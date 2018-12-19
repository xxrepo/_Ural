unit uCurrencyList_old;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frCurrencyList_old;

type
  TCurrencyList_old = class(TForm)
    fCurrencyList1: TfCurrencyList_old;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Initialize(AID : Variant; AFastAccess : Variant; AAvForPay : Variant);
  end;

var
  CurrencyList_old: TCurrencyList_old;

implementation

{$R *.DFM}

{ TCurrencyList }

procedure TCurrencyList_old.Initialize(AID, AFastAccess, AAvForPay: Variant);
begin
  fCurrencyList1.Initialize(AID, AFastAccess, AAvForPay);
end;

procedure TCurrencyList_old.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCurrencyList_old.FormDestroy(Sender: TObject);
begin
  CurrencyList_old := nil;
end;

end.
