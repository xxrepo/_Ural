unit uNewObj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frNewObj, Buttons, Menus;

type
  TNewObj = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    fNewObj1: TfNewObj;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewObj: TNewObj;

implementation

{$R *.DFM}

procedure TNewObj.BitBtn1Click(Sender: TObject);
begin
  fNewObj1.aSaveExecute(Sender);

end;

end.
