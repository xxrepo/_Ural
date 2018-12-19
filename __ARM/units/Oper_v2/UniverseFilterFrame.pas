unit UniverseFilterFrame;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ExtCtrls, ToolWin, StdCtrls, Grids, RXGrids, RXCtrls,
  Db, dbclient, mconnect, StrUtils, ToolEdit, CurrEdit,
  Menus,
  DateUtil,
  UniverseFilter, ActnList, Mask, Buttons,
  contnrs, frArc, frBsnSelector, registry, UniverseFilterTree;

const WM_RefrList = WM_User + 2356;
const  xxxSRegPath = '\SOFTWARE\FO\EMng';

type
  TUFFrame = class(TFrame)
    WorkDS : TClientDataSet;
    ImgList: TImageList;
    ActionList1: TActionList;
    aRefreshe: TAction;
    aSave: TAction;
    aUp: TAction;
    aDown: TAction;
    Action1: TAction;
    Splitter1: TSplitter;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    RxSpeedButton3: TRxSpeedButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton7: TToolButton;
    CondBox: TGroupBox;
    Label1: TLabel;
    ParLabel1: TLabel;
    ParLabel2: TLabel;
    TypeCondBox: TComboBox;
    GroupBox2: TGroupBox;
    Splitter2: TSplitter;
    aOk: TAction;
    panLeft: TPanel;
    UFTree1: TUFTree;
    aAdd: TAction;
    aDel: TAction;
    amiEditClick: TAction;
    amiAddClick: TAction;
    amiDelClick: TAction;
    CondGrid: TRxDrawGrid;
    procedure CondGridClick(Sender: TObject);
    procedure CondGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure TypeCondBoxChange(Sender: TObject);

    procedure ListBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBoxDblClick(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aUpExecute(Sender: TObject);
    procedure aDownExecute(Sender: TObject);
    procedure RxSpeedButton3Click(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure UFTree1ObjViewDblClick(Sender: TObject);
    procedure UFTree1ObjViewChange(Sender: TObject; Node: TTreeNode);
    procedure aAddExecute(Sender: TObject);
    procedure amiEditClickExecute(Sender: TObject);
    procedure amiAddClickExecute(Sender: TObject);
    procedure amiDelClickExecute(Sender: TObject);
  private
    ParEditTime1, ParEditTime2 : TDateTimePicker;
    ValListPanel : TPanel;
    ValList: TListBox;
    fParentFilter: Integer;


    FSelectedNode : TTreeNode;
    fRefreshFilter: Boolean;
    fCurrFilter: Integer;
    fOldFilter: Integer;
    fMainNode: TTreeNode;
    FFilterName : String;
    FilterListBox : TGroupBox;
    ParEdit1, ParEdit2 : TEdit;
    FUniType: String;
    fConnection2: TCustomConnection;
    FID_Univ: Integer;
    FSelectObjEvent: TSelectObjEvent;

    FBsnId : integer;
    procedure SetEnabledButtons;
    procedure SetCurrFilter(const Value: Integer);
    procedure SetRefreshFilter(const Value: Boolean);
    procedure SetConnection(const Value: TCustomConnection);
    procedure SetTreeDataList(const Value: TList);
    procedure _ClearList(AList: TList);
    procedure SetParamEditors(Cond: TUFCondType);
    procedure ComboButtonClick(Sender: TObject);
    procedure ParamChange(Sender: TObject);
    function GetSelectedNode: TTreeNode;
    procedure SetSelectedNode(const Value: TTreeNode);
    procedure ValListCreate(AFilterData: TFilterData);
    procedure ParControlsFree;
    procedure ValListChange;
    procedure ValListDblClick(Sender: TObject);
    procedure miAddClick(Sender: TObject);
    procedure miEditClick(Sender: TObject);
    procedure miDelClick(Sender: TObject);
    procedure EditValList(Index: Integer);

    procedure PopupMenuPopup(Sender: TObject);
    procedure RefresheSelectedFilter(ATM : TTaskMasterClass);
    function GetSelCount: Integer;
    procedure SetID_Univ(const Value: Integer);
    function GetConnection2: TCustomConnection;
    procedure CheckUniverseFilterStyles;

    procedure MakeObjList_Flt(ATableList : TStrings);
    procedure MakeObjList_Where(AWhereList : TStrings; FltExtPatam: TStrings);
    procedure MakeIDSearchSQL(ASQL: TStrings; FltExtPatam: TStrings);
    procedure RecalcSize;
    procedure ValListClick(Sender: TObject);
  public
    FTaskMaster : TTaskMasterClass;
    FilterWasSaved : boolean;
    Fid_user, FParHandle : integer;

    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;

    function InputObj(const ACaption : string;
                      id_Obj : integer;
                      var AID : integer; var AName: string;
                      AConnection : TCustomConnection;
                      MinLen : integer;
                      ExtID : Variant): boolean;

//    property Style: TUniverseFilterStyles read FStyle write SetStyle;
    property ParentFilter: integer read fParentFilter write fParentFilter;


    property SelectedNode: TTreeNode read GetSelectedNode write SetSelectedNode;
    property ID_Univ    : Integer          read FID_Univ         write SetID_Univ;
    property RefreshFilter : Boolean          read fRefreshFilter write SetRefreshFilter;
    property SelCount      : Integer          read GetSelCount;

    property CurrFilter    : Integer          read fCurrFilter    write SetCurrFilter;

    property UniType: String read FUniType write FUniType;
    property SelectObjEvent: TSelectObjEvent read FSelectObjEvent write FSelectObjEvent;

    property Connection    : TCustomConnection read GetConnection2 write SetConnection;

    procedure ChechFilter;

    procedure SetBsnId(AID : Variant; NeedRefr : boolean);
    function initialize(AConnection : TCustomConnection;
                        AUniverseID : integer; id_user : integer;
                        Aid_business: integer;
                        ATaskMaster : TTaskMasterClass;
                        ASelectObjEvent : TSelectObjEvent): boolean;
  end;

var
  UFFrame: TUFFrame;


implementation

uses UniverseFilterUnit2, uInputBoxDate, uInputBoxDigit, uInputBoxObj,
  uInputBoxStr, foMyFunc;

{$R *.DFM}

function SaveFilter(ATaskMaster : TTaskMasterClass; id_Bsn : Variant; SelectedFilter : integer; AConnection : TCustomConnection) : boolean;
var
  Node: TTreeNode;
  i : integer;
  PropData : TPropData;
  AFilterData : TFilterData;
begin
  Result := false;
  try
    for i := 0 to ATaskMaster.FilterDataCount - 1 do
    begin
      AFilterData := ATaskMaster.FilterData[i];

      if TDispatchConnection(AConnection).AppServer.FLT_CondAdd(SelectedFilter,
                                                                AFilterData.ObjData.Un_id_Obj,
                                                                AFilterData.ObjData.Un_id_Prop,
                                                                AFilterData.ObjData.Un_id_Rel,
                                                                integer(AFilterData.CondCode),
                                                                AFilterData.Par1,
                                                                AFilterData.Par2) = -1 then
        raise Exception.Create('Ошибка при сохранении фильтра');

    end;
    Result := true;
  except
  end;
end;

procedure TUFFrame.ListBoxDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var APoint: TPoint;
    AIndex: Integer;
begin
  if Sender = Source then
  begin
    with Sender as TListBox do
    begin
      APoint.x := X;
      APoint.y := Y;
      AIndex := ItemAtPos(APoint, true);
      if AIndex = -1 then AIndex := Items.Count - 1;
      Accept := AIndex <> ItemIndex;
    end;
  end
  else
    if (Source = UFTree1.ObjView) then
      Accept := aAdd.Enabled
    else
      Accept := false;  
end;

procedure TUFFrame.ParControlsFree;
begin
  if ParEdit1 <> nil Then
  begin
    FreeAndNil(ParEdit1);
  end;
  if ParEdit2 <> nil Then
  begin
    FreeAndNil(ParEdit2);
  end;
  if ParEditTime1 <> nil Then
  begin
    FreeAndNil(ParEditTime1);
  end;
  if ParEditTime2 <> nil Then
  begin
    FreeAndNil(ParEditTime2);
  end;             
  
  if ValListPanel <> nil Then
  begin
    FreeAndNil(ValListPanel);
  end;
end;

procedure TUFFrame.SetCurrFilter(const Value: Integer);
var
  I, J, K: Integer;
begin    
  fCurrFilter := Value;
  J := - 1;
  K := - 1;
  TypeCondBox.Items.Clear;
  try
    if Value = - 1 then
    begin
      ParLabel1.Caption := '';
      ParLabel2.Caption := '';
      ParControlsFree;
    end
    else
    begin
      CondGrid.Row := Value;
  ///    if FTaskMaster.FilterData[Value].FObjData.DType = 1 then
      begin
        UFCondTypesGetNameList(TypeCondBox.Items,
                               FTaskMaster.FilterData[Value].ObjData.DType,
                               FTaskMaster.FilterData[Value].ObjData.Un_isDetail,
                               FTaskMaster.FilterData[Value].ObjData.Un_isExtParam);
        TypeCondBox.DropDownCount := TypeCondBox.Items.Count;
        for I := 0 to TypeCondBox.Items.Count - 1 do
          if TUFCondType(TypeCondBox.Items.Objects[i]) = FTaskMaster.FilterData[Value].CondCode then
          begin
            TypeCondBox.ItemIndex := i;
            Break;
          end;

        SetParamEditors(FTaskMaster.FilterData[Value].CondCode);
        FilterToText(FTaskMaster.FilterData[Value], false, Connection);
      end;
    end;
  except
  end;

  for I := 0 to CondBox.ControlCount - 1 do
    if Value > -1 then
      CondBox.Controls[I].Enabled := TypeCondBox.Items.Count > 0
    else
      CondBox.Controls[I].Enabled := false;
  SetEnabledButtons;
end;

procedure TUFFrame.SetParamEditors(Cond: TUFCondType);
var D: TFilterData;
begin
  ParControlsFree;
  if Cond = uctNone then
  begin
    ParLabel1.Caption := '';
    ParLabel2.Caption := '';
    Exit;
  end;
  ParLabel1.Caption := UFCondGetLabel1(Cond);
  ParLabel2.Caption := UFCondGetLabel2(Cond);
  D := FTaskMaster.FilterData[CurrFilter];
  if ParLabel1.Caption <> '' then
  begin
    if (Cond = uctInList) or (Cond = uctNotInList) then
      begin
        ValListCreate(D);
      end
      else
      begin
        case D.ObjData.DType of
          uftInt, uftFloat :
          begin
            TRxCalcEdit(ParEdit1) := TRxCalcEdit.Create(Self);
          end;
          uftDate:
          begin
            TDateEdit(ParEdit1) := TDateEdit.Create(Self);
            ParEditTime1 := TDateTimePicker.Create(Self);
            ParEditTime1.Checked := false;        
          end;
          uftObj:
          begin
            TComboEdit(ParEdit1) := TComboEdit.Create(Self);
          end;
          uftStr:
          begin
            TEdit(ParEdit1) := TEdit.Create(Self);
          end;
        end;
        if ParEdit1 <> nil then
        begin
          with ParEdit1 do
          begin
            Left := 7;
            Top := ParLabel1.Top + ParLabel1.Height + 5;
            Font.Size := 8;
            Parent := CondBox;
            TabOrder := 0;
            Width := (CondBox.ClientWidth - 34) div 2;
            Font.Style := [];
            if ClassType = TEdit then
              with TEdit(ParEdit1) do
              begin
                if D.Par1 <> '' then
                  Text := D.Par1;
              end
            else
            if ClassType = TRxCalcEdit then
              with TRxCalcEdit(ParEdit1) do
              begin
                AlignMent := taRightJustify;
               if D.Par1 <> '' then
               begin
                 Value := UFStrToFloatDef(D.Par1);
                // D.Par1 := Text;
               end
               else
               begin
                 D.Par1 := '0';
                 FilterToText(FTaskMaster.FilterData[CurrFilter], true, Connection);
               end;
              end
            else
              if ClassType = TDateEdit then
                with TDateEdit(ParEdit1) do
                begin
                  YearDigits := dyFour;
                  if D.Par1 <> '' then
                    Date := UFStrToFloatDef(D.Par1);
                end
              else
              begin
                if ClassType = TComboEdit then
                  with TComboEdit(ParEdit1) do
                  begin
                    OnButtonClick := ComboButtonClick;
                    OnChange := nil;
                    DirectInput := false;
                    GlyphKind := gkEllipsis;
                 //   Text := D.CondValue;  1013
                    if (D.CondValue = '') and (D.Par1<>'') then
                      Text := FilterToStringDoc_GetVal(D.ObjData.ID_DBObj, StrToInt(D.Par1), Connection)
                    else
                      Text := D.CondValue;
                end
              end;
            OnChange := ParamChange;
          end;
          ParLabel1.Width := ParEdit1.Width;
        end;
        if ParEditTime1 <> nil then
        begin
          with ParEditTime1 do
          begin
            Kind := dtkTime;
            Parent := CondBox;
            ShowCheckbox := true;
            ParEditTime1.Checked := false;
            Left := ParEdit1.Left + ParEdit1.Width + 27;
            Top := ParLabel1.Top + ParLabel1.Height + 5;
            Font.Size := 8;
            if Frac(UFStrToFloatDef(D.Par1)) <> 0 then
            begin
              Time := Frac(UFStrToFloatDef(D.Par1));
              ParEditTime1.Checked := true;
            end
            else
              ParEditTime1.Checked := false;
            OnChange := ParamChange;
          end;
        end;
    end;
  end;
  if ParLabel2.Caption <> '' then
  begin
    if (Cond = uctInList) or (Cond = uctNotInList) then
      TComboEdit(ParEdit2) := TComboEdit.Create(CondBox)
    else
      case D.ObjData.DType of
        uftInt, uftFloat: TRxCalcEdit(ParEdit2) := TRxCalcEdit.Create(CondBox);
        uftDate:
        begin
          TDateEdit(ParEdit2) := TDateEdit.Create(CondBox);
          ParEditTime2 := TDateTimePicker.Create(Self);
          ParEditTime2.Checked := false;
        end;
      end;
    if ParEdit2 <> nil then
    begin
      with ParEdit2 do
      begin
        Left := ParEdit1.Width + 27;
        Top := ParLabel2.Top + ParLabel2.Height + 5;
        Font.Size := 8;
        Width := (CondBox.ClientWidth - 34) div 2;
        Parent := CondBox;
        Font.Style := [];
        if ClassType = TRxCalcEdit then
        with TRxCalcEdit(ParEdit2) do
        begin
          AlignMent := taRightJustify;
          if D.Par2 <> '' then
            Value := UFStrToFloatDef(D.Par2)
          else
          begin
            D.Par2 := '0';
            FilterToText(FTaskMaster.FilterData[CurrFilter], true, Connection);
          end;
         // D.Par2 := Text;
        end
        else
          if ClassType = TDateEdit then
            with TDateEdit(ParEdit2) do
            begin
              YearDigits := dyFour;
              if D.Par2 <> '' then
                Date := UFStrToFloatDef(D.Par2);
       //       D.Par2 := Text;
            end
          else
            with TComboEdit(ParEdit2) do
            begin
              GlyphKind := gkEllipsis;
              Text := D.Par2;
            end;
        OnChange := ParamChange;
      end;
    end
    else
      D.Par2 := '';
    if ParEditTime2 <> nil then
    begin
      with ParEditTime2 do
      begin
        Kind := dtkTime;
        ParEdit1.Width := ParEdit1.Width div 2;
        ParEditTime1.Width := ParEditTime1.Width div 2;
        ParEditTime1.Left := ParEdit1.Left + ParEdit1.Width + 10;

        Parent := CondBox;
        ShowCheckbox := true;
        Checked := false;
        Top := ParLabel2.Top + ParLabel2.Height + 5;
        Font.Size := 8;

        Left := ParEdit2.Left + ParEdit2.Width + 27;

        if Frac(UFStrToFloatDef(D.Par2)) <> 0 then
        begin
          Time := Frac(UFStrToFloatDef(D.Par2));
          Checked := true;

          ParEdit2.Width := ParEdit2.Width div 2;
          Width := Width div 2;
          Left := ParEdit2.Left + ParEdit2.Width + 10;
        end
        else
          ParEditTime2.Checked := false;
        OnChange := ParamChange;
      end;
    end;
    with ParLabel2 do
    begin
      Left := ParEdit2.Left;
      Width := ParEdit2.Width;
    end
  end;
  if ParEditTime1 <> nil then
    ParEditTime1.TabOrder := 2;
  if ParEdit2 <> nil then
  begin
    if ParEditTime1 = nil then
      ParEdit2.TabOrder := 2
    else
      ParEdit2.TabOrder := 3;
  end;  
  if ParEditTime2 <> nil then
    ParEditTime2.TabOrder := 4;
  RecalcSize;
end;

procedure TUFFrame.ValListChange;
var
  S, S2: String;
  I: Integer;
begin
  S := '';
  if FTaskMaster.FilterData[CurrFilter].ObjData is TObjData then
  begin
    for I := 0 to ValList.Items.Count - 1 do
    if S <> '' then
      S := S + ';' + IntToStr(Integer(ValList.Items.Objects[I]))
    else
      S := IntToStr(Integer(ValList.Items.Objects[I]));
  end
  else
  begin
    for I := 0 to ValList.Items.Count - 1 do
    if S <> '' then
      S := S + ';' + ValList.Items[I]
    else
      S := ValList.Items[I];
  end;

  S2 := '';
  for I := 0 to ValList.Items.Count - 1 do
  if S2 <> '' then
    S2 := S2 + ';' + ValList.Items[I]
  else
    S2 := ValList.Items[I];    

  FTaskMaster.FilterData[CurrFilter].Par1 := S;

  with FTaskMaster.FilterData[CurrFilter] do
  begin
    S := ObjData.ObjName + ' ' + UFCondGetName(ObjData.DType, CondCode);
  end;
  FTaskMaster.FilterData[CurrFilter].FText := S + ' ' + S2;

  CondGrid.InvalidateCell(0, CurrFilter);
  RefreshFilter := True;
  ValListClick(nil);
end;

procedure TUFFrame.ValListDblClick(Sender: TObject);
begin
  if ValList.PopupMenu.Items[0].Enabled then
    miEditClick(nil);
end;

procedure TUFFrame.miAddClick(Sender: TObject);
begin
  EditValList(-1);
end;

procedure TUFFrame.miDelClick(Sender: TObject);
begin
  ValList.Items.Delete(ValList.ItemIndex);
  ValListChange;
end;

procedure TUFFrame.ValListClick(Sender: TObject);
begin
  if (ValList.ItemIndex = -1) and (ValList.Items.Count > 0) then ValList.ItemIndex := 0;
  amiEditClick.Enabled := ValList.ItemIndex > -1;
  amiDelClick.Enabled := ValList.ItemIndex > -1;
end;

procedure TUFFrame.PopupMenuPopup(Sender: TObject);
begin
  ValList.PopupMenu.Items[0].Enabled := ValList.ItemIndex > -1;
  ValList.PopupMenu.Items[2].Enabled := ValList.ItemIndex > -1;
end;

procedure TUFFrame.miEditClick(Sender: TObject);
begin
  EditValList(ValList.ItemIndex);
end;

procedure TUFFrame.ValListCreate(AFilterData: TFilterData);
var SL: TStringList;
    i: Integer;
    Menu: TPopupMenu;
    MenuItem: TMenuItem;
    TB : TSpeedButton;
    ToolBar: TPanel;
begin
  if ValListPanel <> nil then
  begin
    FreeAndNil(ValListPanel);
  end;
  ValListPanel := TPanel.Create(Self);
  with ValListPanel do
  begin
    Left := 7;
    Top := ParLabel1.Top + ParLabel1.Height + 5;
    Width := CondBox.Width - 14;
    Height := CondBox.Height - Top - 8;
    Font.Size := 8;
    Anchors := [akLeft, akRight, akTop, akBottom];
    Parent := CondBox;
  end;
  ToolBar := TPanel.Create(ValListPanel);
  with ToolBar do
  begin
    Parent := ValListPanel;
    Align := alRight;
    ShowHint := true;
    Width := 23;
  end;
  ValList := TListBox.Create(ValListPanel);
  with ValList do
  begin
    Style := lbOwnerDrawFixed;
    Parent := ValListPanel;
    Align := alClient;
    OnDblClick := ValListDblClick;
    if AFilterData.Par1 <> '' then
    begin
      try
        SL := TStringList.Create;
        SL.Text := ReplaceStr(AFilterData.Par1, ';', #13 + #10);
        for i := 0 to SL.Count - 1 do
        begin
          if AFilterData.ObjData is TObjData then
            ValList.Items.AddObject(Trim(FilterToStringDoc_GetVal(AFilterData.ObjData.ID_DBObj, StrToInt(SL[i]), Connection)), TObject(StrToInt(SL[i])))
          else
            ValList.Items.AddObject(Trim(SL[i]), nil);
        end
      finally
        SL.Free;
      end;
    end;
  end;
  Menu := TPopupMenu.Create(ValList);
  Menu.OnPopup := PopupMenuPopup;

  ValList.PopupMenu := Menu;
  ValList.OnDblClick := miEditClick;
  ValList.OnClick := ValListClick;

  MenuItem := TMenuItem.Create(Menu);
  with MenuItem do
  begin
    Caption := 'Редактировать';
    ShortCut := VK_RETURN;
  //  OnClick := miEditClick;
    Action := amiEditClick;
  end;
  Menu.Items.Add(MenuItem);

  MenuItem := TMenuItem.Create(Menu);
  with MenuItem do
  begin
    Caption := 'Добавить';
    ShortCut := VK_INSERT;
   // OnClick := miAddClick;
    Action := amiAddClick;
  end;
  Menu.Items.Add(MenuItem);

  MenuItem := TMenuItem.Create(Menu);
  with MenuItem do
  begin
    Caption := 'Удалить';
    ShortCut := VK_DELETE;
   // OnClick := miDelClick;
    Action := amiDelClick;
  end;
  Menu.Items.Add(MenuItem);

  TB := TSpeedButton.Create(ValListPanel);
  with TB do
  begin
    Parent := ToolBar;
    Align := alTop;
    Height := 22;
    Width := 24;
    Hint := 'Добавить';
    ShowHint := true;
    Action := amiAddClick;
    Caption := '';
 //   ImgList.GetBitmap(13, Glyph);
    Top := 100;
    TAction(Action).ActionList.Images.GetBitmap(TAction(Action).ImageIndex, Glyph);
  end;

  TB := TSpeedButton.Create(ValListPanel);
  with TB do
  begin
    Parent := ToolBar;
    Align := alTop;
    Height := 22;
    Width := 24;
    Hint := 'Редактировать';
    ShowHint := true;
    Action := amiEditClick;
    Caption := '';
//    ImgList.GetBitmap(14, Glyph);
    Top := 100;
    TAction(Action).ActionList.Images.GetBitmap(TAction(Action).ImageIndex, Glyph);
  end;

  TB := TSpeedButton.Create(ValListPanel);
  with TB do
  begin
    Parent := ToolBar;
    Align := alTop;
    Height := 22;
    Width := 24;
    Hint := 'Удалить';
    ShowHint := true;
    Action := amiDelClick;
    Caption := '';
//    ImgList.GetBitmap(12, Glyph);
    Top := 100;
    TAction(Action).ActionList.Images.GetBitmap(TAction(Action).ImageIndex, Glyph);
  end;
  ValListClick(nil);
end;

procedure TUFFrame.ParamChange(Sender : TObject);
begin
  if Sender = ParEdit1 then
  begin
    if Sender is TDateEdit then
    begin
      if (ParEditTime1.Checked) then // Учитывать время?
        FTaskMaster.FilterData[CurrFilter].Par1 := FloatToStr(TDateEdit(ParEdit1).Date + Frac(ParEditTime1.Time))
      else
        FTaskMaster.FilterData[CurrFilter].Par1 := FloatToStr(TDateEdit(ParEdit1).Date); // Только дата
    end
    else
      if not (Sender is TComboEdit) then  // 
        FTaskMaster.FilterData[CurrFilter].Par1 := TEdit(Sender).Text; // Изменен текст условия
  end
  else
  if Sender = ParEdit2 then
  begin
    if Sender is TDateEdit then
    begin
      if (ParEditTime2.Checked) then
        FTaskMaster.FilterData[CurrFilter].Par2 := FloatToStr(TDateEdit(ParEdit2).Date + Frac(ParEditTime2.Time))
      else
        FTaskMaster.FilterData[CurrFilter].Par2 := FloatToStr(TDateEdit(ParEdit2).Date);
    end
    else
      FTaskMaster.FilterData[CurrFilter].Par2 := TEdit(Sender).Text;
  end;

  if (Sender = ParEditTime1) then
  begin
    if (ParEditTime1.Checked) then
      FTaskMaster.FilterData[CurrFilter].Par1 := FloatToStr(TDateEdit(ParEdit1).Date + Frac(ParEditTime1.Time))
    else
      FTaskMaster.FilterData[CurrFilter].Par1 := FloatToStr(TDateEdit(ParEdit1).Date);
  end;

  if (Sender = ParEditTime2) then
  begin
    if (ParEditTime2.Checked) then
      FTaskMaster.FilterData[CurrFilter].Par2 := FloatToStr(TDateEdit(ParEdit2).Date + Frac(ParEditTime2.Time))
    else
      FTaskMaster.FilterData[CurrFilter].Par2 := FloatToStr(TDateEdit(ParEdit2).Date);
  end;

  FilterToText(FTaskMaster.FilterData[CurrFilter], true, Connection); // Пересчет текста условия
  CondGrid.Invalidate;
  RefreshFilter := True;
end;

procedure TUFFrame.SetRefreshFilter(const Value: Boolean);
begin
  fRefreshFilter := Value;
end;

procedure TUFFrame.CondGridClick(Sender: TObject);
begin
  if FTaskMaster.FilterDataCount > 0 then
    CurrFilter := CondGrid.Row;
  SetEnabledButtons;
end;

procedure TUFFrame.CondGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  S: String;
  Y: Integer;
begin
  if (FTaskMaster.FilterDataCount = 0) or (FTaskMaster.FilterDataCount < ARow) then Exit;

  S := FTaskMaster.FilterData[ARow].Text;
  if CondGrid.DefaultColWidth <> CondGrid.ClientWidth - 1 then
    CondGrid.DefaultColWidth := CondGrid.ClientWidth - 1;
  Y := DrawText(CondGrid.Canvas.Handle, PChar(S), - 1, Rect, dt_CalcRect or dt_WordBreak) + 5;
  CondGrid.RowHeights[ARow] := Y;
  Rect := CondGrid.CellRect(0, ARow);
  CondGrid.DrawMultiLine(Rect, S, taLeftJustify)
end;

procedure TUFFrame.TypeCondBoxChange(Sender: TObject);
var
  I: Integer;
begin
  if TypeCondBox.ItemIndex = -1 then
    FTaskMaster.FilterData[CurrFilter].CondCode := uctNone
  else
    FTaskMaster.FilterData[CurrFilter].CondCode := TUFCondType(TypeCondBox.Items.Objects[TypeCondBox.ItemIndex]);
  if FTaskMaster.FilterData[CurrFilter].CondCode in [uctNone, uctBitTrue, uctBitFalse, uctEmpty, uctNotEmpty,  uctLike] then
  begin
    FTaskMaster.FilterData[CurrFilter].Par1 := '';
    FTaskMaster.FilterData[CurrFilter].Par2 := '';
  end;
  FilterToText(FTaskMaster.FilterData[CurrFilter], true, Connection);
  CondGrid.Repaint;

  SetParamEditors(FTaskMaster.FilterData[CurrFilter].CondCode);
//  CurrFilter := FCurrFilter;
  RefreshFilter := true;
  SetEnabledButtons;
end;

procedure TUFFrame.SetEnabledButtons;
begin
 // aRefreshe.Enabled := RefreshFilter;
 // aOk.Enabled := (FTaskMaster.FilterDataCount > 0) and aRefreshe.Enabled;
//  aSave.Enabled := (SelCount > 0) and aRefreshe.Enabled;
  aAdd.Enabled := {(ufsMayChangeCond in Self.Style) and} (UFTree1.ObjView.Selected <> nil) and
                  (
                  ((TObject(UFTree1.ObjView.Selected.Data) is TObjData)
                    and (not TObjData(UFTree1.ObjView.Selected.Data).Un_isDetail)
                    and not (TObjData(UFTree1.ObjView.Selected.Data).Un_isExtParam and TObjData(UFTree1.ObjView.Selected.Data).isSelect)
                  )
                  or (TObject(UFTree1.ObjView.Selected.Data) is TPropData));
  aDel.Enabled := FTaskMaster.FilterDataCount > 0;
  aUp.Enabled := CondGrid.Row > 0;
  aDown.Enabled := (CondGrid.Row < CondGrid.RowCount - 1);
end;

procedure TUFFrame.SetConnection(const Value: TCustomConnection);
begin
  FConnection2 := Value;
  WorkDS.RemoteServer := TCustomRemoteServer(Connection);
end;

procedure TUFFrame._ClearList(AList : TList);
var Obj : TObject;
begin
  while AList.Count > 0 do
  begin
    Obj := TObject(AList[AList.Count - 1]);
    AList.Delete(AList.Count - 1);
    Obj.Free;
  end;
end;

function TUFFrame.GetSelectedNode: TTreeNode;
begin
  Result := FSelectedNode;
end;

procedure TUFFrame.SetSelectedNode(const Value: TTreeNode);
begin
  if FSelectedNode <> Value then
    FSelectedNode := Value;
end;

procedure TUFFrame.ListBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
var APoint: TPoint;
    Index: Integer;
begin
  APoint.x := X;
  APoint.y := Y;
  if (Sender = Source) then
  begin
    with Sender as TListBox do
    begin
      Index := ItemAtPos(APoint, true);
      if Index = -1 then Index := Items.Count - 1;
      Items.Move(ItemIndex, Index);
      ItemIndex := Index;
    end;
  end
  else
    aAdd.Execute;
end;

procedure TUFFrame.RefresheSelectedFilter(ATM : TTaskMasterClass);
var
  I : Integer;
begin
  try
//    FTaskMaster.ClearFilterList;
    with CondGrid do
    begin
      RowCount := 0;
      DefaultRowHeight := 1;
    end;

//    for I := 0 to FTaskMaster.PropDataCount - 1 do
//      FTaskMaster.PropData[I].isSelect := false;
    if ATM.FilterDataCount = 0 then
    begin
      CurrFilter := - 1;
    end
    else
    begin
      // *** Читаем условия ***
      for I := 0 to ATM.FilterDataCount - 1 do
        if not CreateFilterItem(FTaskMaster, ATM.FilterData[i]) then
          raise Exception.Create('Ошибка при чтении условий фильтра');
    end;
  except
  end;

  with CondGrid do
  begin
    RowCount := FTaskMaster.FilterDataCount;
    if FTaskMaster.FilterDataCount > 0 then
      CurrFilter := 0
    else
      CurrFilter := -1;
    Repaint;
  end;
  RefreshFilter := False;
 // SetBsnId(FBsnId, false);   /8
end;

procedure TUFFrame.CheckUniverseFilterStyles;
var i, VCnt: Integer;
    ATabSheet: TTabSheet;
begin
{  aAdd.Visible := (ufsMayChangeFields in Style) or (ufsMayChangeCond in Style) or (ufsMayChangeGroup in Style) or (ufsMayChangeOrder in Style);
  aDel.Visible := (ufsMayChangeFields in Style) or (ufsMayChangeCond in Style) or (ufsMayChangeGroup in Style) or (ufsMayChangeOrder in Style);

  if Assigned(ObjView) then
  begin
    ObjView.Visible := ufsObjView in Style;
    Splitter1.Visible := ufsObjView in Style;
    if not ObjView.Visible then
    begin
      aAdd.Visible := false;
    end;
  end;

  if Assigned(FieldsSheet) then
  begin
    FieldsSheet.TabVisible := ufsFieldsList in Style;
    FieldsSheet.Visible := ufsFieldsList in Style;
  end;
  if Assigned(FilterSheet) then
  begin
    FilterSheet.TabVisible := ufsCondList in Style;
    FilterSheet.Visible := ufsCondList in Style;
  end;
  if Assigned(GroupSheet) then
  begin
    GroupSheet.TabVisible := ufsGroupList in Style;
    GroupSheet.Visible := ufsGroupList in Style;
  end;
  if Assigned(OrderSheet) then
  begin
    OrderSheet.TabVisible := ufsOrderList in Style;
    OrderSheet.Visible := ufsOrderList in Style;
  end;
  VCnt := 0;

  if Assigned(CondControl) then
  begin
    for i := 0 to CondControl.PageCount - 1 do
      if CondControl.Pages[i].Visible then
        Inc(VCnt);
    ATabSheet := CondControl.ActivePage;
    CondControl.ActivePage := nil;
    if VCnt = 1 then
    begin
      CondControl.ActivePage := ATabSheet;
      for i := 0 to CondControl.PageCount - 1 do
        if CondControl.Pages[i].Visible then
        begin
          CondControl.Pages[i].TabVisible := false;
          CondControl.ActivePageIndex := i;
        end;
      aUp.Visible := CondControl.ActivePage <> FilterSheet;
      aDown.Visible := CondControl.ActivePage <> FilterSheet;
    end
    else
    begin
      CondControl.ActivePageIndex := 0;
    end;
  end;  }
end;

function TUFFrame.GetSelCount: Integer;
var i: Integer;
begin
  Result := 0;
{  for i := 0 to FTaskMaster.PropDataCount - 1 do
    if FTaskMaster.PropData[i].isSelect then
      Inc(Result);    }
end;

procedure TUFFrame.ListBoxDblClick(Sender: TObject);
begin
  aDel.Execute;
end;

procedure TUFFrame.SetTreeDataList(const Value: TList);
begin

end;

procedure TUFFrame.SetID_Univ(const Value: Integer);
begin
  FID_Univ := Value;
  UFTree1.GetNodeTDListCover(nil);
end;

procedure TUFFrame.aDelExecute(Sender: TObject);
var I : integer;
begin
  if MessageBox(Handle, 'Удалить условие?', 'Подтвердите удаление', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = idYes then
  begin
    with CondGrid do
    begin
      TObject(FTaskMaster.FilterData[Row]).Free;
      RowCount := RowCount - 1;
      Refresh;
      if FTaskMaster.FilterDataCount = 0 then
        CurrFilter := - 1
      else
        CurrFilter := Row;
    end;
  end;
  RefreshFilter := True;
  SetEnabledButtons;
end;

procedure TUFFrame.aUpExecute(Sender: TObject);
begin
  FTaskMaster.ExchangeFilterList(CondGrid.Row - 1, CondGrid.Row);
  SetEnabledButtons;
  RefreshFilter := True;
  CondGrid.Repaint;
end;

procedure TUFFrame.aDownExecute(Sender: TObject);
begin
  FTaskMaster.ExchangeFilterList(CondGrid.Row + 1, CondGrid.Row);
  SetEnabledButtons;
  RefreshFilter := True;
  CondGrid.Repaint;
end;

procedure TUFFrame.EditValList(Index: Integer);
var V : Variant;
    Rez : boolean;
    S : String;
    ID : integer;
begin
  Rez := false;
  if FTaskMaster.FilterData[CurrFilter].ObjData is TPropData then // Это фильтр по свойству
  begin
    if (Index > -1) and (Index <= ValList.Items.Count) then
      V := ValList.Items[Index]
    else
      V := Null;
    case FTaskMaster.FilterData[CurrFilter].ObjData.DType of
      uftStr :
      begin
        Rez := InputBoxStr(Handle, TPropData(FTaskMaster.FilterData[CurrFilter].ObjData).FullName, '', V, 1000);
      end;
      uftInt :
      begin
        Rez := InputBoxDigit(Handle, TPropData(FTaskMaster.FilterData[CurrFilter].ObjData).FullName, '', V);
      end;
      uftFloat :
      begin
        Rez := InputBoxDigit(Handle, TPropData(FTaskMaster.FilterData[CurrFilter].ObjData).FullName, '', V, '0');
      end;
      uftDate :
      begin
        Rez := InputBoxDate(Handle, TPropData(FTaskMaster.FilterData[CurrFilter].ObjData).FullName, '', V);
      end;
    end;
    if Rez then
    begin
      if Index = -1 then
        ValList.Items.Add(UFVarToStr(V))
      else
        ValList.Items[ValList.ItemIndex] := UFVarToStr(V);
    end;
  end
  else
  begin
 //   ID := StrToIntDef(FTaskMaster.FilterData[CurrFilter].Par1, -1);
    if index > -1 then
      ID := Integer(ValList.Items.Objects[index])
    else
      ID := -1;
    Rez := InputObj(TObjData(FTaskMaster.FilterData[CurrFilter].ObjData).ObjName,
                       FTaskMaster.FilterData[CurrFilter].ObjData.Un_id_Obj,
                       ID,
                       S,
                       Connection,
                       FTaskMaster.FilterData[CurrFilter].ObjData.Un_MinLen,
                       TObjData(FTaskMaster.FilterData[CurrFilter].ObjData).ExtID);
{    Rez := InputBoxObj(TObjData(FTaskMaster.FilterData[CurrFilter].ObjData).ObjName,
                       FTaskMaster.FilterData[CurrFilter].ObjData.Un_id_Obj,
                       ID,
                       S,
                       Connection,
                       FTaskMaster.FilterData[CurrFilter].ObjData.Un_MinLen);   }
    if Rez then
    begin
      if Index = -1 then
        ValList.Items.AddObject(S, Pointer(ID))
      else
      begin
        ValList.Items[ValList.ItemIndex] := S;
        ValList.Items.Objects[ValList.ItemIndex] := Pointer(ID);
      end;
    end;
  end;
  ValListChange;
end;

procedure TUFFrame.ComboButtonClick(Sender : TObject);
var V : Variant;
    Rez : boolean;
    S : String;
    ID : integer;
begin
  Rez := false;
  if FTaskMaster.FilterData[CurrFilter].ObjData is TObjData then // Это фильтр по свойству
  begin
    ID := StrToIntDef(FTaskMaster.FilterData[CurrFilter].Par1, -1); 
    Rez := InputObj(TObjData(FTaskMaster.FilterData[CurrFilter].ObjData).ObjName,
                       FTaskMaster.FilterData[CurrFilter].ObjData.Un_id_Obj,
                       ID,
                       S,
                       Connection,
                       FTaskMaster.FilterData[CurrFilter].ObjData.Un_MinLen,
                       TObjData(FTaskMaster.FilterData[CurrFilter].ObjData).ExtID);
{    Rez := InputBoxObj(TObjData(FTaskMaster.FilterData[CurrFilter].ObjData).ObjName,
                       FTaskMaster.FilterData[CurrFilter].ObjData.Un_id_Obj,
                       ID,
                       S,
                       Connection,
                       FTaskMaster.FilterData[CurrFilter].ObjData.Un_MinLen);   }
    if Rez then
    begin
      FTaskMaster.FilterData[CurrFilter].Par1 := IntToStr(ID);
      FTaskMaster.FilterData[CurrFilter].FSL.Add(S);
      TComboEdit(ParEdit1).Text := S;
      
      with FTaskMaster.FilterData[CurrFilter] do
      begin
        FText := ObjData.ObjName + ' ' + UFCondGetName(ObjData.DType, CondCode) + ' ' + S;
      end;
      CondGrid.InvalidateCell(0, CurrFilter);
    end;
  end;
end;

function TUFFrame.GetConnection2: TCustomConnection;
begin
  Result := fConnection2;
end;

procedure TUFFrame.MakeObjList_Flt(ATableList : TStrings);
var
    AFilterData : TFilterData;
    Obj : TTableList;
    ObjList : TObjectList;
    i : integer;
    MObjD : TObjData;
  function Indexid_Rel(id_Rel : integer) : integer;
  var j : integer;
  begin
    Result := -1;
    for j := 0 to ObjList.Count - 1 do
    begin
      if TTableList(ObjList[j]).id_Rel = id_Rel then
      begin
        Result := j;
        Break;
      end;
    end;
  end;
begin
  if FTaskMaster.FilterDataCount = 0 then
  begin
    MessageBox(Handle, 'Не заданы условия поиска', 'Введены не все данные', MB_OK + MB_ICONERROR);
    Exit;
  end;
    
  ObjList := TObjectList.Create(true);
  try
    MObjD := FTaskMaster.MainObjData;
    Obj := TTableList.Create;
    ObjList.Add(Obj);
    Obj.id_Rel := MObjD.Un_id_Rel;
    Obj.id_RelParent := MObjD.Un_id_RelParent;
    Obj.TableName := MObjD.Un_TableName;
    Obj.RelField := MObjD.Un_RelField;
    Obj.KeyField := MObjD.Un_KeyField;

    Obj.isDetail := MObjD.Un_isDetail;
    Obj.isExtParam := MObjD.Un_isExtParam;

    for i := 0 to FTaskMaster.FilterDataCount - 1 do
    begin
      AFilterData := FTaskMaster.FilterData[i];
      begin
    //    if not AFilterData.ObjData.isDetail then
        begin
          if Indexid_Rel(AFilterData.ObjData.Un_id_Rel) = -1 then
          begin
            Obj := TTableList.Create;
            ObjList.Add(Obj);
            Obj.id_Rel := AFilterData.ObjData.Un_id_Rel;
            Obj.id_RelParent := AFilterData.ObjData.Un_id_RelParent;
            Obj.TableName :=  AFilterData.ObjData.Un_TableName;
            Obj.RelField :=  AFilterData.ObjData.Un_RelField;
            Obj.KeyField :=  AFilterData.ObjData.Un_KeyField;

            Obj.isDetail := AFilterData.ObjData.Un_isDetail;
            Obj.isExtParam := AFilterData.ObjData.Un_isExtParam;
          end;
        end;
      end;
    end;
    MakeTableList222(ObjList, ATableList);
  finally
    ObjList.Free;
  end;
end;

procedure TUFFrame.MakeIDSearchSQL(ASQL: TStrings; FltExtPatam: TStrings);
var SL, SL_Rez : TStringList;
begin
  SL := TStringList.Create;
  SL_Rez := TStringList.Create;
  try
    MakeObjList_Flt(SL);
    SL_Rez.AddStrings(SL);

    SL.Clear;
    MakeObjList_Where(SL, FltExtPatam);
    if SL.Count > 0 then
    begin
      SL_Rez.Add('WHERE');
      SL_Rez.AddStrings(SL);
    end;
  finally
    ASQL.Clear;
    ASQL.AddStrings(SL_Rez);

    SL.Free;
    SL_Rez.Free;
  end;
end;

procedure TUFFrame.MakeObjList_Where(AWhereList: TStrings; FltExtPatam: TStrings);
var
    AFilterData : TFilterData;
    ID, i : integer;
    Obj : TFltList;
    ObjList : TObjectList;
begin
  ObjList := TObjectList.Create(true);
  try
    for i := 0 to FTaskMaster.FilterDataCount - 1 do
    begin
      AFilterData := FTaskMaster.FilterData[i];
      begin
        Obj := TFltList.Create;
        ObjList.Add(Obj);
        Obj.id_Rel := AFilterData.ObjData.Un_id_Rel;
        Obj.id_RelParent := AFilterData.ObjData.Un_id_RelParent;
        Obj.TableName :=  AFilterData.ObjData.Un_TableName;
        Obj.RelField :=  AFilterData.ObjData.Un_RelField;
        Obj.KeyField :=  AFilterData.ObjData.Un_KeyField;

        Obj.id_Prop := AFilterData.ObjData.Un_id_Prop;
        Obj.Par1 := AFilterData.Par1;
        Obj.Par2 := AFilterData.Par2;
        Obj.CondCode := AFilterData.CondCode;
        Obj.isDetail := AFilterData.ObjData.Un_isDetail;
        Obj.isExtParam := AFilterData.ObjData.Un_isExtParam;

        Obj.DType := AFilterData.ObjData.DType;
        Obj.FieldName := AFilterData.ObjData.Un_FieldName;

      end;
    end;
    MakeWhereList222(ObjList, AWhereList, FltExtPatam);
  finally
    ObjList.Free;
  end;
end;

constructor TUFFrame.Create(AOwner: TCOmponent);
var Reg : TRegistry;
    FullRegPathName : String;
begin
  inherited;
  ParLabel1.Caption := '';
  ParLabel2.Caption := '';

  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    FullRegPathName := xxxSRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, true) then
    begin
      if Reg.ValueExists('panLeftWidth') then
        panLeft.Width := Reg.ReadInteger('panLeftWidth');

    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

destructor TUFFrame.Destroy;
var Reg : TRegistry;
    FullRegPathName : String;
begin
  FTaskMaster.Free;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    FullRegPathName := xxxSRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, true) then
    begin
      Reg.WriteInteger('panLeftWidth', panLeft.Width);
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  inherited;

end;

procedure TUFFrame.RxSpeedButton3Click(Sender: TObject);
begin
  if MessageBox(Handle, 'Очистить список условий?', 'Подтвердите удаление', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = idYes then
  begin
    FTaskMaster.ClearFilterList;
    CondGrid.RowCount := 0;
    CurrFilter := -1;
    SetEnabledButtons;
  end;
end;

procedure TUFFrame.ChechFilter;
var N : integer;
begin
  N := FTaskMaster.FilterNotEnter;
  if N <> -1 then
  begin
    CurrFilter := N;
    raise Exception.Create('Не задано условие фильтра');
  end;
end;

procedure TUFFrame.SetBsnId(AID: Variant; NeedRefr : boolean);
begin
  if ((FBsnId <> AID) and (AID <> Null)) or NeedRefr then
  begin
    FBsnId := AID;
    SetBsnId_UN(AID, WorkDS, FTaskMaster);
    UFTree1.GetNodeTDListCover(nil);
  end;
end;

function TUFFrame.InputObj(const ACaption: string; id_Obj: integer;
  var AID: integer; var AName: string; AConnection: TCustomConnection;
  MinLen: integer; ExtID: Variant): boolean;
var DefSelector : boolean;
    id_Bsn : Variant;
begin
  if not(FBsnId > 0) and (ExtID <> Null) then
  begin
    MessageBox(Handle, 'Не выбран бизнес', 'Сначала выберите бизнес', MB_OK + MB_ICONERROR);
    Windows.SetFocus(Handle);
    Exit;
  end;
  DefSelector := true;
  if FBsnId > 0 then
    id_Bsn := FBsnId
  else
    id_Bsn := Null;
  if Assigned(FSelectObjEvent) and (ExtID <> Null) then
    FSelectObjEvent(Self, AID, ANAme, DefSelector, Result, ExtID, id_Bsn);
  if DefSelector then
  begin
    Result := InputBoxObj(ACaption,
                       id_Obj,
                       AID,
                       AName,
                       Connection,
                       MinLen,
                       FBsnId,
                       Self);
  end;
end;

procedure TUFFrame.FrameResize(Sender: TObject);
begin
  RecalcSize;
end;

procedure TUFFrame.RecalcSize;
begin
  if (TypeCondBox <> nil) and (CondBox <> nil) then TypeCondBox.Width := CondBox.ClientWidth - 14;
  if ParEdit1 <> nil then
  begin
    if ParEdit2 <> nil then
      ParEdit1.Width := (TypeCondBox.Width - 60) Div 4
    else
      if ParEditTime1 <> nil then
        ParEdit1.Width := (TypeCondBox.Width - 20) Div 2
      else
        ParEdit1.Width := TypeCondBox.Width;
    ParLabel1.Width := ParEdit1.Width
  end;
  if ParEditTime1 <> nil then
  begin
    with ParEditTime1 do
    begin
      if ParEdit1 <> nil then
        Left := ParEdit1.Left + ParEdit1.Width + 17;
      Width := ParEdit1.Width
    end;
  end;

  if ParEdit2 <> nil then
  begin
    with ParEdit2 do
    begin
      if ParEditTime1 <> nil then
        Left := ParEditTime1.Left + ParEditTime1.Width + 17
      else
        Left := ParEdit1.Left + ParEdit1.Width + 17;
      Width := ParEdit1.Width
    end;
    if ParEditTime2 <> nil then
    begin
      with ParEditTime2 do
      begin
        if ParEdit1 <> nil then
          Left := ParEdit2.Left + ParEdit2.Width + 17;
        Width := ParEdit2.Width
      end;
    end;
    with ParLabel2 do
    begin
      Left := ParEdit2.Left;
      Width := ParEdit2.Width
    end
  end;
  if CondGrid <> nil then
    with CondGrid do
      DefaultColWidth := ClientWidth

end;

function TUFFrame.initialize(AConnection : TCustomConnection;
                        AUniverseID : integer; id_user : integer;
                        Aid_business: integer;
                        ATaskMaster : TTaskMasterClass;
                        ASelectObjEvent : TSelectObjEvent): boolean;
begin
  UFTree1.initialize(AConnection, AUniverseID, id_user, Aid_business, ATaskMaster);

  Connection := AConnection;
  FTaskMaster := TTaskMasterClass.Create(Connection);
  Fid_user := id_user;
  FBsnId := Aid_business;

  GetUniverseListID(WorkDS, AUniverseID, UniType, FTaskMaster);

  SetBsnId(FBsnId, true);
  ID_Univ := AUniverseID;

  RefresheSelectedFilter(ATaskMaster);

  SelectObjEvent := ASelectObjEvent;
end;

procedure TUFFrame.aOkExecute(Sender: TObject);
begin
  if Owner is TForm then
    TForm(Owner).ModalResult := mrOk;
end;

procedure TUFFrame.UFTree1ObjViewDblClick(Sender: TObject);
var P : TPoint;
    Node : TTreeNode;
begin
  UFTree1.ObjViewDblClick(Sender);

  P := Mouse.CursorPos;
  P := UFTree1.ObjView.ScreenToClient(P);
  Node := UFTree1.ObjView.GetNodeAt(P.X, P.Y);
  if (Node = UFTree1.ObjView.Selected) and (aAdd.Enabled) then
  begin
    if P.X > UFTree1.ObjView.Indent*Node.Level then
      aAdd.Execute;
  end
  else
  begin
    if (TObject(Node.Data) is TObjData) and
        (TObjData(UFTree1.ObjView.Selected.Data).Un_isExtParam and TObjData(UFTree1.ObjView.Selected.Data).isSelect) then
      MessageBox(Handle, PChar('Параметр "' + TObjData(UFTree1.ObjView.Selected.Data).ObjName + '" можно выбрать только один раз'), '', MB_ICONWARNING + mb_OK);
  end;
end;

procedure TUFFrame.UFTree1ObjViewChange(Sender: TObject; Node: TTreeNode);
begin
  SetEnabledButtons;
end;

procedure TUFFrame.aAddExecute(Sender: TObject);
var
  D : TFilterData;
begin
  if csDesigning in ComponentState then Exit;

  D := TFilterData.Create(FTaskMaster);
  with D do
  begin
    ObjData := UFTree1.ObjView.Selected.Data;
    CondCode := uctNone;
    Par1 := '';
    Par2 := ''
  end;
  with CondGrid do
  begin
    RowCount := FTaskMaster.FilterDataCount;
    Refresh;
    CurrFilter := RowCount - 1;
  end;

  SetEnabledButtons;
end;

procedure TUFFrame.amiEditClickExecute(Sender: TObject);
begin
  miEditClick(Sender);
end;

procedure TUFFrame.amiAddClickExecute(Sender: TObject);
begin
  miAddClick(Sender);
end;

procedure TUFFrame.amiDelClickExecute(Sender: TObject);
begin
  miDelClick(Sender);
end;

end.
