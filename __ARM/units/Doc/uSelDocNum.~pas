unit  uSelDocNum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Db, Grids, DBGrids,
  RXDBCtrl;

type
 

  TSelDocNum = class(TForm)
    Panel1: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    RxDBGrid1: TRxDBGrid;
    DataSource1: TDataSource;
    procedure RxDBGrid1DblClick(Sender: TObject);
 
  private
    { Private declarations }
  public
 
  end;

var
  SelDocNum: TSelDocNum;

implementation

uses uDM;

{$R *.DFM}


 
procedure TSelDocNum.RxDBGrid1DblClick(Sender: TObject);
begin
  btnOk.Click;
end;

end.
