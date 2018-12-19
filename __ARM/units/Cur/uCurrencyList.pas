unit uCurrencyList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frCurrencyList, frBsnSelector;

type
  TCurrencyList = class(TForm)
    fCurrencyList1: TfCurrencyList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Initialize(AID : Variant; AFastAccess : Variant; AAvForPay : Variant);
  end;

var
  CurrencyList: TCurrencyList;

implementation

{$R *.DFM}

{ TCurrencyList }

procedure TCurrencyList.Initialize(AID, AFastAccess, AAvForPay: Variant);
begin
  fCurrencyList1.Initialize(AID, AFastAccess, AAvForPay);
//  fCurrencyList1.cdsCur.Filter := 'Base=0';
//  fCurrencyList1.cdsCur.Filtered := true;
end;

procedure TCurrencyList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCurrencyList.FormDestroy(Sender: TObject);
begin
  CurrencyList := nil;
end;

end.
