unit uOperLCWare;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, frOperLCWare, Mask, ToolEdit, CurrEdit,
  RXDBCtrl, Buttons;

type
  TWareOperLC = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    btnVisa: TSpeedButton;
    fOperLCWare1: TfOperLCWare;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVisaClick(Sender: TObject);
  private
    function GetID_Oper: integer;
    function CheckViza : boolean;
  public
    function SaveProp: boolean;
    procedure Initialize(ID_Oper : integer; AReadOnly : boolean; ACorrect : boolean; ACopy : boolean; Ais_Mirr : boolean;
  ARezMode : boolean);
    property ID_Oper : integer read GetID_Oper;
  end;

var
  WareOperLC: TWareOperLC;

implementation

uses uDM;


{$R *.DFM}

procedure TWareOperLC.btnOkClick(Sender: TObject);
begin
  if not fOperLCWare1.ConfirmChanges then
    ModalResult := mrNone;
end;

function TWareOperLC.GetID_Oper: integer;
begin
  Result := fOperLCWare1.ID_Oper;
end;

function TWareOperLC.CheckViza : boolean;
var
    UID : integer;
begin
  Result := true;
  with fOperLCWare1.cdsOper do
  begin
    if (not FieldByName('OperTypeIn').AsBoolean
       and not FieldByName('id_WareHouse').IsNull
       and not FieldByName('id_Manufact_Ext').IsNull)
       then
      UID := 18 // Отгрузка
    else
      UID := 17
  end;
  Result := btnVisa.Visible and DM.CheckUserRights(UID, fOperLCWare1.cdsOper.FieldByName('id_Business').AsInteger);
end;

procedure TWareOperLC.Initialize(ID_Oper: integer; AReadOnly: boolean; ACorrect : boolean; ACopy : boolean; Ais_Mirr : boolean;
  ARezMode : boolean);
begin
  fOperLCWare1.Initialize(ID_Oper, AReadOnly, ACorrect, ACopy, Ais_Mirr, ARezMode);
  if (ID_Oper = -1) or (ACorrect) or (ACopy) or ARezMode  then
  begin
    if ARezMode then
      Caption := 'Новое резервирование'
    else
      Caption := 'Создание складской операции';
  end
  else
  begin
    if ARezMode then
      Caption := 'Резервирование'
    else
      Caption := 'Складская операция №';
    Caption := Caption + IntToStr(ID_Oper);

    if not DM.CheckUserRights(1, Null) then
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

function TWareOperLC.SaveProp: boolean;
begin
  Result := fOperLCWare1.SaveProp;
end;

procedure TWareOperLC.FormCreate(Sender: TObject);
begin
  fOperLCWare1.PageControl1.ActivePageIndex := 0;
end;

procedure TWareOperLC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = idCancel then
  begin
    if fOperLCWare1.ChangeData then
      case MessageBox(Handle, 'Сохранить операцию?', 'Данные не были сохранены', MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONQUESTION) of
        id_Yes : btnOk.Click;
        ID_CANCEL : Action := caNone;
      end;
  end;
end;

procedure TWareOperLC.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TWareOperLC.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TWareOperLC.btnVisaClick(Sender: TObject);
begin
  if not fOperLCWare1.ConfirmChanges then
    ModalResult := mrNone
  else
    ModalResult := mrYes;
end;

end.
