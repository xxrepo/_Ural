unit uOperLCOffset;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, frOperLCOffset, Buttons;

type
  TOffsetOperLC = class(TForm)
    Panel2: TPanel;
    btnVisa: TSpeedButton;
    btnCancel: TButton;
    btnOk: TButton;
    fOperLCOffset1: TfOperLCOffset;
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
    procedure Initialize(ID_Oper : integer; AReadOnly : boolean = false; ACorrect : boolean = false; ACopy : boolean = false);
    property ID_Oper : integer read GetID_Oper;
  end;

var
  OffsetOperLC: TOffsetOperLC;

implementation

uses uDM;


{$R *.DFM}

procedure TOffsetOperLC.btnOkClick(Sender: TObject);
begin
  if not fOperLCOffset1.ConfirmChanges then
    ModalResult := mrNone;
end;

function TOffsetOperLC.GetID_Oper: integer;
begin
  Result := fOperLCOffset1.ID_Oper;
end;

procedure TOffsetOperLC.Initialize(ID_Oper: integer; AReadOnly: boolean; ACorrect : boolean; ACopy : boolean);
begin
  fOperLCOffset1.Initialize(ID_Oper, AReadOnly, ACorrect, ACopy);
  if (ID_Oper = -1) or (ACorrect) or (ACopy) then
  begin
    Caption := 'Создание взаимозачета';
  end
  else
  begin
    Caption := 'Взаимозачет №' + IntToStr(ID_Oper);
    if not DM.CheckUserRights(4, Null) then
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

function TOffsetOperLC.SaveProp: boolean;
begin
  Result := fOperLCOffset1.SaveProp;
end;

procedure TOffsetOperLC.FormCreate(Sender: TObject);
begin
  fOperLCOffset1.PageControl1.ActivePageIndex := 0;
end;

procedure TOffsetOperLC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = idCancel then
  begin
    if fOperLCOffset1.ChangeData then
      case MessageBox(Handle, 'Сохранить операцию?', 'Данные не были сохранены', MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONQUESTION) of
        id_Yes : btnOk.Click;
        ID_CANCEL : Action := caNone;
      end;
  end;
end;

procedure TOffsetOperLC.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TOffsetOperLC.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TOffsetOperLC.btnVisaClick(Sender: TObject);
begin
  if not fOperLCOffset1.ConfirmChanges then
    ModalResult := mrNone
  else
    ModalResult := mrYes;

end;

end.
