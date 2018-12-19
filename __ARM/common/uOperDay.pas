unit uOperDay;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, frBsnSelector, Mask, ToolEdit;

type
  TOperDay = class(TForm)
    Label1: TLabel;
    btnOpenDay: TButton;
    btnCloseDay: TButton;
    Button1: TButton;
    fBsnSelector1: TfBsnSelector;
    DateEdit1: TDateEdit;
    btnCNC: TButton;
    procedure btnOpenDayClick(Sender: TObject);
    procedure btnCloseDayClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure DateEdit1AcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure btnCNCClick(Sender: TObject);
  private
    FDateCreate : Variant;
    FDD_MaxDay : Variant;
  public
    procedure Initialize;
  end;

procedure ShowOperDay;
var
  OperDay: TOperDay;

implementation

uses uDM, uAPNOper;

procedure ShowOperDay;
var F : TOperDay;
begin
  F := TOperDay.Create(nil);
  try
    F.Initialize;
    F.ShowModal;
  finally
    F.Free;
  end;
end;

{$R *.DFM}

{ TOperDay }

procedure TOperDay.Initialize;
begin
  if fBsnSelector1.ID > 0 then
  begin
    DateEdit1.Enabled := false;
    FDateCreate := DM.rsCA.AppServer.DD_DayGetProp(fBsnSelector1.ID);
    if FDateCreate = Null then
    begin
      DateEdit1.Enabled := true;
      Label1.Caption := 'День закрыт';
      FDD_MaxDay := DM.rsCA.AppServer.DD_MaxDay(fBsnSelector1.ID);
      if FDD_MaxDay <> Null then
      begin
        DateEdit1.Date := FDD_MaxDay + 1;
        Label1.Caption := Label1.Caption + '. Последний закрытый день ' + FormatDateTime('dd-mm-yyyy', FDD_MaxDay);
      end
      else
        DateEdit1.Date := Date;
    end
    else
      Label1.Caption := 'День открыт. Текущий день ' + FormatDateTime('dd-mm-yyyy', FDateCreate);

    btnOpenDay.Enabled := FDateCreate = Null;
    btnCloseDay.Enabled := FDateCreate <> Null;
    btnCNC.Enabled := btnCloseDay.Enabled;
  end
  else
  begin
    Label1.Caption := 'Выберите бизнес';

    btnOpenDay.Enabled := false;
    btnCloseDay.Enabled := false;
    btnCNC.Enabled := false;
  end;
end;

procedure TOperDay.btnOpenDayClick(Sender: TObject);
begin
  if DM.rsCA.AppServer.DD_DayOpen(fBsnSelector1.ID, Int(DateEdit1.Date) - 0) <> -1 then
  begin
    Initialize;
    ShowAPNOper(0, -1, fBsnSelector1.ID);
  end;
end;

procedure TOperDay.btnCloseDayClick(Sender: TObject);
begin
  if MessageBox(Handle, 'Вы действительно хотите закрыть день?', 'Подтвердите закрытие дня', MB_ICONQUESTION + MB_YESNO) = id_Yes then
  begin
    if DM.rsCA.AppServer.DD_DayClose(fBsnSelector1.ID) <> -1 then
      Initialize;
  end;
end;

procedure TOperDay.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TOperDay.fBsnSelector1Button1Click(Sender: TObject);
begin
  fBsnSelector1.Button1Click(Sender);
  Initialize;
end;

procedure TOperDay.DateEdit1AcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  if FDD_MaxDay <> Null then
    Action := int(ADate) >= int(FDD_MaxDay);

end;

procedure TOperDay.btnCNCClick(Sender: TObject);
begin
  if MessageBox(Handle, 'Вы действительно хотите отменить открытие дня?', 'Подтвердите отмену', MB_ICONQUESTION + MB_YESNO) = id_Yes then
  begin
    if DM.rsCA.AppServer.DD_Cancel(fBsnSelector1.ID) <> -1 then
      Initialize;
  end;
end;

end.
