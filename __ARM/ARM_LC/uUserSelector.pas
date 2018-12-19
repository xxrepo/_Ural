unit uUserSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frUsersListLC, db;

type
  TUserSelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fUsersListLC1: TfUsersListLC;
    procedure fUsersListLC1DataSourceDataChange(Sender: TObject;
      Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserSelector: TUserSelector;

  function SelectUser(var AID:Variant; var AName:string):boolean;

  implementation

uses uMainForm;

{$R *.DFM}
function SelectUser(var AID:Variant; var AName:string):boolean;
var F : TUserSelector;
begin
  Result := false;
  F := TUserSelector.Create(MainForm);
  try
    F.fUsersListLC1.Init(Null, AID);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      AID := F.fUsersListLC1.cdsUsersid_User.AsInteger;
      AName := F.fUsersListLC1.cdsUsersLastName.AsString + ' ' +
               F.fUsersListLC1.cdsUsersFirstName.AsString + ' ' +
               F.fUsersListLC1.cdsUsersMiddleName.AsString;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TUserSelector.fUsersListLC1DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  btnOk.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
end;

end.
