unit frCAGroupSelect;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfCAGroupSelect = class(TFrame)
    Label1: TLabel;
    edName: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    FIDBsn: integer;
    function getID: Variant;
    procedure SetID(const Value: Variant);
    function getGrpName: String;
    procedure SetIDBsn(const Value: integer);
    { Private declarations }
  public
    FID : Variant;
    constructor Create(AOwner : TComponent); override;
    property IDBsn : integer read FIDBsn write SetIDBsn;
    property ID : Variant read getID write SetID;
    property GrpName : String read getGrpName;
  end;

implementation

uses uFormApi_CA, uDM;

{$R *.DFM}

{ TfCAGroupSelect }

constructor TfCAGroupSelect.Create(AOwner: TComponent);
begin
  inherited;
  FID := -1;

end;

function TfCAGroupSelect.getID: Variant;
begin
  Result := FID;
end;

procedure TfCAGroupSelect.SetID(const Value: Variant);
begin
  FID := Value;
  edName.Text := DM.rsCA.AppServer.CA_CAGroupGetProp(FID);
end;

procedure TfCAGroupSelect.Button1Click(Sender: TObject);
var AID : Variant;
    AName : String;
begin
  AID := FID;
  AName := edName.Text;
  if SelectCAGroup(FIDBsn, AID, AName) then
  begin
    FID := AID;
    edName.Text := AName;
  end;

end;

function TfCAGroupSelect.getGrpName: String;
begin
  Result := edName.Text;
end;

procedure TfCAGroupSelect.SetIDBsn(const Value: integer);
begin
  FIDBsn := Value;
end;

end.
