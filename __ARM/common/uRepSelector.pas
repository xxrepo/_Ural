unit uRepSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,
  foMyFunc, frRepSelector;

type
  TRepSelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    Button1: TButton;
    fRepSelector1: TfRepSelector;
    procedure Button1Click(Sender: TObject);
  private
    FSelectedObj : TSelectedObj;
    FDisabled : Variant;
    FEObjTypes: TEObjTypes;
    FUIN : Variant;
    Fid_Bsn : Variant;
  public
    procedure Initialize(ID_Repr : integer; AID : Variant);
  end;

var
  RepSelector: TRepSelector;

function SelectRep(const AHandle : HWnd; UIN : Variant; id_Bsn : Variant;
                   var ASelectedObj : TSelectedObj; Disabled : Variant; AEObjTypes: TEObjTypes;
                   id_Rep : Variant) : boolean;

implementation

uses uUnivSelector;

{$R *.DFM}

function SelectRep(const AHandle : HWnd; UIN : Variant; id_Bsn : Variant;
                   var ASelectedObj : TSelectedObj; Disabled : Variant; AEObjTypes: TEObjTypes;
                   id_Rep : Variant) : boolean;
var F : TRepSelector;
begin
  Result := false;
  F := TRepSelector.Create(nil);
  try
    if AHandle > 0 then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, AHandle);
    F.FSelectedObj := ASelectedObj;
    F.FDisabled := Disabled;
    F.FEObjTypes := AEObjTypes;
    F.FUIN := UIN;
    F.Fid_Bsn := id_Bsn;

    F.Initialize(ASelectedObj.ID, id_Rep);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      ASelectedObj.ObjType := eotRepr;
      ASelectedObj.ID := F.fRepSelector1.cdsReprSelectorid_Repr.AsInteger;
      ASelectedObj.Name := F.fRepSelector1.cdsReprSelectorName.AsString;
      ASelectedObj.CA_Name := F.fRepSelector1.cdsReprSelectorCAName.AsString;
      ASelectedObj.CA_ID := F.fRepSelector1.cdsReprSelectorid_ContrAgent.AsInteger;

      ASelectedObj.Bsn_id  := F.fRepSelector1.cdsReprSelectorid_Bsn.AsInteger;
      ASelectedObj.Bsn_Name := F.fRepSelector1.cdsReprSelectorBsnName.AsString;
    end
    else
      if F.ModalResult = mrYes then
        ASelectedObj := F.FSelectedObj;  
    
    Result := (F.ModalResult = mrOk) or (F.ModalResult = mrYes) ;
  finally
    F.Free;
  end;
end;


{ TRepSelector }

procedure TRepSelector.Initialize(ID_Repr: integer; AID : Variant);
begin
  fRepSelector1.Initialize(ID_Repr, AID);
end;

procedure TRepSelector.Button1Click(Sender: TObject);
var R : boolean;
begin
  if FUIN <> Null then
    R := SelectObjUn(Self, FUIN, FSelectedObj, FDisabled, FEObjTypes)
  else
    R := SelectObjUnBsn(Self, Fid_Bsn, FSelectedObj, FDisabled, FEObjTypes);
    
  if R then
    ModalResult := mrYes;
end;

end.
