unit uOperSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frArc;

type
  TOperSelector = class(TForm)
    fArc1: TfArc;
    Panel1: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OperSelector: TOperSelector;

procedure ShowOperSelector(id_oper : integer; SelectOne : boolean; SelectEvent: TNotifyEvent);

implementation

uses foMyFunc;

{$R *.DFM}

procedure ShowOperSelector(id_oper : integer; SelectOne : boolean; SelectEvent: TNotifyEvent);
var F : TOperSelector;
    AParamBlnc : TParamBlnc;
begin
  F := TOperSelector.Create(nil);
  try
    while true do
    begin
      AParamBlnc := GetEmptyParamBlnc;

      F.fArc1.Initialize(AParamBlnc);
  //    F.fArc1.RxDBGrid1.Options := F.fArc1.RxDBGrid1.Options - [gom];
      F.ShowModal;
      if F.ModalResult = mrOk then
      begin
        if assigned(SelectEvent) then
          try
            SelectEvent(F.fArc1.dsArc.DataSet);
          except
          end;
      end;
      if SelectOne or (F.ModalResult = mrCancel) then
        Break;
    end;
  finally
    F.Free;
  end;
end;

procedure TOperSelector.FormCreate(Sender: TObject);
begin
  fArc1.DisableEditAct;
end;

procedure TOperSelector.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action := caFree;
end;

end.
