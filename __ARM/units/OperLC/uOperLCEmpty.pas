unit uOperLCEmpty;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc,   
  frOperLCEmpty, Buttons;

type
  TEmptyOperLC = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fOperLCEmpty1: TfOperLCEmpty;
    btnVisa: TSpeedButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function GetID_Oper: integer;
    { Private declarations }
  public
    function SaveProp: boolean;
    procedure Initialize(ID_Oper : integer; AReadOnly : boolean = false);
    property ID_Oper : integer read GetID_Oper;
  end;

var
  EmptyOperLC: TEmptyOperLC;

implementation

uses uDM;


{$R *.DFM}

procedure TEmptyOperLC.btnOkClick(Sender: TObject);
begin
  if not fOperLCEmpty1.ConfirmChanges then
    ModalResult := mrNone;
end;

function TEmptyOperLC.GetID_Oper: integer;
begin
  Result := fOperLCEmpty1.ID_Oper;
end;

procedure TEmptyOperLC.Initialize(ID_Oper: integer; AReadOnly: boolean);
begin
  fOperLCEmpty1.Initialize(ID_Oper, AReadOnly);
  if ID_Oper = -1 then
  begin
    Caption := 'Создание пустой операции';
  end
  else
  begin
    Caption := 'Пустая операция №' + IntToStr(ID_Oper);
  end;
  btnOk.Visible := not AReadOnly;
  if AReadOnly then
    Caption := Caption + ', только чтение';
  if AReadOnly then
    btnVisa.Enabled := false;
end;

function TEmptyOperLC.SaveProp: boolean;
begin
  Result := fOperLCEmpty1.SaveProp;
end;

procedure TEmptyOperLC.FormCreate(Sender: TObject);
begin
  fOperLCEmpty1.PageControl1.ActivePageIndex := 0;
end;

procedure TEmptyOperLC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = idCancel then
  begin
    if fOperLCEmpty1.ChangeData then
      case MessageBox(Handle, 'Сохранить операцию?', 'Данные не были сохранены', MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONQUESTION) of
        id_Yes : btnOk.Click;
        ID_CANCEL : Action := caNone;
      end;
  end;
end;

procedure TEmptyOperLC.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TEmptyOperLC.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

end.
