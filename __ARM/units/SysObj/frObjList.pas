unit frObjList;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, ImgList, ActnList, ToolWin, foMyFunc,
  Grids, BaseGrid, AdvGrid, DBGrids, RXDBCtrl, Db, RxMemDS, Provider,
  DBClient, RxLookup, registry, RXCtrls, Menus;

type
  TfObjList = class(TFrame)
    ActionList1: TActionList;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    ilEM: TImageList;
    ImageList: TImageList;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    mtXXX: TRxMemoryData;
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    mtType: TRxMemoryData;
    mtTypeIDType: TIntegerField;
    mtTypeName: TStringField;
    DataSetProvider1: TDataSetProvider;
    mtList: TClientDataSet;
    mtListNN2: TIntegerField;
    mtXXXID: TIntegerField;
    mtXXXName: TStringField;
    mtXXXIDType: TIntegerField;
    mtXXXTypeName: TStringField;
    mtListID: TIntegerField;
    mtListName: TStringField;
    mtListIDType: TIntegerField;
    mtListTypeName: TStringField;
    RxSpeedButton1: TRxSpeedButton;
    ToolButton5: TToolButton;
    PopupMenu1: TPopupMenu;
    Action1: TAction;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure mtXXXCalcFields(DataSet: TDataSet);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure MIClick(Sender: TObject);
  private
    FEObjTypes : TEObjTypes;
    Fid_Bsn: Variant;
    FSaveOnExit : boolean;
    FMaxCount : integer;
    
    function GetTypeName(AIDType : integer) : String;
    function DoSelectObjEvent(var AID: integer;
                               var AName: string;
                               ExtID : TEObjType;
                               id_Bsn: Variant) : boolean;
    procedure UnEdit(Aid: integer; IDType : TEObjType);
    function getObjCount: integer;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;

    procedure LoadFromReg;
    procedure SaveToReg;
    procedure Initialize(AEObjTypes : TEObjTypes; Aid_Bsn: Variant; AMaxCount : integer; ASaveOnExit : boolean);

    function GetIDList(AEObjType : TEObjType) : Variant;
    procedure AddID(AEObjType : TEObjType; AID : integer);
    function InList(AEObjType : TEObjType; AID : integer) : boolean;
    procedure AddParamBlnc(AParamBlnc: TParamBlnc);

    property ObjCount : integer read getObjCount;
  end;

implementation

uses uFormApi_CA, uWareCtgSelector, uLookUpSelector, uDM, uUnivSelector;

{$R *.DFM}

function TfObjList.DoSelectObjEvent(var AID: integer;
  var AName: string; ExtID : TEObjType;
  id_Bsn: Variant) : boolean;
var ASelectedObj : TSelectedObj;
    UnSel : boolean;
    xxx_id_Ctg : Variant;
begin
  if id_Bsn = Null then
    id_Bsn := -13;
  UnSel := false;
  ASelectedObj.ID := AID;
  case ExtID of
    eotFin, eotWH, eotManuf, eotRepr, eotGoods, eotCA:
    begin
      UnSel := true;
      ASelectedObj.ObjType := ExtID;
    end;
    eotCAGroup :
    begin
      Result := SelectCAGroup(id_Bsn, ASelectedObj.ID, ASelectedObj.Name, false, true, true);
      if Result then
      begin
        AID := ASelectedObj.ID;;
        AName := ASelectedObj.Name;
      end;
    end;
    eotGoodsGroup :
    begin
      xxx_id_Ctg := AID;
      Result := ShowWareCtgSelector(id_Bsn, xxx_id_Ctg, AName, false, false, -1, false);
      if Result then
        AID := xxx_id_Ctg;
    end;
    eotFinGroup, eotWHGroup, eotManufGroup :
    begin
      xxx_id_Ctg := AID;
      Result := SelectUnGroup(ExtID, id_Bsn, ASelectedObj.ID, ASelectedObj.Name, false, true);
      if Result then
      begin
        AID := ASelectedObj.ID;;
        AName := ASelectedObj.Name;
      end;
    end;
  end;
  if UnSel then
  begin
    Result := SelectObjUnBsn(Owner, id_Bsn, ASelectedObj, 0, [ASelectedObj.ObjType]);
    if Result then
    begin
      AID := ASelectedObj.ID;
      AName := ASelectedObj.Name;
    end;
  end;
end;

procedure TfObjList.UnEdit(Aid: integer; IDType : TEObjType);
var
    AName: string;
    OldID : integer;
begin
  OldID := Aid;
  if IDType = eotNone then
  begin
    if mtType.RecordCount = 1 then
      IDType := TEObjType(mtTypeIDType.AsInteger)
    else
      if ShowLookUpSelector(mtType, 'Выберите вид объекта', mtTypeIDType.FieldName, mtTypeName.FieldName, AID) then
        IDType := TEObjType(AID);
  end;
  
  if IDType <> eotNone then
  begin
    if DoSelectObjEvent(Aid, AName, IDType, Fid_Bsn) then
    begin
      with mtList do
      begin
        if not Locate('ID;IDType', VarArrayOf([AID, Integer(IDType)]), [loPartialKey]) then
        begin
          if OldID = -1 then
            Append
          else
            Edit;
          FieldByName('ID').AsInteger := AID;
          FieldByName('IDType').AsInteger := Integer(IDType);
          FieldByName('Name').AsString := AName;
          FieldByName('TypeName').AsString := GetTypeName(Integer(IDType));

          Post;
        end;
      end;
    end;
  end;
end;

procedure TfObjList.aEditExecute(Sender: TObject);
begin
  UnEdit(mtList.FieldByName('ID').AsInteger, TEObjType(mtType.FieldByName('IDType').AsInteger));
end;

procedure TfObjList.aDelExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить группу ' + mtListTypeName.AsString + ' "' + mtListName.AsString + '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    mtList.Delete;
  end;
end;

procedure TfObjList.aRefreshExecute(Sender: TObject);
begin
//*
end;

procedure TfObjList.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
 // Enabled := (Field <> nil) and not (Field is TBlobField);
//  ReOrderCDS(Field);
end;

procedure TfObjList.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
 // SortMarker := GetBtnSortMarker(Field);
end;

procedure TfObjList.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;

  if Column.Field = (Sender as TDBGrid).DataSource.DataSet.FieldByName('TypeName') then
  begin
    case TEObjType((Sender as TDBGrid).DataSource.DataSet.FieldByName('IDType').AsInteger) of
      eotFin, eotFinGroup : ImgIndex := 1;
      eotWH, eotWHGroup : ImgIndex := 2;
      eotCA, eotCAGroup : ImgIndex := 3;
      eotManuf, eotManufGroup : ImgIndex := 4;
      eotGoods, eotGoodsGroup : ImgIndex := 6;
      else
        ImgIndex := -1;
    end;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    ilEM.Draw(TDBGrid(Sender).Canvas, Rect.Left + 2, Rect.Top + 1, ImgIndex);
    R := Rect;
    R.Left := R.Left + ilEM.Width + 2;
    TDBGrid(Sender).DefaultDrawColumnCell(R, DataCol, Column, State);     
  end
  else
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);    
end;

constructor TfObjList.Create(AOwner: TComponent);
var TmpOwner: TCustomForm;
    FullRegPathName : String;
begin
  inherited;
  Fid_Bsn := -1;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin                    
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + Self.Name);
  end;
end;

destructor TfObjList.Destroy;
begin
  inherited;
end;

procedure TfObjList.SaveToReg;
var TmpOwner: TCustomForm;
    Reg : TRegistry;
    i,  IDType : integer;
    FullRegPathName : String;
begin
  TmpOwner := GetControlOwner(self);
  if (Fid_Bsn > 0) and (TmpOwner is TCustomForm) and (FSaveOnExit) then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + Self.Name);
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;

      FullRegPathName := SRegPath + '\' + TmpOwner.Name + Self.Name + IntToStr(Fid_Bsn);

      if Reg.OpenKey(FullRegPathName, false) then
        Reg.DeleteKey(FullRegPathName);
      if Reg.OpenKey(FullRegPathName, true) then
      begin
        i := 0;
        with mtList do
        begin
          First;
          while not Eof do
          begin
            Reg.WriteInteger('ID' + IntToStr(i), FieldByName('ID').AsInteger);
            Reg.WriteInteger('IDType' + IntToStr(i), FieldByName('IDType').AsInteger);
            Reg.WriteString('Name' + IntToStr(i), mtList.FieldByName('Name').AsString);

            Next;
            inc(i);
          end;
        end;
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
end;

procedure TfObjList.Initialize(AEObjTypes: TEObjTypes; Aid_Bsn: Variant; AMaxCount : integer; ASaveOnExit : boolean);
  procedure AddType(IDType : TEObjType; AName : String);
  var MI : TMenuItem;
  begin
    if IDType in FEObjTypes then
    begin
      with mtType do
      begin
        if not Active then
          Open;
        Append;
        FieldByName('IDType').AsInteger := Integer(IDType);
        FieldByName('Name').AsString := AName;
        Post;
        MI := TMenuItem.Create(Self);
        MI.Caption := AName;
        MI.Tag := Integer(IDType);
        MI.OnClick := MIClick;
        PopupMenu1.Items.Add(MI);
      end;
    end;
  end;
var TmpOwner: TCustomForm;
    Reg : TRegistry;
    i,  IDType : integer;
    FullRegPathName, S : String;
begin
  if (Fid_Bsn = Aid_Bsn) and (FEObjTypes = AEObjTypes) and RxSpeedButton1.Enabled then Exit;
  mtList.Close;
  mtType.Close;
  FMaxCount := AMaxCount;
  FEObjTypes := AEObjTypes;
  Fid_Bsn := Aid_Bsn;
  FSaveOnExit := ASaveOnExit;
  mtList.Open;
  PopupMenu1.Items.Clear;

  AddType(eotFin, 'Счет');
  AddType(eotFinGroup, 'Группа счетов');
  AddType(eotWH, 'Склад');
  AddType(eotWHGroup, 'Группа складов');
  AddType(eotManuf, 'Производство');
  AddType(eotManufGroup, 'Группа производств');
  AddType(eotCA, 'Контрагент');
  AddType(eotCAGroup, 'Группа контрагентов');
  AddType(eotGoods, 'Товар');
  AddType(eotGoodsGroup, 'Категория товаров');

  DataSource1.DataSet.Open;

 // aAdd.Enabled := (FEObjTypes <> []) and (Fid_Bsn > 0);
  RxSpeedButton1.Enabled := (FEObjTypes <> []) and (Fid_Bsn > 0);
end;

function TfObjList.GetTypeName(AIDType: integer): String;
begin
  Result := '';
  if mtType.Locate('IDType', AIDType, []) then
    Result := mtTypeName.AsString;
end;

procedure TfObjList.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  aDel.Enabled := not mtList.IsEmpty;
  aEdit.Enabled := not mtList.IsEmpty;
  RxSpeedButton1.Enabled := (mtList.RecordCount < FMaxCount) or (FMaxCount = -1);
end;

procedure TfObjList.mtXXXCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('NN').AsInteger := DataSet.RecNo;
end;

function TfObjList.GetIDList(AEObjType: TEObjType): Variant;
var S : String;
    OldRecNo : integer;
begin
  S := '';
  Result := Null;
  with mtList do
  begin
    if not Active then
      Exit;
    DisableControls;
    try
      OldRecNo := RecNo;
      First;
      while not Eof do
      begin
        if AEObjType = TEObjType(mtListIDType.AsInteger) then
        begin
          if S <> '' then
            S := S + ',';
          S := S + mtListID.AsString;
        end;
        Next;
      end;
    finally
      RecNo := OldRecNo;
      EnableControls;
    end;
  end;
  if S <> '' then
    Result := S;
end;

procedure TfObjList.AddID(AEObjType: TEObjType; AID: integer);
var S : String;
begin
  with mtList do
  begin
    if not Active then
      Open;
    First;
    while not Eof do
    begin
      if (AEObjType = TEObjType(mtListIDType.AsInteger)) and (AID = mtListID.AsInteger) then
        Exit;
      Next;
    end;

    case AEObjType of
      eotFin :
      begin
        S := DM.rsCA.appserver.GetAccName(AID);
      end;
      eotFinGroup :
      begin
        S := DM.rsCA.appserver.GetAccGroupName(AID);
      end;
      eotWH :
      begin
        S := DM.rsCA.appserver.GetWHName(AID);
      end;
      eotWHGroup :
      begin
        S := DM.rsCA.appserver.GetWHGroupName(AID);
      end;
      eotCA :
      begin
        S := DM.rsCA.appserver.GetCAName(AID);
      end;
      eotCAGroup :
      begin
        S := DM.rsCA.appserver.GetCAGroupName(AID);
      end;
    end;
    if S <> '' then
    begin
      Append;
      FieldByName('ID').AsInteger := AID;
      FieldByName('IDType').AsInteger := integer(AEObjType);
      FieldByName('TypeName').AsString := GetTypeName(integer(AEObjType));
      FieldByName('Name').AsString := S;
      Post;
    end;
  end;
end;

procedure TfObjList.AddParamBlnc(AParamBlnc: TParamBlnc);
begin
  Fid_Bsn := AParamBlnc.id_business;
  if AParamBlnc.id_Acc <> Null then
    AddID(eotFin, AParamBlnc.id_Acc);
  if AParamBlnc.id_AccGroup <> Null then
    AddID(eotFinGroup, AParamBlnc.id_AccGroup);
  if AParamBlnc.id_Warehouse <> Null then
    AddID(eotWH, AParamBlnc.id_Warehouse);
  if AParamBlnc.id_WarehouseGroup <> Null then
    AddID(eotWHGroup, AParamBlnc.id_WarehouseGroup);
  if AParamBlnc.id_ContrAgent <> Null then
    AddID(eotCA, AParamBlnc.id_ContrAgent);
  if AParamBlnc.id_CAGroup <> Null then
    AddID(eotCAGroup, AParamBlnc.id_CAGroup);
end;

function TfObjList.getObjCount: integer;
begin
  if not mtList.Active then
    Result := 0
  else
    Result := mtList.RecordCount;
end;

procedure TfObjList.LoadFromReg;
var TmpOwner: TCustomForm;
    Reg : TRegistry;
    i,  IDType : integer;
    FullRegPathName, S : String;
begin
  TmpOwner := GetControlOwner(self);
  if (Fid_Bsn > 0) and (mtList.IsEmpty) and (TmpOwner is TCustomForm) and (FSaveOnExit) then
  begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      FullRegPathName := SRegPath + '\' + TmpOwner.Name + Self.Name + IntToStr(Fid_Bsn);
      
      if Reg.OpenKey(FullRegPathName, false) then
      begin
        i := 0;
        with mtList do
        begin
          while true do
          begin
            if Reg.ValueExists('ID' + IntToStr(i)) then
            begin
              IDType := Reg.ReadInteger('IDType' + IntToStr(i));
              S := GetTypeName(IDType);
              if S <> '' then
              begin
                Append;
                FieldByName('ID').AsInteger := Reg.ReadInteger('ID' + IntToStr(i));
                FieldByName('IDType').AsInteger := IDType;
                FieldByName('TypeName').AsString := GetTypeName(IDType);
                FieldByName('Name').AsString := Reg.ReadString('Name' + IntToStr(i));

                Post;
              end;
            end
            else
              Break;
            inc(i);
          end;
        end;
      end
      else
      begin
        mtList.Close;
        mtList.Open;
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
end;

procedure TfObjList.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEdit.Execute;
end;

procedure TfObjList.MIClick(Sender: TObject);
begin
  try
    Enabled := false;
    UnEdit(-1, TEObjType((Sender as TMenuItem).Tag));
  finally
    Enabled := true;
  end;
end;

function TfObjList.InList(AEObjType: TEObjType; AID: integer): boolean;
begin
  Result := false;
  with mtList do
  begin
    if not Active then
      Open;
    First;
    while not Eof do
    begin
      if (AEObjType = TEObjType(mtListIDType.AsInteger)) and (AID = mtListID.AsInteger) then
      begin
        Result := true;
        Exit;
      end;
      Next;
    end;
  end;
end;

end.
