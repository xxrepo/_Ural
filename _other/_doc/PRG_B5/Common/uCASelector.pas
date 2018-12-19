unit uCASelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit,{$IFDEF VER150} Variants,{$ENDIF} CurrEdit,
  frGrp, comctrls, frCA, DB;
type

  TCASelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fCA1: TfCA;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure fCA1dsCAListDataChange(Sender: TObject; Field: TField);
    procedure fCA1dbgCADblClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  CASelector: TCASelector;
function ShowCASelector(var id_CA : integer; var AName : String): boolean;

implementation

uses foMyFunc, uDM;

{$R *.DFM}
function ShowCASelector(var id_CA : integer; var AName : String): boolean;
var F : TCASelector;
begin
  Result := false;
  F := TCASelector.Create(nil);
  try
    F.fCA1.pcCA.Visible := false;
   // F.fCA1.cdsCA.Filtered := true;
   // F.fCA1.cdsCA.Filter := 'isGrp=1';
  //  F.fCA1.fFindFirm1.cdsCAF.Filtered := true;
  //  F.fCA1.fFindFirm1.cdsCAF.Filter := 'isGrp=1';
    
    F.fCA1.initialize(-1, -1);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      id_CA := F.fCA1.dsCAList.DataSet.fieldByName('id_CA').AsInteger;
      AName := F.fCA1.dsCAList.DataSet.fieldByName('Name').AsString;
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TCASelector.FormShow(Sender: TObject);
begin
//  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TCASelector.FormDestroy(Sender: TObject);
begin
 // SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);
end;

procedure TCASelector.fCA1dsCAListDataChange(Sender: TObject;
  Field: TField);
begin
  fCA1.dsCAListDataChange(Sender, Field);
  btnOk.Enabled := not fCA1.dsCAList.DataSet.IsEmpty;
end;

procedure TCASelector.fCA1dbgCADblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 btnOk.Click;
end;

end.
