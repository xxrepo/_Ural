unit uWareProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frWareProp, foMyFunc;

type
  TWareProp = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    btnBarCode: TButton;
    fWareProp1: TfWareProp;
    procedure btnOkClick(Sender: TObject);
    procedure btnBarCodeClick(Sender: TObject);
  private
    function GetIDObj: Variant;
    { Private declarations }
  public
    constructor Create(AOwner : TComponent); override;
    function SaveProp : boolean;
    procedure Initialize(id_Ctg : integer; AID : integer; id_Bsn : integer);
    property IDObj : Variant read GetIDObj;
  end;

var
  WareProp: TWareProp;

implementation

uses uMainForm, uDM;

{$R *.DFM}


constructor TWareProp.Create(AOwner: TComponent);
begin
  inherited;
{$IFDEF LC}
  btnBarCode.Visible := false;
{$ENDIF}
  if DM.IsSimple then
  begin
    btnBarCode.Visible := false;
  end;

end;

procedure TWareProp.btnOkClick(Sender: TObject);
begin
  if not fWareProp1.ConfirmChanges then
    ModalResult := mrNone;
end;

function TWareProp.GetIDObj: Variant;
begin
  Result := fWareProp1.IDObj;
end;

procedure TWareProp.Initialize(id_Ctg : integer; AID : integer; id_Bsn : integer);
begin
  ActiveControl := fWareProp1.edName;
  btnBarCode.Enabled := AID <> -1;
  fWareProp1.Initialize(id_Ctg, AID, id_Bsn);
  if AID = -1 then
  begin
    Caption := 'Новый товар';
  end
  else
  begin
    Caption := 'Товар: ' + fWareProp1.cdsGoodsProp.FieldByName('Name').AsString;
  end;
end;

function TWareProp.SaveProp: boolean;
begin
  Result := fWareProp1.SaveProp;
end;

procedure TWareProp.btnBarCodeClick(Sender: TObject);
begin
  with fWareProp1.cdsGoodsProp do
  begin
 //   if FieldByName('BarCode').AsString = '' then
    begin
      Edit;
      FieldByName('BarCode').AsString := fWareProp1.MakeBarCode;
      Post;
    end;
  end;
end;

end.
