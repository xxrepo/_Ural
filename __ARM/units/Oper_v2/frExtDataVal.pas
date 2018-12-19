unit frExtDataVal;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, Grids, DBGrids, RXDBCtrl, Menus, ComCtrls, ToolWin,Clipbrd,
  ActnList, ImgList, RXCtrls;

type
  TfExtDataVal = class(TFrame)
    dsExtDataDict: TDataSource;
    cdsExtData: TClientDataSet;
    ImageList: TImageList;
    ActionList1: TActionList;
    aEdit: TAction;
    ToolBar: TToolBar;
    ToolButton2: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RxDBGrid1: TRxDBGrid;
    cdsExtDataid_Oper_ExtData: TIntegerField;
    cdsExtDataid_Oper: TIntegerField;
    cdsExtDataType: TIntegerField;
    cdsExtDataNumPrm: TIntegerField;
    cdsExtDataParName: TStringField;
    cdsExtDataVisible: TBooleanField;
    cdsExtDataDigVal: TFloatField;
    cdsExtDataStrVal: TStringField;
    cdsExtDataDateVal: TDateTimeField;
    Action1: TAction;
    Action2: TAction;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    N2: TMenuItem;
    aPost: TAction;
    ToolButton4: TToolButton;
    RxSpeedButton1: TRxSpeedButton;
    procedure aEditExecute(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure aPostExecute(Sender: TObject);
    procedure dsExtDataDictDataChange(Sender: TObject; Field: TField);
  private
    Fid_Oper : Variant;
    Fid_business : Variant;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure Initialize(id_Oper, id_business : Variant);
    procedure GetExtDate(var Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8,
    Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, Str1, Str2, Str3, Str4,
    Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13, Str14, Str15,
    Date1, Date2, Date3, Date4, Date5, Date6, Date7, Date8, Date9, Date10,
    Date11, Date12, Date13, Date14, Date15: OleVariant);
  end;

implementation

uses uDM, foMyFunc, uInputBoxDigit, uInputBoxStr, uInputBoxDate;

{$R *.DFM}

procedure TfExtDataVal.aEditExecute(Sender: TObject);
var DigVal, StrVal, DateVal : Variant;
    Rez : boolean;
    ACaption, APrompt: string;
begin
  if not aEdit.Visible then
    Exit;
  DigVal := Null;
  StrVal := Null;
  DateVal := Null;
  Rez := false;
  ACaption := 'Значение параметра ' + cdsExtDataParName.AsString;
  APrompt := 'Значение';
  case cdsExtDataType.AsInteger of
    1 :
    begin
      DigVal := cdsExtDataDigVal.Value;
      Rez := InputBoxDigit(Handle, ACaption, APrompt, DigVal);
    end;
    2 :
    begin
      StrVal := cdsExtDataStrVal.Value;
      Rez := InputBoxStr(Handle, ACaption, APrompt, StrVal, 100);
    end;
    3 :
    begin
      DateVal := cdsExtDataDateVal.Value;
      Rez := InputBoxDate(Handle, ACaption, APrompt, DateVal);
    end;
  end;
  if Rez then
  begin
    with cdsExtData do
    begin
      Edit;
      FieldByName('DigVal').Value := DigVal;
      FieldByName('StrVal').Value := StrVal;
      FieldByName('DateVal').Value := DateVal;
      Post;
    end;
  end;
end;

procedure TfExtDataVal.Initialize(id_Oper, id_business: Variant);
begin
  if (Fid_business = id_business) and (id_business <> Null) then Exit;
  Fid_Oper := id_Oper;
  Fid_business := id_business;
  with cdsExtData do
  begin
    Close;
    Params.ParamByName('@id_Oper').Value := Fid_Oper;
    if id_Oper = Null then
      Params.ParamByName('@id_business').Value := Fid_business
    else
      Params.ParamByName('@id_business').Value := Null;
    Open;
  end;
end;

procedure TfExtDataVal.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var S : String;
   R : TRect;
begin
  if not cdsExtData.IsEmpty then
  begin
    if Column.Field = cdsExtDataDigVal then
    begin
      case cdsExtDataType.AsInteger of
        1 : S := cdsExtDataDigVal.DisplayText;
        2 : S := cdsExtDataStrVal.DisplayText;
        3 : S := cdsExtDataDateVal.DisplayText;
      end;
      R := Rect;
      DrawText(TDBGrid(Sender).Canvas.Handle, PChar(S), -1, R, DT_RIGHT);
    end
    else
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfExtDataVal.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfExtDataVal.Action1Execute(Sender: TObject);
begin
  with cdsExtData do
  begin
    Edit;
    FieldByName('DigVal').Value := Null;
    FieldByName('StrVal').Value := Null;
    FieldByName('DateVal').Value := Null;
    Post;
  end;
end;

constructor TfExtDataVal.Create(AOwner: TComponent);
var TmpOwner: TCustomForm;
begin
  inherited;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
  Fid_business := Null;
  Fid_Oper := Null;
end;

destructor TfExtDataVal.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
  inherited;

end;

procedure TfExtDataVal.GetExtDate(var Dig1, Dig2, Dig3, Dig4, Dig5, Dig6,
  Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, Str1, Str2,
  Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13,
  Str14, Str15, Date1, Date2, Date3, Date4, Date5, Date6, Date7, Date8,
  Date9, Date10, Date11, Date12, Date13, Date14, Date15: OleVariant);
begin
  with cdsExtData do
  begin
    if not Active then Exit;
    DisableControls;
    try
      First;
      while not Eof do
      begin
        case cdsExtDataType.AsInteger of
          1 : // Dig
          begin
            case cdsExtDataNumPrm.AsInteger of
              1 : Dig1 := cdsExtDataDigVal.AsVariant;
              2 : Dig2 := cdsExtDataDigVal.AsVariant;
              3 : Dig3 := cdsExtDataDigVal.AsVariant;
              4 : Dig4 := cdsExtDataDigVal.AsVariant;
              5 : Dig5 := cdsExtDataDigVal.AsVariant;
              6 : Dig6 := cdsExtDataDigVal.AsVariant;
              7 : Dig7 := cdsExtDataDigVal.AsVariant;
              8 : Dig8 := cdsExtDataDigVal.AsVariant;
              9 : Dig9 := cdsExtDataDigVal.AsVariant;
              10 : Dig10 := cdsExtDataDigVal.AsVariant;
              11 : Dig11 := cdsExtDataDigVal.AsVariant;
              12 : Dig12 := cdsExtDataDigVal.AsVariant;
              13 : Dig13 := cdsExtDataDigVal.AsVariant;
              14 : Dig14 := cdsExtDataDigVal.AsVariant;
              15 : Dig15 := cdsExtDataDigVal.AsVariant;
            end;
          end;
          2 : // Str
          begin
            case cdsExtDataNumPrm.AsInteger of
              1 : Str1 := cdsExtDataStrVal.AsVariant;
              2 : Str2 := cdsExtDataStrVal.AsVariant;
              3 : Str3 := cdsExtDataStrVal.AsVariant;
              4 : Str4 := cdsExtDataStrVal.AsVariant;
              5 : Str5 := cdsExtDataStrVal.AsVariant;
              6 : Str6 := cdsExtDataStrVal.AsVariant;
              7 : Str7 := cdsExtDataStrVal.AsVariant;
              8 : Str8 := cdsExtDataStrVal.AsVariant;
              9 : Str9 := cdsExtDataStrVal.AsVariant;
              10 : Str10 := cdsExtDataStrVal.AsVariant;
              11 : Str11 := cdsExtDataStrVal.AsVariant;
              12 : Str12 := cdsExtDataStrVal.AsVariant;
              13 : Str13 := cdsExtDataStrVal.AsVariant;
              14 : Str14 := cdsExtDataStrVal.AsVariant;
              15 : Str15 := cdsExtDataStrVal.AsVariant;
            end;
          end;
          3 : //Date
          begin
            case cdsExtDataNumPrm.AsInteger of
              1 : Date1 := cdsExtDataDateVal.AsVariant;
              2 : Date2 := cdsExtDataDateVal.AsVariant;
              3 : Date3 := cdsExtDataDateVal.AsVariant;
              4 : Date4 := cdsExtDataDateVal.AsVariant;
              5 : Date5 := cdsExtDataDateVal.AsVariant;
              6 : Date6 := cdsExtDataDateVal.AsVariant;
              7 : Date7 := cdsExtDataDateVal.AsVariant;
              8 : Date8 := cdsExtDataDateVal.AsVariant;
              9 : Date9 := cdsExtDataDateVal.AsVariant;
              10 : Date10 := cdsExtDataDateVal.AsVariant;
              11 : Date11 := cdsExtDataDateVal.AsVariant;
              12 : Date12 := cdsExtDataDateVal.AsVariant;
              13 : Date13 := cdsExtDataDateVal.AsVariant;
              14 : Date14 := cdsExtDataDateVal.AsVariant;
              15 : Date15 := cdsExtDataDateVal.AsVariant;
            end;
          end;
        end;

        Next;
      end;
      First;
    finally
      EnableControls;
    end;
  end;
end;

procedure TfExtDataVal.aPostExecute(Sender: TObject);
var V : Variant;
begin
  V := GetFloatFromClipBoadr;
  with cdsExtData do
  begin
    Edit;
    case cdsExtDataType.AsInteger of
      1 :
      begin
        if V <> 0 then
          cdsExtDataDigVal.Value := V;
      end;
      2 :
      begin
        cdsExtDataStrVal.Value := Clipboard.AsText;
      end;
    end;
    Post;
  end;

end;

procedure TfExtDataVal.dsExtDataDictDataChange(Sender: TObject;
  Field: TField);
var V : Variant;
begin
  V := GetFloatFromClipBoadr;
  aEdit.Enabled := not cdsExtData.IsEmpty;
  aPost.Enabled := not cdsExtData.IsEmpty;// and (V <> 0) or (cdsExtDataType.AsInteger <> 1);

end;

end.
