unit uOperFinLC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, frFinOperLC;

type
  TOperFinLC = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fFinOperLC1: TfFinOperLC;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetID_Oper: integer;
    { Private declarations }
  public
    function SaveProp: boolean;
    procedure Initialize(ID_Oper : integer; AReadOnly : boolean = false; ACorrect : boolean = false; ACopy : boolean = false);
    property ID_Oper : integer read GetID_Oper;
  end;

var
  OperFinLC: TOperFinLC;

implementation


{$R *.DFM}

procedure TOperFinLC.btnOkClick(Sender: TObject);
begin
  if not fFinOperLC1.ConfirmChanges then
    ModalResult := mrNone;
end;

function TOperFinLC.GetID_Oper: integer;
begin
  Result := fFinOperLC1.ID_Oper;
end;

procedure TOperFinLC.Initialize(ID_Oper: integer; AReadOnly: boolean; ACorrect : boolean; ACopy : boolean);
begin
  fFinOperLC1.Initialize(ID_Oper, AReadOnly, ACorrect, ACopy);
  if (ID_Oper = -1) or (ACorrect) or (ACopy) then
  begin
    Caption := 'Создание финансовой операции';
  end
  else
  begin
    Caption := 'Финансовая операция №' + IntToStr(ID_Oper);
  end;
  btnOk.Enabled := not AReadOnly;
  if AReadOnly then
    Caption := Caption + ' только для чтения';
end;

function TOperFinLC.SaveProp: boolean;
begin
  Result := fFinOperLC1.SaveProp;
end;

procedure TOperFinLC.FormCreate(Sender: TObject);
begin
  fFinOperLC1.PageControl1.ActivePageIndex := 0;
end;

end.
