unit uBsnImp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ComCtrls, frBsnSelector, ExtCtrls, RXCtrls, db,
  DBClient;

type
  ImpF =  procedure (id_New_Group, id_Old_Group : Variant; AMsg : String; APosGlobal : integer; AMaxGlobal : integer) of object;
  AddGroupF =  procedure (ADataSet : TDataSet; var id_New_Group, id_Old_Group : integer) of object;
  GroupListF =  function : TDataSet of object;

  TBsnImp = class(TForm)
    Panel2: TPanel;
    dtTo: TDateTimePicker;
    dtTimeTo: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnCancel: TButton;
    cbAccGrp: TCheckBox;
    Label6: TLabel;
    cbAcc: TCheckBox;
    cbAccState: TCheckBox;
    cbWH: TCheckBox;
    cbWHGrp: TCheckBox;
    cbCAState: TCheckBox;
    cbCA: TCheckBox;
    cbCAGrp: TCheckBox;
    cbMNGrp: TCheckBox;
    cbMN: TCheckBox;
    cbWareState: TCheckBox;
    cbWare: TCheckBox;
    RxSpeedButton2: TRxSpeedButton;
    cbAccCrn: TCheckBox;
    cbCACrn: TCheckBox;
    Panel5: TPanel;
    Panel0: TPanel;
    Label3: TLabel;
    edName: TEdit;
    Button1: TButton;
    Panel1: TPanel;
    Label8: TLabel;
    Edit1: TEdit;
    Button4: TButton;
    cdsAccGroup: TClientDataSet;
    cdsAccGroupid_Group: TIntegerField;
    cdsAccGroupName: TStringField;
    cdsAccGroupCnt: TIntegerField;
    cdsAccGroupShowInRoot: TBooleanField;
    cdsAccs: TClientDataSet;
    cdsAccsid_Acc: TAutoIncField;
    cdsAccsid_business: TIntegerField;
    cdsAccsName: TStringField;
    cdsAccsBank: TStringField;
    cdsAccsPrsnAccName: TStringField;
    cdsAccsCorrAccName: TStringField;
    cdsAccsINN: TStringField;
    cdsAccsBIK: TStringField;
    cdsAccsDisabled: TBooleanField;
    cdsAccsLastUpdated: TBytesField;
    cdsAccsID_Main: TIntegerField;
    cdsAccsBusinessName: TStringField;
    cdsAccsNeedSend: TBooleanField;
    cdsAccsid_Acc_Group: TIntegerField;
    cdsAccsGroupName: TStringField;
    cdsAccsShowInRoot: TBooleanField;
    cdsManufacts: TClientDataSet;
    cdsManufactsid_Manufact: TAutoIncField;
    cdsManufactsid_business: TIntegerField;
    cdsManufactsName: TStringField;
    cdsManufactsAddr: TStringField;
    cdsManufactsDisabled: TBooleanField;
    cdsManufactsID_Main: TIntegerField;
    cdsManufactsLastUpdated: TBytesField;
    cdsManufactsNeedSend: TBooleanField;
    cdsManufactsid_Manufact_Group: TIntegerField;
    cdsManufactsBusinessName: TStringField;
    cdsManufactsGroupName: TStringField;
    cdsMNGroup: TClientDataSet;
    cdsMNGroupid_Group: TIntegerField;
    cdsMNGroupName: TStringField;
    cdsMNGroupCnt: TIntegerField;
    cdsMNGroupShowInRoot: TBooleanField;
    cdsManufactsShowInRoot: TBooleanField;
    cdsWHGroup: TClientDataSet;
    cdsWHGroupid_Group: TIntegerField;
    cdsWHGroupName: TStringField;
    cdsWHGroupCnt: TIntegerField;
    cdsWHGroupShowInRoot: TBooleanField;
    cdsWareHouses: TClientDataSet;
    cdsWareHousesid_Warehouse: TAutoIncField;
    cdsWareHousesid_business: TIntegerField;
    cdsWareHousesName: TStringField;
    cdsWareHousesAddr: TStringField;
    cdsWareHousesDisabled: TBooleanField;
    cdsWareHousesLastUpdated: TBytesField;
    cdsWareHousesID_Main: TIntegerField;
    cdsWareHousesBusinessName: TStringField;
    cdsWareHousesNeedSend: TBooleanField;
    cdsWareHousesid_Warehouse_Group: TIntegerField;
    cdsWareHousesGroupName: TStringField;
    cdsWareHousesShowInRoot: TBooleanField;
    cdsCAGroup: TClientDataSet;
    cdsCAGroupid_CAGroup: TAutoIncField;
    cdsCAGroupName: TStringField;
    cdsCAGroupCnt: TIntegerField;
    cdsCAGroupShowInRoot: TBooleanField;
    cdsCAgent: TClientDataSet;
    cdsCAgentid_ContrAgent: TAutoIncField;
    cdsCAgentName: TStringField;
    cdsCAgentid_business: TIntegerField;
    cdsCAgentid_CAGroup: TIntegerField;
    cdsCAgentDisabled: TBooleanField;
    cdsCAgentBusinessName: TStringField;
    cdsCAgentCAGroupName: TStringField;
    cdsCAgentAddr: TStringField;
    cdsCAgentDescr: TStringField;
    cdsCAgentShowInRoot: TBooleanField;
    cdsPepr: TClientDataSet;
    cdsPeprid_Repr: TAutoIncField;
    cdsPeprid_ContrAgent: TIntegerField;
    cdsPeprisJur: TBooleanField;
    cdsPeprName: TStringField;
    cdsPeprCAName: TStringField;
    cdsPeprDisabled: TBooleanField;
    cdsPeprId_Currency: TIntegerField;
    cdsPeprCurrencyName: TStringField;
    cdsPeprid_business2: TIntegerField;
    cdsPeprID_Main: TIntegerField;
    cdsPeprNeedSend: TBooleanField;
    cdsPeprBusinessName: TStringField;
    cdsPeprGroupName: TStringField;
    cdsPeprid_Repr_Group: TIntegerField;
    cdsPeprBIK: TStringField;
    cdsPeprBank: TStringField;
    cdsPeprAccName: TStringField;
    cdsPeprCorAccNAme: TStringField;
    cdsPeprOKPO: TStringField;
    cdsPeprINN: TStringField;
    cdsPeprKPP: TStringField;
    cdsPeprFirstName: TStringField;
    cdsPeprMiddleName: TStringField;
    cdsPeprLastName: TStringField;
    cdsPeprAddr: TStringField;
    cdsPeprDescr: TStringField;
    cdsCtg_Goods2: TClientDataSet;
    cdsCtg_Goods2id_Ctg_Goods: TIntegerField;
    cdsCtg_Goods2id_BaseCtg_Goods: TIntegerField;
    cdsCtg_Goods2id_business: TIntegerField;
    cdsCtg_Goods2Name: TStringField;
    cdsCtg_Goods2ShortName: TStringField;
    cdsCtg_Goods2Disabled: TBooleanField;
    cdsCtg_Goods2Cnt: TIntegerField;
    cdsCtg_Goods2CldCnt: TIntegerField;
    cdsGoods: TClientDataSet;
    cdsGoodsid_Goods: TAutoIncField;
    cdsGoodsid_Ctg_Goods: TIntegerField;
    cdsGoodsName: TStringField;
    cdsGoodsShortName: TStringField;
    cdsGoodsBarCode: TStringField;
    cdsGoodsPrice: TFloatField;
    cdsGoodsDisabled: TBooleanField;
    cdsGoodsLastUpdated: TBytesField;
    cdsGoodsBC: TStringField;
    cdsGoodsID_Main: TIntegerField;
    cdsGoodsProp2: TClientDataSet;
    cdsGoodsProp2id_Goods: TAutoIncField;
    cdsGoodsProp2id_Ctg_Goods: TIntegerField;
    cdsGoodsProp2Name: TStringField;
    cdsGoodsProp2ShortName: TStringField;
    cdsGoodsProp2BarCode: TStringField;
    cdsGoodsProp2Price: TFloatField;
    cdsGoodsProp2Disabled: TBooleanField;
    cdsGoodsProp2LastUpdated: TBytesField;
    cdsGoodsProp2id_Measure: TIntegerField;
    cdsGoodsProp2MeasureName: TStringField;
    cdsGoodsProp2GTD: TStringField;
    cdsGoodsProp2Country: TStringField;
    cdsGoodsProp2DocNomCode: TStringField;
    cdsGoodsProp2DocPriceCode: TStringField;
    cdsGoodsProp2DocArt: TStringField;
    cdsGoodsProp2DocNumber: TStringField;
    cdsMeasures: TClientDataSet;
    cdsMeasuresid_Measure: TAutoIncField;
    cdsMeasuresid_business: TIntegerField;
    cdsMeasuresName: TStringField;
    cdsMeasuresShortName: TStringField;
    cdsMeasuresid_BaseMeasure: TIntegerField;
    cdsMeasuresKoef: TFloatField;
    cdsMeasuresDisabled: TBooleanField;
    cdsMeasuresLastUpdated: TBytesField;
    cdsMeasuresID_Main: TIntegerField;
    cdsMeasuresOKEI: TStringField;
    cdsGoodsid_Measure: TIntegerField;
    cdsGoodsMeasureName: TStringField;
    cdsGoodsGTD: TStringField;
    cdsGoodsCountry: TStringField;
    cdsGoodsDocNomCode: TStringField;
    cdsGoodsDocPriceCode: TStringField;
    cdsGoodsDocArt: TStringField;
    cdsGoodsDocNumber: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure dtToChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure cbAccClick(Sender: TObject);
  private
    FId_Bsn_Dest, FId_Bsn_Src : variant;
    W_CtgCount : integer;
    function CheckBsn: boolean;
    procedure ChechCB;
    procedure DoImport(AImpF : ImpF;
                       AAddGroupF : AddGroupF;
                       AGroupListF : GroupListF;
                       ANeedGrp : boolean;
                       AMsg : String);

    procedure ImpAcc(id_New_Group, id_Old_Group : Variant; AMsg : String; APosGlobal : integer = -1; AMaxGlobal : integer = -1);
    procedure AddAccGroup(ADataSet : TDataSet; var id_New_Group, id_Old_Group : integer);
    function AccGroupList : TDataSet;
    procedure AddMNGroup(ADataSet: TDataSet; var id_New_Group,
      id_Old_Group: integer);
    procedure ImpMN(id_New_Group, id_Old_Group: Variant; AMsg: String; APosGlobal : integer = -1; AMaxGlobal : integer = -1);
    function MNGroupList: TDataSet;
    function WHGroupList: TDataSet;
    procedure AddWHGroup(ADataSet: TDataSet; var id_New_Group,
      id_Old_Group: integer);
    procedure ImpWH(id_New_Group, id_Old_Group: Variant; AMsg: String; APosGlobal : integer = -1; AMaxGlobal : integer = -1);
    function CAGroupList: TDataSet;
    procedure AddCAGroup(ADataSet: TDataSet; var id_New_Group,
      id_Old_Group: integer);
    procedure ImpCA(id_New_Group, id_Old_Group: Variant; AMsg: String; APosGlobal : integer = -1; AMaxGlobal : integer = -1);

    procedure ImpWare(id_New_Group, id_Old_Group: Variant; AMsg: String; APosGlobal : integer = -1; AMaxGlobal : integer = -1);
    procedure ImpWareOneCtg(id_Group, id_New_Group: Variant;
  AMsg: String);
    procedure ImpMeasuresOne(id_BaseMeasures, id_New_BaseMeasures: Variant;
      AMsg: String);
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure Initialize(id_business : Variant; ADate : Variant);
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  BsnImp: TBsnImp;
procedure ShowBsnImp(id_business : Variant; ADate : Variant);

implementation

uses uFormsAPI_Admin, uBsnSelector, foMyFunc, uPrgForm, uDM;

procedure ShowBsnImp(id_business : Variant; ADate : Variant);
var F : TBsnImp;
begin
//  DM.Rights_GetUserRights(15, Null);
  F := TBsnImp.Create(nil);
  try
    F.Show;
    F.Initialize(id_business, ADate);
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

{$R *.DFM}


procedure TBsnImp.FormCreate(Sender: TObject);
begin
//*
end;

procedure TBsnImp.Initialize(id_business, ADate: Variant);
begin

end;

procedure TBsnImp.Button1Click(Sender: TObject);
var AID : Variant;
    AName : String;
begin
  AID := FId_Bsn_Dest;
  if GetBusinessForm(AID, AName, false, true, true) then
  begin
    FId_Bsn_Dest := AID;
    edName.Text := AName;
    EnableControl(Panel1);
  end;
end;

procedure TBsnImp.Button2Click(Sender: TObject);
var AID : Variant;
    AName : String;
begin
  AID := FId_Bsn_Src;
  if SelectBuisnes(AID, AName, Null, Owner) then
  begin
    FId_Bsn_Src := AID;
    Edit1.Text := AName;
    EnableControl(Panel2);
    EnableControl(Panel3);
    ChechCB;
    dtTimeTo.Enabled := false;
  end;
end;

procedure TBsnImp.dtToChange(Sender: TObject);
var B : boolean;
begin
  B := dtTimeTo.Checked and dtTimeTo.Enabled;
  dtTimeTo.Enabled := dtTo.Checked;
  dtTimeTo.Checked := B;
  Label1.Enabled := dtTo.Checked;
end;

constructor TBsnImp.Create(AOwner: TCOmponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  FId_Bsn_Dest := Null;
  FId_Bsn_Src := Null;
  DisableControl(Panel1);
  DisableControl(Panel2);
  DisableControl(Panel3);
  dtTimeTo.Checked := false;
end;

destructor TBsnImp.Destroy;
begin
  inherited;

end;

procedure TBsnImp.ChechCB;
begin
  cbAccGrp.Enabled := cbAcc.Enabled and cbAcc.Checked;
  cbAccState.Enabled := cbAcc.Enabled and cbAcc.Checked;
  cbAccCrn.Enabled := cbAccState.Enabled and cbAccState.Checked;

  cbWHGrp.Enabled := cbWH.Enabled and cbWH.Checked;

  cbWareState.Enabled := cbWare.Enabled and cbWare.Checked;

  cbMNGrp.Enabled := cbMN.Enabled and cbMN.Checked;

  cbCAGrp.Enabled := cbCA.Enabled and cbCA.Checked;
  cbCAState.Enabled := cbCA.Enabled and cbCA.Checked;
  cbCACrn.Enabled := cbCAState.Enabled and cbCAState.Checked;

  cbAccState.Enabled := false;
  cbAccCrn.Enabled := false;
  cbWareState.Enabled := false;
  cbCAState.Enabled := false;
  cbCACrn.Enabled := false;
end;


procedure TBsnImp.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TBsnImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageBox(Handle, 'Закрыть импорт данных?', Pchar(Application.Title), MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = idYes then
    Action := caFree
  else
    Action := caNone;
end;

function TBsnImp.CheckBsn : boolean;
begin
  Result := true;
  if (FId_Bsn_Dest = FId_Bsn_Src) then
  begin
    MessageBox(Handle, PChar('Нельзя импортировать данные в бизнес ' + Edit1.Text + ' из бизнеса ' + edName.Text), 'Ошибка', MB_ICONERROR + MB_Ok);
    Result := false;
  end;
end;

procedure TBsnImp.RxSpeedButton2Click(Sender: TObject);
var N  : integer;
begin
  N := GetTickCount;
  with edName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран бизнес', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  with Edit1 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не выбран бизнес-источник данных', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  if not CheckBsn then
    Abort;
  Enabled := false;
  try
    if cbAcc.Checked then
      DoImport(ImpAcc, AddAccGroup, AccGroupList, cbAccGrp.Checked, 'Импорт счетов');
    if cbWH.Checked then
      DoImport(ImpWH, AddWHGroup, WHGroupList, cbWHGrp.Checked, 'Импорт складов');

    if cbCA.Checked then
      DoImport(ImpCA, AddCAGroup, CAGroupList, cbCAGrp.Checked, 'Импорт контрагентов и представителей');
    if cbWare.Checked then
      DoImport(ImpWare, nil, nil, false, 'Импорт товаров');
    if cbMN.Checked then
      DoImport(ImpMN, AddMNGroup, MNGroupList, cbMNGrp.Checked, 'Импорт производств');

    N := (GetTickCount - N);
    MessageBox(Handle, PChar('Данные успешно импортированы' + #13 + #10 +
      'Затрачено времени ' + FormatDateTime('hh:nn', N/24/60000)), 'Импорт данных завершен', MB_OK + MB_ICONINFORMATION);
  finally
    Enabled := true;
  end;
end;

procedure TBsnImp.cbAccClick(Sender: TObject);
begin
  ChechCB;
end;

function TBsnImp.AccGroupList: TDataSet;
begin
  Result := cdsAccGroup;
  with cdsAccGroup do
  begin
    Close;
    Params.ParamByName('@id_business').Value := FId_Bsn_Src;
    Open;
  end;
end;

function TBsnImp.MNGroupList: TDataSet;
begin
  Result := cdsMNGroup;
  with cdsMNGroup do
  begin
    Close;
    Params.ParamByName('@id_business').Value := FId_Bsn_Src;
    Open;
  end;
end;

function TBsnImp.WHGroupList: TDataSet;
begin
  Result := cdsWHGroup;
  with cdsWHGroup do
  begin
    Close;
    Params.ParamByName('@id_business').Value := FId_Bsn_Src;
    Open;
  end;
end;

function TBsnImp.CAGroupList: TDataSet;
begin
  Result := cdsCAGroup;
  with cdsCAGroup do
  begin
    Close;
    Params.ParamByName('@id_business').Value := FId_Bsn_Src;
    Params.ParamByName('@isOwn').Value := Null;
    Open;
  end;
end;

procedure TBsnImp.AddAccGroup(ADataSet : TDataSet; var id_New_Group, id_Old_Group : integer);
begin
  id_Old_Group := ADataSet.FieldByName('id_Group').AsInteger;
  id_New_Group := DM.rsCA.AppServer.xxx_Group_Add_v2(0,
                        FId_Bsn_Dest,
                        ADataSet.FieldByName('Name').AsString,
                        ADataSet.FieldByName('ShowInRoot').AsBoolean);
end;

procedure TBsnImp.AddMNGroup(ADataSet : TDataSet; var id_New_Group, id_Old_Group : integer);
begin
  id_Old_Group := ADataSet.FieldByName('id_Group').AsInteger;
  id_New_Group := DM.rsCA.AppServer.xxx_Group_Add_v2(2,
                        FId_Bsn_Dest,
                        ADataSet.FieldByName('Name').AsString,
                        ADataSet.FieldByName('ShowInRoot').AsBoolean);
end;

procedure TBsnImp.AddWHGroup(ADataSet : TDataSet; var id_New_Group, id_Old_Group : integer);
begin
  id_Old_Group := ADataSet.FieldByName('id_Group').AsInteger;
  id_New_Group := DM.rsCA.AppServer.xxx_Group_Add_v2(3,
                        FId_Bsn_Dest,
                        ADataSet.FieldByName('Name').AsString,
                        ADataSet.FieldByName('ShowInRoot').AsBoolean);
end;

procedure TBsnImp.AddCAGroup(ADataSet : TDataSet; var id_New_Group, id_Old_Group : integer);
begin
  id_Old_Group := ADataSet.FieldByName('id_CAGroup').AsInteger;
  id_New_Group := DM.rsCA.AppServer.CAGroup_Add(
                        FId_Bsn_Dest,
                        ADataSet.FieldByName('Name').AsString,
                        ADataSet.FieldByName('ShowInRoot').AsBoolean);
end;

procedure TBsnImp.ImpAcc(id_New_Group, id_Old_Group: Variant; AMsg : String; APosGlobal, AMaxGlobal : integer);
begin
  with cdsAccs do
  begin
    Close;
    Params.ParamByName('@ID_Business').Value := FId_Bsn_Src;
    Params.ParamByName('@id_Group').Value := id_Old_Group;
    Open;
    try
      First;
      while not Eof do
      begin
        ShowProgressForm(Handle, RecNo, RecordCount, AMsg, APosGlobal, AMaxGlobal);
        if not FieldByName('Disabled').AsBoolean then
          DM.rsCA.AppServer.Acc_Edit(
            -1,
            FieldByName('Name').AsString,
            FieldByName('Bank').AsString,
            FId_Bsn_Dest,
            FieldByName('PrsnAccName').AsString,
            FieldByName('CorrAccName').AsString,
            FieldByName('INN').AsString,
            FieldByName('BIK').AsString,
            false,
            true,
            id_New_Group,
            FieldByName('ShowInRoot').AsBoolean);
               
        Next;
      end;
    finally
      Close;
      CloseProgressForm;
    end;
  end
end;

procedure TBsnImp.ImpMN(id_New_Group, id_Old_Group: Variant; AMsg : String; APosGlobal, AMaxGlobal : integer);
begin
  with cdsManufacts do
  begin
    Close;
    Params.ParamByName('@ID_Business').Value := FId_Bsn_Src;
    Params.ParamByName('@id_Group').Value := id_Old_Group;
    Open;
    try
      First;
      while not Eof do
      begin
        ShowProgressForm(Handle, RecNo, RecordCount, AMsg, APosGlobal, AMaxGlobal);
        if not FieldByName('Disabled').AsBoolean then
          DM.rsCA.AppServer.MN_Edit(
            -1,
            FieldByName('Name').AsString,
            FId_Bsn_Dest,
            FieldByName('Addr').AsString,
            false,
            true,
            id_New_Group,
            FieldByName('ShowInRoot').AsBoolean);
               
        Next;
      end;
    finally
      Close;
      CloseProgressForm;
    end;
  end
end;

procedure TBsnImp.ImpWH(id_New_Group, id_Old_Group: Variant; AMsg : String; APosGlobal, AMaxGlobal : integer);
begin
  with cdsWareHouses do
  begin
    Close;
    Params.ParamByName('@ID_Business').Value := FId_Bsn_Src;
    Params.ParamByName('@id_Group').Value := id_Old_Group;
    Open;
    try
      First;
      while not Eof do
      begin
        ShowProgressForm(Handle, RecNo, RecordCount, AMsg, APosGlobal, AMaxGlobal);
        if not FieldByName('Disabled').AsBoolean then
          DM.rsCA.AppServer.WH_Edit(
            -1,
            FieldByName('Name').AsString,
            FId_Bsn_Dest,
            FieldByName('Addr').AsString,
            false,
            true,
            id_New_Group,
            FieldByName('ShowInRoot').AsBoolean);
               
        Next;
      end;
    finally
      Close;
      CloseProgressForm;
    end;
  end
end;

procedure TBsnImp.ImpCA(id_New_Group, id_Old_Group: Variant; AMsg : String; APosGlobal, AMaxGlobal : integer);
var id_Ca : integer;
    isJur, Disabled, NeedSend: WordBool;
    AName, FirstName, MiddleName, LastName, Id_Currency, Addr, Descr, 
    BIK, Bank, AccName, CorAccName, OKPO, INN, KPP: OleVariant;

begin
  with cdsCAgent do
  begin
    Close;
    Params.ParamByName('@ID_Business').Value := FId_Bsn_Src;
    Params.ParamByName('@Disabled').Value := false;
    Params.ParamByName('@isOwn').Value := Null;
    Params.ParamByName('@id_CAGroup').Value := id_Old_Group;

    Open;
    try
      First;
      while not Eof do
      begin
        ShowProgressForm(Handle, RecNo, RecordCount, AMsg, APosGlobal, AMaxGlobal);
        if not FieldByName('Disabled').AsBoolean then
        begin
          Addr := FieldByName('Addr').Value;
          Descr := FieldByName('Descr').Value;
          id_Ca := DM.rsCA.AppServer.ContrAgentAdd(FieldByName('Name').AsString,
            FId_Bsn_Dest,
            id_New_Group,
            false,
            Null,
            Addr,
            Descr,
            FieldByName('ShowInRoot').AsBoolean);
        end;
        
        cdsPepr.Close;
        cdsPepr.Params.ParamByName('@id_ContrAgent').Value := FieldByName('id_ContrAgent').Value;
        cdsPepr.Params.ParamByName('@Disabled').Value := false;
        cdsPepr.Params.ParamByName('@id_Bsn').Value := FId_Bsn_Src;
        cdsPepr.Open;
        cdsPepr.First;
        while not cdsPepr.Eof do
        begin
          isJur := cdsPeprisJur.AsBoolean;
          AName := cdsPeprName.AsVariant;
          FirstName := cdsPeprFirstName.AsVariant;
          MiddleName := cdsPeprMiddleName.AsVariant;
          LastName := cdsPeprLastName.AsVariant;

          Addr := cdsPeprAddr.AsVariant;
          Descr := cdsPeprDescr.AsVariant;

          NeedSend := cdsPeprNeedSend.AsBoolean;

          BIK := cdsPeprBIK.AsVariant;
          Bank := cdsPeprBank.AsVariant;
          AccName := cdsPeprAccName.AsVariant;
          CorAccName := cdsPeprCorAccNAme.AsVariant;
          OKPO := cdsPeprOKPO.AsVariant;
          INN := cdsPeprINN.AsVariant;
          KPP := cdsPeprKPP.AsVariant;

          DM.rsCA.AppServer.ReprAdd(id_Ca, isJur, AName, FirstName, MiddleName, LastName,
              Null, false,
              Addr, Descr, Null, NeedSend,
              BIK, Bank, AccName, CorAccNAme, OKPO, INN, KPP);
                                            
          cdsPepr.Next;
        end;

        Next;
      end;
    finally
      Close;
      CloseProgressForm;
    end;
  end
end;

procedure TBsnImp.DoImport(AImpF: ImpF; AAddGroupF: AddGroupF;
  AGroupListF: GroupListF; ANeedGrp: boolean;
                       AMsg : String);
var ADataSet : TDataSet;
    id_New_Group, id_Old_Group : integer;
begin
  if not ANeedGrp then
    AImpF(Null, Null, AMsg, -1, -1)
  else
  begin
    ADataSet := AGroupListF;
    with ADataSet do
    begin
      AImpF(Null, -1, AMsg + ' группа ' + IntToStr(RecNo) + ' из ' + IntToStr(RecordCount + 1), RecNo, RecordCount);
      try
        First;
        while not Eof do
        begin
          AAddGroupF(ADataSet, id_New_Group, id_Old_Group);
          AImpF(id_New_Group, id_Old_Group, AMsg + ' группа ' + IntToStr(RecNo) + ' из ' + IntToStr(RecordCount + 1), RecNo, RecordCount);
          Next;
        end;
      finally
        Close;
      end;
    end;
  end;
end;

procedure TBsnImp.ImpWare(id_New_Group, id_Old_Group: Variant;
  AMsg: String; APosGlobal, AMaxGlobal : integer);
begin
  with cdsMeasures do
  begin
    Close;
    Params.ParamByName('Id_Business').AsInteger := FId_Bsn_Src;
    Params.ParamByName('Id_Base').AsInteger := -1;
    Open;
    try
      W_CtgCount := 0;
      ImpMeasuresOne(Null, Null, 'Импорт единиц измерения');
    finally
      Close;
      CloseProgressForm;
    end;
  end;  

  with cdsCtg_Goods2 do
  begin
    Params.ParamByName('@ID_P').Value := -1;
    Params.ParamByName('@id_business').Value := FId_Bsn_Src;
    Params.ParamByName('@Disabled').Value := false;
    ShowProgressForm(Handle, -1, -1, 'Получение списка категорий товаров...');
    Open;
    CloseProgressForm;
    try
      W_CtgCount := 0;
      ImpWareOneCtg(Null, Null, AMsg);
    finally
      Close;
      CloseProgressForm;
    end;
  end;
end;

procedure TBsnImp.ImpMeasuresOne(id_BaseMeasures, id_New_BaseMeasures : Variant;
  AMsg: String);
var OldRecNo, Fid_Measures : Variant;
begin
  with cdsMeasures do
  begin
    OldRecNo := RecNo;
    try
      First;
      while not Eof do
      begin
        if not cdsMeasuresDisabled.AsBoolean and (cdsMeasuresid_BaseMeasure.AsVariant = id_BaseMeasures) then
        begin             
          Fid_Measures := DM.rsCA.AppServer.SetMeasureDetail(
                   0,
                   -1,
                   cdsMeasuresName.AsString,
                   cdsMeasuresShortName.AsString,
                   id_New_BaseMeasures,
                   FId_Bsn_Dest,
                   cdsMeasuresKoef.AsVariant,
                   false,
                   cdsMeasuresOKEI.AsString);
          inc(W_CtgCount);
          ShowProgressForm(Handle, W_CtgCount, RecordCount, AMsg);

          ImpMeasuresOne(cdsMeasuresid_Measure.AsVariant, Fid_Measures, AMsg);
        end;
        Next;
      end;
    finally
      RecNo := OldRecNo;
    end;
  end;
end;


procedure TBsnImp.ImpWareOneCtg(id_Group, id_New_Group : Variant;
  AMsg: String);
var OldRecNo, Fid_Ctg, id_Measure, id_Goods : integer;
    MeasureName : String;
begin
  with cdsCtg_Goods2 do
  begin
    OldRecNo := RecNo;
    try
      First;
      while not Eof do
      begin
        if cdsCtg_Goods2id_BaseCtg_Goods.AsVariant = id_Group then
        begin
          Fid_Ctg := DM.rsCA.AppServer.Ctg_GoodsAdd(FId_Bsn_Dest,
            id_New_Group,
            cdsCtg_Goods2Name.AsString,
            cdsCtg_Goods2ShortName.AsString,
            false);
          inc(W_CtgCount);
        //  ShowProgressForm(Handle, W_CtgCount, RecordCount, AMsg);
          ShowProgressForm(Handle, -1, -1, 'Импорт каталога товаров "' + cdsCtg_Goods2NAme.Asstring + '"', W_CtgCount, cdsCtg_Goods2.RecordCount);

          with cdsGoods do
          begin
            Close;
            Params.ParamByName('@Disabled').Value := false;
            Params.ParamByName('@id_business').Value := FId_Bsn_Src;
            Params.ParamByName('@id_Ctg_Goods').Value := cdsCtg_Goods2id_Ctg_Goods.AsVariant;
            Open;
            while not Eof do
            begin
              ShowProgressForm(Handle, RecNo, RecordCount, 'Импорт каталога товаров "' + cdsCtg_Goods2NAme.Asstring + '"', W_CtgCount, cdsCtg_Goods2.RecordCount);

              if not cdsGoodsid_Measure.IsNull then
              begin
                MeasureName := DM.rsCA.AppServer.GetMeasureName(cdsGoodsid_Measure.AsVariant);
                id_Measure := DM.rsCA.AppServer.DCh_MeasureAdd(FId_Bsn_Dest, MeasureName);

                id_Goods := DM.rsCA.AppServer.WareAdd(0, Fid_Ctg,
                  cdsGoodsName.AsString,
                  cdsGoodsShortName.AsString,
                  cdsGoodsBarCode.AsString,
                  false,
                  id_Measure,
                  cdsGoodsGTD.AsString,
                  cdsGoodsCountry.AsString,
                  cdsGoodsDocNomCode.AsString,
                  cdsGoodsDocPriceCode.AsString,
                  cdsGoodsDocArt.AsString,
                  cdsGoodsDocNumber.AsString);
              end;
              Next;
            end;

          end;

          ImpWareOneCtg(cdsCtg_Goods2id_Ctg_Goods.AsVariant, Fid_Ctg, AMsg);
        end;
        Next;
      end;
    finally
      RecNo := OldRecNo;
      //      cdsGoodsProp.Close;
    end;
  end;
end;

procedure TBsnImp.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);

end;

end.
