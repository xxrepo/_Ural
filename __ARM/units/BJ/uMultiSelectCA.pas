unit uMultiSelectCA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, Buttons,
  uTopWin, frBsnSelector, ActnList, frCaNavigator, Db, RxMemDS,
  Grids, DBGrids, RXDBCtrl, frCurSelector, DBClient;

type
  TSelObjEvent = procedure (AID: integer; AName : String) of object;

  TMultiSelectCA = class(TForm)
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
    procedure aAddinDS(AID: integer; ANAme: String);
    function CheckData : boolean;
  public
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Initialize(ID_Bsn: integer);
  end;

var
  MultiSelectCA: TMultiSelectCA;

function ShowMultiSelectCA(ID_Bsn: integer; ASelObjEvent : TSelObjEvent) : boolean;

implementation

uses uDM, uPrgForm, uUnivOper_v2, uFormApi_Oper;


function ShowMultiSelectCA(ID_Bsn: integer; ASelObjEvent : TSelObjEvent) : boolean;
var F : TMultiSelectCA;
begin
  result := false;
  F := TMultiSelectCA.Create(nil);
  try
    F.Initialize(ID_Bsn);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      result := true;
      with F.RxMemoryData1 do
      begin
        First;
        while not Eof do
        begin
          ShowProgressForm(0, RecNo, RecordCount, 'Добавление контрагентов...');
          ASelObjEvent(F.RxMemoryData1ID.AsInteger, F.RxMemoryData1Name.AsString);
          Next;
        end;
      end;
    end;
  finally
    CloseProgressForm;
    F.Free;
  end;
end;

{$R *.DFM}

procedure TMultiSelectCA.btnOkClick(Sender: TObject);
begin
{  if not CheckData then
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
  end;    }
end;


procedure TMultiSelectCA.Initialize(ID_Bsn: integer);
var S : String;
    ID : Variant;
begin
  ID := -1;
  fCaNavigator1.Initialize(ID, ID_Bsn, false, Null, false, false);
end;

procedure TMultiSelectCA.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TMultiSelectCA.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

constructor TMultiSelectCA.Create(AOwner: TComponent);
var ID : Variant;
begin
  inherited;
  ID := -1;
  fCaNavigator1.fCntrAgentList1.ToolBar1.Visible := false;
  fCaNavigator1.fReprList1.ToolBar1.Visible := false;
end;

procedure TMultiSelectCA.CreateParams(var Params: TCreateParams);
begin
  inherited;
end;

procedure TMultiSelectCA.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TMultiSelectCA.fCntrAgentList1RxDBGrid1DblClick(Sender: TObject);
begin
  aAddOne.Execute;
end;

procedure TMultiSelectCA.aAddinDS(AID : integer; ANAme : String);
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


procedure TMultiSelectCA.aAddOneExecute(Sender: TObject);
var i : integer;
    NameField : TField;
begin
  with fCaNavigator1.fCntrAgentList1 do
  begin
    if (ActiveControl = fCaNavigator1.fCntrAgentList1.RxDBGrid1) or
       (ActiveControl = fCaNavigator1.fReprList1.RxDBGrid1) then
    begin
      if ActiveControl = fCaNavigator1.fCntrAgentList1.RxDBGrid1 then
        NameField := (ActiveControl as TRxDBGrid).DataSource.DataSet.FieldByName('Name')
      else
        NameField := (ActiveControl as TRxDBGrid).DataSource.DataSet.FieldByName('CAName');
        
      if (ActiveControl as TRxDBGrid).SelectedRows.Count > 0 then
      begin
        for i := 0 to (ActiveControl as TRxDBGrid).SelectedRows.Count - 1 do
        begin
          (ActiveControl as TRxDBGrid).DataSource.DataSet.GotoBookmark(pointer((ActiveControl as TRxDBGrid).SelectedRows.Items[i]));
          aAddinDS((ActiveControl as TRxDBGrid).DataSource.DataSet.FieldByName('id_ContrAgent').AsInteger, NameField.AsString);
        end;
      end
      else
        aAddinDS((ActiveControl as TRxDBGrid).DataSource.DataSet.FieldByName('id_ContrAgent').AsInteger, NameField.AsString);
    end;
  end;
end;

procedure TMultiSelectCA.aAddAllExecute(Sender: TObject);
begin
  with fCaNavigator1.fCntrAgentList1.cdsCAgent do
  begin
    First;
    DisableControls;
    while not Eof do
    begin
      aAddinDS(fCaNavigator1.fCntrAgentList1.cdsCAgentid_ContrAgent.AsInteger,
               fCaNavigator1.fCntrAgentList1.cdsCAgentName.AsString);
      Next;
    end;
    EnableControls;
  end;
end;

procedure TMultiSelectCA.aDelOneExecute(Sender: TObject);
begin
  RxMemoryData1.delete;
end;

procedure TMultiSelectCA.aDelAllExecute(Sender: TObject);
begin
  RxMemoryData1.Close;
  RxMemoryData1.Open;
end;

procedure TMultiSelectCA.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  btnOk.Enabled := not RxMemoryData1.IsEmpty;
  aDelOne.Enabled := not RxMemoryData1.IsEmpty;
  aDelAll.Enabled := not RxMemoryData1.IsEmpty;
end;

procedure TMultiSelectCA.fCntrAgentList1dsCAgentDataChange(Sender: TObject;
  Field: TField);
begin
  fCaNavigator1.fCntrAgentList1dsCAgentDataChange(Sender, Field);
  aAddOne.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
  aAddAll.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;

end;

procedure TMultiSelectCA.fReprList1RxDBGrid1DblClick(Sender: TObject);
begin
  aAddOne.Execute;
end;

function TMultiSelectCA.CheckData: boolean;
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

procedure TMultiSelectCA.grdCADblClick(Sender: TObject);
begin
  aDelOne.Execute;
end;

end.
