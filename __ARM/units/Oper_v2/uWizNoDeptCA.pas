unit uWizNoDeptCA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, Buttons,
  uTopWin, frBsnSelector, ActnList, frCaNavigator, Db, RxMemDS,
  Grids, DBGrids, RXDBCtrl, frCurSelector, DBClient;

type
  
  TWizNoDeptCA = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Splitter1: TSplitter;
    ActionList1: TActionList;
    aAddOne: TAction;
    aAddAll: TAction;
    aDelOne: TAction;
    aDelAll: TAction;
    Panel9: TPanel;
    sbAddOne1: TSpeedButton;
    sbDelOne1: TSpeedButton;
    sbAddAll1: TSpeedButton;
    sbDelAll1: TSpeedButton;
    fCaNavigator1: TfCaNavigator;
    grdCA: TRxDBGrid;
    RxMemoryData1: TRxMemoryData;
    DataSource1: TDataSource;
    RxMemoryData1ID: TIntegerField;
    RxMemoryData1Name: TStringField;
    Panel1: TPanel;
    fBsnSelector1: TfBsnSelector;
    Panel3: TPanel;
    fCurSelector1: TfCurSelector;
    cdsCASumm: TClientDataSet;
    cdsCASummId_CurrencyOper: TIntegerField;
    cdsCASummSumm: TFloatField;
    cdsCASummCrnName: TStringField;
    cdsCASummid_ContrAgent: TIntegerField;
    cdsCASummOperSumm: TFloatField;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure fCntrAgentList1RxDBGrid1DblClick(Sender: TObject);
    procedure aAddOneExecute(Sender: TObject);
    procedure aAddAllExecute(Sender: TObject);
    procedure aDelOneExecute(Sender: TObject);
    procedure aDelAllExecute(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure fCntrAgentList1dsCAgentDataChange(Sender: TObject;
      Field: TField);
    procedure fReprList1RxDBGrid1DblClick(Sender: TObject);
    procedure grdCADblClick(Sender: TObject);
  private
    FHandle : HWnd;
    FThatDay : boolean;
    procedure aAddinDS(AID: integer; ANAme: String);
    function CheckData : boolean;
  public
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    function SaveProp: boolean;
    procedure Initialize(AParamBlnc: TParamBlnc; AThatDay : boolean);
  end;

var
  WizNoDeptCA: TWizNoDeptCA;

procedure ShowWizNoDeptCA(AParamBlnc: TParamBlnc; AThatDay : boolean = false);

implementation

uses uDM, uPrgForm, uUnivOper_v2, uFormApi_Oper;


procedure ShowWizNoDeptCA(AParamBlnc: TParamBlnc; AThatDay : boolean);
var F : TWizNoDeptCA;
begin
  F := TWizNoDeptCA.Create(nil);
  try
    F.Initialize(AParamBlnc, AThatDay);
    F.Show;
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

{$R *.DFM}

procedure TWizNoDeptCA.btnOkClick(Sender: TObject);
begin
  if not CheckData then
    ModalResult := mrNone
  else
  begin
    if MessageBox(Handle, Pchar('Сгенерировать зачетные операции по ' + IntToStr(RxMemoryData1.RecordCount) + ' контрагентам?'), '', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
    begin
      ModalResult := mrOk;
      SaveProp;
      Close;
    end
    else
      ModalResult := mrNone
  end;
end;


procedure TWizNoDeptCA.Initialize(AParamBlnc: TParamBlnc; AThatDay : boolean);
var S : String;
   ID : Variant;
begin
  FThatDay := AThatDay;
  fCurSelector1.Visible := not FThatDay;
  if AParamBlnc.id_ContrAgent <> Null then
  begin
    S := DM.rsCA.appserver.GetCAName(AParamBlnc.id_ContrAgent);
    aAddinDS(AParamBlnc.id_ContrAgent, S);
    fBsnSelector1.ID := AParamBlnc.id_business;
  end;
    if fBsnSelector1.ID > 0 then
  begin
    ID := Null;
    fCaNavigator1.Initialize(ID, fBsnSelector1.ID, false, Null, false, false);
    fCurSelector1.Initialize(fBsnSelector1.ID);
  end;
end;

function TWizNoDeptCA.SaveProp: boolean;
var DD : Variant;
    FID_Oper, Cnt : integer;
    OperVid, id_business, Correct,
    OperTypeIn, Id_CurrencyOper, id_Repr, OpComment : OleVariant;
    OfferSumm : Extended;
begin
  Result := false;
  Cnt := 0;
  {if FThatDay then
  begin
    DM.rsCA.AppServer.OffPaymentdsf
    Exit;
  end;   }
  with cdsCASumm do
  begin
    try
      RxMemoryData1.DisableControls;
      RxMemoryData1.First;
      ShowProgressForm(Handle, -1, -1, 'Идет подготовка к созданию операций...');
      while not RxMemoryData1.Eof do
      begin
        if FThatDay then
        begin
          DM.rsCA.AppServer.OffPayment(RxMemoryData1ID.AsInteger);
          inc(Cnt);
        end
        else
        begin
          Close;
          Params.ParamByName('@id_ContrAgent').Value := RxMemoryData1ID.AsInteger;
          Params.ParamByName('@Date').Value := Null;
          if fCurSelector1.ID_Curr > 0 then
            Params.ParamByName('@Id_Currency').Value := fCurSelector1.ID_Curr
          else
            Params.ParamByName('@Id_Currency').Value := Null;
          Open;
          while not Eof do
          begin
            OfferSumm := cdsCASummOperSumm.AsFloat;
            if (ABS(OfferSumm) > 0.00005) or (1=2) then
            begin
              OperVid := 4;
              Correct := false;
              Id_CurrencyOper := cdsCASummId_CurrencyOper.AsInteger;
              OperTypeIn := OfferSumm < 0;
              id_Repr := DM.rsCA.AppServer.GetFirstRepr(RxMemoryData1ID.AsInteger);
              OpComment := 'Автоматическое списание задолженности';
              id_business := fBsnSelector1.ID;
              FID_Oper := wp_OP_OperAdd_v2(OperVid, id_business, Correct, OperTypeIn, Id_CurrencyOper,
                                                     ABS(OfferSumm), 0, Null, Null, Null,
                                                     id_Repr, Null, Null, Null, Null,
                                                     Null, Null,
                                                     Null, Null, 0,
                                                     Null, Null, 0,
                                                     DM.IDUser, Null,
                                                     Null, Null, Null, OpComment,
                                                     Null, Null, Null, Null, Null, Null, Null, Null,
                                                     Null, Null, Null, Null, Null, Null, Null,
                                                     Null, Null, Null, Null, Null, Null, Null, Null,
                                                     Null, Null, Null, Null, Null, Null, Null,
                                                     Null, Null, Null, Null, Null, Null, Null,
                                                     Null, Null, Null, Null, Null, Null, Null, Null, true, false);

                if FID_Oper > 0 then
                begin
                  inc(Cnt);
                  DM.rsCA.AppServer.OP_OperSetCheckDate_v2(FID_Oper, DM.IDUser);
                end;
             end;
             Next;
          end;
        end;

        RxMemoryData1.Next;
        ShowProgressForm(Handle, RxMemoryData1.RecNo, RxMemoryData1.RecordCount, 'Создание зачетных операций');
      end;
      Result := true;
      CloseProgressForm;
      MessageBox(Handle, Pchar('Создано ' + IntToStr(Cnt) + ' зачетных операций'), '', MB_ICONINFORMATION + MB_Ok);
      RefresheArc(FID_Oper, false);
    finally
      CloseProgressForm;
      RxMemoryData1.EnableControls;
    end;
  end;
 // FHandle := AHandle;
//  fWizReVal1.Initialize(id_WareHouse, AID);
end;

procedure TWizNoDeptCA.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TWizNoDeptCA.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

constructor TWizNoDeptCA.Create(AOwner: TComponent);
var ID : Variant;
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  ID := -1;
//  fCaNavigator1.Initialize(ID, ID, false, Null, false, false);
  
  fCaNavigator1.fCntrAgentList1.ToolBar1.Visible := false;
  fCaNavigator1.fReprList1.ToolBar1.Visible := false;
  fBsnSelector1.UID := Null;
end;

procedure TWizNoDeptCA.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TWizNoDeptCA.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TWizNoDeptCA.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ((ModalResult = mrCancel) or (ModalResult = mrNone)) and (not RxMemoryData1.IsEmpty) then
  begin
    case MessageBox(Handle, 'Сохранить данные?', 'Данные не были сохранены', MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONQUESTION) of
      id_Yes :
        begin
          CanClose := false;
          btnOk.Click;
        end;
      ID_CANCEL : CanClose := false;
      else
        CanClose := true;
      end
  end;
end;

procedure TWizNoDeptCA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 { Action := caFree;
  if ModalResult = mrOk then
    if SaveProp then
      SendMessage(FHandle, xxx_RefrMsg, fWizReVal1.ID_Oper, 0);  }
end;

procedure TWizNoDeptCA.fBsnSelector1Button1Click(Sender: TObject);
var Old : Variant;
    ID : variant;
begin
  Old := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
//  if fBsnSelector1.ID <> Old then
  begin
    ID := Null;
    fCaNavigator1.Initialize(ID, fBsnSelector1.ID, false, Null, false, false);
    fCurSelector1.Initialize(fBsnSelector1.ID);
  end;
end;

procedure TWizNoDeptCA.fCntrAgentList1RxDBGrid1DblClick(Sender: TObject);
begin
  aAddOne.Execute;
end;

procedure TWizNoDeptCA.aAddinDS(AID : integer; ANAme : String);
begin
  with RxMemoryData1 do
  begin
    if not Active then Open;
    if not Locate('ID', AID, []) then
    begin
      Append;
      RxMemoryData1ID.AsInteger := AID;
      RxMemoryData1Name.AsString:= ANAme;
      Post;
    end;
  end;
end;


procedure TWizNoDeptCA.aAddOneExecute(Sender: TObject);
var i : integer;
begin
  with fCaNavigator1.fCntrAgentList1 do
  begin
    if RxDBGrid1.SelectedRows.Count > 0 then
    begin
      for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
      begin
        RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
        aAddinDS(RxDBGrid1.DataSource.DataSet.FieldByName('id_ContrAgent').AsInteger, RxDBGrid1.DataSource.DataSet.FieldByName('Name').AsString);
      end;
    end
    else
      aAddinDS(RxDBGrid1.DataSource.DataSet.FieldByName('id_ContrAgent').AsInteger, RxDBGrid1.DataSource.DataSet.FieldByName('Name').AsString);
  end;
end;

procedure TWizNoDeptCA.aAddAllExecute(Sender: TObject);
begin
  with fCaNavigator1.fCntrAgentList1.cdsCAgent do
  begin
    First;
    while not Eof do
    begin
      aAddinDS(fCaNavigator1.fCntrAgentList1.cdsCAgentid_ContrAgent.AsInteger,
               fCaNavigator1.fCntrAgentList1.cdsCAgentName.AsString);
      Next;
    end;
  end;
end;

procedure TWizNoDeptCA.aDelOneExecute(Sender: TObject);
begin
  RxMemoryData1.delete;
end;

procedure TWizNoDeptCA.aDelAllExecute(Sender: TObject);
begin
  RxMemoryData1.Close;
  RxMemoryData1.Open;
end;

procedure TWizNoDeptCA.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  btnOk.Enabled := not RxMemoryData1.IsEmpty;
  aDelOne.Enabled := not RxMemoryData1.IsEmpty;
  aDelAll.Enabled := not RxMemoryData1.IsEmpty;
end;

procedure TWizNoDeptCA.fCntrAgentList1dsCAgentDataChange(Sender: TObject;
  Field: TField);
begin
  fCaNavigator1.fCntrAgentList1dsCAgentDataChange(Sender, Field);
  aAddOne.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
  aAddAll.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;

end;

procedure TWizNoDeptCA.fReprList1RxDBGrid1DblClick(Sender: TObject);
begin
//*
end;

function TWizNoDeptCA.CheckData: boolean;
begin
  Result := false;
  with grdCA do
    if RxMemoryData1.IsEmpty then
    begin
      MessageBox(Handle, 'Не выбраны контрагенты', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  Result := true;
end;

procedure TWizNoDeptCA.grdCADblClick(Sender: TObject);
begin
  aDelOne.Execute;
end;

end.
