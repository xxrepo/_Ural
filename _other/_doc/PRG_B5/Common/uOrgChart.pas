unit uOrgChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, ComCtrls, dxExEdtr, dxCntner,
  dxTL, dxDBCtrl, dxDBTL, dxDBTLCl, Menus, Buttons, OrgChart, ImgList,
  ActnList, ToolWin, DBClient, Provider, RxMemDS, Grids, DBGrids, Clipbrd,
  RXCtrls, AdvSplitter, AdvMenus, AdvOfficePager, AdvOfficeButtons;

type
  THackOrgChart = class (TOrgChart);

  TDWChart = class(TForm)
    Panel2: TPanel;
    btnClose: TButton;
    qChild2: TADOQuery;
    qOwners2: TADOQuery;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Splitter1: TAdvSplitter;
    Panel3: TPanel;
    PageControl1: TAdvOfficePager;
    TabSheet1: TAdvOfficePage;
    TabSheet2: TAdvOfficePage;
    dsChild: TDataSource;
    dsOwners: TDataSource;
    pmChild: TAdvPopupMenu;
    Expandall1: TMenuItem;
    Collapseall1: TMenuItem;
    pmOwn: TAdvPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    Splitter2: TAdvSplitter;
    ImPIC: TImageList;
    tsTest: TAdvOfficePage;
    ActionList1: TActionList;
    aUP: TAction;
    aDown: TAction;
    ImageList: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    aLoad: TAction;
    aSave: TAction;
    ListBox1: TListBox;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    TabSheet4: TAdvOfficePage;
    Memo1: TMemo;
    DataSetProvider1: TDataSetProvider;
    qChild: TClientDataSet;
    DataSetProvider2: TDataSetProvider;
    qChild2NAME: TStringField;
    qChild2ID_CA: TBCDField;
    qChild2ID_PARENT: TBCDField;
    qChild2APRC: TBCDField;
    qChild2ID_ICONS: TBCDField;
    qChildNAME: TStringField;
    qChildID_CA: TBCDField;
    qChildID_PARENT: TBCDField;
    qChildAPRC: TBCDField;
    qChildID_ICONS: TBCDField;
    qChildicn: TIntegerField;
    qOwners: TClientDataSet;
    qOwners2NAME: TStringField;
    qOwners2ID_CA: TBCDField;
    qOwners2ID_PARENT: TBCDField;
    qOwners2APRC: TBCDField;
    qOwners2ID_ICONS: TBCDField;
    qOwners2CNT: TBCDField;
    qOwners2ID_CA_REAL: TBCDField;
    qOwners2ALEVEL: TBCDField;
    qOwners2ACOLOR: TBCDField;
    qOwnersNAME: TStringField;
    qOwnersID_CA: TBCDField;
    qOwnersID_PARENT: TBCDField;
    qOwnersAPRC: TBCDField;
    qOwnersID_ICONS: TBCDField;
    qOwnersCNT: TBCDField;
    qOwnersID_CA_REAL: TBCDField;
    qOwnersALEVEL: TBCDField;
    qOwnersACOLOR: TBCDField;
    qOwnersicn: TIntegerField;
    qOwners2ACTAMOUNT: TBCDField;
    qOwnersACTAMOUNT: TBCDField;
    rxCA: TRxMemoryData;
    rxCAid_CA: TIntegerField;
    rxCAName: TStringField;
    rxCAicn: TIntegerField;
    dbgDates: TDBGrid;
    DataSource1: TDataSource;
    aAddCA: TAction;
    aDelCA: TAction;
    ToolBar2: TToolBar;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    qCAProp2: TADOQuery;
    Panel4: TPanel;
    ScrollBox1: TScrollBox;
    aEditOWN: TAction;
    aEditCH: TAction;
    Edit1: TMenuItem;
    aAddCA1: TMenuItem;
    qChild2ID_CA_REAL: TBCDField;
    qChildID_CA_REAL: TBCDField;
    N1: TMenuItem;
    Edit2: TMenuItem;
    BitBtn2: TBitBtn;
    SavePic: TSaveDialog;
    BitBtn3: TBitBtn;
    qqqOwnInfo: TADOQuery;
    qqqOwnInfoAM: TBCDField;
    qqqOwnInfoNAME: TStringField;
    qqqOwnInfoAPRC: TBCDField;
    Print1: TMenuItem;
    Print2: TMenuItem;
    PopupMenu1: TAdvPopupMenu;
    Edit3: TMenuItem;
    Goto1: TMenuItem;
    Goto2: TMenuItem;
    qOwners2LINESTYLE: TBCDField;
    qOwnersLINESTYLE: TBCDField;
    qOwners2AINDEX: TWideStringField;
    qOwnersAINDEX: TWideStringField;
    qChild2Aindex: TWideStringField;
    qChildAindex: TWideStringField;
    N2: TMenuItem;
    Addtofilter1: TMenuItem;
    N3: TMenuItem;
    Addtofilter2: TMenuItem;
    Addtofilter3: TMenuItem;
    CheckBox1: TAdvOfficeCheckBox;
    qOwners2BGCOLOR: TBCDField;
    qOwnersBGCOLOR: TBCDField;
    ImPicCH: TImageList;
    Button1: TButton;
    Action1: TAction;
    RxSpeedButton1: TRxSpeedButton;
    pmPrint: TAdvPopupMenu;
    miPrintPic: TMenuItem;
    N4: TMenuItem;
    miPrintOwn: TMenuItem;
    miPrintPicA3: TMenuItem;
    Print100size1: TMenuItem;
    PrintDialog1: TPrintDialog;
    procedure Expandall1Click(Sender: TObject);
    procedure Collapseall1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aDownExecute(Sender: TObject);
    procedure aLoadExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure ChartDChanged(Sender: TObject);
    procedure aUPExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure aAddCAExecute(Sender: TObject);
    procedure aDelCAExecute(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure aEditOWNExecute(Sender: TObject);
    procedure aEditCHExecute(Sender: TObject);
    procedure dxOwnChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure dxChildChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure dxChildDeletion(Sender: TObject; Node: TdxTreeListNode);
    procedure pmOwnPopup(Sender: TObject);
    procedure pmChildPopup(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure qOwnersID_CA_REALGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qChildID_CA_REALGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Print1Click(Sender: TObject);
    procedure Print2Click(Sender: TObject);
    procedure ChartDDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ChartDDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Edit3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Goto1Click(Sender: TObject);
    procedure Goto2Click(Sender: TObject);
    procedure Addtofilter1Click(Sender: TObject);
    procedure Addtofilter2Click(Sender: TObject);
    procedure Addtofilter3Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure miPrintOwnClick(Sender: TObject);
    procedure miPrintPicClick(Sender: TObject);
    procedure miPrintPicA3Click(Sender: TObject);
    procedure Print100size1Click(Sender: TObject);
  private
    AIncorporatorItem : TIncorporatorItem;
    AOrgChartItem : TOrgChartItem;
    FFFNodeOWN, FFFNodeCH : TdxTreeListNode;
    FMaxLevel : integer;
    procedure GetDate;
    procedure ReListBox;
    function GetItemByID(AID: integer): TOrgChartItem;
    procedure AddCA(id_CA: integer);
    procedure CombineInc;
    procedure GotoCA(ID_CA: integer);
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(id_CA : integer; ADate : Variant);
    procedure CMMouseWheel(var Message: TCMMouseWheel); message CM_MOUSEWHEEL;

  end;

var
  OrgChart2: TDWChart;
function ShowOrgChart(id_CA : integer; ADate : Variant): boolean;

implementation

uses uDM, foMyFunc, uMain, uCASelector, uCAProp, uPrev, uWP, uWP_Pic,
  uWP_PicA3, uPrgForm;

{$R *.dfm}
function ShowOrgChart(id_CA : integer; ADate : Variant): boolean;
var F : TDWChart;
begin
  Result := false;
  F := TDWChart.Create(nil);
  try
    F.Initialize(id_CA, ADate);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin

    end;

  finally
    F.Free;
  end;

end;

{ TOrgChart }
procedure TDWChart.AddCA(id_CA: integer);
begin
  if id_CA > 0 then
  begin
    with qCAProp2 do
    begin
      Close;
      Parameters.ParamByName('id_CA').Value := id_CA;
      Open;
      try
        rxCA.Append;
        rxCAid_CA.AsInteger := id_CA;
        rxCANAME.AsString := qCAProp2.FieldByName('Name').AsString;
        rxCA.Post;
      finally
        Close;
      end;
    end;
  end;
end;

procedure TDWChart.Initialize(id_CA: integer; ADate: Variant);
var sysKey: integer;
begin
  rxCA.Open;
  TabSheet4.TabVisible := false;
  tsTest.TabVisible := false;
  
  PageControl1.ActivePageIndex := 0;
  if ADate = null then
    DateTimePicker1.DateTime := Now
  else
    DateTimePicker1.DateTime := ADate;

  AddCA(id_CA);
  GetDate;
end;

  function StringListCompareStrings(List: TStringList; Index1, Index2: Integer): Integer;
  var S, S2 : String;
      i : integer;
  begin
    if Index1 = Index2 then
    begin
      Result := 0;
      Exit;
    end;
    i := Pos('% ', List[Index1]) - 1;
    if i > 0 then
    begin
      S := trim(COPY(List[Index1], 1, i));
      S := StringReplace(S, ',', DecimalSeparator, []);
      S := StringReplace(S, '.', DecimalSeparator, []);
    end
    else
      S := '0';
    i := Pos('% ', List[Index2]) - 1;
    if i > 0 then
    begin
      S2 := trim(COPY(List[Index2], 1, i));
      S2 := StringReplace(S2, ',', DecimalSeparator, []);
      S2 := StringReplace(S2, '.', DecimalSeparator, []);
    end
    else
      S2 := '0';
    try
      Result := ORD(StrToFloat(S) > StrToFloat(S2));
    except

    end;
  end;
  function TDWChart.GetItemByID(AID : integer) :TOrgChartItem;
  var i : integer;
  begin
    Result := nil;
    for i := 0 to ChartD.Items.Count - 1 do
    begin
      if ChartD.Items[i].id_CA = AID then
      begin
        Result := ChartD.Items[i];
        Break; 
      end;
    end;
  end;
  
procedure TDWChart.GetDate;
    function GetIncHint(XOrgInc : TOrgChartItem; XLink : TOrgChartLink) : String;
    var i : integer;
    begin
      Result := '';
      if XLink.ItemTo.ActAmount = 0 then
        Exit;
      for i := 0 to XOrgInc.IncorporatorItems.Count - 1 do
      begin
        if Result <> '' then
          Result := Result + #13 + #10;
        Result := Result + FormatFloat('0.##%', 100*XOrgInc.IncorporatorItems[i].ActAmount/XLink.ItemTo.ActAmount)
         + FormatFloat('(0.##)', XOrgInc.IncorporatorItems[i].ActAmount)
       + ' ' + XOrgInc.IncorporatorItems[i].CaptionInt;
      end;
    end;
var sysKey, i, j, IcNum: integer;
    Year, Month, Day: Word;
    AOrg, AOrgInc : TOrgChartItem;
    ALink : TOrgChartLink;
    SL : TStringList;
    AInc : TIncorporatorItem;
    S : String;

    function HasLinkByInc(AObj : TOrgChartItem) : boolean;
    var K : integer;
    begin
      Result := false;
      for k := 0 to ChartD.Links.Count - 1 do
      begin
        if (ChartD.Links[k].ItemTo = AObj) and (ChartD.Links[k].ItemFrom <> nil)
          and (ChartD.Links[k].ItemFrom.ItemKind = ikIncorporator) then
        begin
          Result := true;
          Break;
        end;
      end;
    end;
    
    procedure GetInc(id_CA : integer; var SHint : String; ACTAMOUNT : Variant);
    var ARecNo, k, ZZZ : integer;
        SH, SSS : String;
    begin
      with qOwners do
      begin
        SHint := '';
        ARecNo := RecNo;
        First;
        K := 0;
      //  Filter := 'ID_PARENT=' + IntToStr(id_CA);
      //  Filtered := true;
        while not Eof do
        begin
          if (qOwnersID_PARENT.AsInteger = id_CA) and (GetItemByID(qOwnersID_CA_Real.AsInteger) = nil) then
          begin
            INC(k);
            AInc := AOrgInc.IncorporatorItems.Add;
            AInc.Id_CA := qOwnersID_CA_Real.AsInteger;
            AInc.CaptionInt := qOwnersNAME.AsString;
            if qOwnersAINDEX.AsString > '' then
              AInc.Caption := qOwnersAINDEX.AsString
            else
              AInc.Caption := 'none';
            AInc.Caption := AInc.Caption + FormatFloat(' - 0.##', qOwnersAPRC.AsFloat) + '%';
            AInc.ActAmount := qOwnersAPRC.AsFloat*ACTAMOUNT/100;
            SH := FormatFloat('0.##', qOwnersAPRC.AsFloat) + '% ' +
            '(' + FormatFloat('0.##', qOwnersAPRC.AsFloat*ACTAMOUNT/100) + ') '
            + qOwnersNAME.AsString;
            i := DM.IconIn(qOwnersID_ICONS.AsInteger, nil, ImPIC);
            AInc.ImageIndex := i;
            AInc.Hint := SH;
// **************************************************
        qqqOwnInfo.Close;
        qqqOwnInfo.Parameters.ParamByName('sysKey2').Value := sysKey;
        qqqOwnInfo.Parameters.ParamByName('id_User2').Value := DM.id_User;
        qqqOwnInfo.Parameters.ParamByName('id_CA').Value := qOwnersID_CA_Real.AsInteger;
        qqqOwnInfo.Open;
        qqqOwnInfo.First;
        SSS := '';
        ZZZ := 0;
        while not qqqOwnInfo.Eof do
        begin
          inc(ZZZ);
          if SSS <> '' then
            SSS := SSS + #13 + #10;
          SSS := SSS + FormatFloat('0.##', qqqOwnInfoAPRC.AsFloat) + '% ' +
            '(' + FormatFloat('0.##', qqqOwnInfoAM.AsFloat) + ') '
            + qqqOwnInfoNAME.AsString; 
          qqqOwnInfo.Next;
        end;
        qqqOwnInfo.Close;
        if ZZZ > 1 then
        begin
          AInc.Hint := AInc.Hint + #13 + #10 + '----------------';
          AInc.Hint := AInc.Hint + #13 + #10 + 'other property:';
          AInc.Hint := AInc.Hint + #13 + #10 + SSS;
        end;
// **************************************************
            if SHint <> '' then
              SHint := SHint + #13 + #10;
            SHint := SHint + SH;
          end;
          Next;
        end;
        Filtered := false;
        RecNo := ARecNo;
      end;

    end;
begin
  AIncorporatorItem := nil;
  AOrgChartItem := nil;
  FFFNodeOWN := nil;
  FFFNodeCH := nil;
  Memo1.Lines.Clear;
  ImPIC.Clear;
  ImPicCH.Clear;
  FMaxLevel := 0;
  DecodeDate(DateTimePicker1.DateTime, Year, Month, Day);
  DM.MakeCAList(sysKey, EncodeDate(Year, Month, Day), rxCA);
  with qOwners do
  begin
    Close;
    Params.ParamByName('sysKey').Value := sysKey;
    Params.ParamByName('sysKey2').Value := sysKey;
    Params.ParamByName('id_User').Value := DM.id_User;
    Params.ParamByName('id_User2').Value := DM.id_User;
    Open;
  end;
  with qChild do
  begin
    Close;
    Params.ParamByName('sysKey').Value := sysKey;
    Params.ParamByName('sysKey2').Value := sysKey;
    Params.ParamByName('sysKey3').Value := sysKey;
    Params.ParamByName('id_User').Value := DM.id_User;
    Params.ParamByName('id_User2').Value := DM.id_User;
    Params.ParamByName('id_User3').Value := DM.id_User;
    IndexDefs.Clear;
    IndexDefs.Add('ixXXX2', 'APrc; Name', [ixCaseInsensitive]);
    IndexName := 'ixXXX2';
    Open;
      First;
      while not Eof do
      begin
        i := DM.IconIn(FieldbyName('ID_ICONS').AsInteger, nil, ImPicCH);
       // if i <> 0 then
        begin
          Edit;
          qChildicn.AsInteger := i;
          Post;
        end;
        Next;
      end;
  end;     
  with qOwners do
  begin
    SL := TStringList.Create;
    DisableControls;
    BeginUpdateControl(ScrollBox1);
 //   ChartD.BeginUpdate;
    IndexDefs.Clear;
    IndexDefs.Add('ixXXX', 'ALevel; APrc; Name', [ixCaseInsensitive]);
    IndexName := 'ixXXX';

    try
      ChartD.links.clear;
      ChartD.Items.clear;
      First;
      while not Eof do
      begin
        IcNum := DM.IconIn(FieldbyName('ID_ICONS').AsInteger, nil, ImPIC);
      //  if i > 0 then
        begin
          Edit;
          qOwnersicn.AsInteger := IcNum;
          Post;
        end;
        if (FieldbyName('ID_CA').AsInteger > 0) and (FieldbyName('CNT').AsInteger > 0) then
        begin
          Memo1.Lines.Add('AOrg := TOrgChartItem(Chart.Items.Add);');

          if FieldbyName('ALevel').AsInteger = 1 then
          begin
            // Добавляем учредителей
            AOrgInc := ChartD.Items.Add;
            AOrgInc.ItemKind := ikIncorporator;
            GetInc(FieldbyName('ID_CA').AsInteger, S, qOwnersACTAMOUNT.AsFloat);
     //       AInc := AOrgInc.IncorporatorItems.Add;
            AOrgInc.CaptionInt := 'Owners of ' + FieldbyName('NAME').AsString;
          end;                              
          AOrg := TOrgChartItem(ChartD.Items.Add);
          AOrg.ActAmount := qOwnersACTAMOUNT.AsFloat;
          AOrg.Caption := FieldbyName('NAME').AsString;// + ' (' + FormatFloat('0.##', AOrg.ActAmount) + ')';
          AOrg.CaptionInt := FieldbyName('NAME').AsString;// + ' (' + FormatFloat('0.##', AOrg.ActAmount) + ')';
          if FieldbyName('CNT').AsInteger > 0 then
          begin
            Memo1.Lines.Add('AOrg.ItemKind := ikCompany;');
            AOrg.ItemKind := ikCompany;
        //    AOrg.Caption := AOrg.Caption + 'ikCompany';
          end
          else
          begin
            AOrg.ItemKind := ikIncorporator;
         //   AOrg.Caption := AOrg.Caption + 'ikIncorporator';
           Memo1.Lines.Add('AOrg.ItemKind := ikIncorporator;');
          end;
          Memo1.Lines.Add('AOrg.Caption := ' + '''' + FieldbyName('NAME').AsString + '''' + ';');
          AOrg.LineColor := FieldbyName('AColor').AsInteger;
          if not FieldbyName('BgColor').IsNull then
            AOrg.BgColor := FieldbyName('BgColor').AsInteger;
          AOrg.id_CA := FieldbyName('ID_CA').AsInteger;
          Memo1.Lines.Add('AOrg.id_CA := ' + IntToStr(FieldbyName('ID_CA').AsInteger) + ';');
        //  AOrg.Alevel := FieldbyName('Alevel').AsInteger + 1;
          if FMaxLevel < AOrg.level then
            FMaxLevel := AOrg.level;
          if IcNum > 0 then
            AOrg.ImageIndex := IcNum;
          if FieldbyName('ALevel').AsInteger = 1 then
          begin
            ALink := ChartD.Links.Add;

            ALink.ItemFrom := AOrgInc;
            ALink.ItemTo := AOrg;
            ALink.Hint := ALink.ItemFrom.CaptionInt + ' <- ' + ALink.ItemTo.CaptionInt + ' 100(' + FloatToStr(ALink.ItemTo.ActAmount) + ')';
        //    ALink.ActAmount := 100;
            SL.Text := S;
            SL.CustomSort(StringListCompareStrings);
            AOrg.Hint := trim(SL.Text);
            
          end;
        end;
        Next;
      end;
    // Links
      First;
      while not Eof do
      begin
        if (FieldbyName('ID_CA').AsInteger = 0) {and (qOwners.FieldbyName('ALevel').AsInteger > 0)} then
        begin
          ALink := TOrgChartLink(ChartD.Links.Add);
          ALink.LineStyle := TPenStyle(FieldbyName('LineStyle').AsInteger);
          ALink.ItemFrom := GetItemByID(qOwners.FieldbyName('ID_CA_Real').AsInteger);
          ALink.ItemTo := GetItemByID(FieldbyName('ID_Parent').AsInteger);
          if (1=1) and (ALink.ItemFrom = nil) and (ALink.ItemTo <> nil) and (not HasLinkByInc(ALink.ItemTo)) then
          begin
            // Добавляем еще один блок учредителей
           // AOrgInc := ChartD.Items.Add;
            AOrgInc := TOrgChartItem(ChartD.Items.Insert(AOrgInc.Index - 0));

            AOrgInc.ItemKind := ikIncorporator;
            AOrgInc.CaptionInt := 'Owners of ' + ALink.ItemTo.Caption;
            ALink.ItemFrom := AOrgInc;
            GetInc(FieldbyName('ID_Parent').AsInteger, S, ALink.ItemTo.ActAmount);
            if ALink.ItemTo.ActAmount > 0 then
            begin
              for i := 0 to AOrgInc.IncorporatorItems.Count - 1 do
              begin
                ALink.ActAmount := ALink.ActAmount + AOrgInc.IncorporatorItems[i].ActAmount;
                if (ALink.ItemTo <> nil) and (ALink.ItemTo.Hint <> '') then
                  ALink.ItemTo.Hint := trim(ALink.ItemTo.Hint) + #13 + #10;

                ALink.ItemTo.Hint := ALink.ItemTo.Hint + FormatFloat('0.##', 100*AOrgInc.IncorporatorItems[i].ActAmount/ALink.ItemTo.ActAmount) + '% ' +
                ' (' + FormatFloat('0.##', AOrgInc.IncorporatorItems[i].ActAmount) + ') ' +
                AOrgInc.IncorporatorItems[i].CaptionInt;

              end;

              ALink.ActAmount := 100*ALink.ActAmount/ALink.ItemTo.ActAmount;
            end;
            ALink.Hint := GetIncHint(AOrgInc, ALink);
            //ALink.ItemFrom.CaptionInt + ' <- ' + ALink.ItemTo.CaptionInt + ' ' + FormatFloat('0.##', ALink.ActAmount) +  '(' + FormatFloat('0.##', ALink.ActAmount/100*ALink.ItemTo.ActAmount) + ')';

          end
          else
          begin
            if (ALink.ItemFrom <> nil) and (ALink.ItemTo <> nil) then
              ALink.Hint := ALink.ItemFrom.Caption + ' <- ' + ALink.ItemTo.Caption + ' ' + FormatFloat('0.##', FieldbyName('APrc').AsFloat)
              + '(' + FormatFloat('0.##', ALink.ItemTo.ActAmount*FieldbyName('APrc').AsFloat/100) + ')';
            if (ALink.ItemFrom <> nil) and (ALink.ItemTo <> nil) and (ALink.ItemTo.Hint <> '') then
              ALink.ItemTo.Hint := ALink.ItemTo.Hint + #13 + #10;
            if (ALink.ItemFrom <> nil) and (ALink.ItemTo <> nil) and (ALink.ItemTo.ActAmount <> 0) then
            begin
              ALink.ItemTo.Hint := ALink.ItemTo.Hint + FormatFloat('0.##', qOwners.FieldbyName('APrc').AsFloat) + '% ' +
              ' (' + FormatFloat('0.##', qOwners.FieldbyName('APrc').AsFloat*ALink.ItemTo.ActAmount/100) + ') ' +
              FieldbyName('NAME').AsString;
              ALink.ActAmount := qOwners.FieldbyName('APrc').AsFloat;
            end;
          end;
          Memo1.Lines.Add('ALink := TOrgChartLink(Chart.Links.Add);');
          Memo1.Lines.Add('ALink.ItemFrom := GetItemByID(' + IntToStr(FieldbyName('ID_CA_Real').AsInteger) + ');');
          Memo1.Lines.Add('ALink.ItemTo := GetItemByID(' + IntToStr(FieldbyName('ID_Parent').AsInteger) +');');
        end;
        Next;
      end;
      for i := 0 to ChartD.Items.Count - 1 do
      begin
        if ChartD.Items[i].Hint <> '' then
        begin
          SL.Text := trim(ChartD.Items[i].Hint);
          SL.CustomSort(StringListCompareStrings);
          if ChartD.Items[i].ItemKind = ikCompany then
          begin
            ChartD.Items[i].Hint := trim(FormatFloat('0.##', ChartD.Items[i].ActAmount) + ' Total'
             + #13 + #10 + '------------'
             + #13 + #10 + trim(SL.Text));
          end;
        end
        else
        begin
         { SL.Clear;
          for j := 0 to ChartD.Links.Count - 1 do
          begin
            if ChartD.Links[j].ItemFrom = ChartD.Items[i] then
            begin
              SL.Add(FormatFloat('0.00', ChartD.Links[j].ActAmount) + '% ' + ChartD.Links[j].ItemTo.Caption);
            end;
          end;
          SL.CustomSort(StringListCompareStrings);
          ChartD.Items[i].Hint := SL.Text;  }
        end;
      end;
      for i := 0 to ChartD.Items.Count - 1 do
        if ChartD.Items[i].ActAmount > 0 then
          ChartD.Items[i].Caption := ChartD.Items[i].Caption + ' (' + FormatFloat('0.##', ChartD.Items[i].ActAmount) + ')';
      ChartD.Title := 'Organization chart';
      if rxCA.RecordCount = 1 then
      begin
        ChartD.Title := ChartD.Title + ' of ' + rxCAName.AsString;
      end;
      ChartD.Title := ChartD.Title + ' until ' + FormatDateTime('dd-mm-yyyy', DateTimePicker1.DateTime);

      CombineInc;
    finally
      First;
      IndexDefs.Clear;
      IndexName := '';
    IndexDefs.Clear;
    IndexDefs.Add('ixXXX', 'APrc; Name', [ixCaseInsensitive]);
    IndexName := 'ixXXX';
                      

      dxOwn.FullCollapse;
      EnableControls;   // ChartD.links.clear;
      SL.Free;
      EndUpdateControl(ScrollBox1);
    //  ChartD.EndUpdate;
      ReListBox;
    end;
  end;
end;

procedure TDWChart.Expandall1Click(Sender: TObject);
begin
  dxChild.FullExpand;
end;

procedure TDWChart.Collapseall1Click(Sender: TObject);
begin
  dxChild.FullCollapse;

end;

procedure TDWChart.MenuItem1Click(Sender: TObject);
begin
  dxOwn.FullExpand;

end;

procedure TDWChart.MenuItem2Click(Sender: TObject);
begin
  dxOwn.FullCollapse;

end;

procedure TDWChart.BitBtn1Click(Sender: TObject);
begin
  GetDate;
end;

procedure TDWChart.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);

end;

procedure TDWChart.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);

end;

procedure TDWChart.CMMouseWheel(var Message: TCMMouseWheel);
begin
      if Message.WheelDelta < 0 then
        ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.ScrollPos + ScrollBox1.VertScrollBar.Increment
      //  ScrollBy(0, -1)
      else
        ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.ScrollPos - ScrollBox1.VertScrollBar.Increment;
     //   ScrollBy(0, 1);

end;

procedure TDWChart.aLoadExecute(Sender: TObject);
var SL : TStringList;
    i : integer;
    AObj : TOrgChartItem;
    AList : TList;
begin
  if OpenDialog1.Execute then
  begin
    SL := TStringList.Create;
    AList := TList.Create;
    ChartD.BeginUpdate;
    try
      SL.LoadFromFile(OpenDialog1.FileName);
      for i := 0 to SL.Count - 1 do
      begin
        AObj := GetItemByID(StrToInt(SL[i]));
        AList.Add(AObj);
      end;
      for i := 0 to AList.Count - 1 do
      begin
        if TOrgChartItem(AList[i]) <> nil then
          TOrgChartItem(AList[i]).Index := i;
      end;
    finally
      SL.Free;
      AList.Free;
      ChartD.EndUpdate;
    end;
  end;
end;

procedure TDWChart.aSaveExecute(Sender: TObject);
var SL : TStringList;
    i : integer;
begin
  if SaveDialog1.Execute then
  begin
    SL := TStringList.Create;
    try
      for i := 0 to ChartD.Items.Count - 1 do
      begin
        SL.Add(IntToStr(ChartD.Items[i].id_CA));
      end;
      SL.SaveToFile(SaveDialog1.FileName);
    finally
      SL.Free;
    end;
  end;
end;

procedure TDWChart.ChartDChanged(Sender: TObject);
begin
//  ReListBox;
end;

procedure TDWChart.ReListBox;
var i, ALevel, MaxLevel : integer;
    b : boolean;
begin
  ALevel := 0;
  MaxLevel := 10;
  ListBox1.Items.Clear;
  try
    for ALevel := 0 to 0 do
    begin
      b := false;
      for i := 0 to ChartD.Items.Count - 1 do
      begin
        if (ChartD.Items[i].ItemKind = ikIncorporator)  then
        begin
          ListBox1.Items.AddObject((ChartD.Items[i]).CaptionInt, ChartD.Items[i]);
        end;
      end;
    end;
  except;
    tag := 0;
  end;
end;

procedure TDWChart.aDownExecute(Sender: TObject);
var i : integer;
begin
  ChartD.BeginUpdate;
  try
    TOrgChartItem(ListBox1.Items.Objects[ListBox1.ItemIndex - 0]).Index := TOrgChartItem(ListBox1.Items.Objects[ListBox1.ItemIndex - 0]).Index + 1;
    i := ListBox1.ItemIndex + 1;
    ReListBox;
  finally
    ChartD.EndUpdate;
    ListBox1.ItemIndex := i;
    ChartD.Repaint;
  end;
end;

procedure TDWChart.aUPExecute(Sender: TObject);
var i : integer;
begin
  ChartD.BeginUpdate;
  try
    TOrgChartItem(ListBox1.Items.Objects[ListBox1.ItemIndex]).Index := TOrgChartItem(ListBox1.Items.Objects[ListBox1.ItemIndex]).Index - 1;
    i := ListBox1.ItemIndex - 1;
    ReListBox;
  finally
    ChartD.EndUpdate;
    ListBox1.ItemIndex := i;
    ChartD.Repaint;
  end;
end;

procedure TDWChart.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  aUP.Enabled := (ListBox1.ItemIndex >= 0) and (ListBox1.ItemIndex > 0)
    and (ListBox1.Items.Objects[ListBox1.ItemIndex] <> nil)
    and (ListBox1.Items.Objects[ListBox1.ItemIndex - 1] <> nil);
  aDown.Enabled := (ListBox1.ItemIndex >= 0) and (ListBox1.ItemIndex < ListBox1.Items.Count - 1)
    and (ListBox1.Items.Objects[ListBox1.ItemIndex] <> nil)
    and (ListBox1.Items.Objects[ListBox1.ItemIndex + 1] <> nil);
end;

procedure TDWChart.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  if ListBox1.Items.Objects[Index] = nil then
  begin
    ListBox1.Canvas.Brush.Color := $00DDDDDD;
    ListBox1.Canvas.Font.Style := ListBox1.Canvas.Font.Style + [fsBold];
  end;
  ListBox1.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 1, ListBox1.Items[Index]);
end;

procedure TDWChart.aAddCAExecute(Sender: TObject);
var AID : integer;
    AName : String;
begin
  if ShowCASelector(AID, AName) then
  begin
    if  not rxCA.Locate('id_ca', AID, []) then
    begin
      rxCA.Append;
      rxCAid_CA.AsInteger := AID;
      rxCANAME.AsString := AName;
      rxCA.Post;
    end;
  end;
end;

procedure TDWChart.aDelCAExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Do you realy want to remove item?'), '?', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    rxCA.Delete;
  end;
end;

procedure TDWChart.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  aDelCA.Enabled := not rxCA.IsEmpty;
end;

procedure TDWChart.aEditOWNExecute(Sender: TObject);
var id_CA : integer;
begin
  id_CA := FFFNodeOWN.Values[dxOwnID_CA_REAL.Index];
  if ShowCAProp(id_CA, false)  then
  begin
    GetDate;
    GotoCA(id_CA);
  end;
end;

procedure TDWChart.aEditCHExecute(Sender: TObject);
var id_CA : integer;
begin
  id_CA := FFFNodeCH.Values[dxChildID_CA_REAL.Index];
  if ShowCAProp(id_CA, false)  then
  begin
    GetDate;
    GotoCA(id_CA);
  end;
end;

procedure TDWChart.dxOwnChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin
  FFFNodeOWN := Node;
end;      

procedure TDWChart.dxChildChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin
  FFFNodeCH := Node;
end;

procedure TDWChart.dxChildDeletion(Sender: TObject; Node: TdxTreeListNode);
begin
  if FFFNodeOWN = Node then
    FFFNodeOWN := nil;
  if FFFNodeCH = Node then
    FFFNodeCH := nil;
end;

procedure TDWChart.pmOwnPopup(Sender: TObject);
begin
  aEditOWN.Enabled := FFFNodeOWN <> nil;
  Goto1.Enabled :=  aEditOWN.Enabled;
  Addtofilter1.Enabled :=  aEditOWN.Enabled;
end;

procedure TDWChart.pmChildPopup(Sender: TObject);
begin
  aEditCH.Enabled := FFFNodeCH <> nil;
  Goto2.Enabled :=  aEditCH.Enabled;
  Addtofilter2.Enabled :=  aEditCH.Enabled;
end;

procedure TDWChart.BitBtn2Click(Sender: TObject);
var Bitmap: TBitmap;
    MyRect, MyOther: TRect;
begin
  Bitmap := TBitmap.Create;
  Bitmap.Width :=ScrollBox1.HorzScrollBar.Range;//  ChartD.Width;
  Bitmap.Height := ScrollBox1.VertScrollBar.Range;// ChartD.Height;

  THackOrgChart(ChartD).PaintCanvas(Bitmap.Canvas);
  try
    MyRect := Rect(0,0, Bitmap.Width, Bitmap.Height);
    SavePic.FileName := '';
    if SavePic.Execute then
    begin
      Bitmap.SaveToFile(SavePic.FileName);
    end;
  finally
    Bitmap.Free;
  end;
end;

procedure TDWChart.BitBtn3Click(Sender: TObject);
begin
  ShowPrevPic(ChartD)

end;

procedure TDWChart.qOwnersID_CA_REALGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qOwnersID_PARENT.AsInteger = -1 then
    Text := IntToStr(Sender.AsInteger)
  else
    Text := '';
end;

constructor TDWChart.Create(AOwner: TCOmponent);
begin
  inherited;
  LoadSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + ClassName);
  LoadSplitterSettingsFromRegistry(Splitter2, SRegPath + '\' + ClassName);

end;

destructor TDWChart.Destroy;
begin
  SaveSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + ClassName);
  SaveSplitterSettingsFromRegistry(Splitter2, SRegPath + '\' + ClassName);
  inherited;
end;

procedure TDWChart.qChildID_CA_REALGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qChildID_PARENT.AsInteger = -1 then
    Text := IntToStr(Sender.AsInteger)
  else
    Text := '';

end;

procedure TDWChart.Print1Click(Sender: TObject);
begin
  ShowWP(Self,  true, false);
end;

procedure TDWChart.Print2Click(Sender: TObject);
begin
  ShowWP(Self,  false, true);

end;

procedure TDWChart.ChartDDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := true;
end;

procedure TDWChart.ChartDDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  tag := 0;
end;

procedure TDWChart.Edit3Click(Sender: TObject);
var id_CA : integer;
begin
  if (AOrgChartItem <> nil) and (AOrgChartItem.ItemKind = ikCompany) then
  begin
    id_CA := AOrgChartItem.Id_CA;
    if ShowCAProp(id_CA, false)  then
    begin
      GetDate;
      GotoCA(id_CA);
    end;
  end
  else
  if AIncorporatorItem <> nil then //(Obj is TOrgChartItem) and (TOrgChartItem(Obj).ItemKind = ikIncorporator) then
  begin
    id_CA := AIncorporatorItem.Id_CA;
    if ShowCAProp(id_CA, false)  then
    begin
      GetDate;
      GotoCA(id_CA);
    end;
  end;
end;

procedure TDWChart.PopupMenu1Popup(Sender: TObject);
var Obj : TObject;
begin
  AIncorporatorItem := nil;
  AOrgChartItem := nil;
  Obj := ChartD.CurrentObject;//ObjectAtPoint( P);
  Edit3.Enabled :=
  (Obj is TOrgChartItem);// and (TOrgChartItem(Obj).ItemKind = ikCompany);
  Addtofilter3.Enabled := Edit3.Enabled;
  if Obj is TOrgChartItem then
    AOrgChartItem := TOrgChartItem(Obj);
  if not Edit3.Enabled then
    Edit3.Caption := 'Edit...'
  else
  begin
    if AOrgChartItem.ItemKind = ikCompany then
    begin
      Edit3.Caption := 'Edit ' + AOrgChartItem.CaptionInt;
    end
    else
    begin
      AIncorporatorItem := AOrgChartItem.ExtractIncItem;
      if AIncorporatorItem <> nil then
        Edit3.Caption := 'Edit ' + AIncorporatorItem.CaptionInt;
    end;
  end;
end;

procedure TDWChart.GotoCA(ID_CA: integer);
var P : TPoint;
begin
  P := ChartD.GetPos(ID_CA);
  ScrollBox1.VertScrollBar.Position := P.Y - ScrollBox1.Height div 2;
  ScrollBox1.HorzScrollBar.Position := P.x - ScrollBox1.width div 2;
end;

procedure TDWChart.Goto1Click(Sender: TObject);
begin
  GotoCA(FFFNodeOWN.Values[dxOwnID_CA_REAL.Index]);
end;

procedure TDWChart.Goto2Click(Sender: TObject);
begin
  GotoCA(FFFNodeCH.Values[dxChildID_CA_REAL.Index]);
end;

procedure TDWChart.Addtofilter1Click(Sender: TObject);
begin
  AddCA(FFFNodeOWN.Values[dxOwnID_CA_REAL.Index]);
  GetDate;
end;

procedure TDWChart.Addtofilter2Click(Sender: TObject);
begin
  AddCA(FFFNodeCH.Values[dxChildID_CA_REAL.Index]);
  GetDate;
end;

procedure TDWChart.Addtofilter3Click(Sender: TObject);
var id_CA : integer;
begin
  if (AOrgChartItem <> nil) and (AOrgChartItem.ItemKind = ikCompany) then
  begin
    AddCA(AOrgChartItem.Id_CA);
    GetDate;
  end
  else
  if AIncorporatorItem <> nil then //(Obj is TOrgChartItem) and (TOrgChartItem(Obj).ItemKind = ikIncorporator) then
  begin
    AddCA(AIncorporatorItem.Id_CA);
    GetDate;
  end;

end;


procedure TDWChart.CombineInc;
  function IncIsEQ(AInc1, AInc2 : TOrgChartItem) : boolean;
  var i : integer;
  begin
    Result := false;
    if AInc1 = AInc2 then Exit;
    if (AInc1.ItemKind = ikCompany) or (AInc2.ItemKind = ikCompany) then
      Exit;
    if AInc1.IncorporatorItems.Count = AInc2.IncorporatorItems.Count then
    begin
      for i := 0 to AInc1.IncorporatorItems.Count - 1 do
      begin
        if AInc1.IncorporatorItems[i].Caption <> AInc2.IncorporatorItems[i].Caption then
        begin
          Exit;
        end;
      end;
      Result := true;
    end;
  end;
var i, j, K : integer;
    Alist : TList;
begin
  if not CheckBox1.Checked then Exit;  
  Alist := TList.Create;
  try
    for i := 0 to ChartD.Items.Count - 1 do
    begin
      for j := i + 1 to ChartD.Items.Count - 1 do
      begin
        if IncIsEQ(ChartD.Items[i], ChartD.Items[j]) then
        begin
          for k := 0 to ChartD.Links.Count - 1 do
          begin
            if ChartD.Links[k].ItemFrom = ChartD.Items[j] then
              ChartD.Links[k].ItemFrom := ChartD.Items[i];
            if ChartD.Links[k].ItemTo = ChartD.Items[j] then
              ChartD.Links[k].ItemTo := ChartD.Items[i];
          end;
          Alist.Add(ChartD.Items[j]);
        end;
      end;
    end;
  finally
    for j := 0 to Alist.Count - 1 do
    begin
      for i := ChartD.Items.Count - 1  downto 0 do
      begin
        if ChartD.Items[i] = Alist[j] then
        begin
          ChartD.Items[i].IncorporatorItems.Clear;
          ChartD.Items.Delete(i);
      //    THackOrgChart(ChartD).X_Layout.InitData;
      //    THackOrgChart(ChartD).Changed;
        //  ChartD.Items[i].Free;
          Break;
        end;
      end;
    end;
  end;
end;

procedure TDWChart.Action1Execute(Sender: TObject);
var i : integer;
begin
  Clipboard.AsText := 'Chart.Items.Clear;';
  Clipboard.AsText := Clipboard.AsText + #13 + #10 + 'Chart.Links.Clear;';
  for i := 0 to ChartD.Items.Count - 1 do
  begin
    Clipboard.AsText := Clipboard.AsText + #13 + #10 + 'AOrg := TOrgChartItem(Chart.Items.Add);';
    if ChartD.Items[i].ItemKind = ikCompany then
    begin
      Clipboard.AsText := Clipboard.AsText + #13 + #10 + 'AOrg.ItemKind := ikCompany;';
    end
    else
    begin
      Clipboard.AsText := Clipboard.AsText + #13 + #10 + 'AOrg.ItemKind := ikIncorporator;';
      Clipboard.AsText := Clipboard.AsText + #13 + #10 + 'AOrg.IncorporatorItems.Add.Caption := ' + '''' + 'учр. ' + IntToStr(i) + '''' + ';';  
    end;
   //   Clipboard.AsText := Clipboard.AsText + #13 + #10 + 'AOrg.Caption := ' + '''' + ChartD.Items[i].Caption + '''' + ';';
      Clipboard.AsText := Clipboard.AsText + #13 + #10 + 'AOrg.Caption := ' + '''' + ChartD.Items[i].CaptionInt + '''' + ';';
      Clipboard.AsText := Clipboard.AsText + #13 + #10 + 'AOrg.id_CA := ' + IntToStr(ChartD.Items[i].Id_CA) + ';';
  //  end;


  end;
  for i := 0 to ChartD.Links.Count - 1 do
  begin
    Clipboard.AsText := Clipboard.AsText + #13 + #10 + 'ALink := TOrgChartLink(Chart.Links.Add);';
    if ChartD.Links[i].ItemFrom <> nil then
      Clipboard.AsText := Clipboard.AsText + #13 + #10 + 'ALink.ItemFrom := GetItemByCI(' + '''' + ChartD.Links[i].ItemFrom.CaptionInt + '''' + ');';
    if ChartD.Links[i].ItemTo <> nil then
      Clipboard.AsText := Clipboard.AsText + #13 + #10 + 'ALink.ItemTo := GetItemByCI(' + '''' + ChartD.Links[i].ItemTo.CaptionInt + '''' + ');';
  end;
  Clipboard.AsText := Trim(Clipboard.AsText);
end;

procedure TDWChart.miPrintOwnClick(Sender: TObject);
begin
  ShowWP(Self, true, true);
end;

procedure TDWChart.miPrintPicClick(Sender: TObject);
begin
  ShowWP_Pic(Self);

end;

procedure TDWChart.miPrintPicA3Click(Sender: TObject);
begin
//  ShowWP_PicA3(Self);
  ShowMessage('Under construction');

end;

procedure TDWChart.Print100size1Click(Sender: TObject);
begin
  if PrintDialog1.Execute then
  begin
    ShowProgressForm(Handle, -1, -1, 'Printing chart...');
    Screen.Cursor := crSQLWait;
    try
      ChartD.Print;
    finally
      Screen.Cursor := crDefault;
      CloseProgressForm;
    end;
  end;
end;

end.
