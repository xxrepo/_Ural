unit uReLink;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,
  foMyFunc, Buttons, Mask, DBCtrls;

type
  TReLink = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    BitBtn3: TBitBtn;
    edNew: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn3Click(Sender: TObject);
  private
    FSelectedObj : TSelectedObj;
    FEObjType: TEObjType;
  public
    function DoReLink(ID : integer; AName : String; AEObjType : TEObjType) : boolean;
  end;

var
  ReLink: TReLink;

    function DoReLink(ID : integer; AName : String; AEObjType : TEObjType) : boolean;
implementation

uses uDM, uUnivSelector;

{$R *.DFM}

function DoReLink(ID : integer; AName : String; AEObjType : TEObjType) : boolean;
var F : TReLink;
    FID_Old, FID_New : integer;
begin
  Result := false;
  F := TReLink.Create(nil);
  try
    FID_Old := ID;
    F.DoReLink(ID, AName, AEObjType);
    F.ShowModal;
                                  
    if F.ModalResult = mrOk then
    begin
      FID_New := F.FSelectedObj.ID;
      if FID_Old <> FID_New then
      begin
        case AEObjType of
          eotFin : Result := DM.rsCA.AppServer.LNK_Acc(FID_Old, FID_New);
        //  3 : AEObjType := eotEQ;
          eotWH : Result := DM.rsCA.AppServer.LNK_Warehouse(FID_Old, FID_New);
          eotRepr : Result := DM.rsCA.AppServer.LNK_Repr(FID_Old, FID_New);
          eotManuf : Result := DM.rsCA.AppServer.LNK_Manufact(FID_Old, FID_New);
          eotGoods : Result := DM.rsCA.AppServer.LNK_Goods(FID_Old, FID_New);
        end;

      end;
    end;
  finally
    F.Free;
  end;
end;

{ TReLink }

function TReLink.DoReLink(ID: integer; AName: String; AEObjType: TEObjType): boolean;
begin
  FEObjType := AEObjType;
  FSelectedObj.ID := ID;
  FSelectedObj.Name := AName;

  edNew.Text := FSelectedObj.Name;
  Edit2.Text := FSelectedObj.Name;
end;
procedure TReLink.BitBtn3Click(Sender: TObject);
var Need : TEObjTypes;
begin
  Need := [FEObjType];
  FSelectedObj.ObjType := FEObjType;
  if SelectObjUn(Self, Null, FSelectedObj, 0, Need) then
  begin
    edNew.Text := FSelectedObj.Name;
  end;
end;

end.
