unit uCurProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frCurProp;

type
  TCurProp = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fCurProp1: TfCurProp;
    procedure btnOkClick(Sender: TObject);
  private
  public
    procedure Initialize(AID : integer; id_Bsn : integer);
    function SaveProp: boolean;
  end;

var
  CurProp: TCurProp;

implementation

uses uDM, foMyFunc;

{$R *.DFM}


{ TCurProp }

procedure TCurProp.Initialize(AID: integer; id_Bsn : integer);
begin
  fCurProp1.initialize(AID, id_Bsn);
  if AID = -1 then
    Caption := 'Новая валюта'
  else
    Caption := 'Валюта - ' + fCurProp1.ObjName;
end;

function TCurProp.SaveProp: boolean;
begin
  Result := fCurProp1.SaveProp;
end;

procedure TCurProp.btnOkClick(Sender: TObject);
begin
  if not fCurProp1.ConfirmChanges then
    ModalResult := mrNone; 
end;

end.
