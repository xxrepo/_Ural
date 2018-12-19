unit uMultiSelectAcc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, Buttons,
  uTopWin, frBsnSelector, ActnList, frCaNavigator, Db, RxMemDS,
  Grids, DBGrids, RXDBCtrl, frCurSelector, DBClient, uAccsFrame;

type
  TSelObjEvent = procedure (AID: integer; AName : String) of object;

  TMultiSelectAcc = class(TForm)
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
    AccsFrame1: TAccsFrame;
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
    procedure fReprList1RxDBGrid1DblClick(Sender: TObject);
    procedure grdCADblClick(Sender: TObject);
    procedure AccsFrame1DataSourceDataChange(Sender: TObject;
      Field: TField);
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
  MultiSelectAcc: TMultiSelectAcc;

function ShowMultiSelectAcc(ID_Bsn: integer; ASelObjEvent : TSelObjEvent) : boolean;

implementation

uses uDM, uPrgForm, uUnivOper_v2, uFormApi_Oper;


function ShowMultiSelectAcc(ID_Bsn: integer; ASelObjEvent : TSelObjEvent) : boolean;
var F : TMultiSelectAcc;
begin
  result := false;
  F := TMultiSelectAcc.Create(nil);
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
          ShowProgressForm(0, RecNo, RecordCount, 'Добавление счетов...');
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

procedure TMultiSelectAcc.btnOkClick(Sender: TObject);
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


procedure TMultiSelectAcc.Initialize(ID_Bsn: integer);
var S : String;
    ID : Variant;
begin
  ID := Null;
  AccsFrame1.Init(ID, ID_Bsn, false, false);
end;

procedure TMultiSelectAcc.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TMultiSelectAcc.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

constructor TMultiSelectAcc.Create(AOwner: TComponent);
begin
  inherited;
  AccsFrame1.ToolBar.Visible := false;
  AccsFrame1.fAccGroup1.ToolBar1.Visible := false;
end;

procedure TMultiSelectAcc.CreateParams(var Params: TCreateParams);
begin
  inherited;
end;

procedure TMultiSelectAcc.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TMultiSelectAcc.fCntrAgentList1RxDBGrid1DblClick(Sender: TObject);
begin
  aAddOne.Execute;
end;

procedure TMultiSelectAcc.aAddinDS(AID : integer; ANAme : String);
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


procedure TMultiSelectAcc.aAddOneExecute(Sender: TObject);
var i : integer;
    NameField : TField;
begin
  with AccsFrame1 do
  begin
    if RxDBGrid1.SelectedRows.Count > 0 then
    begin
      for i := 0 to RxDBGrid1.SelectedRows.Count - 1 do
      begin
        RxDBGrid1.DataSource.DataSet.GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
        aAddinDS(RxDBGrid1.DataSource.DataSet.FieldByName('id_Acc').AsInteger, RxDBGrid1.DataSource.DataSet.FieldByName('Name').AsString);
      end;
    end
    else
      aAddinDS(RxDBGrid1.DataSource.DataSet.FieldByName('id_Acc').AsInteger, RxDBGrid1.DataSource.DataSet.FieldByName('Name').AsString);
  end;
end;

procedure TMultiSelectAcc.aAddAllExecute(Sender: TObject);
begin
  with AccsFrame1.cdsAccs do
  begin
    First;
    DisableControls;
    while not Eof do
    begin
      aAddinDS(AccsFrame1.cdsAccsid_Acc.AsInteger,
               AccsFrame1.cdsAccsName.AsString);
      Next;
    end;
    EnableControls;
  end;
end;

procedure TMultiSelectAcc.aDelOneExecute(Sender: TObject);
begin
  RxMemoryData1.delete;
end;

procedure TMultiSelectAcc.aDelAllExecute(Sender: TObject);
begin
  RxMemoryData1.Close;
  RxMemoryData1.Open;
end;

procedure TMultiSelectAcc.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  btnOk.Enabled := not RxMemoryData1.IsEmpty;
  aDelOne.Enabled := not RxMemoryData1.IsEmpty;
  aDelAll.Enabled := not RxMemoryData1.IsEmpty;
end;

procedure TMultiSelectAcc.fReprList1RxDBGrid1DblClick(Sender: TObject);
begin
  aAddOne.Execute;
end;

function TMultiSelectAcc.CheckData: boolean;
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

procedure TMultiSelectAcc.grdCADblClick(Sender: TObject);
begin
  aDelOne.Execute;
end;

procedure TMultiSelectAcc.AccsFrame1DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  AccsFrame1.DataSourceDataChange(Sender, Field);
  aAddOne.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
  aAddAll.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;

end;

end.
