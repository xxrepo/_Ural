unit uSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RXSpin, foMyFunc, registry, Mask, ToolEdit, CurrEdit, inifiles;

type
  TSettings = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    edServer: TEdit;
    Label2: TLabel;
    edPort: TCurrencyEdit;
    Panel3: TPanel;
    cbShowSplash: TCheckBox;
    cbAReadOneObj: TCheckBox;
    cbFin: TCheckBox;
    cbWH: TCheckBox;
    cbMnf: TCheckBox;
    cbCA: TCheckBox;
    cbWare: TCheckBox;
    cbAllWares: TCheckBox;
    Label3: TLabel;
    cbVatIn: TCheckBox;
    cbOpenDay: TCheckBox;
    cbAP: TCheckBox;
    cbArcOptim: TCheckBox;
    cbCrnInArc: TCheckBox;
    cbStayHere: TCheckBox;
    cbStayHere_Copy: TCheckBox;
    cbUsePrice: TCheckBox;
    cbIsSimple: TCheckBox;
    cbIsMegaFlt: TCheckBox;
    cbAutoCalcDocNum: TCheckBox;
    cbFPredViza: TCheckBox;
    procedure edPortKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure ChangeStng(AOnlyServer : boolean = false);
var
  Settings: TSettings;

implementation

uses uDM;

procedure SaveStng;
var Reg: TRegistry;
    IniFile : TIniFile;
    S : String;
begin
  Reg := TRegistry.Create;
  S := ExpandFileName(ParamStr(0));
  Delete(S, Length(S) - 2, 3);
  S := S + 'ini';
  IniFile := TIniFile.Create(S);
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(SRegPath, true) then
    begin
      Reg.WriteBool('ShowSplash', ShowSplash);
      Reg.WriteBool('AReadOneObj', AReadOneObj);

      Reg.WriteBool('FPredViza', FPredViza);
      Reg.WriteBool('HideFin', HideFin);
      Reg.WriteBool('HideWH', HideWH);
      Reg.WriteBool('HideMnf', HideMnf);
      Reg.WriteBool('HideCA', HideCA);
      Reg.WriteBool('HideWare', HideWare);


      Reg.WriteBool('AutoCalcDocNum', AutoCalcDocNum);
      Reg.WriteBool('HideAllWares', HideAllWares);
      Reg.WriteBool('FVatIn', FVatIn);
      Reg.WriteBool('FOpenDay', FOpenDay);
      Reg.WriteBool('FAP', FAP);
      Reg.WriteBool('FArcOptim', FArcOptim);
      Reg.WriteBool('CrnInArc', CrnInArc);
      Reg.WriteBool('FStayHere', FStayHere);
      Reg.WriteBool('FUsePrice', FUsePrice);
      Reg.WriteBool('FIsSimple', FIsSimple);
      Reg.WriteBool('FIsMegaFlt', FIsMegaFlt);
    end;
    try
      IniFile.WriteString('AppServer', 'HostName', DM.host);
      IniFile.WriteString('AppServer', 'Port', DM.port);
    except
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
    IniFile.Free;
  end;
end;

procedure ChangeStng(AOnlyServer : boolean);
var F : TSettings;
begin
  F := TSettings.Create(nil);
  try
    F.cbShowSplash.Checked := ShowSplash;
    F.cbAReadOneObj.Checked := AReadOneObj;

    F.cbFPredViza.Checked := FPredViza;
    F.cbFin.Checked := HideFin;
    F.cbWH.Checked := HideWH;
    F.cbMnf.Checked := HideMnf;
    F.cbCA.Checked := HideCA;
    F.cbWare.Checked := HideWare;
    F.cbAllWares.Checked := HideAllWares;
    F.cbAutoCalcDocNum.Checked := AutoCalcDocNum;
    F.cbVatIn.Checked := FVatIn;
    F.cbOpenDay.Checked := FOpenDay;
    F.cbAP.Checked := FAP;
    F.cbArcOptim.Checked := FArcOptim;
    F.cbCrnInArc.Checked := CrnInArc;
    F.cbStayHere.Checked := FStayHere;
    F.cbUsePrice.Checked := FUsePrice;
    F.cbIsSimple.Checked := FIsSimple;
    F.cbIsMegaFlt.Checked := FIsMegaFlt;
    F.cbStayHere_Copy.Checked := FStayHere_Copy;


    F.edServer.Text := DM.host;
    if F.edServer.Text = '' then
      F.edServer.Text := 'localhost';
    F.edPort.Text := DM.port;
    if F.edPort.Text = '' then
      F.edPort.Text := '211';
    if AOnlyServer then
    begin
      F.Panel3.Visible := false;
      F.Height := F.Panel1.Height + F.Panel2.Height + 27;
    end;
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      ShowSplash := F.cbShowSplash.Checked;
      AReadOneObj := F.cbAReadOneObj.Checked;

      FPredViza := F.cbFPredViza.Checked;
      HideFin := F.cbFin.Checked;
      HideWH := F.cbWH.Checked;
      HideMnf := F.cbMnf.Checked;
      HideCA := F.cbCA.Checked;
      HideWare := F.cbWare.Checked;
      HideAllWares := F.cbAllWares.Checked;
      AutoCalcDocNum := F.cbAutoCalcDocNum.Checked;
      FVatIn := F.cbVatIn.Checked;
      FOpenDay := F.cbOpenDay.Checked;
      FAP := F.cbAP.Checked;
      FArcOptim := F.cbArcOptim.Checked;
      CrnInArc := F.cbCrnInArc.Checked;
    FStayHere := F.cbStayHere.Checked;
    FStayHere_Copy := F.cbStayHere_Copy.Checked;
    FUsePrice := false; //F.cbUsePrice.Checked;
    FIsSimple := F.cbIsSimple.Checked;
    FIsMegaFlt := F.cbIsMegaFlt.Checked;

      DM.host := F.edServer.Text;
      DM.port := F.edPort.Text;
      SaveStng;
      if AOnlyServer then
      begin
        DM.rsCA.Close;
{$IFNDEF LC}
        DM.rsFlt.Close;
{$ENDIF}
      end;
    end;
  finally
    F.Free;
  end;  
end;


{$R *.DFM}

procedure TSettings.edPortKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = '.') or (Key = ',') then
    Key := #0;
end;

end.
