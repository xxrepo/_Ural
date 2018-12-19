unit uCurrencyDetailForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Buttons, Mask, ToolEdit, CurrEdit;

type
  TCurrencyDetailForm = class(TForm)
    Panel1: TPanel;
    OkButton: TButton;
    Button2: TButton;
    ClientDataSet: TClientDataSet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    NameEdit: TEdit;
    ShortNameEdit: TEdit;
    ISOCodeEdit: TEdit;
    NumCodeEdit: TEdit;
    FastAccess: TCheckBox;
    Label8: TLabel;
    Label11: TLabel;
    AvForPay: TCheckBox;
    Label12: TLabel;
    Base: TCheckBox;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    SiteEdit: TEdit;
    SpeedButton1: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
    Id:Variant;
    procedure Init;
  end;

var
  CurrencyDetailForm: TCurrencyDetailForm;

implementation

{$R *.DFM}

procedure TCurrencyDetailForm.Init;
begin
 {}
end;

end.
