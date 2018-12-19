unit uOperImp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frBsnSelector, StdCtrls, Mask, ToolEdit, ExtCtrls, Db, DBClient, RxMemDS,
  Provider, Grids, DBGridEh, RxLookup, GridsEh;

type
  TDObj = class
    AType : integer;
    NumPrm : integer;
  end;

  TOperImp = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    fBsnSelector1: TfBsnSelector;
    FilenameEdit1: TFilenameEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Memo2: TMemo;
    cdsExp: TClientDataSet;
    dsExp: TDataSetProvider;
    mtExp: TRxMemoryData;
    DataSource1: TDataSource;
    RxDBGrid1: TDBGridEh;
    Label2: TLabel;
    cdsRPList: TClientDataSet;
    cdsRPListid_Replicator: TIntegerField;
    cdsRPListName: TStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    dsRPList: TDataSource;
    mtLog2: TRxMemoryData;
    DataSetProvider1: TDataSetProvider;
    cdsLog: TClientDataSet;
    SaveDialog1: TSaveDialog;
    cdsExtDataDict: TClientDataSet;
    cdsExtDataDictid_Oper_ExtDataNames: TIntegerField;
    cdsExtDataDictid_business: TIntegerField;
    cdsExtDataDictType: TIntegerField;
    cdsExtDataDictNumPrm: TIntegerField;
    cdsExtDataDictParName: TStringField;
    cdsExtDataDictVisible: TBooleanField;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    AFSL : TStringList;
    Fxxx_Handle : HWnd;
    procedure Setid_business(const Value: Variant);
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;

    procedure Initialize(const AHandle : HWnd; id_business : Variant);
  end;

var
  OperImp: TOperImp;

procedure ShowOperImp(const AHandle : HWnd; id_business : Variant);


implementation

uses foMyFunc, uDM, uPrgForm, uMeCrpt;

{$R *.DFM}

procedure ShowOperImp(const AHandle : HWnd; id_business : Variant);
var F : TOperImp;
begin
      {$IFDEF SEOLD}
        raise Exception.Create('В этой версии можно только смотреть старые операции');
        Exit;
       {$ENDIF}
  F := TOperImp.Create(nil);
  try
    F.Show;
    F.Repaint;
    F.Initialize(AHandle, id_business);
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

{ TForm1 }

constructor TOperImp.Create(AOwner: TCOmponent);
begin
  inherited;
  AFSL := TStringList.Create;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TOperImp.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

destructor TOperImp.Destroy;
begin
  AFSL.Free;
  inherited;

end;

procedure TOperImp.FormShow(Sender: TObject);
begin
//  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TOperImp.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TOperImp.Initialize(const AHandle : HWnd; id_business: Variant);
begin
  Fxxx_Handle := AHandle;
end;

procedure TOperImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
//  if not cdsLog.IsEmpty then
//    SendMessage(Fxxx_Handle, xxx_RefrMsg, cdsLog.FieldByName('ID_Oper').AsInteger, 0);
end;

procedure TOperImp.Button1Click(Sender: TObject);
var OldRecNo, idx, i : integer;
    id_bsn, id_oper, AID : integer;
    id_business, OperVid: Integer;
    id_UserCreator, DateLocal: OleVariant;
    Correct, OperTypeIn: WordBool;
    CurrencyOperName, PriceFinOper,
    CurrencySysName, SummSysFin, AccName, AccName_Ext, WarehouseName, WarehouseName_Ext,
    ManufactName, ManufactName_Ext, ReprName, CAName: OleVariant;
    Koeff: Integer;
    FormalDistribName, FuncDistribName, Imp_PayBasic,
    AccInv_PayAssignment, OpComment, Contract, ReprName_Ex: OleVariant;

    CtgName, GoodsName, MeasureName, PriceOper, SummSys, id_Replicator, id_LC_Oper: OleVariant;
    AmountOper: Double;
    isLC : boolean;
    S : String;
    ADObj: TDObj;
    AType, NumPrm: Integer;
    DigVal, StrVal, DateVal: OleVariant;
    is_MirrField : TField;
    N_SRC : integer;
begin
  cdsLog.Close;
  cdsLog.Open;
  N_SRC := 0;
  
  id_Replicator := RxDBLookupCombo1.KeyValue;
  
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
        cdsExp.IndexDefs.Clear;
        cdsExp.IndexDefs.Add('ixCheckDate', 'CheckDate', []);
        cdsExp.IndexName := 'ixCheckDate';

  Setid_business(fBsnSelector1.ID);
  with cdsExp do
  begin
    OldRecNo := RecNo;
    DisableControls;
    try
      First;
      try

        isLC := FindField('ContrAgentName') = nil;
        if isLC then
          S := 'id_LC_Oper'
        else
          S := 'id_Oper';

        cdsExp.IndexDefs.Clear;
        cdsExp.IndexDefs.Add('ixxx', S, []);
        cdsExp.IndexName := 'ixxx';
      
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
      //  if not isLC then
        begin
          First;
          while not Eof do
          begin
            if FieldByName(S).AsInteger = -1 then
            begin
              idx := AFSL.IndexOf(trim(cdsExp.FieldByName('WareName').AsString));
              if idx > 0 then
              begin
                FieldByName(FieldByName('OperNum').AsString).Tag := Integer(AFSL.Objects[idx]);
              end;
            end;
            Next;
          end;
        end;
        Memo2.Lines.Clear;
        First;
        id_oper := -1;
        Memo2.Lines.Clear;
    //    Memo1.Lines.BeginUpdate;
        DM.rsCA.AppServer.BeginTruns;

        while not Eof do
        begin
          ShowProgressForm(Handle, RecNo, RecordCount, 'Импорт данных');
          if (cdsExp.FieldByName(S).AsInteger > 0) and (not FieldByName('is_Mirr').AsBoolean) then
          begin
            try
              if id_oper <> cdsExp.FieldByName(S).AsInteger then
              begin // Создаем операцию
                id_oper := FieldByName(S).AsInteger;

                id_business := fBsnSelector1.ID;
                OperVid := FieldByName('OperVid').AsInteger;
                id_UserCreator := DM.IDUser;
                DateLocal := FieldByName('CheckDate').Value;

                Correct := FieldByName('Correct').AsBoolean;
                OperTypeIn := FieldByName('OperTypeIn').AsBoolean;

                if FieldByName('CurrencyOperName').AsString <> '' then
                  CurrencyOperName := FieldByName('CurrencyOperName').Value
                else
                  CurrencyOperName := FieldByName('CurrencyOperShortName').Value;

                if FieldByName('CurrencySysName').AsString <> '' then
                  CurrencySysName := FieldByName('CurrencySysName').Value
                else
                  CurrencySysName := FieldByName('CurrencySysShortName').Value;

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

                Koeff := FieldByName('Koeff').AsInteger;
                FormalDistribName := FieldByName('FormalDistribName').Value;
                FuncDistribName := FieldByName('FuncDistribName').Value;
                if not isLC then
                begin
                  CAName := FieldByName('ContrAgentName').Value;

                  if not FieldByName('id_Repr_Ex').IsNull then
                    ReprName_Ex := FieldByName('ReprName').Value
                  else
                    ReprName_Ex := Null;
                end;
            //    if isLC then
              //    id_LC_Oper := FieldByName('id_LC_Oper').Value;
                id_LC_Oper := FieldByName(S).AsInteger;

                Imp_PayBasic := FieldByName('Imp_PayBasic').Value;
                AccInv_PayAssignment := FieldByName('AccInv_PayAssignment').Value;
                OpComment := FieldByName('OpComment').Value;
                Contract := FieldByName('Contract').Value;     

                AID := DM.rsCA.AppServer.DCh_Oper(id_business, OperVid, id_UserCreator,
                       DateLocal, Correct, OperTypeIn, CurrencyOperName,
                       PriceFinOper, CurrencySysName, SummSysFin, AccName, AccName_Ext,
                       WarehouseName, WarehouseName_Ext, ManufactName, ManufactName_Ext,
                       ReprName, CAName,
                       Koeff, FormalDistribName, FuncDistribName,
                       Imp_PayBasic, AccInv_PayAssignment, OpComment, Contract,
                       ReprName_Ex, id_Replicator, id_LC_Oper);
                if AID = -1 then
                  raise Exception.Create('Ошибка при импорте операций');

                if AID > 0 then
                begin
                  cdsLog.Append;
                  cdsLog.FieldByName('id_Oper').AsInteger := AID;
                  cdsLog.FieldByName('id_LC_Oper').Value := id_LC_Oper;
                  cdsLog.Post;
                  Memo2.Lines.Add(IntToStr(AID));

               //   if not isLC then
                  begin
                    for i := 0 to Fields.Count - 1 do
                    begin
                      if Fields[i].Tag <> 0 then
                      begin
                        ADObj := TDObj(Fields[i].Tag);
                        case ADObj.AType of
                          1 :
                          begin
                             DigVal := cdsExp.Fields[i].Value;
                          end;
                          2 :
                          begin
                            StrVal := cdsExp.Fields[i].AsString;
                          end;
                        end;
                        DM.rsCA.AppServer.OP_OperExtDataEdit_v2(AID,
                          ADObj.AType, ADObj.NumPrm, DigVal, StrVal, Null);
                      end;
                    end;
                  end;
                end;
              end;
              if (AID > 0) and not FieldByName('id_Goods').IsNull then
              begin
                CtgName := FieldByName('CtgName').Value;
                GoodsName := Null;

                if  not FieldByName('WareName').IsNull then
                  GoodsName := FieldByName('WareName').Value;

                MeasureName := FieldByName('MeasureName').Value;
                PriceOper := FieldByName('PriceOper').Value;
                SummSys := FieldByName('SummSys').Value;
                AmountOper := FieldByName('AmountOper').asfloat;
                if DM.rsCA.AppServer.DCh_OperWare(AID, CtgName,
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

          end;
          Next;
        end;
        DM.rsCA.AppServer.CommitTrans;
        FilenameEdit1.FileName := '';
        fBsnSelector1.ID := -1;
        CloseProgressForm;
        MessageBox(Self.Handle, PChar('Операции успешно импортированы. Всего ' + IntToStr(Memo2.Lines.Count) + ' операций. Их номера приведены в списке'), 'Импорт завершен', MB_OK + MB_ICONINFORMATION);

        if isLC then
        begin
          if not cdsLog.IsEmpty then
          begin
            if MessageBox(Handle, 'Сформировать ответ для удаленной системы? Этот отчет нужно загрузить в удаленную систему, приславшую данные, чтобы пометить операции как отправленные и не отправлять их в дальнейшем', 'Сформировать отчет???', MB_ICONQUESTION + MB_YESNO) = idYes then
            begin
            if SaveDialog1.Execute then
              cdsLog.SaveToFile(SaveDialog1.FileName);
            end;
          end;
        end
        else
        begin
          if Memo2.Lines.Count > 0 then
          begin
            if MessageBox(Handle, 'Завизировать операции???', '', MB_ICONQUESTION + MB_YESNO) = idYes then
            begin
              with cdsLog do
              begin
                First;
                while not Eof do
                begin
                  ShowProgressForm(Handle, RecNo, RecordCount, 'Визирование операций');
                  if DM.rsCA.AppServer.OP_OperSetCheckDate_v2(FieldByName('id_Oper').AsInteger, DM.IDUser) <> 1 then
                  begin

                  end;
                  Next;
                end;
              end;
            end;
          end;
        end;
      end;
    finally
      RecNo := OldRecNo;
      EnableControls;
      CloseProgressForm;

 ///     Memo1.Lines.EndUpdate;
    end;
  end;
end;

procedure TOperImp.Setid_business(const Value: Variant);
var i : integer;
    AField: TField;
    S : String;
    ADObj : TDObj;
begin
  AFSL.Clear;
  with cdsExtDataDict do
  begin
    Close;
    Params.ParamByName('@id_business').Value := Value;
    Open;
    try
      First;
      while Not Eof do
      begin
        case FieldByName('Type').AsInteger of
          1 : S := 'Dig';
          2 : S := 'Str';
          3 : S := 'Date';
        end;
        S := S + FieldByName('NumPrm').AsString;
        S := UpperCase(S);
        for i := 0 to cdsExp.Fields.Count - 1 do
        begin
          AField := cdsExp.Fields[i];
          if UpperCase(AField.FieldName) = S then
          begin
            S := 'Бюджет|' + trim(FieldByName('ParName').AsString);
            case FieldByName('Type').AsInteger of
              1 : S := S + '@1';
              2 : S := S + '@2';
              3 : S := S + '@3';
            end;
            ADObj := TDObj.Create;
            ADObj.AType := FieldByName('Type').AsInteger;
            ADObj.NumPrm := FieldByName('NumPrm').AsInteger;
            AFSL.AddObject(S, ADObj);
          end;
        end;
        Next;
      end;
    finally
      Close;
    end;
  end;
end;

procedure TOperImp.fBsnSelector1Button1Click(Sender: TObject);
begin
  fBsnSelector1.Button1Click(Sender);
  with cdsRPList do
  begin
    Close;
    Params.ParamByName('@id_Business').Value := fBsnSelector1.ID;
    Open;
  end;
end;

procedure TOperImp.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
