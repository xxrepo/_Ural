unit uBankData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TBankData = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    edBank: TEdit;
    Label1: TLabel;
    edBIK: TEdit;
    Label2: TLabel;
    edAcc: TEdit;
    Label3: TLabel;
    edCorrAcc: TEdit;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  end;

var
  BankData: TBankData;
function EditBankData(var Bank, BIK, Acc, CorrAcc: String; var isDef : boolean): boolean;

implementation

uses foMyFunc, uDM;

{$R *.DFM}
function EditBankData(var Bank, BIK, Acc, CorrAcc: String; var isDef : boolean): boolean;
var F : TBankData;
begin
  Result := false;
  F := TBankData.Create(nil);
  try
    with F do
    begin
      if Screen.ActiveForm <> nil then
        SetWindowLong(Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
      F.edBank.Text := Bank;
      F.edBIK.Text := BIK;
      F.edAcc.Text := Acc;
      F.edCorrAcc.Text := CorrAcc;
      F.CheckBox1.Checked := isDef;

      F.ActiveControl := F.edBank;
      F.ShowModal;
      if F.ModalResult = mrOk then
      begin
        Result := true;
        Bank := F.edBank.Text;
        BIK := F.edBIK.Text;
        Acc := F.edAcc.Text;
        CorrAcc := F.edCorrAcc.Text;

        isDef := F.CheckBox1.Checked;
      end;
    end;
  finally
    F.Free;
  end;
end;

{ TBankData }

constructor TBankData.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TBankData.Destroy;
begin
  inherited;

end;

procedure TBankData.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TBankData.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

end.
