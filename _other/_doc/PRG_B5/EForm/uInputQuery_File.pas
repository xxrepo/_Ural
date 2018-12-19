unit uInputQuery_File;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBCtrls,
  RxLookup, Db;

type
  TfrmInputQuery_File = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edName: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    edFile: TEdit;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
  public
  end;
                   
var
  frmInputQuery_File: TfrmInputQuery_File;
function InputQuery_File(var AName, AFile: string): boolean;

implementation

uses foMyFunc;

{$R *.DFM}
function InputQuery_File(var AName, AFile: string): boolean;
var F : TfrmInputQuery_File;
begin
  Result := false;
  F := TfrmInputQuery_File.Create(nil);
  try
    F.edName.Text := AName;
    F.edFile.Text := AFile;
    F.ActiveControl := F.edName;

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      AName := F.edName.Text;
      AFile := ExtractFileName(F.edFile.Text);
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TfrmInputQuery_File.btnOkClick(Sender: TObject);
begin
  if edName.Text = '' then
  begin
    MessageBox(Handle, 'Comment not input', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(edName.Handle);
    ModalResult := mrNone;
    Exit;
  end;
  if edFile.Text = '' then
  begin
    MessageBox(Handle, 'File not selected', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(edFile.Handle);
    ModalResult := mrNone;
    Exit;
  end;
  if not FileExists(edFile.Text) then
  begin
    MessageBox(Handle, PChar('File not found ' + edFile.Text), '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(edFile.Handle);
    ModalResult := mrNone;
    Exit;
  end;
end;

procedure TfrmInputQuery_File.Button1Click(Sender: TObject);
var  FSize : integer;
     aMaxPicSize : integer;
begin
  if OpenDialog1.Execute then
  begin
    FSize := GetFileSizeByName(OpenDialog1.FileName);
    aMaxPicSize := 100;
  {  if FSize > aMaxPicSize*1024 then
    begin
      if Application.MessageBox(PChar('Размер файла превышает ' + IntToStr(aMaxPicSize) + ' Килобайт (' + IntToStr(FSize div 1024) + ' Кб). Добавить файл?'), 'Большой файл, будет долго грузится!', MB_ICONWARNING + MB_YESNO) = idNo then
        Exit;
    end;  }

    edFile.Text := OpenDialog1.FileName;
  end;
end;

end.
