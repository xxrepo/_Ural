unit frFindFirm;

interface

uses
  Windows, Messages, {$IFDEF VER150} Variants,{$ENDIF} SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, 
  RxLookup, Provider, MtUPDPrv, ExtDlgs, jpeg, ImgList,
  ComCtrls, ActnList, ToolWin, Grids, ADODB, Db, DBClient;

type
  THackControl = class(TControl)
    property Color;
  end;


  TfFindFirm = class(TFrame)
    GroupBox1: TGroupBox;
    Label8: TLabel;
    edName: TEdit;
    Label11: TLabel;
    edAddr: TEdit;
    Label12: TLabel;
    edDirector: TEdit;
    Label13: TLabel;
    edBuh: TEdit;
    edComments: TEdit;
    Label16: TLabel;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    cdsCAF: TClientDataSet;
    cdsCAFICN: TIntegerField;
    cdsCAFID_CA: TBCDField;
    cdsCAFPID: TBCDField;
    cdsCAFNAME: TWideStringField;
    cdsCAFDELETED: TBCDField;
    cdsCAFSTATUSNAME: TWideStringField;
    cdsCAFID_ICONS: TBCDField;
    cdsCAFCOMMENTS: TWideStringField;
    cdsCAFDATECREATE: TDateTimeField;
    cdsCAFADDR: TWideStringField;
    cdsCAFJURADR: TWideStringField;
    cdsCAFJURNAME: TWideStringField;
    cdsCAFDIRECTOR: TWideStringField;
    cdsCAFBUH: TWideStringField;
    cdsCAFCAPITAL: TBCDField;
    cdsCAFID_CUR: TBCDField;
    cdsCAFCURNAME: TWideStringField;
    cdsCAFPNAME: TWideStringField;
    DataSetProvider1: TDataSetProvider;
    qCAF: TADOQuery;
    qCAFID_CA: TBCDField;
    qCAFPID: TBCDField;
    qCAFNAME: TWideStringField;
    qCAFDELETED: TBCDField;
    qCAFSTATUSNAME: TWideStringField;
    qCAFID_ICONS: TBCDField;
    qCAFCOMMENTS: TWideStringField;
    qCAFDATECREATE: TDateTimeField;
    qCAFADDR: TWideStringField;
    qCAFJURADR: TWideStringField;
    qCAFJURNAME: TWideStringField;
    qCAFDIRECTOR: TWideStringField;
    qCAFBUH: TWideStringField;
    qCAFCAPITAL: TBCDField;
    qCAFID_CUR: TBCDField;
    qCAFCURNAME: TWideStringField;
    qCAFPNAME: TWideStringField;
    Button2: TButton;
    ActionList1: TActionList;
    Action1: TAction;
    Label14: TLabel;
    edOriginals: TEdit;
    gbStamp: TGroupBox;
    Label15: TLabel;
    Label20: TLabel;
    Residence: TLabel;
    edStampName: TEdit;
    edStampComment: TEdit;
    edStampPlaced: TEdit;
    qDTProp4: TADOQuery;
    qCur: TADOQuery;
    dsCur: TDataSource;
    edAIndex: TEdit;
    Label4: TLabel;
    qCAFAIndex: TWideStringField;
    cdsCAFAIndex: TWideStringField;
    qColProp: TADOQuery;
    pDoc: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    lbDocDate: TLabel;
    lbNum: TLabel;
    lbFIO: TLabel;
    lbCAName: TLabel;
    lbDocComment: TLabel;
    lbDocDate2: TLabel;
    lbCloseDate: TLabel;
    lbCloseDate2: TLabel;
    lbSumm2: TLabel;
    lbSumm: TLabel;
    lbINTEREST: TLabel;
    edDT: TEdit;
    edNum: TEdit;
    edFIO: TEdit;
    edCAName: TEdit;
    edDocComment: TEdit;
    deDocDate: TDateEdit;
    deDocDateTo: TDateEdit;
    Button1: TButton;
    deCloseDate: TDateEdit;
    deCloseDateTo: TDateEdit;
    lcCURNAME: TRxDBLookupCombo;
    ceSumm: TRxCalcEdit;
    ceInterest: TRxCalcEdit;
    pCOL1: TPanel;
    lbCOL2: TLabel;
    ceCol2: TEdit;
    pCOL2: TPanel;
    lbCOL1: TLabel;
    ceCol1: TEdit;
    pCOL3: TPanel;
    lbCOL3: TLabel;
    ceCol3: TEdit;
    pCOL4: TPanel;
    lbCOL4: TLabel;
    ceCol4: TEdit;
    pCOL5: TPanel;
    lbCOL5: TLabel;
    ceCol5: TEdit;
    pCOL6: TPanel;
    lbCOL6: TLabel;
    ceCol6: TEdit;
    pCOL7: TPanel;
    lbCOL7: TLabel;
    ceCol7: TEdit;
    pCOL8: TPanel;
    lbCOL8: TLabel;
    ceCol8: TEdit;
    pCOL9: TPanel;
    lbCOL9: TLabel;
    ceCol9: TEdit;
    pCOL10: TPanel;
    lbCOL10: TLabel;
    ceCol10: TEdit;
    qCAFISGRP: TBCDField;
    qCAFFIO_FAM: TWideStringField;
    qCAFFIO_NAME: TWideStringField;
    qCAFFIO_SUR: TWideStringField;
    qCAFFIO_PSPTYPE: TWideStringField;
    qCAFFIO_PSPSER: TWideStringField;
    qCAFFIO_PSPNUM: TWideStringField;
    qCAFDELETEDFROM: TDateTimeField;
    cdsCAFISGRP: TBCDField;
    cdsCAFFIO_FAM: TWideStringField;
    cdsCAFFIO_NAME: TWideStringField;
    cdsCAFFIO_SUR: TWideStringField;
    cdsCAFFIO_PSPTYPE: TWideStringField;
    cdsCAFFIO_PSPSER: TWideStringField;
    cdsCAFFIO_PSPNUM: TWideStringField;
    cdsCAFDELETEDFROM: TDateTimeField;
    cdsCAFpsp: TStringField;
    qCAFSTARTACTIVITY: TDateTimeField;
    qCAFACOLOR: TBCDField;
    cdsCAFSTARTACTIVITY: TDateTimeField;
    cdsCAFACOLOR: TBCDField;
    qCAFShortName: TWideStringField;
    cdsCAFShortName: TWideStringField;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cdsCAFCalcFields(DataSet: TDataSet);
  private
    Fid_DocType : integer;
    FSL : TStringList;
    procedure ChType;
    procedure SaveCapt;
    procedure LoadCapt;
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize;
  end;
                   

implementation

uses uDM, foMyFunc, uDTSelector;

{$R *.DFM}

procedure TfFindFirm.Initialize;
var S : String;
   Year, Month, Day: Word;
begin
  qCur.Open;
  ChType;
  Fid_DocType := -1;
end;



procedure TfFindFirm.Button1Click(Sender: TObject);
var id_DocType : integer;
    AName : String;
begin
  id_DocType := Fid_DocType;
  if ShowDTSelector(0, id_DocType, AName) then
  begin
    Fid_DocType := id_DocType;
    edDT.Text := AName;
    ChType;
  end;
end;

procedure TfFindFirm.SpeedButton1Click(Sender: TObject);
var i : integer;
begin
  ceInterest.Value := 0;
  ceSumm.Value := 0;
  lcCURNAME.KeyValue := 0;
  deCloseDate.Date := 0;
  deCloseDateTo.Date := 0;

  for i := 1 to 10 do
    TEdit(Self.FindComponent('ceCol' + IntToStr(i))).Text := '';

  edAIndex.Text := '';
  Fid_DocType := -1;
  edName.Text := '';
  edAddr.Text := '';
  edDirector.Text := '';
  edBuh.Text := '';
  edComments.Text := '';
  
  edDT.Text := '';
  edNum.Text := '';
  edFIO.Text := '';
  edCAName.Text := '';
  edDocComment.Text := '';
  deDocDate.Date := 0;
  deDocDateTo.Date := 0;
  cdsCAF.Close;

  edOriginals.Text := '';
  edStampName.Text := '';
  edStampComment.Text := '';
  edStampPlaced.Text := '';
end;

procedure TfFindFirm.SpeedButton2Click(Sender: TObject);
var S, S2, S_Or, S_St : String;
    i : integer;
begin
  cdsCAF.Close;
  S := '';
  S2 := '';
  S_Or := '';
  S_St := '';

  if Trim(edOriginals.Text) <> '' then
    S_Or := S_Or + ' AND UPPER(ORG.Name) like ' + '''' + '%' + AnsiUpperCase(Trim(edOriginals.Text)) + '%' + '''';

  if Trim(edStampName.Text) <> '' then
    S_St := S_St + ' AND UPPER(ST.Name) like ' + '''' + '%' + AnsiUpperCase(Trim(edStampName.Text)) + '%' + '''';
  if Trim(edStampComment.Text) <> '' then
    S_St := S_St + ' AND UPPER(ST.Comment) like ' + '''' + '%' + AnsiUpperCase(Trim(edStampComment.Text)) + '%' + '''';
  if Trim(edStampPlaced.Text) <> '' then
    S_St := S_St + ' AND UPPER(ST.Placed) like ' + '''' + '%' + AnsiUpperCase(Trim(edStampPlaced.Text)) + '%' + '''';


  if Trim(edAIndex.Text) <> '' then
    S := S + ' AND UPPER(CA.AIndex) like ' + '''' + '%' + AnsiUpperCase(Trim(edAIndex.Text)) + '%' + '''';
  if Trim(edName.Text) <> '' then
    S := S + ' AND UPPER(CA.Name) like ' + '''' + '%' + AnsiUpperCase(Trim(edName.Text)) + '%' + '''';
  if Trim(edAddr.Text) <> '' then
    S := S + ' AND UPPER(CA.Addr) like ' + '''' + '%' + AnsiUpperCase(Trim(edAddr.Text)) + '%' + ''''; 
  if Trim(edDirector.Text) <> '' then
    S := S + ' AND UPPER(CA.Director) like ' + '''' + '%' + AnsiUpperCase(Trim(edDirector.Text)) + '%' + ''''; 
  if Trim(edBuh.Text) <> '' then
    S := S + ' AND UPPER(CA.Buh) like ' + '''' + '%' + AnsiUpperCase(Trim(edBuh.Text)) + '%' + ''''; 
  if Trim(edComments.Text) <> '' then
    S := S + ' AND UPPER(CA.Comments) like ' + '''' + '%' + AnsiUpperCase(Trim(edComments.Text)) + '%' + '''';

//*********************************
  for i := 1 to 10 do
    if Trim(TEdit(Self.FindComponent('ceCol' + IntToStr(i))).Text) <> '' then
      S2 := S2 + ' AND UPPER(D.Col' + IntToStr(i) + ') like ' + '''' + '%' + AnsiUpperCase(Trim(TEdit(Self.FindComponent('ceCol' + IntToStr(i))).Text)) + '%' + '''';

  if ceINTEREST.Value > 0 then
    S2 := S2 + ' AND D.INTEREST= ' + StringReplace(FormatFloat('0.0', ceSumm.Value), ',', '.', []);
  if ceSumm.Value > 0 then
    S2 := S2 + ' AND D.Summ= ' + StringReplace(FormatFloat('0.0', ceSumm.Value), ',', '.', []);

  if (deCloseDate.Date > 0) then
    S2 := S2 + ' AND CLOSEDATE >=to_Date(' + '''' + FormatDateTime('DD.MM.YYYY', deCloseDate.Date) + '''' + ', ' + '''' + 'DD.MM.YYYY' + '''' + ')' ;
  if (deCloseDateTo.Date > 0) then
    S2 := S2 + ' AND CLOSEDATE <=to_Date(' + '''' + FormatDateTime('DD.MM.YYYY', deCloseDateTo.Date) + '''' + ', ' + '''' + 'DD.MM.YYYY' + '''' + ')' ;

  if lcCURNAME.KeyValue > 0 then
    S2 := S2 + ' AND D.id_Cur= ' + IntToStr(lcCURNAME.KeyValue);

  if Fid_DocType > 0 then
    S2 := S2 + ' AND D.id_DocType= ' + IntToStr(Fid_DocType);

  if Trim(edNum.Text) <> '' then
    S2 := S2 + ' AND UPPER(D.Num) like ' + '''' + '%' + AnsiUpperCase(Trim(edNum.Text)) + '%' + '''';
  if Trim(edFIO.Text) <> '' then
    S2 := S2 + ' AND UPPER(D.FIO) like ' + '''' + '%' + AnsiUpperCase(Trim(edFIO.Text)) + '%' + '''';
  if Trim(edCAName.Text) <> '' then
    S2 := S2 + ' AND UPPER(D.CAName) like ' + '''' + '%' + AnsiUpperCase(Trim(edCAName.Text)) + '%' + '''';
  if Trim(edDocComment.Text) <> '' then
    S2 := S2 + ' AND UPPER(D.DocComment) like ' + '''' + '%' + AnsiUpperCase(Trim(edDocComment.Text)) + '%' + '''';

  if (deDocDate.Date > 0) then
    S2 := S2 + ' AND DocDate >=to_Date(' + '''' + FormatDateTime('DD.MM.YYYY', deDocDate.Date) + '''' + ', ' + '''' + 'DD.MM.YYYY' + '''' + ')' ;
  if (deDocDateTo.Date > 0) then
    S2 := S2 + ' AND DocDate <=to_Date(' + '''' + FormatDateTime('DD.MM.YYYY', deDocDateTo.Date) + '''' + ', ' + '''' + 'DD.MM.YYYY' + '''' + ')' ;

//*********************************
  if (S = '') and (S2 = '') then
    raise Exception.Create('Condition not input');
  qCAF.SQL.Clear;
  qCAF.SQL.Add('select CA.*, CR.CurName, CA2.Name AS PName   FROM DW_CA CA  left join DW_Cur CR ON CR.id_Cur = CA.id_Cur  left join DW_CA CA2 ON CA2.id_CA = CA.PID AND CA.Deleted=0 WHERE 1=1 ');

  if S <> '' then
    qCAF.SQL.Add(S);
  if S2 <> '' then
  begin
    qCAF.SQL.Add(' AND CA.id_CA in (SELECT id_CA FROM DW_DocBase D WHERE deleted=0 ');
    qCAF.SQL.Add(S2);
    qCAF.SQL.Add(')');
  end;
  if S_Or <> '' then
  begin
    qCAF.SQL.Add(' AND CA.id_CA in (SELECT id_CA FROM DW_Doc ORG WHERE deleted=0 AND DocVid=1');
    qCAF.SQL.Add(S_Or);
    qCAF.SQL.Add(')');
  end;
  if S_St <> '' then
  begin
    qCAF.SQL.Add(' AND CA.id_CA in (SELECT id_CA FROM DW_Doc ST WHERE deleted=0 AND DocVid=2');
    qCAF.SQL.Add(S_St);
    qCAF.SQL.Add(')');
  end;
  cdsCAF.Open;
end;

procedure TfFindFirm.Button2Click(Sender: TObject);
begin
//
end;

procedure TfFindFirm.ChType;
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


constructor TfFindFirm.Create(AOwner: TCOmponent);
begin
  inherited;
  FSL := TStringList.Create;
  SaveCapt;

end;

destructor TfFindFirm.Destroy;
begin
  FSL.Free;
  inherited;
end;

procedure TfFindFirm.LoadCapt;
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

procedure TfFindFirm.SaveCapt;
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

procedure TfFindFirm.cdsCAFCalcFields(DataSet: TDataSet);
begin
  cdsCAFpsp.AsString := cdsCAfFIO_PSPSER.AsString + ' ' + cdsCAfFIO_PSPNUM.AsString;

end;

end.
