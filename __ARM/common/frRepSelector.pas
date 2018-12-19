unit frRepSelector;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, Db, DBClient, Menus, ActnList, ComCtrls,
  ToolWin;

type
  TfRepSelector = class(TFrame)
    cdsReprSelector: TClientDataSet;
    dsCAgent: TDataSource;
    RxDBGrid1: TRxDBGrid;
    cdsReprSelectorid_Repr: TAutoIncField;
    cdsReprSelectorid_ContrAgent: TIntegerField;
    cdsReprSelectorisJur: TBooleanField;
    cdsReprSelectorDisabled: TBooleanField;
    cdsReprSelectorName: TStringField;
    cdsReprSelectorCAName: TStringField;
    ActionList1: TActionList;
    aNew: TAction;
    aProperty: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    aRefreshe: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    cdsReprSelectorid_Bsn: TIntegerField;
    cdsReprSelectorBsnName: TStringField;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure dsCAgentDataChange(Sender: TObject; Field: TField);
    procedure aNewExecute(Sender: TObject);
    procedure aPropertyExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Initialize(ID_Repr : integer; AID : Variant);

    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses foMyFunc, uFormApi_CA, uDM;

{$R *.DFM}

procedure TfRepSelector.Initialize(ID_Repr: integer; AID : Variant);
begin
  with cdsReprSelector do
  begin
    Close;
    Params.ParamByName('@id_Repr').Value := ID_Repr;
    Open;
    Locate('id_Repr', AID, []);
  end;
end;

procedure TfRepSelector.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfRepSelector.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfRepSelector.dsCAgentDataChange(Sender: TObject; Field: TField);
begin
  aProperty.Enabled := not (Sender as TDataSource).DataSet.IsEmpty;
end;

procedure TfRepSelector.aNewExecute(Sender: TObject);
var ID, ID2 : Variant;
    isOwn : boolean;
begin
  ID := -1;
  ID2 := Null;

  if EditReprProp(ID, ID2, Null) then
  begin
    with cdsReprSelector do
    begin
      Close;
      Open;
      Locate('id_Repr', ID, []);
    end;
  end;
end;

procedure TfRepSelector.aPropertyExecute(Sender: TObject);
var ID, ID2 : Variant;
    isOwn : boolean;
begin
  ID :=  cdsReprSelectorid_Repr.AsInteger;
  ID2 := cdsReprSelectorid_ContrAgent.AsInteger;

  if EditReprProp(ID, ID2, Null) then
  begin
    aRefreshe.Execute;
  end;
end;

procedure TfRepSelector.aRefresheExecute(Sender: TObject);
var OldID : integer;
begin
  OldID := cdsReprSelectorid_Repr.AsInteger;
  try
    with cdsReprSelector do
    begin
      Close;
      Open;
      Locate('id_Repr', OldID, []);
    end;
  finally

  end;
end;

constructor TfRepSelector.Create(AOwner: TComponent);
begin
  inherited;
  if Owner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
end;

destructor TfRepSelector.Destroy;
begin
  if Owner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
  inherited;

end;

end.
