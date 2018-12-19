unit uOperBlockIT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, DBGridEh, DB;

type
  TOperBlockIT = class(TForm)
    Label2: TLabel;
    btnOpenDay: TButton;
    btnCloseDay: TButton;
    DateEdit1: TDateEdit;
    procedure btnOpenDayClick(Sender: TObject);
    procedure btnCloseDayClick(Sender: TObject);
    procedure DateEdit1AcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
  private
    FDD_MaxDay : Variant;
    Fid_business : integer;
  public
    procedure Initialize(id_business : integer );
  end;

function ShowOperBlockIT(id_business : integer ) : boolean;
var
  OperBlockIT: TOperBlockIT;

implementation

uses uDM, foMyFunc, uPrgForm;

function ShowOperBlockIT(id_business : integer ) : boolean;
var F : TOperBlockIT;
begin
  Result := false;
  F := TOperBlockIT.Create(nil);
  try
    F.Initialize(id_business);
    F.ShowModal;
    Result := F.ModalResult = mrOk;
  finally
    F.Free;
  end;
end;

{$R *.DFM}

{ TOperDay }

procedure TOperBlockIT.Initialize(id_business : integer );
begin
  FDD_MaxDay := Null;
  Fid_business := id_business;
  exit;
     
  FDD_MaxDay := DM.rsCA.AppServer.DD_MaxDay(43);
  if FDD_MaxDay <> Null then
    DateEdit1.Date := FDD_MaxDay + 0;
end;

procedure TOperBlockIT.btnOpenDayClick(Sender: TObject);
var i, id_Oper, N : integer;
    ABookmark : TBookmark;
    AIDLIst : TIDList;
begin
  Screen.Cursor := crSQLWait;
    try
    with DateEdit1 do
      if DateEdit1.Date = 0 then
      begin
        MessageBox(Handle, 'Не введена дата', 'Введены не все данные', MB_OK + MB_ICONERROR);
        Windows.SetFocus(Handle);
        Exit;
      end;
    if MessageBox(Handle, 'Перенести операции?', 'Подтвердите закрытие и перенос', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
    begin
      N := DM.rsCA.AppServer.OP_BlockIt(Fid_business, DateEdit1.Date);
      if N < 0 then
      begin
        raise Exception.Create('Перенос невозможен!!!');
        ModalResult := mrCancel;
      end
      else
      begin
         ShowMessage('Период закрыт, данные перенесены. Редактирование операций запрещено.' + #13 + #10 + 'Перенесено операций: ' + IntToStr(N));
      end;
    end;
  finally
    Screen.Cursor := crDefault;       
  end;
end;

procedure TOperBlockIT.btnCloseDayClick(Sender: TObject);
begin
  Close;
end;

procedure TOperBlockIT.DateEdit1AcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  if FDD_MaxDay <> Null then
    Action := int(ADate) > int(FDD_MaxDay);

end;

end.
