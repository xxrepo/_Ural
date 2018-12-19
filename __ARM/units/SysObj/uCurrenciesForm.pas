unit uCurrenciesForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TCurrenciesForm = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(ReadOnly:boolean=false; ShowToolBar:boolean=false);
  end;

var
  CurrenciesForm: TCurrenciesForm;

implementation

{$R *.DFM}

procedure TCurrenciesForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TCurrenciesForm.Init(ReadOnly:boolean=false; ShowToolBar:boolean=false);
begin
{}
end;

end.
