unit uUnSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit,{$IFDEF VER150} Variants,{$ENDIF} CurrEdit,
  comctrls, foMyFunc, frUnDict, Db, DBClient, Buttons, sSpeedButton,
  ToolWin, sToolBar, uDM;

type
  
  TUnSelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fUnDict1: TfUnDict;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure fGrp1OrgTreeViewDblClick(Sender: TObject);
    procedure fUnDict1dsObjGetListDataChange(Sender: TObject;
      Field: TField);
  private
    FSelType : boolean;
  public
  end;

var
  UnSelector: TUnSelector;
function ShowUnSelector(var ASelectedObj : TSelectedObj; ExclIDS : ExclList): boolean;

implementation



{$R *.DFM}
function ShowUnSelector(var ASelectedObj : TSelectedObj; ExclIDS : ExclList): boolean;
var F : TUnSelector;
    ExtId, i : integer;
begin
  Result := false;
  F := TUnSelector.Create(nil);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);

    F.fUnDict1.ToolBar1.ButtonHeight := 22;
    F.fUnDict1.ToolBar1.ShowCaptions := false;

    for i := 0 to F.fUnDict1.ToolBar1.ButtonCount - 1 do
      if TObject(F.fUnDict1.ToolBar1.Buttons[i]) is TsSpeedButton then
      begin
        TsSpeedButton(F.fUnDict1.ToolBar1.Buttons[i]).ShowCaption := false;
        TsSpeedButton(F.fUnDict1.ToolBar1.Buttons[i]).Height := 22;
      end;
    F.fUnDict1.ToolBar1.Height := 28;

    
    ExtId := DM.GetExtIdByType(ASelectedObj.ObjType);

    F.fUnDict1.ExclIDS := ExclIDS;
    
    F.fUnDict1.Initialize(ASelectedObj.ID, ExtId);
    F.fUnDict1.sPanel1.Visible := false;
    F.fUnDict1.sSplitter1.Visible := false;
    //F.fUnDict1.ID_Obj := ASelectedObj.ID; 
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      ASelectedObj.ID := F.fUnDict1.ID_Obj;
      ASelectedObj.Name := F.fUnDict1.ObjName;
 
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TUnSelector.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TUnSelector.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TUnSelector.fGrp1OrgTreeViewDblClick(Sender: TObject);
begin
  if btnOk.Enabled then btnOk.Click;
end;

procedure TUnSelector.fUnDict1dsObjGetListDataChange(Sender: TObject;
  Field: TField);
begin
  fUnDict1.dsObjGetListDataChange(Sender, Field);
  btnOk.Enabled := not fUnDict1.dsObjGetList.DataSet.IsEmpty;
end;

end.

