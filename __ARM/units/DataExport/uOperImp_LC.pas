unit uOperImp_LC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frBsnSelector, StdCtrls, Mask, ToolEdit, ExtCtrls, Db, DBClient, RxMemDS,
  Provider, Grids, DBGridEh, RxLookup;

type
  TOperImp_LC = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    fBsnSelector1: TfBsnSelector;
    FilenameEdit1: TFilenameEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    cdsExp: TClientDataSet;
    dsExp: TDataSetProvider;
    mtExp: TRxMemoryData;
    DataSource1: TDataSource;
    RxDBGrid1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;

    procedure Initialize(id_business : Variant);
  end;

var
  OperImp_LC: TOperImp_LC;

procedure ShowOperImp_LC(id_business : Variant);


implementation

uses foMyFunc, uDM, uPrgForm;

{$R *.DFM}

procedure ShowOperImp_LC(id_business : Variant);
var F : TOperImp_LC;
begin
  F := TOperImp_LC.Create(nil);
  try
    F.Show;
    F.Repaint;
    F.Initialize(id_business);
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

{ TForm1 }

constructor TOperImp_LC.Create(AOwner: TCOmponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TOperImp_LC.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

destructor TOperImp_LC.Destroy;
begin
  inherited;

end;

procedure TOperImp_LC.FormShow(Sender: TObject);
begin
//  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TOperImp_LC.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TOperImp_LC.Initialize(id_business: Variant);
begin

end;

procedure TOperImp_LC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TOperImp_LC.Button1Click(Sender: TObject);
var OldRecNo : integer;
    id_bsn, id_oper, AID : integer;
    id_business, OperVid: Integer; id_UserCreator: OleVariant;
    Correct, OperTypeIn: WordBool;
    CurrencyOperName,
    PriceFinOper, CurrencySysName, SummSysFin, AccName, AccName_Ext,
    WarehouseName, WarehouseName_Ext, ManufactName, ManufactName_Ext,
    ReprName, Imp_PayBasic, AccInv_PayAssignment, OpComment,
    FormalDistribName, FuncDistribName, Contract: OleVariant;

    Koeff: Integer;
    CtgName, GoodsName, MeasureName, PriceOper, SummSys, id_Replicator, id_LC_Oper: OleVariant;
    AmountOper: Double;
    isLC : boolean;
    S_Key : String;
    Field_Koeff, Field_FormalDistrib, Field_FuncDistrib : TField;
begin
  if fBsnSelector1.ID < 0 then
  begin
    MessageBox(Self.Handle, 'Не выбран бизнес, в который надо импортировать операции.', 'Выберите бизнес', MB_OK + MB_ICONERROR);
    Windows.SetFocus(fBsnSelector1.edName.Handle);
    Exit;
  end;
  if FilenameEdit1.FileName = '' then
  begin
    MessageBox(Self.Handle, 'Не выбран файл данных.', 'Выберите файл', MB_OK + MB_ICONERROR);
    Windows.SetFocus(FilenameEdit1.Handle);
    Exit;
  end;
  cdsExp.LoadFromFile(FilenameEdit1.FileName);

  isLC := cdsExp.FindField('id_Oper') = Nil;
  Field_Koeff := cdsExp.FindField('Koeff');
  Field_FormalDistrib := cdsExp.FindField('FormalDistribName');
  Field_FuncDistrib := cdsExp.FindField('FuncDistribName');
  if isLC then
    S_Key := 'id_LC_Oper'
  else
    S_Key := 'id_Oper';
  cdsExp.IndexDefs.Clear;
  cdsExp.IndexDefs.Add('ixxx', S_Key, []);
  cdsExp.IndexName := 'ixxx';

  with cdsExp do
  begin
    OldRecNo := RecNo;
    DisableControls;
    try
      First;
      try
        id_bsn := FieldByName('id_business').AsInteger;
        while not Eof do
        begin
          ShowProgressForm(Handle, RecNo, RecordCount, 'Проверка данных');
          if id_bsn <> FieldByName('id_business').AsInteger then
          begin
            CloseProgressForm;
            MessageBox(Self.Handle, 'В списке присутствуют операции из разных бизнесов. Импорт невозможен.', 'Импорт невозможен', MB_OK + MB_ICONERROR);
            Exit;
          end;
          Next;
        end;
      finally
        CloseProgressForm;
      end;


      if MessageBox(Self.Handle, 'Импортировать операции?', 'Подтвердите импорт', MB_YESNO + MB_ICONQUESTION + mb_DefButton2) = idYes then
      begin
        First;
        id_oper := -1;
        Memo1.Lines.Clear;
    //    Memo1.Lines.BeginUpdate;
        DM.rsCA.AppServer.BeginTruns;
        while not Eof do
        begin
          ShowProgressForm(Handle, RecNo, RecordCount, 'Импорт данных');
          if 1=1 then
          begin
            try
              if id_oper <> FieldByName(S_Key).AsInteger then
              begin // Создаем операцию
                id_oper := FieldByName(S_Key).AsInteger;

                id_business := fBsnSelector1.ID;
                OperVid := FieldByName('OperVid').AsInteger;
                id_UserCreator := DM.IDUser;

                Correct := FieldByName('Correct').AsBoolean;
                OperTypeIn := FieldByName('OperTypeIn').AsBoolean;

                CurrencyOperName := FieldByName('CurrencyOperName').Value;
                CurrencySysName := FieldByName('CurrencySysName').Value;
                if FieldByName('WareName').IsNull then
                begin
                  PriceFinOper := FieldByName('PriceOper').Value;
                  SummSysFin := FieldByName('SummSys').Value;
                end
                else
                begin
                  PriceFinOper := Null;
                  SummSysFin := Null;
                end;

                if not FieldByName('id_Acc').IsNull then
                  AccName := FieldByName('SrcName').Value
                else
                  AccName := Null;
                if not FieldByName('id_Acc_Ext').IsNull then
                  AccName_Ext := FieldByName('ReprName').Value
                else
                  AccName_Ext := Null;

                if not FieldByName('id_Warehouse').IsNull then
                  WarehouseName := FieldByName('SrcName').Value
                else
                  WarehouseName := Null;
                if not FieldByName('id_Warehouse_Ext').IsNull then
                  WarehouseName_Ext := FieldByName('ReprName').Value
                else
                  WarehouseName_Ext := Null;

                if not FieldByName('id_Manufact').IsNull then
                  ManufactName := FieldByName('SrcName').Value
                else
                  ManufactName := Null;
                if not FieldByName('id_Manufact_Ext').IsNull then
                  ManufactName_Ext := FieldByName('ReprName').Value
                else
                  ManufactName_Ext := Null;

                if not FieldByName('id_Repr').IsNull then
                  ReprName := FieldByName('ReprName').Value
                else
                  ReprName := Null;

                Imp_PayBasic := FieldByName('Imp_PayBasic').Value;
                AccInv_PayAssignment := FieldByName('AccInv_PayAssignment').Value;
                OpComment := FieldByName('OpComment').Value;
                Contract := FieldByName('Contract').Value;

                if Field_Koeff <> nil then
                  Koeff := Field_Koeff.AsInteger
                else
                  Koeff := 0;
                if Field_FormalDistrib <> nil then
                  FormalDistribName := Field_FormalDistrib.Value
                else
                  FormalDistribName := 0;
                if Field_FuncDistrib <> nil then
                  FuncDistribName := Field_FuncDistrib.Value
                else
                  FuncDistribName := 0;

                AID := DM.rsCA.AppServer.DCh_Oper_LC(id_business, OperVid, id_UserCreator,
                       Correct, OperTypeIn, CurrencyOperName,
                       PriceFinOper, CurrencySysName, SummSysFin, AccName, AccName_Ext,
                       WarehouseName, WarehouseName_Ext, ManufactName, ManufactName_Ext,
                       ReprName,
                       Imp_PayBasic, AccInv_PayAssignment, OpComment, Contract,
                       Koeff, FormalDistribName, FuncDistribName);
                if AID = -1 then
                  raise Exception.Create('Ошибка при импорте операций');
                Memo1.Lines.Add(IntToStr(AID));
              end;
              if not FieldByName('WareName').IsNull and (FieldByName(S_Key).AsInteger > 0) then
              begin
                CtgName := FieldByName('CtgName').Value;
                GoodsName := Null;

                if  not FieldByName('WareName').IsNull then
                  GoodsName := FieldByName('WareName').Value;

                MeasureName := FieldByName('MeasureName').Value;
                PriceOper := FieldByName('PriceOper').Value;
                SummSys := FieldByName('SummSys').Value;
                AmountOper := FieldByName('AmountOper').asfloat;
                if DM.rsCA.AppServer.DCh_OperWare_LC(AID, CtgName,
                           GoodsName, 
                           MeasureName, AmountOper, PriceOper, SummSys) = -1 then
                  raise Exception.Create('Ошибка при импорте данных');
              end;
            except
              DM.rsCA.AppServer.RollbackTrans;
              Exit;
            end;
          end
          else
          begin
            DM.rsCA.AppServer.RollbackTrans;
            Exit;
          end;
          Next;
        end;
        DM.rsCA.AppServer.CommitTrans;
        FilenameEdit1.FileName := '';
        fBsnSelector1.ID := -1;
        CloseProgressForm;
        MessageBox(Self.Handle, PChar('Операции успешно импортированы. Всего ' + IntToStr(Memo1.Lines.Count) + ' операций. Их номера приведены в списке'), 'Импорт завершен', MB_OK + MB_ICONINFORMATION);
      end;
    finally
      RecNo := OldRecNo;
      EnableControls;
      CloseProgressForm;
 ///     Memo1.Lines.EndUpdate;
    end;
  end;
end;

procedure TOperImp_LC.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
