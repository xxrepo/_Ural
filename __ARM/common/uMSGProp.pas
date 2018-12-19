unit uMSGProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frMSGProp, ActnList, Buttons, RXCtrls;

type
  TMSGProp = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fMSGProp1: TfMSGProp;
    ActionList1: TActionList;
    Action1: TAction;
    btnVisa: TSpeedButton;
    btnDel: TSpeedButton;
    sbPrint: TRxSpeedButton;
    PrintDialog: TPrintDialog;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure btnVisaClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FHandle : HWnd;
  public
    procedure Initialize(id_MSG : integer);
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  MSGProp: TMSGProp;
procedure ShowMSGProp(const AHandle : HWnd; Aid_MSG : integer);

implementation

uses foMyFunc, uDM;

{$R *.DFM}

procedure ShowMSGProp(const AHandle : HWnd; Aid_MSG : integer);
var F : TMSGProp;
begin
  F := TMSGProp.Create(nil);
  try
    F.FHandle := AHandle;
    F.Initialize(Aid_MSG);
    F.Show;
  except
    F.Free;
  end;
end;

procedure TMSGProp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMSGProp.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TMSGProp.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TMSGProp.btnOkClick(Sender: TObject);
begin
  if fMSGProp1.CheckData then
  begin
    if fMSGProp1.SaveProp then
    begin
      SendMessage(FHandle, xxx_RefrMsg, fMSGProp1.ID_MSG, ORD(0));
      Close;
    end;
  end;
end;

procedure TMSGProp.Initialize(id_MSG: integer);
begin
  fMSGProp1.Initialize(id_MSG);
  btnOk.Enabled := not fMSGProp1.cdsMSGPrWasRead.AsBoolean and fMSGProp1.cdsMSGPrDateClose.IsNull;
end;

constructor TMSGProp.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TMSGProp.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TMSGProp.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TMSGProp.Action1Execute(Sender: TObject);
begin
  if fMSGProp1.cdsMSGPr.FieldByName('DateClose').IsNull then
  begin
    btnOk.Enabled := true;
    fMSGProp1.SetMayEdit;
    btnVisa.Visible := true;
  end;
  Button1.Visible := true;
  Button1.Enabled := not fMSGProp1.cdsMSGPr.FieldByName('WasRead').AsBoolean;
end;

procedure TMSGProp.btnVisaClick(Sender: TObject);
begin
  btnOkClick(nil);
  if DM.rsCA.AppServer.MSG_SetClosed(fMSGProp1.ID_MSG, Now) = 1 then
    SendMessage(FHandle, xxx_RefrMsg, fMSGProp1.ID_MSG, ORD(0));
end;

procedure TMSGProp.sbPrintClick(Sender: TObject);
var  SL : TStringList;
     FDefFont : TFont;
begin
  if PrintDialog.Execute then
  begin
    SL := TStringList.Create;
    FDefFont := TFont.Create;
    FDefFont.Size := 10;
    try
      SL.Add('Сообщение');
      SL.Add('от ' + fMSGProp1.DBEdit3.Text + ' ' + fMSGProp1.DBEdit1.Text);
      SL.Add('-----------------------------------------------');
      SL.Add('');
      SL.AddStrings(fMSGProp1.DBMemo1.Lines);

      if fMSGProp1.DBMemo2.Lines.Text <> '' then
      begin
        SL.Add('Ответ');
        SL.Add('-----------------------------------------------');
        SL.Add('');
        SL.AddStrings(fMSGProp1.DBMemo2.Lines);
      end;
      PrintStrings(SL, FDefFont, 'Описание: ' + Caption);
    finally
      FDefFont.Free;
      SL.Free;
    end;
  end;
end;

procedure TMSGProp.Button1Click(Sender: TObject);
begin
  if MessageBox(Handle, 'Пометить как прочтенную?', 'Подтвердите прочтение', MB_YESNO + MB_ICONQUESTION) = idYes then
  begin
    DM.rsCA.AppServer.MSG_SetWasRead(fMSGProp1.ID_MSG, true);
    fMSGProp1.cdsMSGPr.Edit;
    fMSGProp1.cdsMSGPrWasRead.AsBoolean := true;
    fMSGProp1.cdsMSGPr.Post;
  end;
end;

end.
