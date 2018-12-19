unit UniverseFilterForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ExtCtrls, ToolWin, StdCtrls, Grids, RXGrids, RXCtrls,
  Db, dbclient, mconnect, StrUtils, ToolEdit, CurrEdit,
  Menus,
  DateUtil,
  UniverseFilter, ActnList, Mask;



type
  TUFForm = class(TForm)
    ImgList: TImageList;
    Splitter1: TSplitter;
    Panel1: TPanel;
    CondControl: TPageControl;
    FilterSheet: TTabSheet;
    Splitter2: TSplitter;
    CondBox: TGroupBox;
    Label1: TLabel;
    ParLabel1: TLabel;
    ParLabel2: TLabel;
    TypeCondBox: TComboBox;
    GroupBox2: TGroupBox;
    CondGrid: TRxDrawGrid;
    GroupSheet: TTabSheet;
    GrListBox: TListBox;
    FieldsSheet: TTabSheet;
    OrderSheet: TTabSheet;
    OrderListBox: TListBox;
    FieldsListBox: TListBox;
    WorkDS: TClientDataSet;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    ActionList1: TActionList;
    aAdd: TAction;
    aDel: TAction;
    aRefreshe: TAction;
    aSave: TAction;
    ToolBar1: TToolBar;
    aUp: TAction;
    ToolButton1: TToolButton;
    aDown: TAction;
    ToolButton3: TToolButton;
    Panel3: TPanel;
    ObjView: TTreeView;
    TBar: TToolBar;
    ToolButton2: TToolButton;
    AddBtn2: TToolButton;
    ToolButton4: TToolButton;
    Panel4: TPanel;
    Label2: TLabel;
    edName: TEdit;
    ToolButton5: TToolButton;

    procedure ObjViewChange(Sender: TObject; Node: TTreeNode);
    procedure ObjViewGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure ObjViewGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure ObjViewDblClick(Sender: TObject);
    procedure CondGridClick(Sender: TObject);
    procedure CondGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GrListBoxClick(Sender: TObject);
    procedure TypeCondBoxChange(Sender: TObject);
    procedure CondControlChange(Sender: TObject);
    procedure ObjViewExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ObjViewDeletion(Sender: TObject; Node: TTreeNode);
    procedure FilterSheetResize(Sender: TObject);
    procedure ObjViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ObjViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormConstrainedResize(Sender: TObject; var MinWidth,
      MinHeight, MaxWidth, MaxHeight: Integer);


    procedure ListBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBoxDblClick(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aUpExecute(Sender: TObject);
    procedure aDownExecute(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure ObjViewCustomDraw(Sender: TCustomTreeView;
      const ARect: TRect; var DefaultDraw: Boolean);
  private
    ParEditTime1, ParEditTime2 : TDateTimePicker;
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
    fSelectedFilter: Integer;
    FStyle: TUniverseFilterStyles;
    fConnection2: TCustomConnection;
    FID_Univ: Integer;
    procedure SetEnabledButtons;
    procedure SetCurrFilter(const Value: Integer);
    procedure SetRefreshFilter(const Value: Boolean);
    procedure SetConnection(const Value: TCustomConnection);
    procedure SetTreeDataList(const Value: TList);
    procedure GetNodeTDList(Node: TTreeNode);
    procedure _ClearList(AList: TList);
    function FilterToString(FNumber: Integer): String;
    procedure SetFilterName(const Value: String);
    procedure GetFilterParams(AFilterData: TFilterData; var P1, P2: String; SQLParam: Boolean);
    procedure SetParamEditors(Cond: TUFCondType);
    procedure ComboButtonClick(Sender: TObject);
    procedure ParamChange(Sender: TObject);
    function GetSelectedNode: TTreeNode;
    procedure SetSelectedNode(const Value: TTreeNode);
    procedure CalcUpDownPos;
    procedure GetNewFilterParams(AFilterData: TFilterData; var P1, P2: String; SQLParam: Boolean);
    procedure ValListCreate(AFilterData: TFilterData);
    function GetFilterString: String;
    function GetFilterTextToDoc: String;
    procedure ParControlsFree;
    function MakeSQLValList(FilterData: TFilterData): String;
    procedure ValListChange;
    procedure ValListDblClick(Sender: TObject);
    procedure miAddClick(Sender: TObject);
    procedure miEditClick(Sender: TObject);
    procedure miDelClick(Sender: TObject);
    procedure EditValList(Index: Integer);

    procedure PopupMenuPopup(Sender: TObject);
    procedure FieldsListBoxAddItem(AObjData: TPropData);
    procedure GrListBoxAddItem(AObjData: TPropData);
    procedure OrderListBoxAddItem(AObjData: TPropData);

    function MakeWhereStr : String;   // Формирует условие запроса (для сохранения в базе)

    procedure SetSelectedFilter(const Value: Integer);
    procedure RefresheSelectedFilter;
    function MakeCondByWhereStr(AWhereStr: String): String;
    function NewFilterToSQL(FilterData: TFilterData): String;
    function SaveFilter : boolean;
    procedure SetStyle(const Value: TUniverseFilterStyles);
    function GetSelCount: Integer;
    procedure SetObjDataList(const Value: TList);
    procedure SetID_Univ(const Value: Integer);
    procedure GetNodeTDListCover(Node: TTreeNode);
    function CreateFilterItem(CDS: TClientDataSet): boolean;
    function GetConnection2: TCustomConnection;
  public
    FTaskMaster : TTaskMasterClass;
    FilterWasSaved : boolean;
    property Style: TUniverseFilterStyles read FStyle write SetStyle;
    property ParentFilter: integer read fParentFilter write fParentFilter;


    procedure NewFillTree;
    property SelectedNode: TTreeNode read GetSelectedNode write SetSelectedNode;
    property ID_Univ    : Integer          read FID_Univ         write SetID_Univ;
    property RefreshFilter : Boolean          read fRefreshFilter write SetRefreshFilter;
    property SelCount      : Integer          read GetSelCount;

    property CurrFilter    : Integer          read fCurrFilter    write SetCurrFilter;
    property SelectedFilter    : Integer          read fSelectedFilter     write SetSelectedFilter;

    property UniType: String read FUniType write FUniType;
    property FilterTextToDoc: String read GetFilterTextToDoc;


    property Connection    : TCustomConnection read GetConnection2 write SetConnection;
    property FilterName : String read FFilterName write SetFilterName;

    function FilterToStringDoc(FilterData: TFilterData): String;
    function FilterToStringDoc_GetVal(id_Obj, ID: Integer): String;
    procedure FilterToText(FilterData: TFilterData; ANeedRecalc : boolean = true);
  end;

var
  UFForm: TUFForm;

  function EditFilter(AConnection : TCustomConnection;
                      AUniverseID : integer; UniType : String;
                      ASelectedFilter : integer;
                      AStyle: TUniverseFilterStyles = [ufsMainTree, ufsObjView, ufsSaveBtn, ufsFieldsList, ufsCondList, ufsGroupList, ufsOrderList, ufsMayChangeFields, ufsMayChangeCond, ufsMayChangeGroup, ufsMayChangeOrder, fsMayCreateNew, fsMayDelete];
                      ATaskMaster : TTaskMasterClass = nil): boolean;

  function NewFilter (AConnection : TCustomConnection;
                      AUniverseID : integer; UniType : String;
                      AParentFilter : integer = NoParent;
                      AStyle: TUniverseFilterStyles = [ufsMainTree, ufsObjView, ufsSaveBtn, ufsFieldsList, ufsCondList, ufsGroupList, ufsOrderList, ufsMayChangeFields, ufsMayChangeCond, ufsMayChangeGroup, ufsMayChangeOrder, fsMayCreateNew, fsMayDelete];
                      ATaskMaster : TTaskMasterClass = nil): integer;

implementation

uses UniverseFilterUnit2, uInputBoxDate, uInputBoxDigit, uInputBoxObj,
  uInputBoxStr;

{$R *.DFM}

function NewFilter (AConnection : TCustomConnection;
                    AUniverseID : integer; UniType : String;
                    AParentFilter : integer;
                    AStyle: TUniverseFilterStyles;
                    ATaskMaster : TTaskMasterClass): integer;
var F : TUFForm;
    FDelTM : boolean;
begin
  Result := -1;
  F := TUFForm.Create(nil);
  try
    F.Connection := AConnection;
    F.Style := AStyle;

    if ATaskMaster <> nil then
    begin
      FDelTM := false;
      F.FTaskMaster := ATaskMaster;
    end
    else
    begin
      FDelTM := true;
      F.FTaskMaster := TTaskMasterClass.Create(F);
      GetUniverseListID(F.WorkDS, AUniverseID, F.UniType, F.FTaskMaster);
    end;
    F.ID_Univ := AUniverseID;
    F.SelectedFilter := -1;
    F.ParentFilter := AParentFilter;

    F.NewFillTree;
    F.ShowModal;
    Result := F.SelectedFilter;
  finally
    if FDelTM then
      F.FTaskMaster.Free;
    F.Free;
  end;
end;

function EditFilter(AConnection : TCustomConnection;
                    AUniverseID : integer; UniType : String;
                    ASelectedFilter : integer;
                    AStyle: TUniverseFilterStyles;
                    ATaskMaster : TTaskMasterClass): boolean;
var F : TUFForm;
begin
  Result := false;
  F := TUFForm.Create(nil);
  try
    F.Connection := AConnection;
    F.Style := AStyle;

    if ATaskMaster <> nil then
    begin
      F.FTaskMaster := ATaskMaster;
    end
    else
    begin
      F.FTaskMaster := TTaskMasterClass.Create(F);
      GetUniverseListID(F.WorkDS, AUniverseID, F.UniType, F.FTaskMaster);
    end;
    F.ID_Univ := AUniverseID;
    F.SelectedFilter := ASelectedFilter;

 //   F.NewFillTree;
    F.ShowModal;
    if F.ModalResult = mrOk then
      F.SaveFilter;
    //Result := F.FilterWasSaved;
  finally
    if ATaskMaster <> F.FTaskMaster then
      F.FTaskMaster.Free;
    F.Free;
  end;
end;

function TUFForm.MakeCondByWhereStr(AWhereStr: String): String;
var WorkList: TStringList;
    i, j, Num, cnt: Integer;
    S: String;
    D: TFilterData;
begin
{  Result := '';
  WorkList := TStringList.Create;
  D := TFilterData.Create(FTaskMaster);
  try
    WorkList.Text := ReplaceStr(AWhereStr, '|', #13#10);
    for i := 0 to WorkList.Count - 1 do
    begin
      S := WorkList[I];
      cnt := WordCount(S, [',']);
      Num := StrToInt(ExtractWord(1, S, [',']));
      for j := 0 to FTaskMaster.ObjDataCount - 1 do
        if (not FTaskMaster.ObjData[j].PrClass) and  // Объект (Не класс)
           (FTaskMaster.ObjData[j].ID = Num) and  // ID
           (((cnt > 1) and (FTaskMaster.ObjData[j].ObjType = 1)) or // Объект
           ((cnt = 1) and (FTaskMaster.ObjData[j].ObjType = 2))) then  // Предопределенный фильтр
        begin
          D.FObjData := FTaskMaster.ObjData[j];
          Break;
        end;
      if cnt > 1 then
      begin
        D.OperCode := StrToInt(ExtractWord(2, S, [',']));
        if cnt >= 3 then
          D.Par1 := ExtractWord(3, S, [',']);
        if cnt = 4 then
          D.Par2 := ExtractWord(4, S, [',']);
        if Result <> '' then
          Result := Result + '|';
      end;
      Result := Result + NewFilterToSQL(D);
    end;
  finally
    WorkList.Free;
    D.Free;
  end;    }
end;

function TUFForm.NewFilterToSQL(FilterData: TFilterData): String;
var
  S1, S2: String;
//  S: String;
//  I, N        : Integer;
  ToDate: Boolean;
begin
{  if FilterData.FObjData.ObjType = 1 then
  begin
  with FilterData do
  begin
    ToDate := (OperCode < ArrMax - 1) and (FilterData.FObjData.DType = 2);
    if Par1 <> '' then
    begin
      if ToDate then S1 := UFFormatDateTimeEx(UFStrToFloatDef(Par1))
      else S1 := Par1
    end;
    if Par2 <> '' then
    begin
      if ToDate then S2 := UFFormatDateTimeEx(UFStrToFloatDef(Par2))
      else S2 := Par2
    end;

    Result := IntToStr(FilterData.FObjData.ID) + SQLArray[OperCode];
    if FilterData.FObjData.DType > 0 then
    begin
      if (OperCode = ArrMax - 1) or (OperCode = ArrMax) then
      begin
        Result := IntToStr(FilterData.FObjData.ID) + MakeSQLValList(FilterData);
      end
      else
        if Pos('Like', Result) = 0 then
        begin
          if S1 <> '' then S1 := #39 + Trim(S1) + #39;
          if S2 <> '' then S2 := #39 + Trim(S2) + #39
        end;
    end
    else
      S1 := ReplaceStr(S1, ';', ',');
    if Pos('P1', Result) <> 0 then Result := ReplaceStr(Result, 'P1', S1);
    if Pos('P2', Result) <> 0 then Result := ReplaceStr(Result, 'P2', S2)
  end;
  Result := '(' + Result + ')';
  end
  else
    Result := '(c' + IntToStr(FilterData.FObjData.ID) + ')';  }
end;


procedure TUFForm.ListBoxDragOver(Sender, Source: TObject; X,
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
    if (Source = ObjView) then
      Accept := aAdd.Enabled
    else
      Accept := false;  
end;

procedure TUFForm.ParControlsFree;
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
  
  if ValList <> nil Then
  begin
    FreeAndNil(ValList);
  end;
end;

procedure TUFForm.FieldsListBoxAddItem(AObjData: TPropData);
begin
  with FieldsListBox do
  begin
    Items.AddObject(AObjData.FullName, AObjData);
    ItemIndex := Items.Count - 1;
    CondControl.Refresh;
  end
end;

procedure TUFForm.GrListBoxAddItem(AObjData: TPropData);
begin
  with GrListBox do
  begin
    Items.AddObject(AObjData.FullName, AObjData);
    ItemIndex := Items.Count - 1;
  end
end;

procedure TUFForm.OrderListBoxAddItem(AObjData: TPropData);
begin
  with OrderListBox do
  begin
    Items.AddObject(AObjData.FullName, AObjData);
    ItemIndex := Items.Count - 1;
  end
end;

procedure TUFForm.SetCurrFilter(const Value: Integer);
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
        UFCondTypesGetNameList(TypeCondBox.Items, FTaskMaster.FilterData[Value].FObjData.DType);
        TypeCondBox.DropDownCount := TypeCondBox.Items.Count;
        for I := 0 to TypeCondBox.Items.Count - 1 do
          if TUFCondType(TypeCondBox.Items.Objects[i]) = FTaskMaster.FilterData[Value].CondCode then
          begin
            TypeCondBox.ItemIndex := i;
            Break;
          end;

        SetParamEditors(FTaskMaster.FilterData[Value].CondCode);
        FilterToText(FTaskMaster.FilterData[Value], false);
      end;
    end;
  except
  end;

  for I := 0 to CondBox.ControlCount - 1 do
    if Value > -1 then
      CondBox.Controls[I].Enabled := TypeCondBox.Items.Count > 0
    else
      CondBox.Controls[I].Enabled := false;
end;

procedure TUFForm.SetParamEditors(Cond: TUFCondType);
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
        case D.FObjData.DType of
          uftInt, uftFloat :
          begin
            TRxCalcEdit(ParEdit1) := TRxCalcEdit.Create(Self);
          end;
          uftDate:
          begin
            TDateEdit(ParEdit1) := TDateEdit.Create(Self);
            ParEditTime1 := TDateTimePicker.Create(Self);
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
            OnChange := ParamChange;
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
                 Value := UFStrToFloatDef(D.Par1);
               D.Par1 := Text;     //1013
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
                    if D.CondValue = '' then
                      Text := FilterToStringDoc_GetVal(D.FObjData.ID_DBObj, StrToInt(D.Par1))
                    else
                      Text := D.CondValue;
                end
              end;
          end;
          ParLabel1.Width := ParEdit1.Width;
        end;
        if ParEditTime1 <> nil then
        begin
          with ParEditTime1 do
          begin
            OnChange := ParamChange;
            Checked := false;
            Parent := CondBox;
            Kind := dtkTime;
            ShowCheckbox := true;
            Left := ParEdit1.Left + ParEdit1.Width + 27;
            Top := ParLabel1.Top + ParLabel1.Height + 5;
            Font.Size := 8;
            if Frac(UFStrToFloatDef(D.Par1)) <> 0 then    
            begin
              Time := Frac(UFStrToFloatDef(D.Par1));
              Checked := true;
            end
            else
              Checked := false;
          end;
        end;
    end;
  end;
  if ParLabel2.Caption <> '' then
  begin
    if (Cond = uctInList) or (Cond = uctNotInList) then
      TComboEdit(ParEdit2) := TComboEdit.Create(CondBox)
    else
      case D.FObjData.DType of
        uftInt, uftFloat: TRxCalcEdit(ParEdit2) := TRxCalcEdit.Create(CondBox);
        uftDate:
        begin
          TDateEdit(ParEdit2) := TDateEdit.Create(CondBox);
          ParEditTime2 := TDateTimePicker.Create(Self);
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
            Value := UFStrToFloatDef(D.Par2);
          D.Par2 := Text;
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
    end;
    if ParEditTime2 <> nil then
    begin
      with ParEditTime2 do
      begin
        ParEdit1.Width := ParEdit1.Width div 2;
        ParEditTime1.Width := ParEditTime1.Width div 2;
        ParEditTime1.Left := ParEdit1.Left + ParEdit1.Width + 10;

        OnChange := ParamChange;
        Parent := CondBox;
        Kind := dtkTime;
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
          Checked := false;
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
  FilterSheetResize(nil);
end;

function TUFForm.MakeSQLValList(FilterData: TFilterData): String;
var
//  S2: String;
  S, S1, Rez: String;
  I, N        : Integer;
//  ToDate: Boolean;
begin
{  Result := '';
  if FilterData.OperCode < ArrMax - 1 then Exit;
  with FilterData do
  begin
    S1 := Par1;
    Result := SQLArray[OperCode];

    if FilterData.FObjData.DType > 0 then
    begin
      if OperCode in [ArrMax - 1, ArrMax] then
      begin
        N := WordCount(S1, [';']);
        for I := 1 to N do
        begin
          S := ExtractWord(I, S1, [';']);
          if FilterData.FObjData.DType = 2 then
            S := UFFormatDateTimeEx(StrToDateFmt(DateMask, S));
      //      S := FormatDateTime(SQLDateMask, StrToDateFmt(DateMask, S));


          S := #39 + Trim(S) + #39;
          if Rez = '' then
            Rez := S
          else
            Rez := rez + ',' + S;
        end;
        S1 := ReplaceStr(S1, ';', ',');
        S1 := Rez;
      end;
    end
    else
      S1 := ReplaceStr(S1, ';', ',');
    if Pos('P1', Result) <> 0 then Result := ReplaceStr(Result, 'P1', S1);
  end;   }
end;

procedure TUFForm.ValListChange;
var
  S, S2: String;
  I: Integer;
begin
  S := '';
  if FTaskMaster.FilterData[CurrFilter].FObjData is TObjData then
  begin
    for I := 0 to ValList.Items.Count - 1 do
    if S <> '' then
      S := S + '; ' + IntToStr(Integer(ValList.Items.Objects[I]))
    else
      S := IntToStr(Integer(ValList.Items.Objects[I]));
  end
  else
  begin
    for I := 0 to ValList.Items.Count - 1 do
    if S <> '' then
      S := S + '; ' + ValList.Items[I]
    else
      S := ValList.Items[I];
  end;

  S2 := '';
  for I := 0 to ValList.Items.Count - 1 do
  if S2 <> '' then
    S2 := S2 + '; ' + ValList.Items[I]
  else
    S2 := ValList.Items[I];    

  FTaskMaster.FilterData[CurrFilter].Par1 := S;

  with FTaskMaster.FilterData[CurrFilter] do
  begin
    S := FObjData.ObjName + ' ' + UFCondGetName(FObjData.DType, CondCode);
  end;
  FTaskMaster.FilterData[CurrFilter].FText := S + ' ' + S2;

  CondGrid.InvalidateCell(0, CurrFilter);
  RefreshFilter := True;
end;

procedure TUFForm.ValListDblClick(Sender: TObject);
begin
  if ValList.PopupMenu.Items[0].Enabled then
    miEditClick(nil);
end;

procedure TUFForm.miAddClick(Sender: TObject);
begin
  EditValList(-1);
end;

procedure TUFForm.miDelClick(Sender: TObject);
begin
  ValList.Items.Delete(ValList.ItemIndex);
  ValListChange;
end;

procedure TUFForm.PopupMenuPopup(Sender: TObject);
begin
  ValList.PopupMenu.Items[0].Enabled := ValList.ItemIndex > -1;
  ValList.PopupMenu.Items[2].Enabled := ValList.ItemIndex > -1;
end;

procedure TUFForm.miEditClick(Sender: TObject);
begin
  EditValList(ValList.ItemIndex);
end;

procedure TUFForm.ValListCreate(AFilterData: TFilterData);
var SL: TStringList;
    i: Integer;
    Menu: TPopupMenu;
    MenuItem: TMenuItem;
begin
  if ValList <> nil then
  begin
    FreeAndNil(ValList);
  end;
  ValList := TListBox.Create(Self);
  with ValList do
  begin
    Left := 7;
    Top := ParLabel1.Top + ParLabel1.Height + 5;
    Width := CondBox.Width - 14;
    Style := lbOwnerDrawFixed;
    Height := CondBox.Height - Top - 8;
    Font.Size := 8;
    Anchors := [akLeft, akRight, akTop, akBottom];
    Parent := CondBox;
    OnDblClick := ValListDblClick;
    if AFilterData.Par1 <> '' then
    begin
      try
        SL := TStringList.Create;
        SL.Text := ReplaceStr(AFilterData.Par1, ';', #13 + #10);
        for i := 0 to SL.Count - 1 do
        begin
          if AFilterData.FObjData is TObjData then
            ValList.Items.AddObject(Trim(FilterToStringDoc_GetVal(AFilterData.FObjData.ID_DBObj, StrToInt(SL[i]))), TObject(StrToInt(SL[i])))
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

  MenuItem := TMenuItem.Create(Menu);
  with MenuItem do
  begin
    Caption := 'Редактировать';
    ShortCut := VK_RETURN;
    OnClick := miEditClick;
  end;
  Menu.Items.Add(MenuItem);

  MenuItem := TMenuItem.Create(Menu);
  with MenuItem do
  begin
    Caption := 'Добавить';
    ShortCut := VK_INSERT;
    OnClick := miAddClick;
  end;
  Menu.Items.Add(MenuItem);

  MenuItem := TMenuItem.Create(Menu);
  with MenuItem do
  begin
    Caption := 'Удалить';
    ShortCut := VK_DELETE;
    OnClick := miDelClick;
  end;
  Menu.Items.Add(MenuItem);    
end;

procedure TUFForm.ParamChange(Sender : TObject);
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

  FilterToText(FTaskMaster.FilterData[CurrFilter]); // Пересчет текста условия
  CondGrid.Invalidate;
  RefreshFilter := True;
end;

procedure TUFForm.SetRefreshFilter(const Value: Boolean);
begin
  fRefreshFilter := Value;
end;

procedure TUFForm.NewFillTree;
var
  N, Node: TTreeNode;
  M: TMainData;
  I, J, Num: Integer;
  WorkList: TStringList;
begin {   
  try   
    WorkList := TStringList.Create;
    with WorkDS do
    begin
      if Active then Close;
      NameSQL := 'Get_User_Filter_List';
      Params.Clear;
      Params.CreateParam(ftInteger,'UNID',ptInput).Value := UniverseID;
      Params.CreateParam(ftInteger,'FILT_ID',ptInput).AsInteger := - 1;
      try
        Open;
      except
        on E: Exception do
        begin
          raise Exception.Create('Не могу получить список фильтров для выбранной схемы ' + E.Message);
        end;
      end;
      First;
      while not EOF do
      begin
        M := TMainData.Create(FTaskMaster);
        with M do
        begin
          ID := FieldByName('FILTER_ID').AsInteger;
          Name := FieldByName('NAME').AsString;
          ThisUser := FieldByName('USER_ID').AsString <> '';
          if FieldByName('PARENT_ID').AsString <> '' then
            ParentID := FieldByName('PARENT_ID').AsInteger;
          GrStr := FieldByName('GROUPSTR').AsString;
          CondStr := MakeCondByWhereStr(FieldByName('WHERESTR').AsString);

        end;
        Next;
      end;
      Close;
    end;
    for i := 0 to FTaskMaster.MainDataCount - 1 do
      if FTaskMaster.MainData[i].ParentID <> NoParent then
      begin
        for j := 0 to FTaskMaster.MainDataCount - 1 do
          if FTaskMaster.MainData[j].ID = FTaskMaster.MainData[i].ParentID then
          begin
            FTaskMaster.MainData[j].HasSubFilter := true;
            Break;
          end;
      end;

    for i := 0 to FTaskMaster.MainDataCount - 1 do
    begin
      M := FTaskMaster.MainData[i];
      if (M.ID <> -1) and (M.ParentID = NoParent) then
      begin
        N := TTreeView(MainNode.TreeView).Items.AddChildObject(MainNode, M.Name, M);
        N.HasChildren := (M.GrStr <> '') or (M.HasSubFilter);
        MainViewSetNodeImageIndex(N);
      end;
    end;
    if (IDList <> nil) and (SelectedFilter <> -1) then
    begin
      Node := MainNode;
      for i := IDList.Count - 1 downto 0 do
      begin
        Num := Integer(IDList[i]);
        for j := 0 to Node.Count - 1 do
        begin
          if TMainData(Node.Item[j].Data).ID = Num then
          begin
            Node := Node.Item[j];
            Node.Expand(false);
            Break;
          end;
        end;
      end;
      if Node <> nil then
        TTreeView(MainNode.TreeView).Selected := Node;
    end;
  finally
    WorkList.Free;
    TTreeView(MainNode.TreeView).Items.EndUpdate;
  end;
  if Assigned(fOnFillTree) then fOnFillTree(Self);    }
end;

function TUFForm.SaveFilter : boolean;
var
  Node: TTreeNode;
  i : integer;
  PropData : TPropData;
  AFilterData : TFilterData;
begin
  Result := false;
 
  try
    TDispatchConnection(Connection).AppServer.BeginTrans;
    if SelectedFilter = -1 then
    begin
      FSelectedFilter := TDispatchConnection(Connection).AppServer.FLT_FilterAdd(edName.Text);
      if FSelectedFilter = -1 then
        raise Exception.Create('Ошибка при сохранении фильтра');
    end
    else
    begin
      if TDispatchConnection(Connection).AppServer.FilterDel(SelectedFilter) = -1 then
        raise Exception.Create('Ошибка при сохранении фильтра');

      if TDispatchConnection(Connection).AppServer.FLT_FilterEdit(SelectedFilter, edName.Text) = -1 then
        raise Exception.Create('Ошибка при сохранении фильтра');
    end;

    with FieldsListBox do
    begin
      for i := 0 to Items.Count - 1 do
      begin
        PropData := TPropData(Items.Objects[i]);

        if TDispatchConnection(Connection).AppServer.FLT_ColumnsAdd(SelectedFilter, PropData.ID_DBObj, PropData.id_Rel) = -1 then
          raise Exception.Create('Ошибка при сохранении фильтра');
      end;
    end;
    with GrListBox do
    begin
      for i := 0 to Items.Count - 1 do
      begin
        PropData := TPropData(Items.Objects[i]);

        if TDispatchConnection(Connection).AppServer.FLT_GroupAdd(SelectedFilter, PropData.ID_DBObj, PropData.id_Rel) = -1 then
          raise Exception.Create('Ошибка при сохранении фильтра');
      end;
    end;
    with OrderListBox do
    begin
      for i := 0 to Items.Count - 1 do
      begin
        PropData := TPropData(Items.Objects[i]);

        if TDispatchConnection(Connection).AppServer.FLT_OrderAdd(SelectedFilter, PropData.ID_DBObj, PropData.id_Rel) = -1 then
          raise Exception.Create('Ошибка при сохранении фильтра');
      end;

      for i := 0 to FTaskMaster.FilterDataCount - 1 do
      begin
        AFilterData := FTaskMaster.FilterData[i];

        if TDispatchConnection(Connection).AppServer.FLT_CondAdd(SelectedFilter,
                                                                  AFilterData.FObjData.Unid_Obj,
                                                                  AFilterData.FObjData.Unid_Prop,
                                                                  AFilterData.FObjData.Unid_Rel,
                                                                  integer(AFilterData.CondCode),
                                                                  AFilterData.Par1,
                                                                  AFilterData.Par2) = -1 then
          raise Exception.Create('Ошибка при сохранении фильтра');

      end;
    end;
    TDispatchConnection(Connection).AppServer.CommitTrans;
    Result := true;
  except
    TDispatchConnection(Connection).AppServer.RollbackTrans;
  end;
end;

procedure TUFForm.ObjViewChange(Sender: TObject; Node: TTreeNode);
begin
  SetEnabledButtons;
end;

procedure TUFForm.ObjViewGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TUFForm.ObjViewGetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  with Node do
  begin
    if TObject(Node.Data) is TObjData then
    begin
      if Expanded then
        ImageIndex := 0
      else
        ImageIndex := 1;
    end
    else
      if (TObject(Node.Data) is TPropData) and (TPropData(Node.Data).isSelect)  then
        ImageIndex := 8
      else
        ImageIndex := 2;
  end;
end;

procedure TUFForm.ObjViewDblClick(Sender: TObject);
var P: TPoint;
    Node: TTreeNode;
begin
  P := Mouse.CursorPos;
  P := ObjView.ScreenToClient(P);
  Node := ObjView.GetNodeAt(P.X, P.Y);
  if (Node = ObjView.Selected) and (aAdd.Enabled) then
    aAdd.Execute;
end;

procedure TUFForm.CondGridClick(Sender: TObject);
begin
  if FTaskMaster.FilterDataCount > 0 then
    CurrFilter := CondGrid.Row;
end;

procedure TUFForm.CondGridDrawCell(Sender: TObject; ACol, ARow: Integer;
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

function TUFForm.FilterToString(FNumber : Integer) : String;
var
  S1, S2 : String;
begin                            
{  GetFilterParams(FTaskMaster.FilterData[FNumber], S1, S2, False);
  with FTaskMaster.FilterData[FNumber] do
  begin
    Result := 'Значение объекта "' + FObjData.ObjName + '"';
    if OperCode = - 1 then Exit;
    Result := Result + ' ' + CondArray[OperCode];
    if S1 <> '' then Result := Result + ' ' + S1;
    if S2 <> '' then Result := Result + ' и ' + S2
  end;  }
end;

procedure TUFForm.GetFilterParams(AFilterData : TFilterData; var P1, P2 : String; SQLParam : Boolean);
var
  ToDate : Boolean;
  Dm     : String;
begin
{  P1 := '';
  P2 := '';
  with AFilterData do
  begin
    ToDate := (OperCode < ArrMax) and (FObjData.DType = 2);
    if Par1 <> '' then
    begin
      if ToDate then
        P1 := FormatDateTime(SQLDateMask, StrToFloat(Par1))
      else
        P1 := Par1;
    end;
    if Par2 <> '' then
    begin
      if ToDate then
        P2 := FormatDateTime(SQLDateMask, StrToFloat(Par2))
      else
        P2 := Par2;
    end;
  end;}
end;

procedure TUFForm.GrListBoxClick(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TUFForm.FilterToText(FilterData: TFilterData; ANeedRecalc : boolean);
begin
  if ANeedRecalc or (FilterData.FText = '') then
    FilterData.FText := FilterToStringDoc(FilterData);
end;

procedure TUFForm.TypeCondBoxChange(Sender: TObject);
var
  I: Integer;
begin
  if TypeCondBox.ItemIndex = -1 then
    FTaskMaster.FilterData[CurrFilter].CondCode := uctNone
  else
    FTaskMaster.FilterData[CurrFilter].CondCode := TUFCondType(TypeCondBox.Items.Objects[TypeCondBox.ItemIndex]);
  FilterToText(FTaskMaster.FilterData[CurrFilter]);
  CondGrid.Repaint;

  SetParamEditors(FTaskMaster.FilterData[CurrFilter].CondCode);
//  CurrFilter := FCurrFilter;
  RefreshFilter := true;
  SetEnabledButtons;
end;

procedure TUFForm.SetEnabledButtons;
begin
  aRefreshe.Enabled := RefreshFilter;
  aSave.Enabled := (SelCount > 0) and aRefreshe.Enabled;
  if CondControl.ActivePage = FieldsSheet then
  begin
    with FieldsListBox do
    begin
      aAdd.Enabled := (ufsMayChangeFields in Self.Style) and (ObjView.Selected <> nil) and (TObject(ObjView.Selected.Data) is TPropData) and (Items.IndexOfObject(TPropData(ObjView.Selected.Data)) = - 1);
      aDel.Enabled := Items.Count > 0;
      aUp.Enabled := ItemIndex > 0;
      aDown.Enabled := ItemIndex < Items.Count - 1;
    end;
  end
  else
    if CondControl.ActivePage = FilterSheet then
    begin
      aAdd.Enabled := (ufsMayChangeCond in Self.Style) and (ObjView.Selected <> nil) and
                      ((TObject(ObjView.Selected.Data) is TObjData) or (TObject(ObjView.Selected.Data) is TPropData));
      aDel.Enabled := FTaskMaster.FilterDataCount > 0;
      aUp.Enabled := False;
      aDown.Enabled := False;
    end              
    else
      if CondControl.ActivePage = GroupSheet then
      begin
        with GrListBox do
        begin
          aAdd.Enabled := (ufsMayChangeGroup in Self.Style) and (ObjView.Selected <> nil) and (TObject(ObjView.Selected.Data) is TPropData) and (Items.IndexOfObject(TPropData(ObjView.Selected.Data)) = - 1);
          aDel.Enabled := Items.Count > 0;
          aUp.Enabled := ItemIndex > 0;
          aDown.Enabled := ItemIndex < Items.Count - 1;
        end;
      end
      else
        if CondControl.ActivePage = OrderSheet then
        begin
          with OrderListBox do
          begin
            aAdd.Enabled := (ufsMayChangeOrder in Self.Style) and (ObjView.Selected <> nil) and (TObject(ObjView.Selected.Data) is TPropData) and (Items.IndexOfObject(TPropData(ObjView.Selected.Data)) = - 1);
            aDel.Enabled := Items.Count > 0;
            aUp.Enabled := ItemIndex > 0;
            aDown.Enabled := ItemIndex < Items.Count - 1;
          end;
      end;
      
end;

procedure TUFForm.CondControlChange(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TUFForm.SetConnection(const Value: TCustomConnection);
begin     
  FConnection2 := Value;
  WorkDS.RemoteServer := TCustomRemoteServer(Connection);
end;

procedure TUFForm.SetObjDataList(const Value: TList);
var
  i : Integer;
  ObjData   : TObjData;
  Node : TTreeNode;
begin
  ObjView.Items.BeginUpdate;
  try
    ObjView.Items.Clear;
    GetNodeTDList(nil);
  finally
    ObjView.Items.EndUpdate;
  end;
end;

function TUFForm.FilterToStringDoc(FilterData: TFilterData): String;
var S1, S2, S: String;
    i: Integer;
    SL: TStringList;
begin
  if FilterData.FObjData is TObjData then
    S1 := FilterData.Par1
  else
    GetNewFilterParams(FilterData, S1, S2, False);
  with FilterData do
  begin
    if FObjData = nil then
      Exit;
    Result := FObjData.FullName;    
    if CondCode <> uctNone then
    begin
      Result := Result + ' ' + UFCondGetName(FObjData.DType, CondCode);
    end;
    if (S1 <> '') and (CondCode in [uctEq..uctNotEq, uctInList, uctNotInList]) and
       (FilterData.FObjData.DType <> uftDate) and
       (FObjData is TObjData) then
    begin
      SL := TStringList.Create;
      try
        SL.Text := ReplaceStr(S1, ';', #13 + #10);
        S := '';
        FSL.Clear;
        for i := 0 to SL.Count - 1 do
        begin        //000
          if S = '' then
            S := FilterToStringDoc_GetVal(FObjData.ID_DBObj, StrToInt(SL[i]))
          else
            S := S + '; ' + FilterToStringDoc_GetVal(FObjData.ID_DBObj, StrToInt(SL[i]));
            
          FSL.Add(S);
        end;
        Result := Result + ' ' + S;
      finally
        SL.Free;
      end; 
    end
    else
    begin

//*************
      if (CondCode < uctInList) and (FObjData.DType = uftDate) then
      begin
        if FilterData.Par1 <> '' then
          S1 := UFFormatDateTimeEx(UFStrToFloatDef(Par1));
        if (FilterData.Par2 <> '')
      //    and (FilterData.CondCode in [9, 12])
          then
          S2 := UFFormatDateTimeEx(UFStrToFloatDef(Par2));
      end;
//*************

      if S1 <> '' then Result := Result + ' ' + S1;
      if S2 <> '' then Result := Result + ' и ' + S2;
    end;
  end;
end;


function TUFForm.FilterToStringDoc_GetVal(id_Obj, ID: Integer): String;
var S : OleVariant;
begin
  if TDispatchConnection(Connection).AppServer.FLT_ObjGetProp(id_Obj, ID, S) = 1 then
    Result := S
  else
    Result := '';
end;

procedure TUFForm.GetNewFilterParams(AFilterData: TFilterData;
  var P1, P2: String; SQLParam: Boolean);
var
  ToDate: Boolean;
  E : Extended;
//  Dm    : String;
begin
  P1 := '';
  P2 := '';
  with AFilterData do
  begin
    if FObjData = nil then Exit;
    ToDate := (FObjData.DType = uftDate);
    if Par1 <> '' then
    begin
      if ToDate then
        P1 := UFFormatDateTimeEx(UFStrToFloatDef(Par1))
      else
        P1 := Par1;
    end;
    if (Par2 <> '') {and (OperCode in [9, 12])} then
    begin
      if ToDate then
        P2 := UFFormatDateTimeEx(UFStrToFloatDef(Par2))
      else
        P2 := Par2;
    end;
  end;  
end;

procedure TUFForm.GetNodeTDListCover(Node: TTreeNode);
begin
  // Обертка для заполнения дерева
  // Отключает отрисовку
  ObjView.Items.BeginUpdate;
  try
    if Node <> nil then
      Node.DeleteChildren
    else
      ObjView.Items.Clear;
    GetNodeTDList(Node);
  finally
    if ObjView.Items.Count > 0 then
      ObjView.Items[0].Expand(False);
    ObjView.Items.EndUpdate;
  end;
end;

procedure TUFForm.GetNodeTDList(Node: TTreeNode);
var
  i, j : Integer;
  ObjData  : TObjData;
  N: TTreeNode;
  ACLID : Variant;
  Cnt: Integer;
begin
  { Вариант с рекурсией  }
  try
    if Node = nil then
    begin
      ACLID := Null;
      ObjView.Items.Clear;
    end
    else
    begin
      ACLID := TObjData(Node.Data).ID_Rel;
      Node.DeleteChildren;
    end;
    Cnt := FTaskMaster.ObjDataCount;
    for i := 0 to Cnt - 1 do
    begin
      ObjData := FTaskMaster.ObjData[i];
      if (ObjData.PID = ACLID) then
      begin
          N := ObjView.Items.AddChildObject(Node, ObjData.ObjName, ObjData);
          GetNodeTDList(N);
        for j := 0 to ObjData.FPropList.Count - 1 do
        begin
          ObjView.Items.AddChildObject(N, TPropData(ObjData.FPropList[j]).ObjName, ObjData.FPropList[j]);
        end;
      end;
    end;
  finally
//    if Node <> nil then
//      TObjData(Node.Data).HasDetail := Node.HasChildren;
  end;  
end;

procedure TUFForm.ObjViewExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  if (Node.HasChildren) and (Node.Count = 0) and (TObject(Node.Data) is TObjData) then
  begin
    GetNodeTDList(Node);
  end;
end;

procedure TUFForm.FormCreate(Sender: TObject);
begin
  FilterWasSaved := false;
  CondControl.ActivePageIndex := 0;
  ParLabel1.Caption := '';
  ParLabel2.Caption := '';
end;

procedure TUFForm._ClearList(AList : TList);
var Obj : TObject;
begin
  while AList.Count > 0 do
  begin
    Obj := TObject(AList[AList.Count - 1]);
    AList.Delete(AList.Count - 1);
    Obj.Free;                    
  end;
end;


procedure TUFForm.ObjViewDeletion(Sender: TObject; Node: TTreeNode);
begin
 { if (Node.Data <> nil) then
  begin
    try
      TObject(Node.Data).Free;
    except
      on E : Exception do
        raise Exception.Create('Ошибка при удалении объекта из Node.Data ' + E.Message);
    end;
    Node.Data := nil;
  end; }
end;

procedure TUFForm.SetFilterName(const Value: String);
begin
  FFilterName := Value;
  Caption := 'Фильтр -' + FFilterName;
end;

procedure TUFForm.FilterSheetResize(Sender: TObject);
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

procedure TUFForm.ObjViewDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := aDel.Enabled and
     ((Source = FieldsListBox) or
     (Source = GrListBox) or
     (Source = OrderListBox));
end;

procedure TUFForm.ObjViewDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if (Source = FieldsListBox) or
     (Source = GrListBox) or
     (Source = OrderListBox) then
    aDel.Execute;
end;

procedure TUFForm.CalcUpDownPos;
begin
 //1013 SepBtn.Width := SepBtn.Width + Panel1.Left - UpBtn.Left;
end;

function TUFForm.GetSelectedNode: TTreeNode;
begin
  Result := FSelectedNode;
end;

procedure TUFForm.SetSelectedNode(const Value: TTreeNode);
begin
  if FSelectedNode <> Value then
    FSelectedNode := Value;
end;

procedure TUFForm.FormConstrainedResize(Sender: TObject; var MinWidth,
  MinHeight, MaxWidth, MaxHeight: Integer);
begin
{  BeginUpdateControl(CondControl);
  try
    if (TypeCondBox <> nil) and (CondBox <> nil) then
    begin
      TypeCondBox.Width := CondBox.ClientWidth - 14;
    end;
    if ParEdit1 <> nil then
    begin
      if (ParEdit2 <> nil) or (ParEdit1.ClassType = TRxCalcEdit) or (ParEdit1.ClassType = TDateEdit) then
        ParEdit1.Width := (TypeCondBox.Width - 20) Div 2
      else
        ParEdit1.Width := TypeCondBox.Width;
      ParLabel1.Width := ParEdit1.Width
    end;
    if (ParEdit2 <> nil) and (ParEdit1 <> nil) then
    begin
      with ParEdit2 do
      begin
        Left := ParEdit1.Width + 27;
        Width := ParEdit1.Width
      end;
      with ParLabel2 do
      begin
        Left := ParEdit2.Left;
        Width := ParEdit2.Width
      end
    end;
    if CondGrid <> nil then
        CondGrid.DefaultColWidth := CondGrid.ClientWidth - 1;
    CalcUpDownPos;
  finally
    EndUpdateControl(CondControl);
  end; }
end;

function TUFForm.GetFilterString: String;
begin
  Result := MakeWhereStr;
end;

function TUFForm.MakeWhereStr: String;
var
  S,  St: String;
  I: Integer;
begin
{  Result := '';
  with FTaskMaster do
    for I := 0 to FilterDataCount - 1 do
    begin
      with FTaskMaster.FilterData[i] do
        if FObjData.ObjType = 1 then
        begin
          if (OperCode = - 1) or ((Par1Capt[OperCode] <> '') and (Par1 = '')) or ((Par2Capt[OperCode] <> '') and (Par2 = '')) then
          begin
            CurrFilter := I;
            raise Exception.Create('Фильтр не заполнен ');
          end;
          St := IntToStr(FObjData.ID ) + ',' + IntToStr(OperCode);
          if Par1Capt[OperCode] <> '' then
          begin
            if FObjData.DType = 2 then
              S := ReplaceStr(Par1, ',', '.')
            else
              S := Par1;
              St := St + ',' + S;
          end;
          if Par2Capt[OperCode] <> '' then
          begin
            if FObjData.DType = 2 then
              S := ReplaceStr(Par2, ',', '.')
            else
              S := Par2;
              St := St + ',' + S;
          end;
        end
        else
          St := IntToStr(FObjData.ID);
      if Result <> '' then Result := Result + '|';
      Result := Result + St;
    end; }
end;

function TUFForm.GetFilterTextToDoc: String;
var i: Integer;
    N: Integer;
begin
  Result := '';
  N := FTaskMaster.FilterDataCount;
  for i := 0 to N - 1 do
  begin
    if Result <> '' then Result := Result + #13 + #10;
    if FTaskMaster.FilterData[i].Text = '' then FilterToText(FTaskMaster.FilterData[i]);
    Result := Result + FTaskMaster.FilterData[i].Text;
    //FilterToStringDoc(FTaskMaster.FilterData[i]);
  end;
end;

procedure TUFForm.ListBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
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

procedure TUFForm.SetSelectedFilter(const Value: Integer);
begin
  fSelectedFilter := Value;
  RefresheSelectedFilter;

  SetEnabledButtons;
end;

procedure TUFForm.RefresheSelectedFilter;
  function GetDS(AName : String) : boolean;
  begin
    Result := false;
    with WorkDS do
    begin
      // *** Читаем датасет ***
      if Active then Close;
      ProviderName := AName;
      Params.Clear;
      FetchParams;
      Params.ParamByName('@id_Filter').Value := fSelectedFilter;
      try
        Open;
      except
        on E: Exception do
        begin
          Close;
          raise Exception.Create('Ошибка при чтении фильтра ' + E.Message);
        end;
      end;
      Result := True;
    end;
  end;
var
  I : Integer;
begin
  try
//    FTaskMaster.ClearFilterList;
    GrListBox.Items.BeginUpdate;
    FieldsListBox.Items.BeginUpdate;
    OrderListBox.Items.BeginUpdate;
    FieldsListBox.Items.Clear;
    GrListBox.Items.Clear;
    OrderListBox.Items.Clear;
    ObjView.Items.BeginUpdate;
    BeginUpdateControl(CondControl);
    with CondGrid do
    begin
      RowCount := 0;
      DefaultRowHeight := 1;
    end;

    for I := 0 to FTaskMaster.PropDataCount - 1 do
      FTaskMaster.PropData[I].isSelect := false;
    if FSelectedFilter = - 1 then
    begin
      CurrFilter := - 1;
      Caption := 'Создание фильтра';
      edName.Text := 'Новый фильтр';
    end
    else
    begin
      with WorkDS do
      begin
        GetDS('dsFltProp');
        FilterName := FieldByName('Name').AsString;
        Caption := FilterName;
        edName.Text := FilterName;
      // *** Читаем столбы ***
        GetDS('dsCol');
        First;
        while not Eof do
        begin
          for i := 0 to FTaskMaster.PropDataCount - 1 do
          begin
            if (FTaskMaster.PropData[i].ID_DBObj = FieldByName('id_Prop').Value) and
               (FTaskMaster.PropData[i].id_Rel = FieldByName('id_Rel').Value)  then
            begin
              FTaskMaster.PropData[i].isSelect := true;
              FieldsListBoxAddItem(FTaskMaster.PropData[i]);
            end;
          end;
          Next;
        end;

        // *** Читаем группировки ***
        GetDS('dsGrp');
        First;
        while not Eof do
        begin
          for i := 0 to FTaskMaster.PropDataCount - 1 do
          begin
            if (FTaskMaster.PropData[i].ID_DBObj = FieldByName('id_Prop').Value) and
               (FTaskMaster.PropData[i].id_Rel = FieldByName('id_Rel').Value)  then
            begin
              GrListBoxAddItem(FTaskMaster.PropData[i]);
            end;
          end;
          Next;
        end;
        // *** Читаем сортировки ***
        GetDS('dsOrder');
        First;
        while not Eof do
        begin
          for i := 0 to FTaskMaster.PropDataCount - 1 do
          begin
            if (FTaskMaster.PropData[i].ID_DBObj = FieldByName('id_Prop').Value) and
               (FTaskMaster.PropData[i].id_Rel = FieldByName('id_Rel').Value)  then
            begin
              OrderListBoxAddItem(FTaskMaster.PropData[i]);
            end;
          end;
          Next;
        end;
       // *** Читаем условия ***
        GetDS('dsCond');
        First;
        while not Eof do
        begin
          if not CreateFilterItem(WorkDS) then
            raise Exception.Create('Ошибка при чтении условий фильтра');
          Next;
        end;
      end;
    end;
  except
  end;

  ObjView.Items.EndUpdate;
  with FieldsListBox do
  begin
    Items.EndUpdate;
    ItemIndex := 0;
  end;
  with GrListBox do
  begin
    Items.EndUpdate;
    ItemIndex := 0;
  end;
  with OrderListBox do
  begin
    Items.EndUpdate;
    ItemIndex := 0;
  end;
  with CondGrid do
  begin
    RowCount := FTaskMaster.FilterDataCount;
    if FTaskMaster.FilterDataCount > 0 then
      CurrFilter := 0
    else
      CurrFilter := -1;
  end;
  EndUpdateControl(CondControl);
  RefreshFilter := False; 
end;

function TUFForm.CreateFilterItem(CDS : TClientDataSet) : boolean;
var AFilterData : TFilterData;
    i : integer;
    ADBObj, ADBObjRez : TDBObj;
begin
  Result := false;
  ADBObjRez := nil;
  if CDS.FieldByName('id_Prop').IsNull then
  begin
    // *** Это объект
    for i := 0 to FTaskMaster.ObjDataCount - 1 do
    begin
      ADBObj := FTaskMaster.ObjData[i];
      if (ADBObj.ID_DBObj = CDS.FieldByName('id_Obj').Value) and
         (ADBObj.id_Rel = CDS.FieldByName('id_Rel').Value)  then
      begin
        ADBObjRez := ADBObj;
        Break;
      end;
    end;
  end
  else
  begin
    // *** Это свойство
    for i := 0 to FTaskMaster.PropDataCount - 1 do
    begin
      ADBObj := FTaskMaster.PropData[i];
      if (ADBObj.ID_DBObj = CDS.FieldByName('id_Prop').Value) and
         (ADBObj.unid_Rel = CDS.FieldByName('id_Rel').Value)  then
      begin
        ADBObjRez := ADBObj;
        Break;
      end;
    end;
  end;
  if ADBObjRez <> nil then
  begin
    AFilterData := TFilterData.Create(FTaskMaster);
    AFilterData.FObjData := ADBObjRez;
    AFilterData.CondCode := TUFCondType(CDS.FieldByName('CondCode').AsInteger);
    AFilterData.Par1 := CDS.FieldByName('Par1').AsString;
    AFilterData.Par2 := CDS.FieldByName('Par2').AsString;

    Result := True;
  end;
end;


procedure TUFForm.SetStyle(const Value: TUniverseFilterStyles);
begin
  FStyle := Value;
//  CheckUniverseFilterStyles;
end;

function TUFForm.GetSelCount: Integer;
var i: Integer;
begin
  Result := 0;
  for i := 0 to FTaskMaster.PropDataCount - 1 do
    if FTaskMaster.PropData[i].isSelect then
      Inc(Result);

end;

procedure TUFForm.ListBoxDblClick(Sender: TObject);
begin
  aDel.Execute;
end;

procedure TUFForm.SetTreeDataList(const Value: TList);
begin

end;

procedure TUFForm.SetID_Univ(const Value: Integer);
begin
  FID_Univ := Value;
  GetNodeTDListCover(nil);
end;

procedure TUFForm.aAddExecute(Sender: TObject);
var
  D : TFilterData;
begin
  if csDesigning in ComponentState then Exit;
{  if (CondControl.ActivePage <> FilterSheet) then
    Exit; }

  if CondControl.ActivePage = FieldsSheet then
  begin
    with FieldsListBox do
    begin
      if Items.IndexOfObject(TPropData(ObjView.Selected.Data)) = - 1 then
      begin
        FieldsListBoxAddItem(TPropData(ObjView.Selected.Data));
        TPropData(ObjView.Selected.Data).isSelect := true;
      end;
     end;
  end
  else
    if CondControl.ActivePage = FilterSheet then
    begin
      D := TFilterData.Create(FTaskMaster);
      with D do
      begin
        FObjData := ObjView.Selected.Data;
        CondCode := uctNone;
        Par1 := '';
        Par2 := ''
      end;
      with CondGrid do
      begin
        RowCount := FTaskMaster.FilterDataCount;
        Refresh;
        CurrFilter := RowCount - 1;
      end
    end
    else
      if CondControl.ActivePage = GroupSheet then
      begin
        with GrListBox do
          if Items.IndexOfObject(TObjData(ObjView.Selected.Data)) = - 1 then
          begin
            GrListBoxAddItem(TPropData(ObjView.Selected.Data));
      //      Items.AddObject('', TObjData(ObjView.Selected.Data));
      //      ItemIndex := Items.Count - 1;
          end;
      end
      else
        if CondControl.ActivePage = OrderSheet then
        begin
          with OrderListBox do
            if Items.IndexOfObject(TObjData(ObjView.Selected.Data)) = - 1 then
            begin
              OrderListBoxAddItem(TPropData(ObjView.Selected.Data));
             // Items.AddObject('', TObjData(ObjView.Selected.Data));
           //   ItemIndex := Items.Count - 1;
            end;
        end;
  RefreshFilter := True;
  ObjView.Refresh;  
  SetEnabledButtons;
end;

procedure TUFForm.aDelExecute(Sender: TObject);
var I : integer;
begin
  if CondControl.ActivePage = FieldsSheet then
  begin
    with FieldsListBox do
    begin
      I := ItemIndex;
      if I > 0 then Dec(I);
      TPropData(Items.Objects[ItemIndex]).isSelect := false;
      Items.Delete(ItemIndex);
      if Items.Count > 0 then ItemIndex := I;
    end;
  end
  else
    if CondControl.ActivePage = FilterSheet then
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
    end
    else
      if CondControl.ActivePage = GroupSheet then
      begin
        with GrListBox do
        begin
          I := ItemIndex;
          if I > 0 then Dec(I);
          Items.Delete(ItemIndex);
          if Items.Count > 0 then ItemIndex := I;
        end;
      end
      else
        if CondControl.ActivePage = OrderSheet then
        begin
          with OrderListBox do
          begin
            I := ItemIndex;
            if I > 0 then Dec(I);
            Items.Delete(ItemIndex);
            if Items.Count > 0 then ItemIndex := I;
          end;
        end;
  RefreshFilter := True;
  ObjView.Refresh;  
  SetEnabledButtons;
end;

procedure TUFForm.aRefresheExecute(Sender: TObject);
begin
  RefresheSelectedFilter;
  RefreshFilter := False;
end;

procedure TUFForm.aSaveExecute(Sender: TObject);
var
  N: String;
begin
  if csDesigning in ComponentState then Exit;
  if FilterName <> '' then
    N := FilterName
  else
    N := 'Новый фильтр';

  if not InputQuery('Наименование фильтра', 'Введите наименование', N) then Exit;
  if N = '' then Exit;

  SaveFilter;
  FilterWasSaved := true;
end;

procedure TUFForm.aUpExecute(Sender: TObject);
begin
  if CondControl.ActivePage = FieldsSheet then
  begin
    with FieldsListBox do
    begin
      Items.Exchange(ItemIndex - 1, ItemIndex);
      Refresh;
    end;
  end
  else
    if CondControl.ActivePage = GroupSheet then
    begin
      with GrListBox do
      begin
        Items.Exchange(ItemIndex - 1, ItemIndex);
        Refresh;
      end;
    end
    else
      if CondControl.ActivePage = OrderSheet then
      begin
        with OrderListBox do
        begin
          Items.Exchange(ItemIndex - 1, ItemIndex);
          Refresh;
        end;
      end;
  SetEnabledButtons;
  RefreshFilter := True;
end;

procedure TUFForm.aDownExecute(Sender: TObject);
begin
  if CondControl.ActivePage = FieldsSheet then
  begin
    with FieldsListBox do
    begin
      Items.Exchange(ItemIndex + 1, ItemIndex);
      Refresh;
    end;
  end
  else
    if CondControl.ActivePage = GroupSheet then
    begin
      with GrListBox do
      begin
        Items.Exchange(ItemIndex + 1, ItemIndex);
        Refresh;
      end;
    end
    else
      if CondControl.ActivePage = OrderSheet then
      begin
        with OrderListBox do
        begin
          Items.Exchange(ItemIndex + 1, ItemIndex);
          Refresh;
        end;
      end;
  SetEnabledButtons;
  RefreshFilter := True;
end;

procedure TUFForm.btnOkClick(Sender: TObject);
begin
  if 1 = 2 then
  begin
    ModalResult := mrNone;
  end;
end;

procedure TUFForm.ObjViewCustomDraw(Sender: TCustomTreeView;
  const ARect: TRect; var DefaultDraw: Boolean);
begin
  ObjView.Canvas.FillRect(ARect);
end;

procedure TUFForm.EditValList(Index: Integer);
var V : Variant;
    Rez : boolean;
    S : String;
    ID : integer;
    ID_Obj : integer;
begin
  Rez := false;
  if FTaskMaster.FilterData[CurrFilter].FObjData is TPropData then // Это фильтр по свойству
  begin
    if (Index > -1) and (Index <= ValList.Items.Count) then
      V := ValList.Items[Index]
    else
      V := Null;
    case FTaskMaster.FilterData[CurrFilter].FObjData.DType of
      uftStr :
      begin
        Rez := InputBoxStr(TPropData(FTaskMaster.FilterData[CurrFilter].FObjData).FullName, '', V);
      end;
      uftInt :
      begin
        Rez := InputBoxDigit(TPropData(FTaskMaster.FilterData[CurrFilter].FObjData).FullName, '', V);
      end;
      uftFloat :
      begin
        Rez := InputBoxDigit(TPropData(FTaskMaster.FilterData[CurrFilter].FObjData).FullName, '', V, '0');
      end;
      uftDate :
      begin
        Rez := InputBoxDate(TPropData(FTaskMaster.FilterData[CurrFilter].FObjData).FullName, '', V);
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
    Rez := InputBoxObj(TObjData(FTaskMaster.FilterData[CurrFilter].FObjData).ObjName,
                       FTaskMaster.FilterData[CurrFilter].FObjData.Unid_Obj,
                       ID,
                       S,
                       Connection);
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

procedure TUFForm.ComboButtonClick(Sender : TObject);
var V : Variant;
    Rez : boolean;
    S : String;
    ID : integer;
    ID_Obj : integer;
begin
  Rez := false;
  if FTaskMaster.FilterData[CurrFilter].FObjData is TObjData then // Это фильтр по свойству
  begin
    ID := StrToIntDef(FTaskMaster.FilterData[CurrFilter].Par1, -1); 
    Rez := InputBoxObj(TObjData(FTaskMaster.FilterData[CurrFilter].FObjData).ObjName,
                       FTaskMaster.FilterData[CurrFilter].FObjData.Unid_Obj,
                       ID,
                       S,
                       Connection);
    if Rez then
    begin
      FTaskMaster.FilterData[CurrFilter].Par1 := IntToStr(ID);
      FTaskMaster.FilterData[CurrFilter].FSL.Add(S);
      TComboEdit(ParEdit1).Text := S;
      
      with FTaskMaster.FilterData[CurrFilter] do
      begin
        FText := FObjData.ObjName + ' ' + UFCondGetName(FObjData.DType, CondCode) + ' ' + S;
      end;
      CondGrid.InvalidateCell(0, CurrFilter);
    end;
  end;
end;

function TUFForm.GetConnection2: TCustomConnection;
begin
  Result := fConnection2;
end;

end.
