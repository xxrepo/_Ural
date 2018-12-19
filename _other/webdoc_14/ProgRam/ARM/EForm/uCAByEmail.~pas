unit uCAByEmail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls, 
  sButton, RXCtrls, BoxProcs, sCheckBox, sDBCheckBox, sDBEdit, sLabel,
  sPanel, ComCtrls, sPageControl, Menus, Clipbrd, ActnList,
  sSpeedButton, BaseGrid, AdvGrid, DBAdvGrid;

type
  TCAByEmail = class(TForm)
    Panel2: TsPanel;
    btnCancel: TsButton;
    btnOk: TsButton;
    dsFindCAByEmail: TDataSource;
    GroupBox1: TGroupBox;
    DBAdvGrid1: TDBAdvGrid;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    lbSeller: TLabel;
    lbBayer: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure DBAdvGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GroupBox2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GroupBox2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure GroupBox3DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
   private
    Xid_Seller, Xid_Bayer : variant;
    procedure CheckBTN;
  public
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  CAByEmail: TCAByEmail;
  function SelectCAByEmail(Email : String; var id_Seller, id_Bayer : variant): boolean;
implementation

uses uDM, foMyFunc, uMainForm, uUnSelector, uNote;

{$R *.DFM}


function SelectCAByEmail(Email : String; var id_Seller, id_Bayer : variant): boolean;
var F : TCAByEmail;
begin
  Result := false;

  DM.cdsFindCAByEmail.Close;
  DM.cdsFindCAByEmail.Params.ParamByName('@Email').Value := Email;
  DM.cdsFindCAByEmail.Open;
  if DM.cdsFindCAByEmail.IsEmpty then Exit;

  F := TCAByEmail.Create(MainForm);
  try
    DM.Email := Email;
    
    F.Label1.Caption := 'Адрес: ' + Email;
     if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      id_Seller := null;
      id_Bayer := null;
      id_Seller := F.Xid_Seller;
      id_Bayer := F.Xid_Bayer;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;
 
 

constructor TCAByEmail.Create(AOwner: TComponent);
begin
  inherited;
//  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  Xid_Seller := null;
  Xid_Bayer := null;
  lbSeller.Caption := '';
  lbBayer.Caption := '';
end;

procedure TCAByEmail.CreateParams(var Params: TCreateParams);begin
  inherited;
  //Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);

end;

procedure TCAByEmail.DBAdvGrid1MouseDown(Sender: TObject;  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    DBAdvGrid1.BeginDrag(false,5);
  end;
end;

procedure TCAByEmail.GroupBox2DragOver(Sender, Source: TObject; X,  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source = DBAdvGrid1;

end;

procedure TCAByEmail.CheckBTN;
begin
  btnOk.Enabled := (Xid_Seller <> null) or (Xid_Bayer <> null);
end;


procedure TCAByEmail.GroupBox2DragDrop(Sender, Source: TObject; X,  Y: Integer);
begin
  Xid_Seller := DM.cdsFindCAByEmailid_CA.AsInteger;
  lbSeller.Caption := DM.cdsFindCAByEmailObjName.AsString;
  CheckBTN;
end;

procedure TCAByEmail.GroupBox3DragDrop(Sender, Source: TObject; X,  Y: Integer);
begin
  Xid_Bayer := DM.cdsFindCAByEmailid_CA.AsInteger;
  lbBayer.Caption := DM.cdsFindCAByEmailObjName.AsString;
  CheckBTN;

end;

procedure TCAByEmail.Button1Click(Sender: TObject);begin
  Xid_Seller := null;
  lbSeller.Caption := '';
  CheckBTN;
end;
             
procedure TCAByEmail.Button2Click(Sender: TObject);begin
  Xid_Bayer := null;
  lbBayer.Caption := '';
  CheckBTN;
end;

procedure TCAByEmail.btnOkClick(Sender: TObject);begin
  if (Xid_Seller = Xid_Bayer) then
  begin
    MessageBox(Handle, 'Продавец и покупатель одно и то же лицо. Так не бывает.', 'Ошибка', MB_ICONERROR);
    ModalResult := mrNone;
  end;
end;

end.