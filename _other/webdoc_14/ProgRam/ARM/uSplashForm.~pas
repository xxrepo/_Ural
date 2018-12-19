unit uSplashForm;
        // Форма - заставка при запуске
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, registry, jpeg, ActnList, RxGIF;

type
  TSplashForm = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    lbVer2: TLabel;
    Panel3: TPanel;
    ActionList1: TActionList;
    aEgg: TAction;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TComponent; ATime : Cardinal; AModal : boolean = false); overload;
    procedure Kill(ATime : Cardinal);
  end;

var
  SplashForm: TSplashForm;

  procedure ShowSplashForm(ATime : Cardinal = 1000);
  procedure KillSplashForm(ATime : Cardinal = 0);
implementation

uses uDM;

{$R *.DFM}
procedure ShowSplashForm(ATime : Cardinal = 1000);
begin
  if SplashForm = nil then
  begin
    SplashForm := TSplashForm.Create(Application, 10000, false);
    SplashForm.Show;
    SplashForm.BringToFront;
    SplashForm.Refresh;
  end;
end;

procedure KillSplashForm(ATime : Cardinal);
begin
  if SplashForm <> nil then SplashForm.Kill(ATime);
end;

procedure TSplashForm.Timer1Timer(Sender: TObject);
begin
  PostMessage(Handle, CM_RELEASE, 0, 0);
end;

procedure TSplashForm.FormShow(Sender: TObject);
begin
  Timer1.Enabled := true;
end;

procedure TSplashForm.FormDestroy(Sender: TObject);
var Reg: TRegistry;
begin
  SplashForm := nil;
  if Panel2.Visible then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(SRegPath, true) then
      begin
        Reg.WriteBool('ShowSplash', not CheckBox1.Checked);
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
end;

constructor TSplashForm.Create(AOwner: TComponent; ATime : Cardinal; AModal: boolean);
 type TLongVersion = record
    case Integer of
    0: (All: array[1..4] of Word);
    1: (MS, LS: LongInt);
  end;

  var
    FPVSFixedFileInfo : PVSFixedFileInfo;
    FSize : integer;
    FBuffer: PChar;
    FHandle: DWORD;
    Len: UINT;
    LongVersion : TLongVersion;
begin
  inherited Create(AOwner);

  FSize := GetFileVersionInfoSize(PChar(Application.ExeName), FHandle);
  GetMem(FBuffer, FSize);
  try
    if GetFileVersionInfo(PChar(Application.ExeName), FHandle, FSize, FBuffer) then
    begin
      VerQueryValue(FBuffer, '\', Pointer(FPVSFixedFileInfo), Len);
      LongVersion.MS := FPVSFixedFileInfo^.dwFileVersionMS;
      LongVersion.LS := FPVSFixedFileInfo^.dwFileVersionLS;
      lbVer2.Caption := Format(lbVer2.Caption, [LongVersion.All[2], LongVersion.All[1]]);
    end
    else
      lbVer2.Caption := '';
  except

  end;
  if FBuffer <> nil then
    FreeMem(FBuffer, FSize);

  Panel1.Visible := AModal;
  Panel2.Visible := not AModal;

  Timer1.Interval := ATime;
end;

procedure TSplashForm.Button1Click(Sender: TObject);
begin
  Release;
end;

procedure TSplashForm.Kill(ATime: Cardinal);
begin
  Timer1.Enabled := false;
  if ATime = 0 then
    Free
  else
  begin
    Timer1.Interval := ATime;
    Timer1.Enabled := true;
  end;
end;

end.
