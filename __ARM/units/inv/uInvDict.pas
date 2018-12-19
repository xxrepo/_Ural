unit uInvDict;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBCtrls,
  RxLookup, Db, DBClient;

type
  TSetOfChar = set of char;

  TInvDict = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cePrintPrice: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ceForm: TCurrencyEdit;
    cePrint: TCurrencyEdit;
    Label5: TLabel;
    ceLam: TCurrencyEdit;
    Label6: TLabel;
    ceDiv: TCurrencyEdit;
    Label7: TLabel;
    ceSkob: TRxCalcEdit;
    ceLent: TRxCalcEdit;
    ceFNR_Delta: TCurrencyEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    Fid_business : integer;
  public
  end;
                   
var
  InvDict: TInvDict;
function ShowInvDict(id_business : integer): boolean;

implementation

uses uDM, foMyFunc;

{$R *.DFM}
function ShowInvDict(id_business : integer): boolean;
var F : TInvDict;
begin

    DM.Rights_GetUserRights(1001, Null); 

  Result := false;
  F := TInvDict.Create(nil);
  try
    F.Fid_business := id_business;

    F.cePrintPrice.Value := VarToFloat(DM.rsCA.AppServer.GetINV_Form(F.Fid_business, 1));;

    F.ceSkob.Value := VarToFloat(DM.rsCA.AppServer.GetINV_Form(F.Fid_business, 10));;
    F.ceLent.Value := VarToFloat(DM.rsCA.AppServer.GetINV_Form(F.Fid_business, 11));;

    F.ceForm.Value := VarToFloat(DM.rsCA.AppServer.GetINV_Form(F.Fid_business, 1000));;
    F.cePrint.Value := VarToFloat(DM.rsCA.AppServer.GetINV_Form(F.Fid_business, 1001));;
    F.ceLam.Value := VarToFloat(DM.rsCA.AppServer.GetINV_Form(F.Fid_business, 1002));;
    F.ceDiv.Value := VarToFloat(DM.rsCA.AppServer.GetINV_Form(F.Fid_business, 1003));;
    F.ceFNR_Delta.Value := VarToFloat(DM.rsCA.AppServer.GetINV_Form(F.Fid_business, -13));

  //  F.ceForm.Value := VarToFloat(DM.rsCA.AppServer.GetINV_Form(F.Fid_business, 1001));;

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      DM.rsCA.AppServer.INV_FormEdit(1, F.cePrintPrice.Value);
      DM.rsCA.AppServer.INV_FormEdit(10, F.ceSkob.Value);
      DM.rsCA.AppServer.INV_FormEdit(11, F.ceLent.Value);

      DM.rsCA.AppServer.INV_FormEdit(1000, F.ceForm.Value);
      DM.rsCA.AppServer.INV_FormEdit(1001, F.cePrint.Value);
      DM.rsCA.AppServer.INV_FormEdit(1002, F.ceLam.Value);
      DM.rsCA.AppServer.INV_FormEdit(1003, F.ceDiv.Value);

      DM.rsCA.AppServer.INV_FormEdit(-13, F.ceFNR_Delta.Value);

      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TInvDict.FormCreate(Sender: TObject);
begin
{$IFDEF LC}
  cbShowInRoot.Visible := false;
{$ENDIF}
end;

end.
