
unit uAPNOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frBsnSelector, StdCtrls, Mask, ToolEdit, ExtCtrls, Db, DBClient, RxMemDS,
  Provider, Grids, DBGridEh, foMyFunc, RxLookup, ActnList, ImgList, ComCtrls, contnrs,
  Menus, Buttons, ToolWin, DBCtrls, GridsEh;

type
  TParObj = class
    id_ObjItem, ExtID : integer;
    ParField, ParName, OpName, APName : String;
  end;

  TOperObj = class
    id_ObjItem, id_Oper : integer;
  end;


  TAPNOper = class(TForm)
    RxDBGrid1: TDBGridEh;
    ActionList1: TActionList;
    aProperty: TAction;
    ilImage: TImageList;
    StatusBar1: TStatusBar;
    aCreate: TAction;
    dsDoFilter: TDataSource;
    aDel: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    aSet: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    aUp: TAction;
    aDown: TAction;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    SpeedButton3: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure aPropertyExecute(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumnEh);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarkerEh;
      IsDown: Boolean);
    procedure RxDBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RxDBGrid1SelectionChange(Sender: TObject);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure aCreateExecute(Sender: TObject);
    procedure dsDoFilterDataChange(Sender: TObject; Field: TField);
    procedure aDelExecute(Sender: TObject);
    procedure aSetExecute(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    FNoRefr : boolean;
    FFuckedCol : integer;
    AFSL : TStringList;
    Fxxx_Handle : HWnd;
    FObjList : TObjectList;
    Fid_business : integer;
    procedure DoCreateOper;
    function DoEditOper(AReadOnly: boolean; id_OperParent: Variant;
      ACorrect, ACopy, ADelMode: boolean; var ID: integer; Ais_Mirr,
      ARezMode, AViza: boolean; AOperVid: integer): boolean;
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;

    procedure Initialize(const AHandle : HWnd; id_APN_Obj, Aid_business : integer);
    procedure DoCancelMsg(var Msg: TMessage); message xxx_Cancel;
  end;

var
  APNOper: TAPNOper;

procedure ShowAPNOper(const AHandle : HWnd; id_APN_Obj, Aid_business : integer);


implementation

uses uDM, uPrgForm, foMyFuncEh, uUnivOper_v2, uFormApi_Oper, uArcProp;

{$R *.DFM}

procedure ShowAPNOper(const AHandle : HWnd; id_APN_Obj, Aid_business : integer);
var F : TAPNOper;
begin
  if (Aid_business > 0) and DM.CheckUserRights(5000, Aid_business) then
  begin
    F := TAPNOper.Create(nil);
    try
    //  ShowProgressForm(AHandle, -1, -1, 'Идет генерация операций...');
      F.Initialize(AHandle, id_APN_Obj, Aid_business);
    //  CloseProgressForm;
      if not Dm.cdsAPNGen.IsEmpty then
      begin
        F.ShowModal;
      end;
    finally
      F.Free;
    end;
  end;
end;

{ TForm1 }

constructor TAPNOper.Create(AOwner: TCOmponent);
begin
  inherited;
//  LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\q' + Self.ClassName {+ VarToStr(Fid_business)});
  FObjList := TObjectList.Create(true);
  AFSL := TStringList.Create;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TAPNOper.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

destructor TAPNOper.Destroy;
begin
  AFSL.Free;
  FObjList.Free;
  SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\q' + Self.ClassName + VarToStr(Fid_business));
  inherited;

end;

procedure TAPNOper.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TAPNOper.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TAPNOper.Initialize(const AHandle : HWnd; id_APN_Obj, Aid_business : integer);
var Obj : TParObj;
    oldCursor : TCursor;
    i : integer;
begin
  Fid_business := Aid_business;
  with DM.cdsCur do
  begin
    Close;

    Params.ParamByName('@id_Bsn').Value := Fid_business;
    Params.ParamByName('@AvForPay').Value := true;
    Params.ParamByName('@FastAccess').Value := true;
    Open;
  end;
  with DM.cdsAPNGen do
  begin
    Close;

    if id_APN_Obj = -1 then
      Params.ParamByName('@id_business').Value := Fid_business
    else
      Params.ParamByName('@id_business').Value := Null;
    Params.ParamByName('@id_APN_Obj').Value := id_APN_Obj;
    Open;
  end;



end;

procedure TAPNOper.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
//  if not cdsLog.IsEmpty then
//    SendMessage(Fxxx_Handle, xxx_RefrMsg, cdsLog.FieldByName('ID_Oper').AsInteger, 0);
end;


procedure TAPNOper.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TAPNOper.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGridEh(Sender).ScreenToClient(P);
  if P.y <= THackGridEh(Sender).RowHeights[0] then
    Exit;
  aProperty.Execute;
end;

procedure TAPNOper.aPropertyExecute(Sender: TObject);
begin
//*
end;

procedure TAPNOper.RxDBGrid1CellClick(Column: TColumnEh);
var S : String;
    P : TPoint;
    i, X : integer;
    Row: Longint;
begin
  P := Mouse.CursorPos;
  P := THackGridEh(RxDBGrid1).ScreenToClient(P);
  THackGridEh(RxDBGrid1).MouseToCell(P.X, P.Y, FFuckedCol, Row);

//  UpdateStatusBarText;
end;

procedure TAPNOper.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
    S : String;
begin
  if (Sender as TDBGridEh).DataSource.DataSet.IsEmpty then
    Exit;

{  if Column.Field = RxDBGrid1.DataSource.DataSet.FieldByName('OperVidName') then
  begin
    case RxDBGrid1.DataSource.DataSet.FieldByName('OperVid').AsInteger of
      -1 :
      begin
        ImgIndex := 29;
      end;
      0 :
      begin
        ImgIndex := 0;
      end;
      201 :
      begin
        ImgIndex := 14;
      end;
      1, 101 :
      begin
        ImgIndex := 2;
      end;
      2, 102 :
      begin
        ImgIndex := 1;
      end;
      3, 103 :
      begin
        ImgIndex := 3;
      end;
      4 :
      begin
        ImgIndex := 21;
      end;
      else
        ImgIndex := -1;
    end;
    TDBGridEh(Sender).Canvas.FillRect(Rect);
    ilImage.Draw(TDBGridEh(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
  end
  else }
  begin
    TDBGridEh(Sender).Canvas.FillRect(Rect);
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

    // Красим незаполненные ячейки
    if ((Column.Field = RxDBGrid1.DataSource.DataSet.FieldByName('APPP')) and
        (not RxDBGrid1.DataSource.DataSet.FieldByName('APrc').IsNull))
       or
       ((Column.Field = RxDBGrid1.DataSource.DataSet.FieldByName('CName2')) and
        (not RxDBGrid1.DataSource.DataSet.FieldByName('APrc').IsNull)) then
    begin
      TDBGridEh(Sender).Canvas.Brush.Color := clWindow;

    //  TDBGridEh(Sender).Canvas.Font.Color := clRed;
    //  TDBGridEh(Sender).Canvas.Font.Style := TDBGridEh(Sender).Canvas.Font.Style + [fsBold];

      TDBGridEh(Sender).Canvas.Brush.Style := bsClear;
      TDBGridEh(Sender).Canvas.Pen.Color := clRed;
      TDBGridEh(Sender).Canvas.Rectangle(Rect.Left + 0, Rect.Top + 0, Rect.Right - 0, Rect.Bottom - 0);
    end;
  end;
end;

procedure TAPNOper.RxDBGrid1GetBtnParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarkerEh; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarkerEh(Column.Field);
end;

procedure TAPNOper.RxDBGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Row: Longint;
begin
  THackGridEh(RxDBGrid1).MouseToCell(X, Y, FFuckedCol, Row);
end;

procedure TAPNOper.RxDBGrid1SelectionChange(Sender: TObject);
var V : Variant;
    S : String;
begin
  V := GridSelectionSumm(RxDBGrid1, true);
  if V = Null then
    S := ''
  else
    S := 'Сумма: ' + FormatFloat('0.##', V);
  StatusBar1.Panels[2].Text := S;
end;

procedure TAPNOper.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
//  ReOrderCDSEh(Column, 'id_Oper');
end;

procedure TAPNOper.aCreateExecute(Sender: TObject);
begin
  if DM.cdsAPNGen.State = dsEdit then
    DM.cdsAPNGen.Post;
  with DM.cdsAPNGen do
  begin
    First;
    while not Eof do
    begin
      if not DM.cdsAPNGenAPrc.IsNull and (DM.cdsAPNGenAPPP.AsFloat = 0) then
      begin
        Windows.SetFocus(RxDBGrid1.Handle);
        RxDBGrid1.col := 7;
        MessageBox(Handle, 'Не введена сумма', 'Ошибка!!!', MB_OK + MB_ICONERROR);
        Exit;
      end;
      if not DM.cdsAPNGenAPrc.IsNull and (DM.cdsAPNGenARC.AsString = '') then
      begin
        Windows.SetFocus(RxDBGrid1.Handle);
        RxDBGrid1.col := 8;
        MessageBox(Handle, 'Не выбрана валюта', 'Ошибка!!!', MB_OK + MB_ICONERROR);
        Exit;
      end;
      Next;
    end;
  end;
  DoCreateOper;
  Close;
end;

procedure TAPNOper.DoCreateOper;
var OperVid: Integer; id_business: OleVariant; Correct,
      OperTypeIn: WordBool; Id_CurrencyOper, PriceFinOper: OleVariant;
      RateOper: Double; Id_CurrencySys, SummSysFin, RateSys, id_Repr,
      id_Acc, id_Acc_Ext, id_Warehouse, id_Warehouse_Ext, id_Manufact,
      id_Manufact_Ext, id_FormalDistrib, id_FuncDistrib, Koeff,
      Id_CurrencyInv, id_OperParent: OleVariant; OperState: Integer;
      id_UserCreator, id_DocType, Imp_PayBasic, AccInv_PayAssignment,
      Contract, OpComment, Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8,
      Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, Str1, Str2, Str3,
      Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13,
      Str14, Str15, Date1, Date2, Date3, Date4, Date5, Date6, Date7, Date8,
      Date9, Date10, Date11, Date12, Date13, Date14, Date15,
      id_Goods, id_Measure, Amount, PriceOper : OleVariant;
      VatIn, AutoGen: WordBool;
  OldRecNo, i, ID : integer;
  AID_Oper : integer;
  AList, AListOperVid : TIDList;
  AOperObjList : TObjectList;
  MayClose : boolean;

begin
  MayClose := false;
  FNoRefr := true;
  with DM.cdsAPNGen do
  begin
    try
      First;
      AID_Oper := -1;
      while not Eof do
      begin
        ShowProgressForm(Handle, RecNo, RecordCount, 'Создание операций');
          OperVid := 102;//DM.cdsAPNGenOperVid.AsInteger;
          id_business := DM.cdsAPNGenid_business.AsInteger;
          Correct := false;
          OperTypeIn := true;
          Id_CurrencyOper := DM.cdsAPNGenId_Cur.AsVariant;
          PriceFinOper := DM.cdsAPNGenAR.AsVariant;
          RateOper := 0;
          Id_CurrencySys := Null;
          SummSysFin := Null;
          RateSys := Null;
          id_Repr := Null; //DM.cdsAPNGenid_Repr.AsVariant;
          id_Acc := DM.cdsAPNGenid_Acc.AsVariant;
          id_Acc_Ext := Null; //DM.cdsAPNGenid_AccDest.AsVariant;
          id_Warehouse := Null;
          id_Warehouse_Ext := Null;
          id_Manufact := Null;
          id_Manufact_Ext := Null;
                       
          id_FormalDistrib := Null;
          id_FuncDistrib := Null;
          Koeff := 0;

          Id_CurrencyInv := Null;
          id_OperParent := Null;
          OperState := 0;
          id_UserCreator := DM.IDUser;
          id_DocType := Null;
          Imp_PayBasic := Null;
          AccInv_PayAssignment := Null;
          Contract := Null;
          OpComment := 'автоначисление';

          Dig1 := Null;
          Dig2 := Null;
          Dig3 := Null;
          Dig4 := Null;
          Dig5 := Null;
          Dig6 := Null;
          Dig7 := Null;
          Dig8 := Null;
          Dig9 := Null;
          Dig10 := Null;
          Dig11 := Null;
          Dig12 := Null;
          Dig13 := Null;
          Dig14 := Null;
          Dig15 := Null;

          Str1 := Null;
          Str2 := Null;
          Str3 := Null;
          Str4 := Null;
          Str5 := Null;
          Str6 := Null;
          Str7 := Null;
          Str8 := Null;
          Str9 := Null;
          Str10 := Null;
          Str11 := Null;
          Str12 := Null;
          Str13 := Null;
          Str14 := Null;
          Str15 := Null;

          Date1 := Null;
          Date2 := Null;
          Date3 := Null;
          Date4 := Null;
          Date5 := Null;
          Date6 := Null;
          Date7 := Null;
          Date8 := Null;
          Date9 := Null;
          Date10 := Null;
          Date11 := Null;
          Date12 := Null;
          Date13 := Null;
          Date14 := Null;
          Date15 := Null;


          VatIn := true;
          AutoGen := true;
          AID_Oper := wp_OP_OperAdd_v2(OperVid, id_business, Correct, OperTypeIn, Id_CurrencyOper,
                                                 PriceFinOper, RateOper, Id_CurrencySys, SummSysFin, RateSys,
                                                 id_Repr, id_Acc, id_Acc_Ext, id_Warehouse, id_Warehouse_Ext,
                                                 id_Manufact, id_Manufact_Ext,
                                                 id_FormalDistrib, id_FuncDistrib, Koeff,
                                                 Id_CurrencyInv, id_OperParent, OperState,
                                                 id_UserCreator, id_DocType,
                                                 Imp_PayBasic, AccInv_PayAssignment, Contract, OpComment,
                                                 Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8,
                                                 Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15,
                                                 Str1, Str2, Str3, Str4, Str5, Str6, Str7, Str8,
                                                 Str9, Str10, Str11, Str12, Str13, Str14, Str15,
                                                 Date1, Date2, Date3, Date4, Date5, Date6, Date7,
                                                 Date8, Date9, Date10, Date11, Date12, Date13, Date14, Date15, VATIn, AutoGen);

      //  end;
        DoEditOper(false, Null, false, false, false, AID_Oper, false, false, true, OperVid);
        dm.rsCA.AppServer.APN_ObjDoIt(DM.cdsAPNGenid_APN_Obj.AsInteger);
        Next;
      end;
    finally
      First;
      EnableControls;
      CloseProgressForm;
    //  RefresheArc(ID);
      PostMessage(Fxxx_Handle, xxx_RefrOptim, ID, 0);
      if MayClose then Release;
    end;
  end;
end;

function TAPNOper.DoEditOper(AReadOnly: boolean; id_OperParent: Variant;
  ACorrect, ACopy, ADelMode: boolean; var ID: integer; Ais_Mirr, ARezMode,
  AViza: boolean; AOperVid: integer): boolean;
var
    Rez : boolean;
    B, IsMy : boolean;
    AOperParamz : TOperParamz;
begin
  ADelMode := false;

  AOperParamz := GetEmptyOperParamz;
  AOperParamz.ReadOnly := false;
  AOperParamz.ID_Oper := ID;
  AOperParamz.is_Mirr := Ais_Mirr;
  AOperParamz.Correct := ACorrect;
  AOperParamz.Copy := ACopy;
  AOperParamz.DelMode := ADelMode;
  AOperParamz.RezMode := ARezMode;
  AOperParamz.Viza := AViza;
  AOperParamz.ALevel := 0;

  AOperParamz.CalcPrice := true;

  Result := false;
  case AOperVid of
    -1 : EditOperCrnCh(Fxxx_Handle, AOperParamz);
    0 : EditOperEmpty(Fxxx_Handle, AOperParamz);
    1 : EditOperWare(Fxxx_Handle, AOperParamz);
    2 : EditOperFin(Fxxx_Handle, AOperParamz);
    4 : EditOperOffset(Fxxx_Handle, AOperParamz);

    101 : EditOperWare_FFF(Fxxx_Handle, AOperParamz);
    102 : EditOperFin_FFF(Fxxx_Handle, AOperParamz);

    201 : EditOperWare(Fxxx_Handle, AOperParamz);
  end;

end;


procedure TAPNOper.dsDoFilterDataChange(Sender: TObject; Field: TField);
begin
  aCreate.Enabled := not DM.cdsAPNGen.IsEmpty;
  aDel.Enabled := not DM.cdsAPNGen.IsEmpty;
  RxDBGrid1.ReadOnly := DM.cdsAPNGenAPrc.IsNull  and not DM.cdsAPNGen.IsEmpty;
end;

procedure TAPNOper.DoCancelMsg(var Msg: TMessage);
begin
  FNoRefr := false;

end;

procedure TAPNOper.aDelExecute(Sender: TObject);
var OldRecNo, i : integer;
begin
  if MessageBox(Handle, 'Удалить операцию?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idNo then
    Exit;
  with DM.cdsAPNGen do
  begin
    Delete;
  end;
end;

procedure TAPNOper.aSetExecute(Sender: TObject);
var FrozenColCnt : integer;
    B, FShowBudjet : boolean;
begin
  if ShowArcProp(RxDBGrid1, FrozenColCnt, b, '', false) then
  begin
    RxDBGrid1.FrozenCols := FrozenColCnt;
    SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\q' + Self.ClassName + VarToStr(Fid_business));
  end;
end;

procedure TAPNOper.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if DM.cdsAPNGen.State = dsEdit then
      DM.cdsAPNGen.Post
  end;
end;


end.


