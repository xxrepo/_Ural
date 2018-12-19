unit uFuncForm;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FuncsForm: TFuncsForm;

implementation

{$R *.DFM}

end.
