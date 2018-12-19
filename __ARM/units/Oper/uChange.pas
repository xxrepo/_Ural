unit uChange;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frOperOldData, Buttons;

type
  TChangeOper = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    fDataOld: TfOperOldData;
    Splitter1: TSplitter;
    Panel3: TPanel;
    fDataNew: TfOperOldData;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    FID_Oper : integer;
    ID_New : integer;
  public
    function DoOk : boolean;
    function DoCancel : boolean;
    procedure Initialize(ID_Oper : integer);
  end;

var
  ChangeOper: TChangeOper;

implementation

uses uDM;

{$R *.DFM}

{ TChangeOper }

function TChangeOper.DoCancel: boolean;
begin
  Result := DM.rsCA.AppServer.OP_DoCancel(ID_New) <> -1;
end;

function TChangeOper.DoOk: boolean;
begin
  Result := DM.rsCA.AppServer.OP_DoOk(ID_New) <> -1;
end;

procedure TChangeOper.Initialize(ID_Oper: integer);
begin
  FID_Oper := ID_Oper;
  fDataOld.InitializeNewData(ID_Oper);
  ID_New := DM.rsCA.AppServer.OP_OperGetEditID(ID_Oper);
  fDataNew.InitializeNewData(ID_New);
end;

procedure TChangeOper.SpeedButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TChangeOper.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TChangeOper.SpeedButton3Click(Sender: TObject);
begin
  ModalResult := mrNo;
end;

end.
