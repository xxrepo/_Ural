unit uFltPropSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, UniverseFilterTree, db, UniverseFilter, comctrls;

type
  TFltPropSelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    Button1: TButton;
    UFTree1: TUFTree;
    procedure UFTree1ObjViewChange(Sender: TObject; Node: TTreeNode);
  private
    FDigit, FDate, FText, FObj : boolean;
  public
    function initialize(AConnection : TCustomConnection;
                        AUniverseID : integer; id_user : integer;
                        Aid_business : integer;
                        AOwner : TComponent;
                        ATaskMaster : TTaskMasterClass;
                        ADigit : boolean;
                        ADate : boolean;
                        AText : boolean;
                        AObj : boolean): boolean;
  end;

var
  FltPropSelector: TFltPropSelector;
  
function ShowFltPropSelector(AConnection : TCustomConnection;
                 AUniverseID : integer; id_user : integer; Aid_business : integer;
                 AOwner : TComponent;
                 ATaskMaster : TTaskMasterClass;
                 var ID_Obj : Variant;
                 var ID_Prop : Variant;
                 var ID_Rel: Variant;
                 var DType : TUFType;
                 ADigit : boolean = true;
                 ADate : boolean = true;
                 AText : boolean = true;
                 AObj : boolean = true): boolean;

implementation

{$R *.DFM}

function ShowFltPropSelector(AConnection : TCustomConnection;
                 AUniverseID : integer; id_user : integer; Aid_business : integer;
                 AOwner : TComponent;
                 ATaskMaster : TTaskMasterClass;
                 var ID_Obj : Variant;
                 var ID_Prop : Variant;
                 var ID_Rel: Variant;
                 var DType : TUFType;
                 ADigit : boolean = true;
                 ADate : boolean = true;
                 AText : boolean = true;
                 AObj : boolean = true): boolean;
var F : TFltPropSelector;
    i : integer;
    FilterData : TFilterData;
    SelObj : TUFDBObj;
begin
  Result := false;
  F := TFltPropSelector.Create(AOwner);
  try
    if AOwner is TWinControl then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, TWinControl(AOwner).Handle);
    F.initialize(AConnection, AUniverseID, id_user, Aid_business, AOwner, ATaskMaster, ADigit, ADate, AText, AObj);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := true;
      SelObj := TUFDBObj(F.UFTree1.ObjView.Selected.Data);
      ID_Prop := SelObj.Un_id_Prop;
      ID_Obj := SelObj.Un_id_Obj;
      ID_Rel := SelObj.Un_id_Rel;
      DType := SelObj.DType;
    end;
  finally
    F.Free;
  end;
end;

{ TFltPropSelector }

function TFltPropSelector.initialize(AConnection : TCustomConnection;
                        AUniverseID : integer; id_user : integer;
                        Aid_business : integer;
                        AOwner : TComponent;
                        ATaskMaster : TTaskMasterClass;
                        ADigit : boolean;
                        ADate : boolean;
                        AText : boolean;
                        AObj : boolean): boolean;
begin
  FDigit := ADigit;
  FDate := ADate;
  FText := AText;
  FObj := AObj;
  UFTree1.initialize(AConnection, AUniverseID, id_user, Aid_business, ATaskMaster);
end;

procedure TFltPropSelector.UFTree1ObjViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  Button1.Enabled := (Node <> nil) and
                     ((TObject(Node.Data) is TPropData) and
                     (
                       ((TPropData(Node.Data).DType in [uftInt, uftFloat]) and FDigit) or
                       ((TPropData(Node.Data).DType = uftDate) and FDate) or
                       ((TPropData(Node.Data).DType = uftStr) and FText)
                     )
                     and not(TPropData(Node.Data).FObjData.Un_isDetail)
                     or
                     (
                     (TObject(Node.Data) is TObjData) and
                     FObj and
                     (not TObjData(Node.Data).Un_isDetail) and
                     (not TObjData(Node.Data).Un_isExtParam))
                     );

end;

end.
