unit UnitARate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, ToolEdit, RXDBCtrl, Mask, DBCtrls, DBClient,
  Provider, ADODB, RxLookup;

type
  TFormARate = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    QueryCurrency: TADOQuery;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DataSource1: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormARate: TFormARate;

implementation

uses Common;

{$R *.DFM}

procedure TFormARate.FormActivate(Sender: TObject);
begin
  if Tag=0 then
    with QueryCurrency do
      begin
      if Active then Close;
      SQL.Add('AND NOT (Id_Currency IN (SELECT IdCurrency FROM Rate))');
      end;
  QueryCurrency.Open;
  if QueryCurrency.RecordCount=0 then
    Application.MessageBox('Нет валют для ввода курса', 'Внимание', mb_Ok)
  else
    begin
    if Tag=1 then
      begin
      ActiveControl:=Edit2;
       RxDBLookupCombo1.Enabled:=False;
      end;
    end;
end;

procedure TFormARate.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', DecimalSeparator, #8, #22]) then Key:=#0;
end;

procedure TFormARate.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #22]) then Key:=#0;
end;

end.
