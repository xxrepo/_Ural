unit uInputQuery_AccGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBCtrls,
  RxLookup, Db, DBClient;

type
  TSetOfChar = set of char;

  TAccGrp = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cbShowInRoot: TCheckBox;
    Edit2: TEdit;
    Button1: TButton;
    Label2: TLabel;
    cdsAccGroup: TClientDataSet;
    cdsAccGroupid_Group: TIntegerField;
    cdsAccGroupName: TStringField;
    cdsAccGroupCnt: TIntegerField;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FPID : Variant;
    FID : integer;
    FID_Business : integer;
  public
  end;
                   
var
  AccGrp: TAccGrp;
function InputQuery_AccGrp(AID : integer; const ACaption: string; AID_Business : integer; var AName: string; var AShowInRoot : boolean; var PID : Variant): boolean;

implementation

uses uFormApi_CA, foMyFunc;

{$R *.DFM}
function InputQuery_AccGrp(AID : integer; const ACaption: string; AID_Business : integer; var AName: string; var AShowInRoot : boolean; var PID : Variant): boolean;
var F : TAccGrp;
begin
  Result := false;
  F := TAccGrp.Create(nil);
  try
    F.Caption := ACaption;

    F.Edit1.Text := AName;
    F.ActiveControl := F.Edit1;
    F.cbShowInRoot.Checked := AShowInRoot;
    F.FPID := PID;
    F.FID_Business := AID_Business;
    F.FID := AID;
    
    if F.FPID <> Null then
    begin
      with F.cdsAccGroup do
      begin
        Close;
        Params.ParamByName('@id_business').Value := F.FID_Business;
        Open;
        if Locate('id_Group', F.FPID, []) then
          F.Edit2.Text := F.cdsAccGroupName.AsString;
      end;
    end;
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      AName := F.Edit1.Text;
      AShowInRoot := F.cbShowInRoot.Checked;
      if F.FPID > 0 then
        PID := F.FPID
      else
        PID := -1;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TAccGrp.btnOkClick(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    MessageBox(Handle, 'Не введено название', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(Edit1.Handle);
    ModalResult := mrNone;
  end;
end;

procedure TAccGrp.FormCreate(Sender: TObject);
begin
{$IFDEF LC}
  cbShowInRoot.Visible := false;
{$ENDIF}
end;

procedure TAccGrp.Button1Click(Sender: TObject);
var AID : Variant;
    AName : String;
begin
  AID := FPID;
  if AID = Null then AID := -1;
  if SelectUnGroup(eotFinGroup, FID_Business, AID, AName, false, true, FID) then
  begin
    FPID := AID;
    Edit2.Text := AName;
  end;
end;

end.
