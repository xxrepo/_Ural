unit uOperLCFin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, frOperLCFin, Buttons;

type
  TOperFinLC = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    btnVisa: TSpeedButton;
    fOperLCFin1: TfOperLCFin;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVisaClick(Sender: TObject);
  private
    function GetID_Oper: integer;
    { Private declarations }
  public
    function SaveProp: boolean;
    procedure Initialize(ID_Oper : integer; AReadOnly : boolean; ACorrect : boolean; ACopy : boolean; Ais_Mirr : boolean);
    property ID_Oper : integer read GetID_Oper;
  end;

var
  OperFinLC: TOperFinLC;

implementation

uses uDM;


{$R *.DFM}

procedure TOperFinLC.btnOkClick(Sender: TObject);
begin
  if not fOperLCFin1.ConfirmChanges then
    ModalResult := mrNone;
end;

function TOperFinLC.GetID_Oper: integer;
begin
  Result := fOperLCFin1.ID_Oper;
end;

procedure TOperFinLC.Initialize(ID_Oper: integer; AReadOnly: boolean; ACorrect : boolean; ACopy : boolean; Ais_Mirr : boolean);
begin
  fOperLCFin1.Initialize(ID_Oper, AReadOnly, ACorrect, ACopy, Ais_Mirr);
  if (ID_Oper = -1) or (ACorrect) or (ACopy) then
  begin
    Caption := 'Создание финансовой операции';
  end
  else
  begin
    Caption := 'Финансовая операция №' + IntToStr(ID_Oper);
    if not DM.CheckUserRights(2, Null) then
      if DM.CheckUserRights(7, Null) then
      begin
        AReadOnly := true;
        btnOk.Enabled := false;
      end;
    end;

  btnOk.Visible := not AReadOnly;
  if AReadOnly then
    Caption := Caption + ', только чтение';
  if AReadOnly then
    btnVisa.Enabled := false;
end;

function TOperFinLC.SaveProp: boolean;
begin
  Result := fOperLCFin1.SaveProp;
end;

procedure TOperFinLC.FormCreate(Sender: TObject);
begin
  fOperLCFin1.PageControl1.ActivePageIndex := 0;
end;

procedure TOperFinLC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = idCancel then
  begin
    if fOperLCFin1.ChangeData then
      case MessageBox(Handle, 'Сохранить операцию?', 'Данные не были сохранены', MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONQUESTION) of
        id_Yes : btnOk.Click;
        ID_CANCEL : Action := caNone;
      end;
  end;
end;

procedure TOperFinLC.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TOperFinLC.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TOperFinLC.btnVisaClick(Sender: TObject);
begin
  if not fOperLCFin1.ConfirmChanges then
    ModalResult := mrNone
  else
    ModalResult := mrYes;

end;

end.
