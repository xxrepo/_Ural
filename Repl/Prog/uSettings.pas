unit uSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RXSpin, registry, Mask, ToolEdit, CurrEdit, inifiles;

type
  THackControl = class(TWinControl)
    property Text;
  end;
  TSettings = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edServer: TEdit;
    Label2: TLabel;
    edPort: TCurrencyEdit;
    Label5: TLabel;
    edPeriod: TRxSpinEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    dsfUserName: TLabel;
    Label4: TLabel;
    edBasePassword: TEdit;
    edBaseUserName: TEdit;
    edBaseName: TEdit;
    Label6: TLabel;
    edSvrName: TEdit;
    Label7: TLabel;
    edSvrPassword: TEdit;
    Label8: TLabel;
    edxxxCatalog: TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Settings: TSettings;

implementation

uses uDM;


{$R *.DFM}



procedure TSettings.btnOkClick(Sender: TObject);
  function sss(AControl : TWinControl) : boolean;
  begin
    Result := trim(THackControl(AControl).Text) = '';
    if Result then
    begin
      windows.SetFocus(AControl.Handle);
      Application.MessageBox('¬ведены не все данные', '', MB_ICONERROR);
      ModalResult := mrNone;
      Abort;
    end;
  end;
begin
  ModalResult := mrOk;
  sss(edServer);
  sss(edPort);
  sss(edPeriod);
  
  sss(edSvrName);
  sss(edSvrPassword);

  sss(edBaseName);
  sss(edBaseUserName);
  sss(edBasePassword);
end;

procedure TSettings.FormDestroy(Sender: TObject);
begin
  Settings := nil;
end;

procedure TSettings.FormCreate(Sender: TObject);
begin
  tag := 0;
end;

end.
