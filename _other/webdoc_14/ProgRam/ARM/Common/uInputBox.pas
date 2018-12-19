unit uInputBox;
   // Форма аналогичная InputBox
   // не закрываетсяЮ пока не введешь значение
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, sLabel;

type
  TFrmInputBox = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;                        
    GroupBox1: TGroupBox;
    sWebLabel1: TsWebLabel;
    sWebLabel2: TsWebLabel;
    sWebLabel3: TsWebLabel;
    sWebLabel4: TsWebLabel;
    sWebLabel5: TsWebLabel;
    sWebLabel6: TsWebLabel;
    sWebLabel7: TsWebLabel;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    procedure btnOk2Click(Sender: TObject);
    procedure sWebLabel1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  public
  end;
                   
var
  FrmInputBox: TFrmInputBox;
function InputBoxKrm(const ACaption, APrompt, APrompt2: string; var Value, Value2: string): boolean;

implementation

uses foMyFunc, uDM;

{$R *.DFM}
function InputBoxKrm(const ACaption, APrompt, APrompt2: string; var Value, Value2: string): boolean;
var F : TFrmInputBox;
begin
  Result := false;
  F := TFrmInputBox.Create(nil);
  try
    F.Caption := ACaption;
  //  F.Label1.Caption := APrompt;
  //  F.Label2.Caption := APrompt2;

 //   F.Edit1.Left := F.Label1.Left + F.Label1.Width + 10;
  //  F.Width := F.Edit1.Left + F.Edit1.Width + 10;
    F.Edit1.Text := Value;
    F.Edit2.Text := Value2;
    F.ActiveControl := F.Edit1;
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin

      Value := F.Edit1.Text;
      Value2 := F.Edit2.Text;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TFrmInputBox.btnOk2Click(Sender: TObject);
var i, SK1, SK2 : integer;
    S : String;
begin
  ModalResult := mrNone;
  if Edit1.Text = '' then
  begin
    MessageBox(Handle, 'Не введено значение', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(Edit1.Handle);
    ModalResult := mrNone;
    Exit;
  end;
  if Edit2.Text = '' then
  begin
    MessageBox(Handle, 'Не введен формат названия файла', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(Edit1.Handle);
    ModalResult := mrNone;
    Exit;
  end;
  with Edit2 do   //  \/:*"?<>|
    if (POS('\', Text) > 0) or (POS('/', Text) > 0) or (POS(':', Text) > 0) or (POS('*', Text) > 0)
     or (POS('"', Text) > 0) or (POS('?', Text) > 0) or (POS('<', Text) > 0) or (POS('>', Text) > 0)  then
    begin
      MessageBox(Handle, 'Нельзя использовать символы \/:*"?<>| в имени файла', 'ОШИБКА', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      ModalResult := mrNone;
      Exit;
    end;
  SK1 := 0;
  SK2 := 0;
  S := Edit2.Text;
  for i := 0 to Length(S) do
  begin
    if S[i] = '[' then inc(SK1);
    if S[i] = ']' then inc(SK2);
  end;
  if SK1 <> SK2 then
  begin
    MessageBox(Handle, 'Количество открытых и закрытых скобок не совпадает!', 'ОШИБКА', MB_OK + MB_ICONERROR);
    Windows.SetFocus(Edit2.Handle);
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TFrmInputBox.sWebLabel1Click(Sender: TObject);
begin
  Edit2.SelText := '[' + (Sender as TsWebLabel).Caption + ']'
end;

procedure TFrmInputBox.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);

end;

procedure TFrmInputBox.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);

end;

end.
