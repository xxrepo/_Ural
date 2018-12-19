unit uFuncsForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, uFuncsFrame;

type
  TFuncsForm = class(TForm)
    Panel1: TPanel;
    OkButton: TButton;
    Button2: TButton;
    FuncsFrame1: TFuncsFrame;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init(id_Group, id_Business, id_Func : integer);
  end;

var
  FuncsForm: TFuncsForm;

implementation

{$R *.DFM}
procedure TFuncsForm.Init(id_Group, id_Business, id_Func : integer);
begin
 FuncsFrame1.Init(id_Group, id_Business, id_Func);
end;

procedure TFuncsForm.FormDestroy(Sender: TObject);
begin
 FuncsForm:=nil;
end;

end.
