unit uInvList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, Db, DBClient, StdCtrls, Buttons, ComCtrls, ExtCtrls,
  ActnList, ImgList, ToolWin, foMyFunc, Menus, uBaseGridFilter,
  uEhGridFilter, GridsEh;

type
  TInvList = class(TForm)
    dsInv_Rep: TDataSource;
    cdsPrjList: TClientDataSet;
    pnDate: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    dtTo: TDateTimePicker;
    dtFrom: TDateTimePicker;
    BitBtn2: TBitBtn;
    RxDBGrid1: TDBGridEh;
    ilImage: TImageList;
    ActionList1: TActionList;
    aDel: TAction;
    aEdit: TAction;
    aNew: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    cdsPrjListid_Project: TAutoIncField;
    cdsPrjListName: TStringField;
    cdsPrjListid_User: TIntegerField;
    cdsPrjListPrjNum: TIntegerField;
    cdsPrjListPrjDate: TDateTimeField;
    cdsPrjListDateCreate: TDateTimeField;
    cdsPrjListid_Inv: TIntegerField;
    cdsPrjListDisabled: TBooleanField;
    cdsPrjListCalcDate: TDateTimeField;
    cdsPrjListCheckDate: TDateTimeField;
    cdsPrjListID_Main: TIntegerField;
    aSetCheckDate: TAction;
    aUnSetCheckDate: TAction;
    pmPrj: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    aRefreshe: TAction;
    ToolButton5: TToolButton;
    EhGridFilter1: TEhGridFilter;
    cdsPrjListSPrjNum: TStringField;
    aCopy: TAction;
    ToolButton6: TToolButton;
    Button1: TButton;
    cdsPrjListKomposit: TStringField;
    cdsPrjListOwnName: TStringField;
    N6: TMenuItem;
    aSetCheckDateFact: TAction;
    aUnSetCheckDateFact: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    cdsPrjListCheckDateFact: TDateTimeField;
    cdsPrjListSendFact: TDateTimeField;
    cdsPrjListid_Checker: TIntegerField;
    cdsPrjListid_CheckerFFF: TIntegerField;
    cdsPrjListFIO: TStringField;
    cdsPrjListFIOFFF: TStringField;
    N10: TMenuItem;
    N11: TMenuItem;
    cdsPrjListxxxDate: TDateTimeField;
    cdsPrjListAmount1: TFloatField;
    cdsPrjListAmount2: TFloatField;
    cdsPrjListInv1: TFloatField;
    cdsPrjListInv2: TFloatField;
    cdsPrjListPrice: TFloatField;
    cdsPrjListKlishe_Inv1: TFloatField;
    cdsPrjListKlishe_Inv2: TFloatField;
    cdsPrjListKlishe_Price: TFloatField;
    cdsPrjListKlishe_Price2: TFloatField;
    cdsPrjListKlishe_Amount: TFloatField;
    cdsPrjListKlishe_Amount2: TFloatField;
    cdsPrjListTime_FormPrice: TFloatField;
    cdsPrjListTime_Form1: TDateTimeField;
    cdsPrjListTime_Form2: TDateTimeField;
    cdsPrjListTime_Form_Time: TDateTimeField;
    cdsPrjListTime_Form_Tuning: TDateTimeField;
    cdsPrjListTime_FormDelta: TDateTimeField;
    cdsPrjListTime_PrintPrice: TFloatField;
    cdsPrjListTime_Print1: TDateTimeField;
    cdsPrjListTime_Print2: TDateTimeField;
    cdsPrjListTime_Print_Time: TDateTimeField;
    cdsPrjListTime_Print_Tuning: TDateTimeField;
    cdsPrjListTime_PrintDelta: TDateTimeField;
    cdsPrjListTime_LamPrice: TFloatField;
    cdsPrjListTime_Lam1: TDateTimeField;
    cdsPrjListTime_Lam2: TDateTimeField;
    cdsPrjListTime_Lam_Time: TDateTimeField;
    cdsPrjListTime_Lam_Tuning: TDateTimeField;
    cdsPrjListTime_LamDelta: TDateTimeField;
    cdsPrjListTime_RezPrice: TFloatField;
    cdsPrjListTime_Rez1: TDateTimeField;
    cdsPrjListTime_Rez2: TDateTimeField;
    cdsPrjListTime_Rez_Time: TDateTimeField;
    cdsPrjListTime_Rez_Tuning: TDateTimeField;
    cdsPrjListTime_RezDelta: TDateTimeField;
    cdsPrjListRaw_FormAmount: TFloatField;
    cdsPrjListRaw_Form1: TFloatField;
    cdsPrjListRaw_Form2: TFloatField;
    cdsPrjListRaw_FormPriceStat: TFloatField;
    cdsPrjListRaw_FormDelta: TFloatField;
    cdsPrjListRaw_PrintAmount: TFloatField;
    cdsPrjListRaw_Print1: TFloatField;
    cdsPrjListRaw_Print2: TFloatField;
    cdsPrjListRaw_PrintPriceStat: TFloatField;
    cdsPrjListRaw_PrintDelta: TFloatField;
    cdsPrjListRaw_LamAmount: TFloatField;
    cdsPrjListRaw_Lam1: TFloatField;
    cdsPrjListRaw_Lam2: TFloatField;
    cdsPrjListRaw_LamPriceStat: TFloatField;
    cdsPrjListRaw_LamDelta: TFloatField;
    cdsPrjListRaw_RezAmount: TFloatField;
    cdsPrjListRaw_Rez1: TFloatField;
    cdsPrjListRaw_Rez2: TFloatField;
    cdsPrjListRaw_RezPriceStat: TFloatField;
    cdsPrjListRaw_RezDelta: TFloatField;
    cdsPrjListid_Goods: TIntegerField;
    cdsPrjListLastUpdated: TBytesField;
    cdsPrjListid_lc: TIntegerField;
    cdsPrjListComment: TStringField;
    cdsPrjListInv_Prev: TFloatField;
    cdsPrjListInv_Real: TFloatField;
    cdsPrjListPrice_Real: TFloatField;
    cdsPrjListKL_PRev: TFloatField;
    cdsPrjListKL_Real: TFloatField;
    cdsPrjListKL_Price: TFloatField;
    cdsPrjListid_BSN: TIntegerField;
    cdsPrjListOLD_PPP: TIntegerField;
    cdsPrjListLineNum: TIntegerField;
    aExport1C: TAction;
    cdsInvWare1C: TClientDataSet;
    cdsInvWare1Cid_Inv_Ware: TIntegerField;
    cdsInvWare1Cid_Project: TIntegerField;
    cdsInvWare1Cid_Goods: TIntegerField;
    cdsInvWare1Cid_Measure: TIntegerField;
    cdsInvWare1Cid_Manufact: TIntegerField;
    cdsInvWare1CAmountPlan: TFloatField;
    cdsInvWare1CPricePlan: TFloatField;
    cdsInvWare1CAmount: TFloatField;
    cdsInvWare1CSumm: TFloatField;
    cdsInvWare1CGName: TStringField;
    cdsInvWare1CMSName: TStringField;
    cdsInvWare1CMNName: TStringField;
    cdsInvWare1CNumb: TIntegerField;
    cdsInvWare1CSummOper2: TFloatField;
    cdsInvWare1CDelta: TFloatField;
    cdsInvWare1CPriceAvg: TFloatField;
    cdsInvWare1CPLLid_Goods: TIntegerField;
    cdsInvWare1CFPP: TBooleanField;
    cdsInvWare1CPPPPrice: TFloatField;
    cdsInvWare1CPPPPricePlan: TFloatField;
    cdsInvWare1CK_AmountPlan: TFloatField;
    cdsInvWare1CK_Amount: TFloatField;
    cdsInvWare1Czzzz_PPPPrice: TAggregateField;
    N12: TMenuItem;
    N13: TMenuItem;
    procedure cdsPrjListCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aNewExecute(Sender: TObject);
    procedure dsInv_RepDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure aSetCheckDateExecute(Sender: TObject);
    procedure aUnSetCheckDateExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure cdsPrjListid_ProjectGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure aCopyExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure aSetCheckDateFactExecute(Sender: TObject);
    procedure aUnSetCheckDateFactExecute(Sender: TObject);
    procedure cdsPrjListLineNumGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure aExport1CExecute(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;

    procedure DoRefrMsg(var Msg: TMessage); message xxx_RefrMsg;
  end;

var
  InvList: TInvList;
procedure ShowInvList;

implementation

uses uDM, foMyFuncEh, uInvMain, uPrgForm;

{$R *.DFM}

procedure ShowInvList;
begin
    DM.Rights_GetUserRights(1001, Null);


  if not Assigned(InvList) then
  begin
    InvList := TInvList.Create(nil);
    InvList.aRefreshe.Execute;
  end
  else
    InvList.BringToFront;
end;

{ TInvRepList }

constructor TInvList.Create(AOwner: TCOmponent);
var i : integer;
begin
  inherited;
{$IFDEF SEINV}
  ToolButton4.Visible := false;
  aDel.Visible := false;
  aCopy.Visible := false;
  aNew.Visible := false;
  aSetCheckDate.Visible := false;
  aUnSetCheckDate.Visible := false;

  aDel.Free;
  ToolButton4.Free;
{$ENDIF}



  LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\q' + ClassName);
//  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  dtFrom.DateTime := Now-30;
//  {$IFDEF LC}
  aSetCheckDate.Caption := aSetCheckDate.Caption + ' ����';
  aUnSetCheckDate.Caption := aUnSetCheckDate.Caption + ' ����';

  for i := 0 to RxDBGrid1.Columns.Count - 1 do
  begin
    if RxDBGrid1.Columns[i].Field = cdsPrjListCheckDateFact then
      RxDBGrid1.Columns[i].Visible := true;
  end;


  dtFrom.DateTime := Now-7;
  aSetCheckDateFact.Visible := true;
  aUnSetCheckDateFact.Visible := true;

//{$ELSE}
 { for i := 0 to RxDBGrid1.Columns.Count - 1 do
  begin
    if RxDBGrid1.Columns[i].Field = cdsPrjListCheckDateFact then
    begin
      RxDBGrid1.Columns[i].Visible := true;
      RxDBGrid1.Columns[i].Title.Caption := '������ ����';
    end;
  end;   }
//{$ENDIF}
  dtTo.DateTime := Now;

  EhGridFilter1.SetField(cdsPrjListSPrjNum);
end;

procedure TInvList.CreateParams(var Params: TCreateParams);
begin
  inherited;
//  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);

end;

destructor TInvList.Destroy;
begin
  SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\q' + ClassName);
  inherited;

end;

procedure TInvList.cdsPrjListCalcFields(DataSet: TDataSet);
begin
 // DataSet.FieldByName('RecNum').Value := DataSet.RecNo;

  if not DataSet.FieldByName('PrjNum').IsNull then
    DataSet.FieldByName('SPrjNum').AsString := IntToStr(DataSet.FieldByName('PrjNum').AsInteger);
end;

procedure TInvList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TInvList.FormDestroy(Sender: TObject);
begin
  InvList := nil;
end;

procedure TInvList.aDelExecute(Sender: TObject);
begin
{$IFDEF SEINV}
  Exit;
{$ENDIF}

  if MessageBox(Handle, PChar('������� �����?'), '����������� ��������', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    DM.rsCA.AppServer.Inv_ProjectDel(cdsPrjListid_Project.AsInteger);
    aRefreshe.Execute;
  end;
end;

procedure TInvList.aEditExecute(Sender: TObject);
var ID : integer;
begin
  ID := cdsPrjListid_Project.AsInteger;
  ShowInvMain(Handle, ID);
end;

procedure TInvList.aNewExecute(Sender: TObject);
begin
  ShowInvMain(Handle, -1);
end;

procedure TInvList.dsInv_RepDataChange(Sender: TObject; Field: TField);
begin
  aCopy.Enabled := not cdsPrjList.IsEmpty;
  aEdit.Enabled := not cdsPrjList.IsEmpty;
  aExport1C.Enabled := not cdsPrjList.IsEmpty;

{$IFNDEF SEINV}
  aDel.Enabled := not cdsPrjList.IsEmpty and cdsPrjListCheckDate.IsNull;
{$ENDIF}

  aSetCheckDate.Enabled := not cdsPrjList.IsEmpty and cdsPrjListCheckDate.IsNull;
  aUnSetCheckDate.Enabled := (not cdsPrjList.IsEmpty) and (not cdsPrjListCheckDate.IsNull);

 // {$IFDEF LC}
 //   aUnSetCheckDate.Enabled := not cdsPrjList.IsEmpty and not cdsPrjListCheckDate.IsNull
 //     and cdsPrjListID_Main.IsNull;

  aSetCheckDateFact.Enabled := not cdsPrjList.IsEmpty and cdsPrjListCheckDateFact.IsNull and not cdsPrjListCheckDate.IsNull;

  aUnSetCheckDateFact.Enabled := not cdsPrjList.IsEmpty
    and not cdsPrjListCheckDateFact.IsNull
    and cdsPrjListSendFact.IsNull;
{$IFNDEF SEINV}
    aDel.Enabled := aUnSetCheckDate.Enabled;
{$ENDIF}
//{$ENDIF}

end;

procedure TInvList.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=TDBGridEh(Sender).ScreenToClient(P);
  if P.y<=THackGridEh(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TInvList.DoRefrMsg(var Msg: TMessage);
begin
  with cdsPrjList do
  begin
    Close;
    Open;
    try
      Locate('id_Project', Msg.WParam, [loCaseInsensitive]);
    except
      tag := 0;
    end;
  end;

end;

procedure TInvList.RxDBGrid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (cdsPrjListCheckDate.IsNull) then
    AFont.Style := [fsBold];

end;

procedure TInvList.aSetCheckDateExecute(Sender: TObject);
begin
  if MessageBox(Handle, '������������?', '����������� �����������', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    Screen.Cursor := crSQLWait;
    DM.rsCA.AppServer.Inv_ProjectSetCheckDate(cdsPrjListid_Project.AsInteger, Now);
    aRefreshe.Execute;
    Screen.Cursor := crDefault;
  end;
end;

procedure TInvList.aUnSetCheckDateExecute(Sender: TObject);
begin
  if MessageBox(Handle, '����� �����������?', '����������� �����������', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    DM.rsCA.AppServer.Inv_ProjectSetCheckDate(cdsPrjListid_Project.AsInteger, Null);
    aRefreshe.Execute;
  end;
end;

procedure TInvList.aRefresheExecute(Sender: TObject);
var ID : integer;
begin

    with cdsPrjList do
    begin
      ID := cdsPrjListid_Project.AsInteger;
      Close;
      Params.ParamByName('@DateFrom').Value := GetDateAdv(dtFrom.Date, false);
      Params.ParamByName('@DateTo').Value := GetDateAdv(dtTo.Date, true);
      Open;
      Locate('id_Project', ID, [loCaseInsensitive]);
    end;
end;

procedure TInvList.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  ReOrderCDSEh(Column, '');
end;

procedure TInvList.cdsPrjListid_ProjectGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
    Text := cdsPrjListid_Project.AsString;
  {$IFDEF LC}
    Text := cdsPrjListID_Main.AsString;
{$ENDIF}
end;

procedure TInvList.aCopyExecute(Sender: TObject);
begin
  ShowInvMain(Handle, cdsPrjListid_Project.AsInteger, true);

end;

procedure TInvList.Button1Click(Sender: TObject);
var ID : integer;
begin
  with cdsPrjList do
  begin
    First;
    while not Eof do
    begin
      ShowProgressForm(Handle, RecNo, RecordCount, '...');
      ID := cdsPrjListid_Project.AsInteger;
//    DM.rsCA.AppServer.Inv_ProjectSetCheckDate(ID, Null);
      if (cdsPrjListRaw_Form1.AsInteger > 0) or (cdsPrjListRaw_Form2.AsInteger > 0) then
      begin
        ShowInvMain(Handle, ID, false, true);
        Sleep(5000)
      end;

      Next;
    end;
  end;
  CloseProgressForm;
  aRefreshe.Execute;
end;

procedure TInvList.aSetCheckDateFactExecute(Sender: TObject);
begin
  if MessageBox(Handle, '������������ ����������� ������?', '����������� �����������', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    Screen.Cursor := crSQLWait;
    DM.rsCA.AppServer.Inv_ProjectSetCheckDateFact(cdsPrjListid_Project.AsInteger, Now);
    aRefreshe.Execute;
    Screen.Cursor := crDefault;
  end;
end;

procedure TInvList.aUnSetCheckDateFactExecute(Sender: TObject);
begin
  if MessageBox(Handle, '����� ����������� ����������� ������?', '����������� �����������', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
  begin
    DM.rsCA.AppServer.Inv_ProjectSetCheckDateFact(cdsPrjListid_Project.AsInteger, Null);
    aRefreshe.Execute;
  end;
end;

procedure TInvList.cdsPrjListLineNumGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if cdsPrjListLineNum.AsInteger = 1 then
    Text := '������'
  else
    Text := '�����'
end;

procedure TInvList.aExport1CExecute(Sender: TObject);
var ID : integer;
begin
  with cdsPrjList do
  begin
    First;
    while not Eof do
    begin
      ShowProgressForm(Handle, RecNo, RecordCount, '��������� ������ ' + IntToStr(RecNo) + ' �� ' + IntToStr(RecordCount));
      ID := cdsPrjListid_Project.AsInteger;
      if not cdsPrjListCheckDateFact.IsNull then
      begin
        cdsInvWare1C.Params.ParamByName('@id_Project').Value := cdsPrjListid_Project.AsInteger;
        cdsInvWare1C.Params.ParamByName('@PrjNum').Value := null;
        cdsInvWare1C.Params.ParamByName('@id_Manufact').Value := null;
        cdsInvWare1C.Params.ParamByName('@Mode').Value := 777;
 
        cdsInvWare1C.Execute;
      end;
      Next;
    end;
  end;
  CloseProgressForm;
  aRefreshe.Execute;
  MessageBox(Handle, '�������� ������ � 1� ���������', Pchar(Application.Title), MB_ICONINFORMATION + MB_OK)
end;

end.

