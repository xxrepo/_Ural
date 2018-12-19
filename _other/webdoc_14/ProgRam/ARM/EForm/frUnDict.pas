unit frUnDict;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Db, DBGrids, RXDBCtrl, ComCtrls, ToolWin, Menus, AdvMenus,  ActnList, ImgList,
  DBClient, Provider, ADODB, StdCtrls, Mask, ToolEdit, MtUPDPrv,
  GridsEh, DBGridEh, sToolBar, sFrameAdapter, Buttons,
  sSpeedButton, ExtCtrls, sSplitter, sPanel, frCAInfo, sPageControl, Clipbrd,
  frFiles, sEdit, uDM, sLabel, sButton;

type
  TfUnDict = class(TFrame)
    ActionList1: TActionList;
    aNewObj: TAction;
    aEditObj: TAction;
    aDelObj: TAction;
    aRefresh: TAction;
    dsObjGetList: TDataSource;
    cdsObjGetList: TClientDataSet;
    DBGridEh1: TDBGridEh;
    pmUnDic: TPopupMenu;
    cdsObjGetListid_Obj: TAutoIncField;
    cdsObjGetListid_NS: TIntegerField;
    cdsObjGetListPID: TIntegerField;
    cdsObjGetListid_ObjType: TIntegerField;
    cdsObjGetListObjName: TStringField;
    cdsObjGetListFileName: TStringField;
    cdsObjGetListDeleted: TBooleanField;
    cdsObjGetListDateStart: TDateTimeField;
    cdsObjGetListDateStop: TDateTimeField;
    cdsObjGetListisDef: TBooleanField;
    cdsObjGetListPName: TStringField;
    sFrameAdapter1: TsFrameAdapter;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    cdsObjGetListisBayer: TBooleanField;
    cdsObjGetListisSeller: TBooleanField;
    cdsObjGetListWorkType: TStringField;
    cdsObjGetListRealWorkType: TStringField;
    cdsObjGetListisBayerStr: TStringField;
    cdsObjGetListisSellerStr: TStringField;
    cdsObjGetListisUsedStr: TStringField;
    sPanel1: TsPanel;
    sSplitter1: TsSplitter;
    cdsObjGetListEmailList: TStringField;
    sPageControl1: TsPageControl;
    tsInfo: TsTabSheet;
    tsFiles: TsTabSheet;
    fCAInfo1: TfCAInfo;
    fFiles1: TfFiles;
    Timer1: TTimer;
    sPanel2: TsPanel;
    sLabel1: TsLabel;
    FilterEdit: TsEdit;
    aCopy: TAction;
    N4: TMenuItem;
    ToolBar1: TsToolBar;
    sSpeedButton7: TsSpeedButton;
    sSpeedButton9: TsSpeedButton;
    sSpeedButton10: TsSpeedButton;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    btnName: TsButton;
    procedure aDelObjExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aNewObjExecute(Sender: TObject);
    procedure aEditObjExecute(Sender: TObject);
    procedure dsObjGetListDataChange(Sender: TObject; Field: TField);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure sPageControl1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FilterEditChange(Sender: TObject);
    procedure cdsObjGetListFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure aCopyExecute(Sender: TObject);
    procedure btnNameClick(Sender: TObject);
    procedure cdsObjGetListAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FID, Val, Fid_NS: Variant;
    BaseCurrencyName : string;
    FExtID : integer;
    function GetObjName: String;
    function Getid_Obj: integer;
    procedure SetID_Obj(const Value: integer);
    procedure GetInfo;
  public
    ExclIDS : ExclList;
    constructor Create(AOwner: TComponent; ExtID : integer); overload; //override;
    destructor Destroy; override;
    procedure RefrNS;
    procedure Initialize(ID : Variant; ExtID : integer = -1);
    property ID_Obj : integer read GetID_Obj write SetID_Obj;
    property ObjName : String read GetObjName;
    procedure DoRefrMsg2(var Msg: TMessage); message xxx_WD_RefrMsg;
  end;

var
  fUnDict: TfUnDict;

implementation

{$R *.DFM}

uses
  uObjProp, foMyFuncEh, foMyFunc;

procedure TfUnDict.aDelObjExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить ' + cdsObjGetListObjName.AsString + '?'), 'Внимание', mb_OkCancel)=mrOk then
    if DM.rsCA.AppServer.ObjDel(cdsObjGetListid_Obj.AsInteger) = 1  then
      cdsObjGetList.Delete;
end;

procedure TfUnDict.aRefreshExecute(Sender: TObject);
begin
  Fid_NS := DM.id_NS;
  cdsObjGetList.Params.ParamByName('@ExtID').Value := FExtID;
  cdsObjGetList.Params.ParamByName('@id_NS').Value := Fid_NS;
//  cdsObjGetList.Open;
  FixIdRefresh(cdsObjGetList, 'id_Obj');
end;

procedure TfUnDict.aNewObjExecute(Sender: TObject);
var AID: integer;
begin
  AID := -1;
  ShowObjProp_Adv(AID, FExtID, Handle, false);
 { if EditObjProp(AID, FExtID) then
  begin
    cdsObjGetList.Close;
    cdsObjGetList.Open;
    cdsObjGetList.Locate('id_Obj', AID, []);
  end; }
end;

procedure TfUnDict.aEditObjExecute(Sender: TObject);
var AID: integer;
begin
  AID := cdsObjGetListid_Obj.AsInteger;
  ShowObjProp_Adv(AID, FExtID, Handle, false);
{  if EditObjProp(AID, FExtID) then
  begin
    cdsObjGetList.Close;
    cdsObjGetList.Open;
    cdsObjGetList.Locate('id_Obj', AID, [loCaseInsensitive, loPartialKey]);
  end;    }
end;

constructor TfUnDict.Create(AOwner: TComponent; ExtID : integer);
begin
  inherited Create(AOwner);
  sPageControl1.ActivePage := tsInfo;
  Fid_NS := DM.id_NS;
  FExtID := ExtID;
  Initialize(Null);
  LoadEhGridSettingsFromRegistry(DBGridEh1, SRegPath + '\' + GetControlOwner(Self).ClassName + '\' + ClassName + 'a' + IntToStr(FExtID));
  LoadSplitterSettingsFromRegistry(sSplitter1, SRegPath + '\' + GetControlOwner(Self).ClassName + '\' + ClassName + 'sSplitter1');

  fCAInfo1.fUnDict := Self;
end;

destructor TfUnDict.Destroy;
begin
  SaveEhGridSettingsToRegistry(DBGridEh1, SRegPath + '\' + GetControlOwner(Self).ClassName + '\' + ClassName + 'a' + IntToStr(FExtID));
  SaveSplitterSettingsFromRegistry(sSplitter1, SRegPath + '\' + GetControlOwner(Self).ClassName + '\' + ClassName + 'sSplitter1');
  inherited;

end;

function TfUnDict.GetObjName: String;
begin
  Result := cdsObjGetListObjName.AsString;
end;

function TfUnDict.Getid_Obj: integer;
begin
  if cdsObjGetList.IsEmpty then
    Result := -1
  else
    Result := cdsObjGetListid_Obj.AsInteger;
end;

procedure TfUnDict.Initialize(ID : Variant; ExtID : integer );
var i : integer;
begin
  FID := ID;
  if ExtID <> -1 then FExtID := ExtID;
  
  for i:=0 to ActionList1.ActionCount-1 do
    (ActionList1.Actions[i] as TAction).Hint:=
      (ActionList1.Actions[i] as TAction).Caption;

  aRefresh.Execute;

  if FExtID = 300 then
  begin
    sPanel1.Visible := true;
    
    for i := 0 to DBGridEh1.Columns.Count - 1 do
    begin
    {  if (DBGridEh1.Columns[i].Field = cdsObjGetListPName)
          or (DBGridEh1.Columns[i].Field = cdsObjGetListDateStart)
          or (DBGridEh1.Columns[i].Field = cdsObjGetListDateStop) then }
       DBGridEh1.Columns[i].Visible := true;
    end;
  end;
  if High(ExclIDS) > 0 then
  begin
    for i := 0 to High(ExclIDS) do
      if FID <> ExclIDS[i] then
        if cdsObjGetList.Locate('id_Obj', ExclIDS[i], [loCaseInsensitive, loPartialKey]) then
          cdsObjGetList.Delete;
    cdsObjGetList.First;
    cdsObjGetList.Locate('id_Obj', FID, [loCaseInsensitive, loPartialKey]);
  end;
end;

procedure TfUnDict.dsObjGetListDataChange(Sender: TObject;
  Field: TField);
begin
  aCopy.Enabled := not cdsObjGetList.IsEmpty;
  aEditObj.Enabled := not cdsObjGetList.IsEmpty;
  aDelObj.Enabled := not cdsObjGetList.IsEmpty;

  Timer1.Enabled := false;
  if FExtID = 300 then
    Timer1.Enabled := sPanel1.Visible and aEditObj.Enabled;

end;

procedure TfUnDict.DBGridEh1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGridEh(Sender).ScreenToClient(P);
  if P.y <= THackGridEh(Sender).RowHeights[0] then
    Exit;
  aEditObj.Execute;
end;

procedure TfUnDict.SetID_Obj(const Value: integer);
begin
  try
    cdsObjGetList.Locate('id_Obj', Value, [loCaseInsensitive, loPartialKey]);
  except
    Tag := 0;
  end;
end;

procedure TfUnDict.RefrNS;
begin
  if Fid_NS <> DM.id_NS then
    aRefresh.Execute;
end;

procedure TfUnDict.sPageControl1Change(Sender: TObject);
begin
  GetInfo;
end;

procedure TfUnDict.GetInfo;
begin
  if not cdsObjGetList.Active then Exit;
  
  if sPageControl1.ActivePage = tsInfo then
  begin
      fCAInfo1.Initialize(cdsObjGetListid_Obj.AsInteger)
  end
  else
  if sPageControl1.ActivePage = tsFiles then
  begin
    fFiles1.Init(false, cdsObjGetListid_Obj.AsString, Null);
  end
end;

procedure TfUnDict.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  GetInfo;
end;

procedure TfUnDict.FilterEditChange(Sender: TObject);
begin
  with cdsObjGetList   do
  begin
    DisableControls;
    try
      Filtered := False;
      FilterOptions := [foCaseInsensitive];
      Filtered := Trim(FilterEdit.Text) <> '';
    finally
      EnableControls;
    end;
  end;
end;

procedure TfUnDict.cdsObjGetListFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var S : String;
begin
  S := AnsiUpperCase(Trim(FilterEdit.Text));
  with DataSet  do
    Accept := (S = '') or (Pos(S, AnsiUpperCase(cdsObjGetListObjName.AsString)) > 0)
     or (Pos(S, AnsiUpperCase(cdsObjGetListFileName.AsString)) > 0)
     or (Pos(S, AnsiUpperCase(cdsObjGetListWorkType.AsString)) > 0)
     or (Pos(S, AnsiUpperCase(cdsObjGetListRealWorkType.AsString)) > 0)
     or (Pos(S, AnsiUpperCase(cdsObjGetListPName.AsString)) > 0);
end;

procedure TfUnDict.aCopyExecute(Sender: TObject);
var AID: integer;
begin
  AID := cdsObjGetListid_Obj.AsInteger;
  ShowObjProp_Adv(AID, FExtID, Handle, true);

end;

procedure TfUnDict.DoRefrMsg2(var Msg: TMessage);
begin
  FixIdRefresh(cdsObjGetList, 'id_Obj', Msg.WParam);

end;

procedure TfUnDict.btnNameClick(Sender: TObject);
begin
  FilterEdit.Text := clipBoard.AsText;
end;

procedure TfUnDict.cdsObjGetListAfterOpen(DataSet: TDataSet);
begin
  tag := 0;
end;

end.
