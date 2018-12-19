
unit uAPOperList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Clipbrd,
  frBsnSelector, StdCtrls, Mask, ToolEdit, ExtCtrls, Db, DBClient, RxMemDS,
  Provider, Grids, DBGridEh, foMyFunc, RxLookup, ActnList, ImgList, ComCtrls, contnrs,
  Menus, Buttons, ToolWin, GridsEh;

type
  TParObj = class
    id_ObjItem, ExtID : integer;
    ParField, ParName, OpName, APName : String;
  end;

  TOperObj = class
    id_ObjItem, id_Oper : integer;
  end;


  TAPOperList = class(TForm)
    RxDBGrid1: TDBGridEh;
    cdsExtDataDict: TClientDataSet;
    cdsExtDataDictid_Oper_ExtDataNames: TIntegerField;
    cdsExtDataDictid_business: TIntegerField;
    cdsExtDataDictType: TIntegerField;
    cdsExtDataDictNumPrm: TIntegerField;
    cdsExtDataDictParName: TStringField;
    cdsExtDataDictVisible: TBooleanField;
    ActionList1: TActionList;
    aProperty: TAction;
    ilImage: TImageList;
    StatusBar1: TStatusBar;
    aCreate: TAction;
    dsDoFilter: TDataSource;
    cdsDoFilter: TClientDataSet;
    cdsDoFilterid_ObjItem: TIntegerField;
    cdsDoFilterExtId: TIntegerField;
    cdsDoFilterOperVid: TIntegerField;
    cdsDoFilterid_UserCreator: TIntegerField;
    cdsDoFilterid_UserChecker: TIntegerField;
    cdsDoFilterid_business: TIntegerField;
    cdsDoFilterCorrect: TBooleanField;
    cdsDoFilterOperTypeIn: TBooleanField;
    cdsDoFilterid_Acc: TIntegerField;
    cdsDoFilterid_Warehouse: TIntegerField;
    cdsDoFilterid_Manufact: TIntegerField;
    cdsDoFilterid_Repr: TIntegerField;
    cdsDoFilterid_Acc_Ext: TIntegerField;
    cdsDoFilterid_Warehouse_Ext: TIntegerField;
    cdsDoFilterid_Manufact_Ext: TIntegerField;
    cdsDoFilterKoeff: TIntegerField;
    cdsDoFilterid_FormalDistrib: TIntegerField;
    cdsDoFilterid_FuncDistrib: TIntegerField;
    cdsDoFilterImp_PayBasic: TStringField;
    cdsDoFilterAccInv_PayAssignment: TStringField;
    cdsDoFilterContract: TStringField;
    cdsDoFilterOpComment: TStringField;
    cdsDoFilterDig1: TFloatField;
    cdsDoFilterDig2: TFloatField;
    cdsDoFilterDig3: TFloatField;
    cdsDoFilterDig4: TFloatField;
    cdsDoFilterDig5: TFloatField;
    cdsDoFilterDig6: TFloatField;
    cdsDoFilterDig7: TFloatField;
    cdsDoFilterDig8: TFloatField;
    cdsDoFilterDig9: TFloatField;
    cdsDoFilterDig10: TFloatField;
    cdsDoFilterDig11: TFloatField;
    cdsDoFilterDig12: TFloatField;
    cdsDoFilterDig13: TFloatField;
    cdsDoFilterDig14: TFloatField;
    cdsDoFilterDig15: TFloatField;
    cdsDoFilterStr1: TStringField;
    cdsDoFilterStr2: TStringField;
    cdsDoFilterStr3: TStringField;
    cdsDoFilterStr4: TStringField;
    cdsDoFilterStr5: TStringField;
    cdsDoFilterStr6: TStringField;
    cdsDoFilterStr7: TStringField;
    cdsDoFilterStr8: TStringField;
    cdsDoFilterStr9: TStringField;
    cdsDoFilterStr10: TStringField;
    cdsDoFilterStr11: TStringField;
    cdsDoFilterStr12: TStringField;
    cdsDoFilterStr13: TStringField;
    cdsDoFilterStr14: TStringField;
    cdsDoFilterStr15: TStringField;
    cdsDoFilterId_CurrencyOper: TIntegerField;
    cdsDoFilterId_CurrencySys: TIntegerField;
    cdsDoFilterOperVidName: TStringField;
    cdsDoFilterContrAgentName: TStringField;
    cdsDoFilterFormalDistribName: TStringField;
    cdsDoFilterFuncDistribName: TStringField;
    cdsDoFilterKoeffName: TStringField;
    cdsDoFilterSrcName: TStringField;
    cdsDoFilterReprName: TStringField;
    cdsDoFilterTypeName: TStringField;
    cdsDoFilterBusinessid_Currency: TIntegerField;
    cdsDoFilterBusinessName: TStringField;
    cdsDoFilterBusinessNum: TStringField;
    cdsDoFilterOperCrnName: TStringField;
    cdsDoFilterCurrencyBsnName: TStringField;
    cdsDoFilterCurrencySysShortName: TStringField;
    cdsDoFilterCurrencyOperShortName: TStringField;
    cdsDoFilterid_AP_Obj: TIntegerField;
    cdsDoFilterWareName: TStringField;
    cdsDoFilterMeasureName: TStringField;
    cdsDoFilterParName: TStringField;
    cdsDoFilterAPName: TStringField;
    cdsDoFilterParField: TStringField;
    cdsDoFilterOpName: TStringField;
    cdsDoFilterid_Goods: TIntegerField;
    cdsDoFilterid_Measure: TIntegerField;
    cdsDoFilterVatIn: TBooleanField;
    aDel: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    cdsDoFilterPriceOper: TFloatField;
    cdsDoFilterSummOper: TFloatField;
    cdsDoFilterSummSys: TFloatField;
    cdsDoFilterPriceOper_F: TFloatField;
    cdsDoFilterSummOper_F: TFloatField;
    cdsDoFilterSummSys_F: TFloatField;
    aSet: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    aUp: TAction;
    aDown: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    SpeedButton3: TSpeedButton;
    cdsDoFilterForOrd: TIntegerField;
    cdsDoFilterChOnRate: TBooleanField;
    cdsDoFilterAmountOper: TBCDField;
    N4: TMenuItem;
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
    procedure aUpExecute(Sender: TObject);
    procedure aDownExecute(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    FNoRefr : boolean;
    FFuckedCol : integer;
    AFSL : TStringList;
    Fxxx_Handle : HWnd;
    FObjList : TObjectList;
    Fid_business : integer;
    FLevel, xxxid_Oper : integer;
    procedure DoCreateOper;
    procedure Setid_business(const Value: Variant);
    function DoEditOper(AReadOnly : boolean; id_OperParent: Variant; ACorrect, ACopy : boolean; ADelMode : boolean;
                        var ID : integer; Ais_Mirr : boolean;
                        ARezMode : boolean;
                        AViza : boolean = false;
                        AOperVid : integer = -1) : boolean;
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;

    procedure Initialize(const AHandle : HWnd; id_Oper : Variant; ALevel : integer = 0);
    procedure DoCancelMsg(var Msg: TMessage); message xxx_Cancel;
  end;

var
  APOperList: TAPOperList;

procedure ShowAPOperList(const AHandle : HWnd; id_Oper : Variant; ALevel : integer = 0);


implementation

uses uDM, uPrgForm, foMyFuncEh, uUnivOper_v2, uFormApi_Oper, uArcProp;

{$R *.DFM}

procedure ShowAPOperList(const AHandle : HWnd; id_Oper : Variant; ALevel : integer);
var F : TAPOperList;
begin
  if ALevel > 0 then
  begin
  //  MessageBox(AHandle, 'Превышен уровень вложенности', 'Генерация остановлена', MB_ICONERROR + mb_OK);
    Abort;
  end;  
  F := TAPOperList.Create(nil);
  try
    ShowProgressForm(AHandle, -1, -1, 'Идет генерация операций...');
    F.Initialize(AHandle, id_Oper, ALevel);
    CloseProgressForm;
    if (ALevel > 0) and F.cdsDoFilter.IsEmpty then
      F.Release
    else
    begin
      if (ALevel > 0) and not F.cdsDoFilter.IsEmpty then
        F.DoCreateOper
      else
      begin
        F.Show;
        F.Repaint;
      end;
    end;
  except
    on E : Exception do
    begin
      CloseProgressForm;
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

{ TForm1 }

constructor TAPOperList.Create(AOwner: TCOmponent);
begin
  inherited;
//  LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\q' + Self.ClassName {+ VarToStr(Fid_business)});
  FObjList := TObjectList.Create(true);
  AFSL := TStringList.Create;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TAPOperList.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

destructor TAPOperList.Destroy;
begin
  AFSL.Free;
  FObjList.Free;
  SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\q' + Self.ClassName + VarToStr(Fid_business));
  inherited;

end;

procedure TAPOperList.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TAPOperList.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TAPOperList.Initialize(const AHandle : HWnd; id_Oper: Variant; ALevel : integer);
var Obj : TParObj;
    oldCursor : TCursor;
    i : integer;
begin
  xxxid_Oper := id_Oper;
  
  FLevel := ALevel;
  FObjList.Clear;
  Fxxx_Handle := AHandle;
  with cdsDoFilter do
  begin
    Close;
    Params.ParamByName('@id_Oper').Value := id_Oper;
    DisableControls;
    oldCursor := Screen.Cursor;
    Screen.Cursor := crSQLWait;
    try
      Open;
      First;
      i := 1;
      while not Eof do
      begin
        if not cdsDoFilterExtId.IsNull then
        begin
          Obj := TParObj.Create;
          FObjList.Add(Obj);
          Obj.id_ObjItem := cdsDoFilterid_ObjItem.AsInteger;
          Obj.ExtID := cdsDoFilterExtID.AsInteger;
          Obj.ParField := cdsDoFilterParField.AsString;
          Obj.ParName := cdsDoFilterParName.AsString;
          Obj.OpName := cdsDoFilterOpName.AsString;
          Obj.APName := cdsDoFilterAPName.AsString;
          Delete;
        end
        else
        begin
          Edit;
          cdsDoFilterForOrd.AsInteger := i;
          inc(i);
          Post;
          Next;
        end;
      end;
      Setid_business(cdsDoFilterid_business.AsInteger);
      IndexDefs.Clear;
      IndexDefs.Add('ixForOrd', 'ForOrd', [ixCaseInsensitive]);
      IndexName := 'ixForOrd';
      First;
      Screen.Cursor := oldCursor;
      EnableControls;
    except
      on E : Exception do
      begin
        Screen.Cursor := oldCursor;
        EnableControls;
        raise Exception.Create('Произошла ошибка при формировании списка операций.' + #13 + #10 + E.Message);
      end;
    end;
  end;
end;

procedure TAPOperList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
//  if not cdsLog.IsEmpty then
//    SendMessage(Fxxx_Handle, xxx_RefrMsg, cdsLog.FieldByName('ID_Oper').AsInteger, 0);
end;

procedure TAPOperList.Setid_business(const Value: Variant);
var i : integer;
    AField: TField;
    S : String;
   // ADObj : TDObj;
begin
  Fid_business := Value;
  AFSL.Clear;
  with cdsExtDataDict do
  begin
    Close;
    Params.ParamByName('@id_business').Value := Fid_business;
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
          for i := 0 to RxDBGrid1.Columns.Count - 1 do
          begin
            if UpperCase(RxDBGrid1.Columns[i].FieldName) = S then
            begin
              RxDBGrid1.Columns[i].Visible := FieldByName('Visible').AsBoolean;
              if FieldByName('Visible').AsBoolean then
                RxDBGrid1.Columns[i].Title.Caption := 'Бюджет|' + FieldByName('ParName').AsString;
              Break;
            end;
        end;
        Next;
      end;
    finally
      Close;
      LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\q' + Self.ClassName + VarToStr(Fid_business));
    end;
  end;
end;

procedure TAPOperList.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TAPOperList.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := TDBGridEh(Sender).ScreenToClient(P);
  if P.y <= THackGridEh(Sender).RowHeights[0] then
    Exit;
  aProperty.Execute;
end;

procedure TAPOperList.aPropertyExecute(Sender: TObject);
begin
//*
end;

procedure TAPOperList.RxDBGrid1CellClick(Column: TColumnEh);
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

procedure TAPOperList.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
    S : String;
begin
  if (Sender as TDBGridEh).DataSource.DataSet.IsEmpty then
    Exit;

  if Column.Field = RxDBGrid1.DataSource.DataSet.FieldByName('OperVidName') then
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
  else
  begin
    TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

    // Красим незаполненные ячейки
    if ((Column.Field = RxDBGrid1.DataSource.DataSet.FieldByName('ContrAgentName')) and
       (RxDBGrid1.DataSource.DataSet.FieldByName('ContrAgentName').IsNull) and
       (not RxDBGrid1.DataSource.DataSet.FieldByName('id_Repr').IsNull)
       or
       ((Column.Field = RxDBGrid1.DataSource.DataSet.FieldByName('BusinessName')) and
       (RxDBGrid1.DataSource.DataSet.FieldByName('BusinessName').IsNull))
       or
       ((Column.Field = RxDBGrid1.DataSource.DataSet.FieldByName('KoeffName')) and
       (RxDBGrid1.DataSource.DataSet.FieldByName('KoeffName').IsNull))
       or
       ((Column.Field = RxDBGrid1.DataSource.DataSet.FieldByName('FormalDistribName')) and
       (RxDBGrid1.DataSource.DataSet.FieldByName('FormalDistribName').IsNull) and (RxDBGrid1.DataSource.DataSet.FieldByName('Koeff').AsInteger <> 0))
       or
       ((Column.Field = RxDBGrid1.DataSource.DataSet.FieldByName('FuncDistribName')) and
       (RxDBGrid1.DataSource.DataSet.FieldByName('FuncDistribName').IsNull) and (RxDBGrid1.DataSource.DataSet.FieldByName('Koeff').AsInteger <> 0))
       or
       ((Column.Field = RxDBGrid1.DataSource.DataSet.FieldByName('ReprName')) and
    //   (RxDBGrid1.DataSource.DataSet.FieldByName('id_Repr').IsNull) and
       (RxDBGrid1.DataSource.DataSet.FieldByName('ReprName').AsString = ''))) then
    begin
      TDBGridEh(Sender).Canvas.Brush.Color := clWindow;

      TDBGridEh(Sender).Canvas.Font.Color := clRed;
      TDBGridEh(Sender).Canvas.Font.Style := TDBGridEh(Sender).Canvas.Font.Style + [fsBold];

      TDBGridEh(Sender).Canvas.Brush.Style := bsClear;
      TDBGridEh(Sender).Canvas.Pen.Color := clRed;
      TDBGridEh(Sender).Canvas.Rectangle(Rect.Left + 0, Rect.Top + 0, Rect.Right - 0, Rect.Bottom - 0);
    end;
    if (Column.Field is TNumericField) then
    begin
      R := Rect;
      TDBGridEh(Sender).Canvas.FillRect(R);
      if (not Column.Field.IsNull) and (Column.Field.DisplayText <> '') then
      begin
        if Column.Field = cdsDoFilterForOrd then
          S := cdsDoFilterForOrd.AsString
        else
          S := Trim(FormatFloat('### ### ### ### ##0.00', ABS(Column.Field.AsFloat)));
        if Column.Field.AsFloat < 0 then
          S := '-' + S;
        R.Top := R.Top + 2;
        DrawText(TDBGridEh(Sender).Canvas.Handle, PChar(S), -1, R, DT_RIGHT);
      end;
    end;
  end;
end;

procedure TAPOperList.RxDBGrid1GetBtnParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarkerEh; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarkerEh(Column.Field);
end;

procedure TAPOperList.RxDBGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Row: Longint;
begin
  THackGridEh(RxDBGrid1).MouseToCell(X, Y, FFuckedCol, Row);
end;

procedure TAPOperList.RxDBGrid1SelectionChange(Sender: TObject);
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

procedure TAPOperList.RxDBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
//  ReOrderCDSEh(Column, 'id_Oper');
end;

procedure TAPOperList.aCreateExecute(Sender: TObject);
begin
  DoCreateOper;
//    PostMessage(Fxxx_Handle, xxx_RefrOptim, xxxid_Oper, 0);
end;

procedure TAPOperList.DoCreateOper;
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

  function GetIDOper(id_ObjItem: integer) : integer;
  var j : integer;
  begin
    Result := -1;
    for j := 0 to AOperObjList.Count - 1 do
    begin
      if TOperObj(AOperObjList[j]).id_ObjItem = id_ObjItem then
      begin
        Result := TOperObj(AOperObjList[j]).id_Oper;
        Break;
      end;
    end;
  end;
  procedure AddIDOper(id_ObjItem, id_Oper: integer);
  var AOperObj : TOperObj;
  begin
    AOperObj := TOperObj.Create;
    AOperObjList.Add(AOperObj);
    AOperObj.id_ObjItem := id_ObjItem;
    AOperObj.id_Oper := id_Oper;
  end;
begin
  MayClose := false;
  FNoRefr := true;
  with cdsDoFilter do
  begin
    DisableControls;
      IndexDefs.Clear;
      IndexDefs.Add('ixForOrd', 'ForOrd', [ixCaseInsensitive]);
      IndexName := 'ixForOrd';
    OldRecNo := RecNo;
    AList := TIDList.Create;
    AListOperVid := TIDList.Create;
    AOperObjList := TObjectList.Create(true);
    try
      First;
      AID_Oper := -1;
      while not Eof do
      begin
        AID_Oper := GetIDOper(cdsDoFilterid_ObjItem.AsInteger);
        if AID_Oper = -1 then
        begin
          OperVid := cdsDoFilterOperVid.AsInteger;
          id_business := cdsDoFilterid_business.AsInteger;
          Correct := cdsDoFilterCorrect.AsBoolean;
          OperTypeIn := cdsDoFilterOperTypeIn.AsBoolean;
          Id_CurrencyOper := cdsDoFilterId_CurrencyOper.AsVariant;
          if OperVid <> 1 then
            PriceFinOper := cdsDoFilterSummOper_F.AsVariant
          else
            PriceFinOper := Null;
          RateOper := 0;
          Id_CurrencySys := cdsDoFilterId_CurrencySys.AsVariant;
          if OperVid <> 1 then
            SummSysFin := cdsDoFilterSummSys_F.AsVariant
          else
            SummSysFin := Null;
          RateSys := Null;
          id_Repr := cdsDoFilterid_Repr.AsVariant;
          id_Acc := cdsDoFilterid_Acc.AsVariant;
          id_Acc_Ext := cdsDoFilterid_Acc_Ext.AsVariant;
          id_Warehouse := cdsDoFilterid_Warehouse.AsVariant;
          id_Warehouse_Ext := cdsDoFilterid_Warehouse_Ext.AsVariant;
          id_Manufact := cdsDoFilterid_Manufact.AsVariant;
          id_Manufact_Ext := cdsDoFilterid_Manufact_Ext.AsVariant;

          id_FormalDistrib := cdsDoFilterid_FormalDistrib.AsVariant;
          id_FuncDistrib := cdsDoFilterid_FuncDistrib.AsVariant;
          Koeff := cdsDoFilterKoeff.AsVariant;

          Id_CurrencyInv := Null;
          id_OperParent := xxxid_Oper;
          OperState := 0;
          id_UserCreator := DM.IDUser;
          id_DocType := Null;
          Imp_PayBasic := cdsDoFilterImp_PayBasic.AsVariant;
          AccInv_PayAssignment := cdsDoFilterAccInv_PayAssignment.AsVariant;
          Contract := cdsDoFilterContract.AsVariant;
          OpComment := {'авт. ген. ' + } cdsDoFilterOpComment.AsVariant;

          Dig1 := cdsDoFilterDig1.AsVariant;
          Dig2 := cdsDoFilterDig2.AsVariant;
          Dig3 := cdsDoFilterDig3.AsVariant;
          Dig4 := cdsDoFilterDig4.AsVariant;
          Dig5 := cdsDoFilterDig5.AsVariant;
          Dig6 := cdsDoFilterDig6.AsVariant;
          Dig7 := cdsDoFilterDig7.AsVariant;
          Dig8 := cdsDoFilterDig8.AsVariant;
          Dig9 := cdsDoFilterDig9.AsVariant;
          Dig10 := cdsDoFilterDig10.AsVariant;
          Dig11 := cdsDoFilterDig11.AsVariant;
          Dig12 := cdsDoFilterDig12.AsVariant;
          Dig13 := cdsDoFilterDig13.AsVariant;
          Dig14 := cdsDoFilterDig14.AsVariant;
          Dig15 := cdsDoFilterDig15.AsVariant;

          Str1 := cdsDoFilterStr1.AsVariant;
          Str2 := cdsDoFilterStr2.AsVariant;
          Str3 := cdsDoFilterStr3.AsVariant;
          Str4 := cdsDoFilterStr4.AsVariant;
          Str5 := cdsDoFilterStr5.AsVariant;
          Str6 := cdsDoFilterStr6.AsVariant;
          Str7 := cdsDoFilterStr7.AsVariant;
          Str8 := cdsDoFilterStr8.AsVariant;
          Str9 := cdsDoFilterStr9.AsVariant;
          Str10 := cdsDoFilterStr10.AsVariant;
          Str11 := cdsDoFilterStr11.AsVariant;
          Str12 := cdsDoFilterStr12.AsVariant;
          Str13 := cdsDoFilterStr13.AsVariant;
          Str14 := cdsDoFilterStr14.AsVariant;
          Str15 := cdsDoFilterStr15.AsVariant;

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

    {      Date1 := cdsDoFilterDate1.AsVariant;
          Date2 := cdsDoFilterDate2.AsVariant;
          Date3 := cdsDoFilterDate3.AsVariant;
          Date4 := cdsDoFilterDate4.AsVariant;
          Date5 := cdsDoFilterDate5.AsVariant;
          Date6 := cdsDoFilterDate6.AsVariant;
          Date7 := cdsDoFilterDate7.AsVariant;
          Date8 := cdsDoFilterDate8.AsVariant;
          Date9 := cdsDoFilterDate9.AsVariant;
          Date10 := cdsDoFilterDate10.AsVariant;
          Date11 := cdsDoFilterDate11.AsVariant;
          Date12 := cdsDoFilterDate12.AsVariant;
          Date13 := cdsDoFilterDate13.AsVariant;
          Date14 := cdsDoFilterDate14.AsVariant;
          Date15 := cdsDoFilterDate15.AsVariant;  }

          VatIn := cdsDoFilterVatIn.AsBoolean;
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

          AList.Add(AID_Oper);
          AListOperVid.Add(OperVid);
          AddIDOper(cdsDoFilterid_ObjItem.AsInteger, AID_Oper);
        end;
        if (AID_Oper > 0) and (OperVid = 1) then
        begin        
          id_Goods := cdsDoFilterid_Goods.Value;

          id_Measure := cdsDoFilterid_Measure.Value;
          Amount := cdsDoFilterAmountOper.Value;

          PriceOper := Null;
          
          if DM.rsCA.AppServer.OP_OperWareAdd_BackToCA(AID_Oper,
                               id_Goods,
                               id_Measure, Amount,
                               PriceOper,
                               Null,
                               false) = -1 then
            raise Exception.Create('Ошибка при создании операции - товары');

        end;
        Next;
      end;
      self.Hide;
      for i := 0 to AList.Count - 1 do
      begin
        if not FNoRefr then
        begin
          MayClose := true;
          Break;
        end;
        ID := AList[i];
        ShowProgressForm(Handle, i, AList.Count, 'Визирование операций');
        DoEditOper(false, Null, false, false, false, ID, false, false, true, AListOperVid[i]);
      end;
      MayClose := true;
    finally
      AList.Free;
      AListOperVid.Free;
      AOperObjList.Free;
      RecNo := OldRecNo;
      EnableControls;
      CloseProgressForm;
    //  RefresheArc(ID);
      if not FStayHere then
        PostMessage(Fxxx_Handle, xxx_RefrOptim, ID, 0);
      if MayClose then Release;
    end;
  end;
end;

procedure TAPOperList.dsDoFilterDataChange(Sender: TObject; Field: TField);
begin
  aProperty.Enabled := not cdsDoFilter.IsEmpty;
  aCreate.Enabled := not cdsDoFilter.IsEmpty;
  aDel.Enabled := not cdsDoFilter.IsEmpty;

  aUp.Enabled := cdsDoFilter.RecNo > 1;
  aDown.Enabled := cdsDoFilter.RecNo < cdsDoFilter.RecordCount;
end;

procedure TAPOperList.DoCancelMsg(var Msg: TMessage);
begin
  FNoRefr := false;

end;

function TAPOperList.DoEditOper(AReadOnly: boolean; id_OperParent: Variant;
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
  AOperParamz.ALevel := FLevel + 1;

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

procedure TAPOperList.aDelExecute(Sender: TObject);
var OldRecNo, i : integer;
begin
  if MessageBox(Handle, 'Удалить операцию?', 'Подтвердите удаление', MB_YESNO + MB_ICONQUESTION) = idNo then
    Exit;
  with cdsDoFilter do
  begin
    Delete;
    DisableControls;
    OldRecNo := RecNo;
//    Screen.Cursor := crSQLWait;
    try
      First;
      i := 1;
      while not Eof do
      begin
        Edit;
        cdsDoFilterForOrd.AsInteger := i;
        inc(i);
        Post;
        Next;
      end;
    finally
      RecNo := OldRecNo;
      EnableControls;
    end;
  end;
end;

procedure TAPOperList.aSetExecute(Sender: TObject);
var FrozenColCnt : integer;
    B, FShowBudjet : boolean;
begin
  if ShowArcProp(RxDBGrid1, FrozenColCnt, b, '', false) then
  begin
    RxDBGrid1.FrozenCols := FrozenColCnt;
    SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\q' + Self.ClassName + VarToStr(Fid_business));
  end;
end;

procedure TAPOperList.aUpExecute(Sender: TObject);
var ID, ForOrd, ForOrdNew : integer;
begin
  ID := cdsDoFilterid_ObjItem.AsInteger;
  ForOrd := cdsDoFilterForOrd.AsInteger;
  with cdsDoFilter do
  begin
    DisableControls;
    try
      Prior;
      Edit;
      ForOrdNew := cdsDoFilterForOrd.AsInteger;
      cdsDoFilterForOrd.AsInteger := ForOrd;
      Post;
      if Locate('id_ObjItem', ID, []) then
      begin
        Edit;
        cdsDoFilterForOrd.AsInteger := ForOrdNew;
        Post;
      end;
    finally
      EnableControls;
    end;
  end;
end;

procedure TAPOperList.aDownExecute(Sender: TObject);
var ID, ForOrd, ForOrdNew : integer;
begin
  ID := cdsDoFilterid_ObjItem.AsInteger;
  ForOrd := cdsDoFilterForOrd.AsInteger;
  with cdsDoFilter do
  begin
    DisableControls;
    try
      Next;
      Edit;
      ForOrdNew := cdsDoFilterForOrd.AsInteger;
      cdsDoFilterForOrd.AsInteger := ForOrd;
      Post;
      if Locate('id_ObjItem', ID, []) then
      begin
        Edit;
        cdsDoFilterForOrd.AsInteger := ForOrdNew;
        Post;
      end;
    finally
      EnableControls;
    end;
  end;
end;

procedure TAPOperList.N4Click(Sender: TObject);
begin
  Clipboard.AsText:=GridSelectionAsExcelText(RxDBGrid1)

end;

procedure TAPOperList.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
var tmpCol : TColumnEh;
    S, S2 : String;
begin
  if (Key = '.') then
  begin
    S := DecimalSeparator;
    if S = ',' then S2 := '.' else S2 := ',';
    tmpCol := TDBGridEh(Sender).Columns[TDBGridEh(Sender).col];
    if (Key = S2[1]) and ((tmpCol.Field = cdsDoFilterSummOper_F) or
     (tmpCol.Field = cdsDoFilterSummSys_F)) then
      Key := S[1];
  end;
  if (Key = #13) and (cdsDoFilter.State in [dsinsert, dsEdit]) then
    cdsDoFilter.post;

end;

end.
