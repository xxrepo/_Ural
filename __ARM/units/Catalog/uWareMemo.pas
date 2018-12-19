unit uWareMemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TWareMemo = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    Memo1: TMemo;
    Panel1: TPanel;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    edMes: TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    Fid_Bsn, FID, Fid_Ctg, Fid_Measure : integer;
  public
    function SaveProp : boolean;
    procedure Initialize(id_Bsn, id_Ctg : integer);
  end;

var
  WareMemo: TWareMemo;
function EditWareMemo(id_Bsn, id_Ctg : integer; var AID : integer): boolean;

implementation

uses uMainForm, uDM, foMyFunc, uFormApi_Ware, uPrgForm;
//
{$R *.DFM}

function EditWareMemo(id_Bsn, id_Ctg : integer; var AID : integer): boolean;
var F : TWareMemo;
    AHandle : HWnd;
begin
  if Screen.ActiveForm <> nil then
    AHandle := Screen.ActiveForm.Handle
  else
    AHandle := 0;
  Result := false;
  F := TWareMemo.Create(MainForm);
  try
    F.Initialize(id_Bsn, id_Ctg);
    if AHandle > 0 then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, AHandle);

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      AID := F.FID;
    end;
  finally
    F.Free;
  end;
end;


procedure TWareMemo.btnOkClick(Sender: TObject);
var S : OleVariant;
begin
  with edMes do
    if Enabled and (trim(Text) = '') then
    begin
      MessageBox(Handle, 'Не выбрана единица измерения', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      ModalResult := mrNone;
      Exit;
    end;

    if Memo1.Lines.Count = 0 then
    begin
      MessageBox(Handle, 'Не введены названия товаров', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Memo1.Handle);
      ModalResult := mrNone;
      Exit;
    end;

  if DM.rsCA.AppServer.CtgByID(0, Fid_Ctg, S) then
  begin
    if MessageBox(Handle, PChar('Добавить' + IntToStr(Memo1.Lines.Count) + ' товаров в категорию ' + String(S) + '?' ), 'Подтвердите оптовое создание товаров', MB_YESNO + MB_ICONQUESTION) = idYes then
      ModalResult := mrOk
    else
      ModalResult := mrNone;
  end;
end;

procedure TWareMemo.Initialize(id_Bsn, id_Ctg: integer);
begin
  Fid_Bsn := id_Bsn;
  Fid_Ctg := id_Ctg;
end;

function TWareMemo.SaveProp: boolean;
var i, X, N : integer;
    S : String;
    OldCursor : TCursor;
    AType: Integer;
    AName, ShortName, BarCode, id_Ctg, id_Measure,
    GTD, Country, DocNomCode, DocPriceCode, DocArt, DocNumber: OleVariant;
    Disabled: WordBool;
    Rez : integer;
begin
  FID := -1;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try
    AType := 0;
    id_Ctg := Fid_Ctg;
    if id_Ctg = -13 then
      id_Ctg := Null;
//    AName := cdsGoodsProp.FieldByName('Name').AsString;
    ShortName := null;
    BarCode := Null;
    Disabled := false;
    id_Measure := Fid_Measure;

    GTD := null;
    Country := null;
    DocNomCode := null;
    DocPriceCode := null;
    DocArt := null;
    DocNumber := null;
    Memo1.Lines.Text := trim(Memo1.Lines.Text);
    for i := 0 to Memo1.Lines.Count - 1 do
    begin
      ShowProgressForm(handle, i + 1, Memo1.Lines.Count, 'Создание товаров...');
      S := trim(Memo1.Lines[i]);
      if S <> '' then
      begin
        AName := S;
        N := DM.rsCA.AppServer.UN_Check_Ware(0, id_Ctg, AName, null);
        if N = 1 then
          X := DM.rsCA.AppServer.WareAdd(AType, id_Ctg, AName, ShortName, BarCode, Disabled, id_Measure,
                     GTD, Country, DocNomCode, DocPriceCode, DocArt, DocNumber);

        if X = -1 then
          raise Exception.Create('Ошибка при сохранении свойств');
        if FID = -1 then
          FID := X;
       end;
    end;

    CommitTrans(DM.rsCA);
    Result := true;
  except
    RollbackTrans(DM.rsCA);
  end;
  Screen.Cursor := OldCursor;
  CloseProgressForm;    
end;

procedure TWareMemo.SpeedButton1Click(Sender: TObject);
var
 AID:Variant;
 AName:string;
begin
  AID := Fid_Measure;
  AName := edMes.Text;
  if SelectMeasure(Fid_Bsn, AID, AName) then
  begin
      edMes.Text := AName;
      Fid_Measure := AID;
  end;
end;

end.
