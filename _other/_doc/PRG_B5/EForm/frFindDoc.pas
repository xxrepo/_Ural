unit frFindDoc;

interface

uses
  Windows, Messages, {$IFDEF VER150} Variants,{$ENDIF} SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, 
  RxLookup, Provider, MtUPDPrv, ExtDlgs, jpeg, ImgList,
  ComCtrls, ActnList, ToolWin, Grids, ADODB, Db, DBClient, RXDBCtrl, RXSpin, AdvOfficeButtons;

type
  THackControl = class(TControl)
    property Color;
  end;
  
  TfFindDoc = class(TFrame)
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Button2: TButton;
    ActionList1: TActionList;
    Action1: TAction;
    qDocList: TADOQuery;
    DataSetProvider1: TDataSetProvider;
    cdsDocList: TClientDataSet;
    qCur: TADOQuery;
    dsCur: TDataSource;
    qColProp: TADOQuery;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    lbDocDate: TLabel;
    lbNum: TLabel;
    lbDocComment: TLabel;
    lbDocDate2: TLabel;
    lbCloseDate: TLabel;
    lbCloseDate2: TLabel;
    lbSumm2: TLabel;
    lbSumm: TLabel;
    edDT: TEdit;
    edNum: TEdit;
    edDocComment: TEdit;
    deDocDate: TDateEdit;
    deDocDateTo: TDateEdit;
    Button1: TButton;
    deCloseDate: TDateEdit;
    deCloseDateTo: TDateEdit;
    lcCURNAME: TRxDBLookupCombo;
    ceSumm: TRxCalcEdit;
    Label2: TLabel;
    deEV_Date: TDateEdit;
    Label3: TLabel;
    deEV_Date2: TDateEdit;
    Label4: TLabel;
    edEV_EventComment: TEdit;
    cbAllEvent: TAdvOfficeCheckBox;
    Label5: TLabel;
    edRep: TEdit;
    Button3: TButton;
    Label6: TLabel;
    edCA: TEdit;
    Button4: TButton;
    Label7: TLabel;
    edEventType: TEdit;
    Button5: TButton;
    Label8: TLabel;
    edDateCreate: TDateEdit;
    Label9: TLabel;
    edDateCreate2: TDateEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    cbAllW: TAdvOfficeCheckBox;
    cbAllClosed: TAdvOfficeCheckBox;
    cdsDocListID_DOCBASE: TAutoIncField;
    cdsDocListNAME: TStringField;
    cdsDocListID_DOCTYPE: TIntegerField;
    cdsDocListNUM: TStringField;
    cdsDocListDATECREATE: TDateTimeField;
    cdsDocListDOCDATE: TDateTimeField;
    cdsDocListID_CA: TIntegerField;
    cdsDocListid_REP: TIntegerField;
    cdsDocListDELETED: TIntegerField;
    cdsDocListSUMM: TFloatField;
    cdsDocListID_CUR: TIntegerField;
    cdsDocListCOL1: TStringField;
    cdsDocListCOL2: TStringField;
    cdsDocListCOL3: TStringField;
    cdsDocListCOL4: TStringField;
    cdsDocListCOL5: TStringField;
    cdsDocListCOL6: TStringField;
    cdsDocListCOL7: TStringField;
    cdsDocListCOL8: TStringField;
    cdsDocListCOL9: TStringField;
    cdsDocListCOL10: TStringField;
    cdsDocListEV_Date: TDateTimeField;
    cdsDocListEV_EventComment: TStringField;
    cdsDocListDateClosed: TDateTimeField;
    cdsDocListAmount: TIntegerField;
    cdsDocListHasFormPrint: TBooleanField;
    cdsDocListHasFormEl: TBooleanField;
    cdsDocListRedDate: TDateTimeField;
    cdsDocListid_EventType: TIntegerField;
    cdsDocListDTName: TStringField;
    cdsDocListOrgName: TStringField;
    cdsDocListID_CAParent: TAutoIncField;
    cdsDocListOrgNameParent: TStringField;
    cdsDocListRepName: TStringField;
    cdsDocListID_RepParent: TAutoIncField;
    cdsDocListRepNameParent: TStringField;
    cdsDocListCURNAME: TStringField;
    cdsDocListEventTypeName: TStringField;
    Label10: TLabel;
    RxSpinEdit1: TRxSpinEdit;
    cdsDocListXDay: TIntegerField;
    cdsDocListDOCCOMMENT2: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    FSL : TStringList;
    procedure SaveCapt;
    procedure LoadCapt;

    procedure ChType;
  public
    Fid_DocType, FID_CA, FID_REP, Fid_EventType : integer;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize;
  end;
                   

implementation

uses uDM, foMyFunc, uDTSelector;

{$R *.DFM}

procedure TfFindDoc.Initialize;
var S : String;
   Year, Month, Day: Word;
begin
  qCur.Open;
  ChType;
  Fid_DocType := -1;
end;



procedure TfFindDoc.Button1Click(Sender: TObject);
var id_DocType : integer;
    AName : String;
begin
  LoadCapt;
  id_DocType := Fid_DocType;
  if ShowDTSelector(0, id_DocType, AName) then
  begin
    Fid_DocType := id_DocType;
    edDT.Text := AName;
    ChType;
  end;
end;

procedure TfFindDoc.SpeedButton1Click(Sender: TObject);
var i : integer;
begin
  RxSpinEdit1.Value := 0;
  cbAllClosed.Checked := false;
  cbAllW.Checked := false;

  ceSumm.Value := 0;
  lcCURNAME.KeyValue := 0;
  deCloseDate.Date := 0;
  deCloseDateTo.Date := 0;

  for i := 1 to 10 do
    TEdit(Self.FindComponent('ceCol' + IntToStr(i))).Text := '';

  Fid_DocType := -1;
  FID_CA := -1;
  FID_REP := -1;
  Fid_EventType := -1;
  
  edDT.Text := '';
  edCA.Text := '';
  edRep.Text := '';
  edEV_EventComment.Text := '';
  edEventType.Text := '';
  edNum.Text := '';
 // edName_D.Text := '';
 // edPost.Text := '';
  edDocComment.Text := '';
  deDocDate.Date := 0;
  deDocDateTo.Date := 0;
  cdsDocList.Close;

  ceSumm.Value := 0;
  lcCURNAME.KeyValue := 0;
  deCloseDate.Date := 0;
  deCloseDateTo.Date := 0;

  deEV_Date.Date := 0;
  deEV_Date2.Date := 0;
  cbAllEvent.Checked := false;

  edDateCreate.Date := 0;
  edDateCreate2.Date := 0;
end;

procedure TfFindDoc.SpeedButton2Click(Sender: TObject);
var S2, SS : String;
    i : integer;
begin
  cdsDocList.Close;
  S2 := '';


//*********************************
 { for i := 1 to 10 do
    if Trim(TEdit(Self.FindComponent('ceCol' + IntToStr(i))).Text) <> '' then
      S2 := S2 + ' AND UPPER(D.Col' + IntToStr(i) + ') like ' + '''' + '%' + AnsiUpperCase(Trim(TEdit(Self.FindComponent('ceCol' + IntToStr(i))).Text)) + '%' + '''';
   }

  if RxSpinEdit1.Value <> 0 then
  begin
   S2 := S2 + ' AND D.DateClosed is null AND xDay >=  ' + IntToStr(Trunc(RxSpinEdit1.Value));
  end;
  if cbAllClosed.Checked then
    S2 := S2 + ' AND D.DateClosed is not null ';
  if cbAllW.Checked then
    S2 := S2 + ' AND D.DateClosed is null ';

  if cbAllEvent.Checked then
  begin
    // ищем в истории событий
    if Fid_EventType > 0 then
      S2 := S2 + ' AND E.id_EventType= ' + IntToStr(Fid_EventType);
    if trim(edEV_EventComment.Text) > '' then
      S2 := S2 + ' AND UPPER(E.EventComment) like ' + '''' + '%' + AnsiUpperCase(Trim(edEV_EventComment.Text)) + '%' + '''';
    if (deEV_Date.Date > 0) then
      S2 := S2 + ' AND DateCreate >=' + '''' + FormatDateTime('yyyy-mm-dd', deEV_Date.Date) + ''''  ;
    if (deEV_Date.Date > 0) then
      S2 := S2 + ' AND DateCreate <=' + '''' + FormatDateTime('yyyy-mm-dd', deEV_Date.Date) + '''' ;
    if S2 <> '' then
      S2 := ' AND ID_DOCBASE in (SELECT ID_DOCBASE FROM DW_EVENT E WHERE event_deleted=0 ' + S2 + ')'; 
  end
  else
  begin
    // ищем в текущем состоянии
    if Fid_EventType > 0 then
      S2 := S2 + ' AND D.id_EventType= ' + IntToStr(Fid_EventType);
    if trim(edEV_EventComment.Text) > '' then
      S2 := S2 + ' AND UPPER(D.EV_EventComment) like ' + '''' + '%' + AnsiUpperCase(Trim(edEV_EventComment.Text)) + '%' + '''';
    if (deEV_Date.Date > 0) then
      S2 := S2 + ' AND EV_Date >=' + '''' + FormatDateTime('yyyy-mm-dd', deEV_Date.Date) + ''''  ;
    if (deEV_Date.Date > 0) then
      S2 := S2 + ' AND EV_Date <=' + '''' + FormatDateTime('yyyy-mm-dd', deEV_Date.Date) + '''' ;
  end;

  if ceSumm.Value > 0 then
    S2 := S2 + ' AND D.Summ= ' + StringReplace(FormatFloat('0.0', ceSumm.Value), ',', '.', []);

  if (deCloseDate.Date > 0) then
    S2 := S2 + ' AND CLOSEDATE >=' + '''' + FormatDateTime('yyyy-mm-dd', deCloseDate.Date) + ''''  ;
  if (deCloseDateTo.Date > 0) then
    S2 := S2 + ' AND CLOSEDATE <=' + '''' + FormatDateTime('yyyy-mm-dd', deCloseDateTo.Date) + '''' ;

  if lcCURNAME.KeyValue > 0 then
    S2 := S2 + ' AND D.id_Cur= ' + IntToStr(lcCURNAME.KeyValue);

  if Fid_DocType > 0 then
    S2 := S2 + ' AND D.id_DocType= ' + IntToStr(Fid_DocType);

  if FID_CA > 0 then
    S2 := S2 + ' AND (D.ID_CA= ' + IntToStr(FID_CA) + ' OR ID_CAParent= ' + IntToStr(FID_CA) + ')' ;
  if FID_REP > 0 then
    S2 := S2 + ' AND (D.ID_REP= ' + IntToStr(FID_REP) + ' OR ID_REPParent= ' + IntToStr(FID_REP) + ')' ;


  if Trim(edNum.Text) <> '' then
    S2 := S2 + ' AND UPPER(D.Num) like ' + '''' + '%' + AnsiUpperCase(Trim(edNum.Text)) + '%' + '''';
  if Trim(edDocComment.Text) <> '' then
    S2 := S2 + ' AND UPPER(D.DocComment2) like ' + '''' + '%' + AnsiUpperCase(Trim(edDocComment.Text)) + '%' + '''';

  if (deDocDate.Date > 0) then
    S2 := S2 + ' AND DocDate >=' + '''' + FormatDateTime('yyyy-mm-dd', deDocDate.Date) + '''' ;
  if (deDocDateTo.Date > 0) then
    S2 := S2 + ' AND DocDate <=' + '''' + FormatDateTime('yyyy-mm-dd', deDocDateTo.Date) + '''';

  if (edDateCreate.Date > 0) then
    S2 := S2 + ' AND DateCreate >=' + '''' + FormatDateTime('yyyy-mm-dd', edDateCreate.Date) + '''' ;
  if (edDateCreate2.Date > 0) then
    S2 := S2 + ' AND DateCreate <=' + '''' + FormatDateTime('yyyy-mm-dd', edDateCreate2.Date) + '''';

//*********************************
//  if (S2 = '') then
  //  raise Exception.Create('Не введены условия');
  qDocList.SQL.Clear;
  qDocList.SQL.Add('select * FROM VW_DOC D WHERE D.Deleted=0 ');

  if S2 <> '' then
    qDocList.SQL.Add(S2);
  cdsDocList.Open;
end;

procedure TfFindDoc.Button2Click(Sender: TObject);
begin
//
end;

procedure TfFindDoc.ChType;
var PCol : TPanel;
    lbCol : TLabel;
    i, pnnotVis : integer;
begin
  with qColProp do
  begin
    Close;
    Parameters.ParamByName('id_DocType').Value := Fid_DocType;
    Open;
    
    First;
    for i := 1 to 10 do
    begin
      PCol := TPanel(Self.FindComponent('pCOL' + IntToStr(i)));
     // if PCol <> nil then
     //   PCol.Visible := false;
      lbCol := TLabel(Self.FindComponent('lbCOL' + IntToStr(i)));
      if lbCol <> nil then
      begin
        lbCol.Enabled := true;
        if lbCol.FocusControl <> nil then
        begin
          lbCol.FocusControl.Enabled := lbCol.Enabled;
          if lbCol.Enabled then
             THackControl(lbCol.FocusControl).Color := clWindow
          else
             THackControl(lbCol.FocusControl).Color := clBtnFace;
        end;
      end;
    end;
    while not Eof do
    begin
      PCol := TPanel(Self.FindComponent('p' + qColProp.FieldByName('ColName').AsString));
      if PCol <> nil then
      begin
    //    PCol.Visible := qColProp.FieldByName('Visible').AsInteger = 1;
        if not PCol.Visible then
          inc(pnnotVis);
      end;
      lbCol := TLabel(Self.FindComponent('lb' + qColProp.FieldByName('ColName').AsString));
      if lbCol <> nil then
      begin
        lbCol.Caption := qColProp.FieldByName('ColSyn').AsString;
        lbCol.Enabled := qColProp.FieldByName('Visible').AsInteger = 1;
        if lbCol.FocusControl <> nil then
        begin
          lbCol.FocusControl.Enabled := lbCol.Enabled;
          if lbCol.Enabled then
             THackControl(lbCol.FocusControl).Color := clWindow
          else
             THackControl(lbCol.FocusControl).Color := clBtnFace;
        end;
      end;  
      Next;
    end;
  end;
  if pnnotVis = 0 then
    pnnotVis := 10;               
//  pDoc.Height := ceSumm.Top + ceSumm.Height + 4 + 240 - 24 * pnnotVis;
end;


procedure TfFindDoc.LoadCapt;
var i : integer;
begin
  for i := 0 to FSL.Count - 1 do
  begin
    if FSL.Objects[i] is TLabel then
    begin
      TLabel(FSL.Objects[i]).Caption := FSL[i];
    end;
  end;
end;

procedure TfFindDoc.SaveCapt;
var i : integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TLabel then
    begin
      FSL.AddObject(TLabel(Components[i]).Caption, Components[i]);
    end;
  end;
end;

constructor TfFindDoc.Create(AOwner: TCOmponent);
begin
  inherited;
  RxSpinEdit1.Value := 0;

  FSL := TStringList.Create;
  SaveCapt;
end;

destructor TfFindDoc.Destroy;
begin
  FSL.Free;
  inherited;
end;

procedure TfFindDoc.Button3Click(Sender: TObject);
var id_Rep : integer;
    AName : String;
begin
  LoadCapt;
  id_Rep := Fid_Rep;
  if ShowDTSelector(5, id_Rep, AName) then
  begin
    Fid_rep := id_rep;
    edRep.Text := AName;
  end;
end;

procedure TfFindDoc.Button4Click(Sender: TObject);
var id_CA : integer;
    AName : String;
begin
  LoadCapt;
  id_CA := Fid_CA;
  if ShowDTSelector(6, id_CA, AName) then
  begin
    Fid_CA := id_CA;
    edCA.Text := AName;
  end;
end;

procedure TfFindDoc.Button5Click(Sender: TObject);
var id_EventType : integer;
    AName : String;
begin
  LoadCapt;
  id_EventType := Fid_EventType;
  if ShowDTSelector(13, id_EventType, AName) then
  begin
    Fid_EventType := id_EventType;
    edEventType.Text := AName;
  end;
end;

end.
