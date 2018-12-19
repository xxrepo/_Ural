unit SyncForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfSyncForm = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cbUser: TCheckBox;
    cbObj: TCheckBox;
    cbGoods: TCheckBox;
    cbWHState: TCheckBox;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSyncForm: TfSyncForm;

implementation

{$R *.DFM}

end.
