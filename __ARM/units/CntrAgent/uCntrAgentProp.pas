unit uCntrAgentProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frCntrAgentProp;

type
  TCntrAgentProp = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fCntrAgentProp1: TfCntrAgentProp;
    procedure btnOkClick(Sender: TObject);
  private
    procedure SetCAID(const Value: integer);
    function GetCAID: integer;
    function GetidBsn: integer;
    procedure SetidBsn(const Value: integer);
    procedure SetisOwn(const Value: boolean);
    procedure SetidGroup(const Value: Variant);
  private
  public
    function SaveProp: boolean;
    property CAID : integer read GetCAID write SetCAID;
    property idBsn : integer read GetidBsn write SetidBsn;
    property isOwn : boolean write SetisOwn;
    property idGroup : Variant write SetidGroup;
  end;

var
  CntrAgentProp: TCntrAgentProp;

implementation

uses uDM;

{$R *.DFM}

{ TForm1 }



{ TForm1 }

function TCntrAgentProp.GetCAID: integer;
begin
  Result := fCntrAgentProp1.CAID;
end;

function TCntrAgentProp.GetidBsn: integer;
begin
  Result := fCntrAgentProp1.idBsn;
end;

function TCntrAgentProp.SaveProp: boolean;
begin
  Result := fCntrAgentProp1.SaveProp;
end;

procedure TCntrAgentProp.SetCAID(const Value: integer);
begin
  fCntrAgentProp1.CAID := Value;
  if Value = -1 then
    Caption := 'Новый контрагент'
  else
    Caption := fCntrAgentProp1.cdsCAPropName.AsString + ', код ' + IntToStr(Value);
end;

procedure TCntrAgentProp.SetidBsn(const Value: integer);
begin
  fCntrAgentProp1.idBsn := Value;
  Caption := Caption + ' - бизнес "' + DM.GetBusinessName(Value) + '"'
end;

procedure TCntrAgentProp.SetidGroup(const Value: Variant);
begin
  fCntrAgentProp1.idGroup := Value;
end;

procedure TCntrAgentProp.SetisOwn(const Value: boolean);
begin
  fCntrAgentProp1.isOwn := Value;
end;

procedure TCntrAgentProp.btnOkClick(Sender: TObject);
begin
  if not fCntrAgentProp1.ConfirmChanges then
    ModalResult := mrNone;
end;

end.
