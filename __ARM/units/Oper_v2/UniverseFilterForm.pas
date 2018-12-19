unit UniverseFilterForm;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ExtCtrls, ToolWin, StdCtrls, Grids, RXGrids, RXCtrls,
  Db, dbclient, mconnect, StrUtils, ToolEdit, CurrEdit,
  Menus,
  UniverseFilter, ActnList, Mask, Buttons,
  contnrs, frArc, registry, frBsnSelector, DBGrids,
  RXDBCtrl, inifiles, DBGridEh, RxMemDS, Provider, dxCntner, dxTL,
  dxDBCtrl, dxDBGrid, dxGrClms, dxTLClms, dxDBTLCl, dxDBTL, foMyFunc,
  frFltTree

;

const WM_RefrList = WM_User + 2356;
const  xxxSRegPath = '\SOFTWARE\FO\EMng2';

type
  THackdxDBGrid = class(TdxDBGrid)
    procedure BeginLayout;
    procedure EndLayout;  
  end;

  TDataObj = class
    ValList : TVariantList;
    constructor Create;
    destructor Destroy;
  end;

  TUFForm = class(TForm)
    ImgList: TImageList;
    Panel2: TPanel;
    btnCancel: TButton;
    Panel4: TPanel;
    Label2: TLabel;
    edName: TEdit;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    tsDataPg: TTabSheet;
    fBsnSelector1: TfBsnSelector;
    tsFlrPg: TTabSheet;
    ActionList1: TActionList;
    aNew: TAction;
    aEdit: TAction;
    aDel: TAction;
    ToolBar1: TToolBar;
    ToolButton4: TToolButton;
    SpeedButton2: TSpeedButton;
    cdsCondList2: TClientDataSet;
    cdsCondList2CondNum: TIntegerField;
    WorkDS: TClientDataSet;
    cdsCondList2RNum: TIntegerField;
    aCopy: TAction;
    cdsData: TClientDataSet;
    aLoad: TAction;
    aSave: TAction;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    DrawGrid1: TDrawGrid;
    ToolBar2: TToolBar;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton17: TToolButton;
    aAddGrp: TAction;
    aDelGrp: TAction;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    Panel3: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    RxSpeedButton2: TRxSpeedButton;
    GroupBox3: TGroupBox;
    Panel5: TPanel;
    cdsAggs: TClientDataSet;
    cdsAggsid_Aggs: TAutoIncField;
    cdsAggsid_Filter: TIntegerField;
    cdsAggsid_Prop: TIntegerField;
    cdsAggsAggCode: TIntegerField;
    cdsGrp2: TClientDataSet;
    cdsGrp2id_Filter: TIntegerField;
    cdsGrp2id_Prop: TIntegerField;
    DBGrid1: TDBGrid;
    dsGrp: TDataSource;
    cdsGrp2GrpText: TStringField;
    cdsGrp2id_Obj: TIntegerField;
    aUpGrp: TAction;
    aDownGrp: TAction;
    ToolBar3: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    aAddAgg: TAction;
    aDelAgg: TAction;
    cdsAggsAggText: TStringField;
    GroupBox4: TGroupBox;
    Panel6: TPanel;
    ToolBar4: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    dsAggs: TDataSource;
    mtAggDic: TRxMemoryData;
    cdsAggsCondName: TStringField;
    DBGrid2: TDBGrid;
    Button121: TButton;
    cdsGrp2id_Rel: TIntegerField;
    cdsGrp2id_RelParent: TIntegerField;
    cdsGrp2RelField: TStringField;
    cdsGrp2KeyField: TStringField;
    cdsGrp2TableName: TStringField;
    cdsGrp2FieldName: TStringField;
    cdsAggsid_Rel: TIntegerField;
    cdsAggsid_RelParent: TIntegerField;
    cdsAggsTableName: TStringField;
    cdsAggsRelField: TStringField;
    cdsAggsKeyField: TStringField;
    cdsAggsFieldName: TStringField;
    Memo1: TMemo;
    cdsGrp2ObjNameField: TStringField;
    cdsGrp: TRxMemoryData;
    Button1: TButton;
    cdsGetDataTree: TClientDataSet;
    cdsCond: TClientDataSet;
    cdsCondid_Filter: TIntegerField;
    cdsCondid_Prop: TIntegerField;
    cdsCondid_Rel: TIntegerField;
    cdsCondCondCode: TIntegerField;
    cdsCondPar1: TStringField;
    cdsCondPar2: TStringField;
    cdsCondid_Cond: TAutoIncField;
    cdsCondid_Obj: TIntegerField;
    cdsCondCondNum: TIntegerField;
    DataSource1: TDataSource;
    ilEM: TImageList;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton18: TToolButton;
    fFltTree1: TfFltTree;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure ertyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action1Execute(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aNewExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure cdsCondCalcFields(DataSet: TDataSet);
    procedure cdsCondList2CalcFields(DataSet: TDataSet);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure aCopyExecute(Sender: TObject);
    procedure DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure DrawGrid1DblClick(Sender: TObject);
    procedure DrawGrid1Click(Sender: TObject);
    procedure aLoadExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure aAddGrpExecute(Sender: TObject);
    procedure aDelGrpExecute(Sender: TObject);
    procedure aUpGrpExecute(Sender: TObject);
    procedure aDownGrpExecute(Sender: TObject);
    procedure dsGrpDataChange(Sender: TObject; Field: TField);
    procedure aAddAggExecute(Sender: TObject);
    procedure aDelAggExecute(Sender: TObject);
    procedure dsAggsDataChange(Sender: TObject; Field: TField);
    procedure cdsAggsCondNameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Button121Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FChanged : boolean;
    UnivTaskMaster : TTaskMasterClass;
    
    ParEditTime1, ParEditTime2 : TDateTimePicker;
    ValList: TListBox;
    fParentFilter: Integer;
    LC_TaskMaster : TTaskMasterClass;
    FObjList : TStringList;

    FSelectedNode : TTreeNode;
    fRefreshFilter: Boolean;
    fCurrFilter: Integer;
    fOldFilter: Integer;
    fMainNode: TTreeNode;
    FFilterName : String;
//    FilterListBox : TGroupBox;
    ParEdit1, ParEdit2 : TEdit;
    FUniType: String;
    fSelectedFilter: Integer;
    FStyle: TUniverseFilterStyles;
    fConnection2: TCustomConnection;
    FID_Univ: Integer;
    FSelectObjEvent: TSelectObjEvent;

    procedure SetRefreshFilter(const Value: Boolean);
    procedure SetConnection(const Value: TCustomConnection);

    procedure SetFilterName(const Value: String);
    function GetSelCount: Integer;

    procedure SetID_Univ(const Value: Integer);
    function GetConnection2: TCustomConnection;
    procedure CheckUniverseFilterStyles;

    procedure MakeObjList_Flt(ATaskMaster : TTaskMasterClass; ATableList : TStrings; ATreeDetail : boolean);
    procedure MakeObjList_Where(ATaskMaster : TTaskMasterClass; AWhereList : TStrings; FltExtPatam: TStrings; ATreeDetail : boolean);
    procedure MakeIDSearchSQL(ATaskMaster : TTaskMasterClass; ASQL: TStrings; FltExtPatam: TStrings; ATreeDetail : boolean);
    
    function SaveFilter: boolean;
    procedure SetSelectedFilter(const Value: Integer);
    function GetDS(AName: String): boolean;
    procedure aEditFlt(ANew : boolean; ACopy : boolean);

    procedure ObjListClear;
    procedure CheckEnabled;

    procedure CalcRowCount;
    procedure aEditUnTM;
    procedure CalcGrpText;
    procedure CalcAggText;
    function CalcAggCode(AggType: TUFAggs): String;
    function GetSQLTree(SL: TStrings): boolean;
    procedure GetDataTreeDB;
    procedure DoFilter(CDS : TClientDataSet; ATaskMasterClass: TTaskMasterClass;
      Number: integer; ATreeDetail : boolean = false);
    procedure GetFtlDate(ATreeDetail : boolean);
    procedure GetTree;
  public
    FilterWasSaved : boolean;
    Fid_user, FParHandle : integer;

    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;

    function InputObj(const ACaption : string;
                      id_Obj : integer;
                      var AID : integer; var AName: string;
                      AConnection : TCustomConnection;
                      MinLen : integer;
                      ExtID : Variant): boolean;

    property ParentFilter: integer read fParentFilter write fParentFilter;


    procedure NewFillTree;
    property ID_Univ    : Integer          read FID_Univ         write SetID_Univ;
    property RefreshFilter : Boolean          read fRefreshFilter write SetRefreshFilter;
    property SelCount      : Integer          read GetSelCount;

    property SelectedFilter    : Integer          read fSelectedFilter     write SetSelectedFilter;

    property UniType: String read FUniType write FUniType;
    property SelectObjEvent: TSelectObjEvent read FSelectObjEvent write FSelectObjEvent;

    property Connection    : TCustomConnection read GetConnection2 write SetConnection;
    property FilterName : String read FFilterName write SetFilterName;

    procedure CheckFilter;

    procedure SetBsnId(AID : Variant; NeedRefr : boolean; ATaskMaster : TTaskMasterClass);

    function MakeDocTextByCondNum(ATaskMaster : TTaskMasterClass; ACondNum: integer) : String;
  end;

var
  UFForm: TUFForm;

  function EditFilter(AConnection : TCustomConnection;
                      AUniverseID : integer; id_user : integer; ParHandle : integer;
                      ASelectedFilter : integer;
                      ASelectObjEvent : TSelectObjEvent;
                      AStyle: TUniverseFilterStyles = [ufsMainTree, ufsObjView, ufsSaveBtn, ufsFieldsList, ufsCondList, ufsGroupList, ufsOrderList, ufsMayChangeFields, ufsMayChangeCond, ufsMayChangeGroup, ufsMayChangeOrder, fsMayCreateNew, fsMayDelete];
                      CopyMode : boolean = false): boolean;

implementation

uses UniverseFilterUnit2, uInputBoxDate, uInputBoxDigit, uInputBoxObj,
  uInputBoxStr, uFilterForm, uDM, uFltPropSelector,
  foMyFuncDXTreeExcel, uPrgForm;

{$R *.DFM}

function EditFilter(AConnection : TCustomConnection;
                    AUniverseID : integer; id_user : integer; ParHandle : integer;
                    ASelectedFilter : integer;
                    ASelectObjEvent : TSelectObjEvent;
                    AStyle: TUniverseFilterStyles;
                    CopyMode : boolean): boolean;
var F : TUFForm;
begin
  Result := false;
  F := TUFForm.Create(nil);
  try
    F.Connection := AConnection;
    F.LC_TaskMaster := TTaskMasterClass.Create(F.Connection);
    F.Fid_user := id_user;
    F.FParHandle := ParHandle;

    F.ID_Univ := AUniverseID;
    GetUniverseListID(F.WorkDS, AUniverseID, F.UniType, F.LC_TaskMaster);

    F.UnivTaskMaster := TTaskMasterClass.Create(F.Connection);
    GetUniverseListID(F.WorkDS, AUniverseID, F.UniType, F.UnivTaskMaster);

    F.SelectedFilter := ASelectedFilter;
    if CopyMode then
    begin
      F.fSelectedFilter := -1;
   //   F.Caption := 'Создание фильтра';
    end;
    F.SelectObjEvent := ASelectObjEvent;
 //   F.NewFillTree;
    F.Show;
 {   if F.ModalResult = mrOk then
      F.SaveFilter;}
    //Result := F.FilterWasSaved;
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TUFForm.SetRefreshFilter(const Value: Boolean);
begin
  fRefreshFilter := Value;
end;

function TUFForm.SaveFilter : boolean;
var
  Node: TTreeNode;
  i, j : integer;
  PropData : TPropData;
  AFilterData : TFilterData;
  id_Bsn : Variant;
  OldRecNo : integer;
begin
  Result := false;
  CheckFilter;

  with edName do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введено название фильтра', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  if (FObjList.Count = 0) and (UnivTaskMaster.FilterDataCount = 0)  then      
  begin
    MessageBox(Handle, 'Не заданы условия поиска', 'Введены не все данные', MB_OK + MB_ICONERROR);
    Exit;
  end;

  if fBsnSelector1.ID > 0 then
    id_Bsn := fBsnSelector1.ID
  else
    id_Bsn := Null;
  try
    FFilterName := edName.Text;
    TDispatchConnection(Connection).AppServer.BeginTrans;
    if SelectedFilter = -1 then
    begin
      FSelectedFilter := TDispatchConnection(Connection).AppServer.FLT_FilterAdd(FFilterName, FID_Univ, id_Bsn);
      if FSelectedFilter = -1 then
        raise Exception.Create('Ошибка при сохранении фильтра');
    end
    else
    begin
      if TDispatchConnection(Connection).AppServer.FilterClear(SelectedFilter) = -1 then
        raise Exception.Create('Ошибка при сохранении фильтра');

      if TDispatchConnection(Connection).AppServer.FLT_FilterEdit(SelectedFilter, FFilterName, id_Bsn) = -1 then
        raise Exception.Create('Ошибка при сохранении фильтра');
    end;

    with cdsGrp do
    begin
      DisableControls;
      OldRecNo := RecNo;
      try
        First;
        while not Eof do
        begin
          if TDispatchConnection(Connection).AppServer.FLT_GroupAdd(SelectedFilter,
                                                                    FieldByName('id_Rel').Value,
                                                                    FieldByName('id_Obj').Value,
                                                                    FieldByName('id_Prop').Value) = -1 then
            raise Exception.Create('Ошибка при сохранении фильтра');
          Next;
        end;
      finally
        RecNo := OldRecNo;
        EnableControls;
      end;
    end;

    with cdsAggs do
    begin
      DisableControls;
      OldRecNo := RecNo;
      try
        First;
        while not Eof do
        begin
          if TDispatchConnection(Connection).AppServer.FLT_AggAdd(SelectedFilter,
                                                                 FieldByName('id_Rel').Value,
                                                                 FieldByName('id_Prop').Value,
                                                                 FieldByName('AggCode').Value) = -1 then
            raise Exception.Create('Ошибка при сохранении фильтра');
          Next;
        end;
      finally
        RecNo := OldRecNo;
        EnableControls;
      end;
    end;

    for i := 0 to UnivTaskMaster.FilterDataCount - 1 do
    begin
      AFilterData := UnivTaskMaster.FilterData[i];

      if TDispatchConnection(Connection).AppServer.FLT_CondAdd2(SelectedFilter,
                                                                AFilterData.ObjData.Un_id_Obj,
                                                                AFilterData.ObjData.Un_id_Prop,
                                                                AFilterData.ObjData.Un_id_Rel,
                                                                integer(AFilterData.CondCode),
                                                                AFilterData.Par1,
                                                                AFilterData.Par2,
                                                                -1) = -1 then
        raise Exception.Create('Ошибка при сохранении фильтра');

    end;

    for j := 0 to FObjList.Count - 1 do
    begin
      for i := 0 to TTaskMasterClass(FObjList.Objects[j]).FilterDataCount - 1 do
      begin
        AFilterData := TTaskMasterClass(FObjList.Objects[j]).FilterData[i];

        if TDispatchConnection(Connection).AppServer.FLT_CondAdd2(SelectedFilter,
                                                                  AFilterData.ObjData.Un_id_Obj,
                                                                  AFilterData.ObjData.Un_id_Prop,
                                                                  AFilterData.ObjData.Un_id_Rel,
                                                                  integer(AFilterData.CondCode),
                                                                  AFilterData.Par1,
                                                                  AFilterData.Par2,
                                                                  j) = -1 then
          raise Exception.Create('Ошибка при сохранении фильтра');

      end;
    end;
    TDispatchConnection(Connection).AppServer.CommitTrans;
    FChanged := false;
    Result := true;
    SendMessage(FParHandle, WM_RefrList, SelectedFilter, 0);
  except
    TDispatchConnection(Connection).AppServer.RollbackTrans;
  end;
end;

procedure TUFForm.SetConnection(const Value: TCustomConnection);
begin     
  FConnection2 := Value;
  cdsCond.RemoteServer := TCustomRemoteServer(Connection);
  cdsCondList2.RemoteServer := TCustomRemoteServer(Connection);
  WorkDS.RemoteServer := TCustomRemoteServer(Connection);

  cdsGrp2.RemoteServer := TCustomRemoteServer(Connection);
  cdsAggs.RemoteServer := TCustomRemoteServer(Connection);
end;

procedure TUFForm.FormCreate(Sender: TObject);
begin
  FilterWasSaved := false;

  PageControl1.ActivePage := tsFlrPg;

  DisableControl(tsDataPg);
end;

procedure TUFForm.SetFilterName(const Value: String);
begin
  FFilterName := Value;
  Caption := 'Фильтр -' + FFilterName;
end;

function TUFForm.GetDS(AName : String) : boolean;
begin
  Result := false;
  with WorkDS do
  begin
    // *** Читаем датасет ***
    if Active then Close;
    ProviderName := AName;
    Params.Clear;
    FetchParams;
    Params.ParamByName('@id_Filter').Value := fSelectedFilter;
    try
      Open;
    except
      on E: Exception do
      begin
        Close;
        raise Exception.Create('Ошибка при чтении фильтра ' + E.Message);
      end;
    end;
    Result := True;
  end;
end;

procedure TUFForm.SetSelectedFilter(const Value: Integer);
var id_business : Variant;
    ATM : TTaskMasterClass;
    S : String;
begin
  ObjListClear;
  fSelectedFilter := Value;
  if FSelectedFilter = - 1 then
  begin
    Caption := 'Создание фильтра';
    edName.Text := '';// 'Новый фильтр';
  end
  else
  begin
    with WorkDS do
    begin
      GetDS('dsFltProp');
      FilterName := FieldByName('Name').AsString;
      Caption := FilterName;
      edName.Text := FilterName;
      id_business := FieldByName('id_business').Value;
    end;
    with cdsCond do
    begin
      Params.ParamByName('@id_Filter').Value := Value;
      Open;
    end;
    with cdsCondList2 do
    begin
      Params.ParamByName('@id_Filter').Value := Value;
      Open;
      First;
      while not Eof do
      begin
        if cdsCondList2CondNum.AsInteger <> -1 then
        begin
          ATM := TTaskMasterClass.Create(fConnection2);
          GetUniverseListID(WorkDS, FID_Univ, UniType, ATM);    // Сделать чтение дерева из готового
      //    SetBsnId_UN(id_business, WorkDS, ATaskMaster);
          SetBsnId(id_business, true, ATM);
          S := MakeDocTextByCondNum(ATM, cdsCondList2CondNum.AsInteger);
          FObjList.AddObject(S, ATM);
        end
        else
        begin
     //     GetUniverseListID(WorkDS, FID_Univ, UniType, UnivTaskMaster);    // Сделать чтение дерева из готового
        //  SetBsnId_UN(id_business, WorkDS, ATaskMaster);
          SetBsnId(id_business, true, UnivTaskMaster);
          StringGrid1.Cells[0, 0] := MakeDocTextByCondNum(UnivTaskMaster, cdsCondList2CondNum.AsInteger);
        end;
        Next;
      end;
      First;
    end;
  end;
{  with cdsGrp_r do
  begin
    Params.ParamByName('@id_Filter').Value := Value;
    Open;
    First;
    while not Eof do
    begin
      CalcGrpText;
      Next;
    end;
    First;
  end;   }

  with cdsGrp2 do
  begin
    Params.ParamByName('@id_Filter').Value := Value;
    Open;
    First;
  end;
  with cdsGrp do
  begin
    LoadFromDataSet(cdsGrp2, -1, lmAppend);
    First;
    while not Eof do
    begin
      CalcGrpText;
      Next;
    end;
    First;
  end;

  with cdsAggs do
  begin
    Params.ParamByName('@id_Filter').Value := Value;
    Open;
    First;
    while not Eof do
    begin
      CalcAggText;
      Next;
    end;
    First;

  end;
  CalcRowCount;
end;

procedure TUFForm.btnOkClick(Sender: TObject);
begin
  SaveFilter;
{  if 1 = 2 then
  begin
    ModalResult := mrNone;
  end;}
end;

function TUFForm.GetConnection2: TCustomConnection;
begin
  Result := fConnection2;
end;

procedure TUFForm.DoFilter(CDS : TClientDataSet; ATaskMasterClass : TTaskMasterClass; Number : integer; ATreeDetail : boolean);
var ASQL, FltExtPatam : TStrings;
begin
  ASQL := TStringList.Create;
  FltExtPatam := TStringList.Create;
  try
    FltExtPatam.Clear;
    MakeIDSearchSQL(ATaskMasterClass, ASQL, FltExtPatam, ATreeDetail);

    CDS.Params.ParamByName('@SQLText' + IntToStr(Number)).Value := ASQL.Text;
    if (FltExtPatam.Text = '') then
      CDS.Params.ParamByName('@FltExtPatam' + IntToStr(Number)).Value := Null
    else
      CDS.Params.ParamByName('@FltExtPatam' + IntToStr(Number)).Value := trim(FltExtPatam.Text);
  finally
    ASQL.Free;
    FltExtPatam.Free;
  end;
end;

procedure TUFForm.ertyClick(Sender: TObject);
begin
  fFltTree1.fArc1.id_business := fBsnSelector1.ID;
  if cdsAggs.IsEmpty and cdsGrp.IsEmpty then
  begin
    cdsData.Close;
    fFltTree1.ToolBar5.Visible := false;
    fFltTree1.dxTreeList.Visible := false;
    GetFtlDate(false);
  end
  else
  begin
    cdsData.Close;
    fFltTree1.ToolBar5.Visible := true;
    fFltTree1.dxTreeList.Visible := true;
    GetTree;
  end;
end;

procedure TUFForm.GetFtlDate(ATreeDetail : boolean);
var i : integer;
begin
  CheckFilter;
  Screen.Cursor := crSQLWait;
  SpeedButton2.Enabled := false;
  try
    with cdsData do
    begin
      Close;
      RemoteServer := TCustomRemoteServer(Connection);
      if ProviderName = '' then
      begin
        ProviderName := 'dsGetData2';
        Params.Clear;
        FetchParams;
      end;
      for i := 0 to Params.Count - 1 do
        Params[i].Value := Null;
        
      Params.ParamByName('@id_user').Value := Fid_user;
      if fBsnSelector1.ID > 0 then
        Params.ParamByName('@id_business').Value := fBsnSelector1.ID
      else
        Params.ParamByName('@id_business').Value := Null;

      if FObjList.Count = 0 then
      begin
        DoFilter(cdsData, UnivTaskMaster, 0, ATreeDetail);
      end
      else
      begin
        for i := 0 to FObjList.Count - 1 do
        begin
          DoFilter(cdsData, TTaskMasterClass(FObjList.Objects[i]), i, ATreeDetail);
        end;
      end;
      fFltTree1.fArc1.dsArc.DataSet := cdsData;
      Open;
      PageControl1.ActivePage := tsDataPg;
    end;
  finally
    EnableControl(tsDataPg);
    SpeedButton2.Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TUFForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FChanged or (trim(edName.Text) <> FilterName) ) and (ModalResult in [idCancel, 0]) then
  begin
    case MessageBox(Handle, 'Сохранить фильтр?', 'Данные не были сохранены', MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONQUESTION) of
      id_Yes : begin if not SaveFilter then Action := caNone; end;
      ID_CANCEL : Action := caNone;
    end;
  end
  else
    Action := caFree;   
end;

procedure TUFForm.Action1Execute(Sender: TObject);
var F : TForm;
    Memo : TMemo;
begin
{  F := TForm.Create(Self);
  try
    Memo := TMemo.Create(F);
    Memo.Parent := F;
    Memo.Align := alClient;
    Memo.Lines.Text := cdsData.Params.ParamByName('@SQLText').AsString;
    F.ShowModal;
  finally
    F.Free;
  end;  }
end;

constructor TUFForm.Create(AOwner: TCOmponent);
var Reg : TRegistry;
    FullRegPathName : String;
    i : integer;
begin
  inherited;
  fFltTree1.FGetFtlDateProc := GetFtlDate;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, false) then
    begin
      if Reg.ValueExists('Panel1Height') then
        Panel1.Height := Reg.ReadInteger('Panel1Height');
      if Reg.ValueExists('GroupBox4Width') then
        GroupBox4.Width := Reg.ReadInteger('GroupBox4Width');
      if Reg.ValueExists('GroupBox3Width') then
        GroupBox1.Width := Reg.ReadInteger('GroupBox3Width');
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;

  FChanged := false;
  
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  FObjList := TStringList.Create;
  with mtAggDic do
  begin
    Open;
    for i := Integer(uagSum) to integer(uagMin) do
    begin
      Append;
      FieldByName('ID').AsInteger := i;
      FieldByName('Name').Value := CalcAggCode(TUFAggs(i));

      Post;
    end;
  end;
end;

procedure TUFForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

destructor TUFForm.Destroy;
var Reg : TRegistry;
    FullRegPathName : String;
begin
  ObjListClear;
  FObjList.Free; 
  LC_TaskMaster.Free;
  UnivTaskMaster.Free;

  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, true) then
    begin
      Reg.WriteInteger('Panel1Height', Panel1.Height);
      Reg.WriteInteger('GroupBox3Width', GroupBox1.Width);
      Reg.WriteInteger('GroupBox4Width', GroupBox4.Width);
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;

  inherited;
end;

procedure TUFForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TUFForm.CheckFilter;
var N : integer;
begin
  if not(fBsnSelector1.ID > 0) then
  begin
    raise Exception.Create('Не выбран бизнес');
  end;
end;

procedure TUFForm.fBsnSelector1Button1Click(Sender: TObject);
var OldBsn : Variant;
    i : integer;
begin
  OldBsn := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if OldBsn <> fBsnSelector1.ID then
  begin
    for i := 0 to FObjList.Count - 1 do
    begin
      SetBsnId(fBsnSelector1.ID, true, TTaskMasterClass(FObjList.Objects[i]));
    end;
    SetBsnId(fBsnSelector1.ID, true, LC_TaskMaster);
    SetBsnId(fBsnSelector1.ID, true, UnivTaskMaster);

    fFltTree1.fArc1.id_business := fBsnSelector1.ID;
  end;
end;

procedure TUFForm.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, xxxSRegPath + '\' + Name);
end;

procedure TUFForm.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, xxxSRegPath + '\' + Name);
end;

procedure TUFForm.CheckUniverseFilterStyles;
begin

end;

function TUFForm.GetSelCount: Integer;
begin

end;

function TUFForm.InputObj(const ACaption: string; id_Obj: integer;
  var AID: integer; var AName: string; AConnection: TCustomConnection;
  MinLen: integer; ExtID: Variant): boolean;
begin

end;

procedure TUFForm.MakeIDSearchSQL(ATaskMaster : TTaskMasterClass; ASQL, FltExtPatam: TStrings; ATreeDetail : boolean);
var SL, SL_Rez : TStringList;
begin
  SL := TStringList.Create;
  SL_Rez := TStringList.Create;
  try
    MakeObjList_Flt(ATaskMaster, SL, ATreeDetail);
    SL_Rez.AddStrings(SL);

    SL.Clear;
    MakeObjList_Where(ATaskMaster, SL, FltExtPatam, ATreeDetail);
    if SL.Count > 0 then
    begin
      SL_Rez.Add('WHERE');
      SL_Rez.AddStrings(SL);
    end;
  finally
    ASQL.Clear;
    ASQL.AddStrings(SL_Rez);

    SL.Free;
    SL_Rez.Free;
  end;
end;

procedure TUFForm.MakeObjList_Flt(ATaskMaster : TTaskMasterClass; ATableList: TStrings; ATreeDetail : boolean);
var
    ObjList : TObjectList;
    MObjD : TObjData;
    Obj : TTableList;
  function Indexid_Rel(id_Rel : integer) : integer;
  var j : integer;
  begin
    Result := -1;
    for j := 0 to ObjList.Count - 1 do
    begin
      if TTableList(ObjList[j]).id_Rel = id_Rel then
      begin
        Result := j;
        Break;
      end;
    end;
  end;
  procedure DoList(ATaskMasterLC : TTaskMasterClass);
  var i : integer;
    AFilterData : TFilterData;
    Obj : TTableList;
  begin
    for i := 0 to ATaskMasterLC.FilterDataCount - 1 do
    begin
      AFilterData := ATaskMasterLC.FilterData[i];
      begin
        if AFilterData.ObjData.DType <> uftObj then   // 1014
    //    if not AFilterData.FObjData.isDetail then
        begin
          if Indexid_Rel(AFilterData.ObjData.Un_id_Rel) = -1 then
          begin
            Obj := TTableList.Create;
            ObjList.Add(Obj);
            Obj.id_Rel := AFilterData.ObjData.Un_id_Rel;
            Obj.id_RelParent := AFilterData.ObjData.Un_id_RelParent;
            Obj.TableName :=  AFilterData.ObjData.Un_TableName;
            Obj.RelField :=  AFilterData.ObjData.Un_RelField;
            Obj.KeyField :=  AFilterData.ObjData.Un_KeyField;

            Obj.isDetail := AFilterData.ObjData.Un_isDetail;
            Obj.isExtParam := AFilterData.ObjData.Un_isExtParam;
          end;
        end;
      end;
    end;
  end;
begin
  if (ATaskMaster <> nil) and (ATaskMaster.FilterDataCount = 0) then
  begin
    raise Exception.Create(PChar('Не заданы условия поиска' + #13 + #10 + 'Введены не все данные'));
  end;
    
  ObjList := TObjectList.Create(true);
  try
    MObjD := ATaskMaster.MainObjData;
    Obj := TTableList.Create;
    ObjList.Add(Obj);
    Obj.id_Rel := MObjD.Un_id_Rel;
    Obj.id_RelParent := MObjD.Un_id_RelParent;
    Obj.TableName := MObjD.Un_TableName;
    Obj.RelField := MObjD.Un_RelField;
    Obj.KeyField := MObjD.Un_KeyField;

    Obj.isDetail := MObjD.Un_isDetail;
    Obj.isExtParam := MObjD.Un_isExtParam;

    if UnivTaskMaster <> ATaskMaster then
      DoList(UnivTaskMaster);
    DoList(ATaskMaster);
    if ATreeDetail then
      fFltTree1.MakeTreeFlt(ObjList, cdsGrp, cdsGetDataTree);
    MakeTableList222(ObjList, ATableList);
  finally
    ObjList.Free;
  end;
end;

procedure TUFForm.MakeObjList_Where(ATaskMaster : TTaskMasterClass; AWhereList, FltExtPatam: TStrings; ATreeDetail : boolean);
var ObjList, AList : TObjectList;
  procedure DoList(ATaskMasterLC : TTaskMasterClass) ;
  var
    AFilterData : TFilterData;
    ID, i : integer;
    Obj : TFltList;
  begin
    for i := 0 to ATaskMasterLC.FilterDataCount - 1 do
    begin
      AFilterData := ATaskMasterLC.FilterData[i];
      begin
        Obj := TFltList.Create;
        ObjList.Add(Obj);
        Obj.id_Rel := AFilterData.ObjData.Un_id_Rel;
        Obj.id_RelParent := AFilterData.ObjData.Un_id_RelParent;
        Obj.TableName :=  AFilterData.ObjData.Un_TableName;
        Obj.RelField :=  AFilterData.ObjData.Un_RelField;
        Obj.KeyField :=  AFilterData.ObjData.Un_KeyField;

        Obj.id_Prop := AFilterData.ObjData.Un_id_Prop;
        Obj.Par1 := AFilterData.Par1;
        Obj.Par2 := AFilterData.Par2;
        Obj.CondCode := AFilterData.CondCode;
        Obj.isDetail := AFilterData.ObjData.Un_isDetail;
        Obj.isExtParam := AFilterData.ObjData.Un_isExtParam;

        Obj.DType := AFilterData.ObjData.DType;
        Obj.FieldName := AFilterData.ObjData.Un_FieldName;

      end;
    end;
  end;
begin
  AList := TObjectList.Create(true);
  ObjList := TObjectList.Create(true);
  try
    DoList(ATaskMaster);
    if UnivTaskMaster <> ATaskMaster then
      DoList(UnivTaskMaster);
    if ATreeDetail then
      fFltTree1.MakeTreeFlt(ObjList, cdsGrp, cdsGetDataTree);
    MakeWhereList222(ObjList, AWhereList, FltExtPatam);
  finally
    ObjList.Free;
    AList.Free;
  end;
end;

procedure TUFForm.NewFillTree;
begin

end;

procedure TUFForm.SetID_Univ(const Value: Integer);
begin
  FID_Univ := Value;
end;

procedure TUFForm.aNewExecute(Sender: TObject);
begin
  aEditFlt(true, false);
end;

procedure TUFForm.aEditFlt(ANew : boolean; ACopy: boolean);
var ATM : TTaskMasterClass;
    i : integer;
begin
  if not(fBsnSelector1.ID > 0) then
  begin
    MessageBox(Handle, 'Не выбран бизнес', 'Выберите бизнес', MB_ICONWARNING + MB_OK);
    Exit;
  end;

  LC_TaskMaster.ClearFilterList;
  if ANew or ACopy then
  begin
    ATM := TTaskMasterClass.Create(fConnection2);
    GetUniverseListID(WorkDS, FID_Univ, UniType, ATM);    // Сделать чтение дерева из готового
  end
  else
    ATM := TTaskMasterClass(FObjList.Objects[DrawGrid1.Row - DrawGrid1.FixedRows]);
  if not ANew then
  begin
    for i := 0 to ATM.FilterDataCount - 1 do
      CreateFilterItem(LC_TaskMaster, ATM.FilterData[i]);
  end;
  if ShowFlt(fConnection2, FID_Univ, Fid_user, fBsnSelector1.ID, FSelectObjEvent, Self, LC_TaskMaster) then
  begin
    FChanged := true;
    if ANew or ACopy then
    begin
      FObjList.AddObject('', ATM);
      CalcRowCount;
    end;
    ATM.ClearFilterList;
    for i := 0 to LC_TaskMaster.FilterDataCount - 1 do
      CreateFilterItem(ATM, LC_TaskMaster.FilterData[i]);
    i := FObjList.IndexOfObject(ATM);
    FObjList[i] := GetFilterTextToDoc(ATM);
  end;
  CheckEnabled;
end;

procedure TUFForm.aDelExecute(Sender: TObject);
var Obj : TObject;
begin
  if MessageBox(Handle, PChar('Удалить условия?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    Obj := TObject(FObjList.Objects[DrawGrid1.Row - DrawGrid1.FixedRows]);
    FObjList.Delete(DrawGrid1.Row - DrawGrid1.FixedRows);
    Obj.Free;
    DrawGrid1.RowCount := DrawGrid1.FixedRows + FObjList.Count;
    FChanged := true;
    CheckEnabled;
  end;
end;

procedure TUFForm.aEditExecute(Sender: TObject);
begin
  aEditFlt(false, false);
end;

procedure TUFForm.cdsCondCalcFields(DataSet: TDataSet);
begin
//*
end;

function TUFForm.MakeDocTextByCondNum(ATaskMaster : TTaskMasterClass; ACondNum: integer) : String;
begin
  ATaskMaster.ClearFilterList;
  try
    with cdsCond do
    begin
      First;
      while not Eof do
      begin
        if cdsCondCondNum.AsInteger = ACondNum then
        begin
          CreateFilterItem(ATaskMaster, cdsCond);
        end;
        Next;
      end;
    end;
    Result := GetFilterTextToDoc(ATaskMaster);
  finally
//   
  end;
end;


procedure TUFForm.SetBsnId(AID: Variant; NeedRefr: boolean; ATaskMaster : TTaskMasterClass);
begin
  if ((fBsnSelector1.ID <> AID) and (AID <> Null)) or NeedRefr then
  begin
    fBsnSelector1.ID := AID;
    SetBsnId_UN(AID, WorkDS, ATaskMaster);
  //  GetNodeTDListCover(nil);
  end;
end;

procedure TUFForm.cdsCondList2CalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('RNum').AsInteger := DataSet.RecNo;
end;

procedure TUFForm.CheckEnabled;
begin
  aCopy.Enabled := FObjList.Count > 0;
  aEdit.Enabled := FObjList.Count > 0;
  aDel.Enabled := FObjList.Count > 0;
  aNew.Enabled := FObjList.Count < 10;
//  aSave.Enabled := FObjList.Count > 10;
end;


procedure TUFForm.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
  aEdit.Execute;
end;

procedure TUFForm.aCopyExecute(Sender: TObject);
begin
  aEditFlt(false, true);
end;

procedure TUFForm.ObjListClear;
begin
  while FObjList.Count > 0 do
  begin
    try
      TObject(FObjList.Objects[FObjList.Count - 1]).Free;
    except
    end;
    FObjList.Delete(FObjList.Count - 1);
  end;
end;

procedure TUFForm.DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var R : TRect;
    S : String;
    Y : integer;
begin
  if FObjList.Count > 0 then
  begin
    if (gdSelected in State) then
    begin
      TDrawGrid(Sender).Canvas.Brush.Color := clHighlight;
      TDrawGrid(Sender).Canvas.FillRect(Rect);
      TDrawGrid(Sender).Canvas.Font.Color := clWhite;
    end;
    R := Rect;
    R.Left := R.Left + 2;
    R.Top := R.Top + 2;
    if (ACol = TDrawGrid(Sender).FixedCols + 1) then
    begin
      if ARow = 0 then
        S := 'Условия'
      else
        S := FObjList[ARow - DrawGrid1.FixedRows];
        
      Y := DrawText((Sender as TDrawGrid).Canvas.Handle, PChar(S), -1, R, DT_WORDBREAK or DT_CALCRECT) + 5;
      if Y <> TDrawGrid(Sender).RowHeights[ARow] then
        TDrawGrid(Sender).RowHeights[ARow] := Y;
      R.Bottom := R.Top + Y;
      DrawText((Sender as TDrawGrid).Canvas.Handle, PChar(S), -1, R, DT_LEFT or DT_WORDBREAK);
    end
    else
    begin
      if (ACol = TDrawGrid(Sender).FixedCols) and (ARow >= DrawGrid1.FixedRows) then
      begin
        DrawText((Sender as TDrawGrid).Canvas.Handle, PChar(IntToStr(ARow)), -1, R, DT_LEFT or DT_WORDBREAK);
      end;
    end;
  end;    
end;

procedure TUFForm.DrawGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
  aEdit.Execute;
end;

procedure TUFForm.DrawGrid1Click(Sender: TObject);
begin
  CheckEnabled;
end;

procedure TUFForm.aLoadExecute(Sender: TObject);
var SL : TIniFile;
    i, j : integer;
    AFilterData : TFilterData;
    ATM : TTaskMasterClass;
    Sect : String;
    id_Prop, id_Obj, id_Rel : Variant;
    CondCode : TUFCondType;
    S, Par1, Par2 : String;
begin
  if OpenDialog1.Execute then
  begin
    ObjListClear;
    UnivTaskMaster.ClearFilterList;
    SL := TIniFile.Create(OpenDialog1.FileName);
    try
      with SL do
      begin
        fBsnSelector1.ID := ReadInteger('general', 'BSN', -1);
        j := -1;
        while true do
        begin
          Sect := 'FLT' + IntToStr(j);
          if SectionExists(Sect) then
          begin
            if j > -1 then
              ATM := TTaskMasterClass.Create(fConnection2)
            else
              ATM := UnivTaskMaster;
              
            GetUniverseListID(WorkDS, FID_Univ, UniType, ATM);    // Сделать чтение дерева из готового
            SetBsnId(fBsnSelector1.ID, true, ATM);
            i := 0;
            while true do
            begin
              if ValueExists(Sect, 'id_Obj' + IntToStr(i)) then
              begin
                id_Obj := ReadString(Sect, 'id_Obj'+ IntToStr(i), '');
                if id_Obj = '' then id_Obj := Null;

                id_Prop := ReadString(Sect, 'id_Prop'+ IntToStr(i), '');
                if id_Prop = '' then id_Prop := Null;

                id_Rel := ReadString(Sect, 'id_Rel'+ IntToStr(i), '');
                if id_Rel = '' then id_Rel := Null;

                CondCode := TUFCondType(ReadInteger(Sect, 'CondCode'+ IntToStr(i), 0));
                Par1 := ReadString(Sect, 'Par1'+ IntToStr(i), '');
                Par2 := ReadString(Sect, 'Par2'+ IntToStr(i), '');

                CreateFilterItem_UN(ATM, id_Prop, id_Obj, id_Rel, CondCode, Par1, Par2);
                inc(i);
              end
              else
                if j > -1 then Break;
            end;
            S := GetFilterTextToDoc(ATM);
            FObjList.AddObject(S, ATM);

            inc(j);
          end
          else
            Break;
        end;
      end;
    finally
      StringGrid1.Cells[0, 0] := '';
      CalcRowCount;
      SL.Free;
    end;
  end;
end;

procedure TUFForm.aSaveExecute(Sender: TObject);
var SL : TIniFile;
    i, j : integer;
    AFilterData : TFilterData;
begin
  if SaveDialog1.Execute then
  begin
    DeleteFile(SaveDialog1.FileName);
    SL := TIniFile.Create(SaveDialog1.FileName);
    try
      with SL do
      begin
        WriteInteger('general', 'BSN', fBsnSelector1.ID);
        j := -1;
        for i := 0 to UnivTaskMaster.FilterDataCount - 1 do
        begin
          AFilterData := UnivTaskMaster.FilterData[i];
          WriteString('FLT' + IntToStr(j), 'id_Obj' + IntToStr(i), VarToStr(AFilterData.ObjData.Un_id_Obj));
          WriteString('FLT' + IntToStr(j), 'id_Prop' + IntToStr(i), VarToStr(AFilterData.ObjData.Un_id_Prop));
          WriteString('FLT' + IntToStr(j), 'id_Rel' + IntToStr(i), VarToStr(AFilterData.ObjData.Un_id_Rel));
          WriteInteger('FLT' + IntToStr(j), 'CondCode' + IntToStr(i), ORD(AFilterData.CondCode));
          WriteString('FLT' + IntToStr(j), 'Par1' + IntToStr(i), AFilterData.Par1);
          WriteString('FLT' + IntToStr(j), 'Par2' + IntToStr(i), AFilterData.Par2);
        end;

        for j := 0 to FObjList.Count - 1 do
        begin
          for i := 0 to TTaskMasterClass(FObjList.Objects[j]).FilterDataCount - 1 do
          begin
            AFilterData := TTaskMasterClass(FObjList.Objects[j]).FilterData[i];
            WriteString('FLT' + IntToStr(j), 'id_Obj' + IntToStr(i), VarToStr(AFilterData.ObjData.Un_id_Obj));
            WriteString('FLT' + IntToStr(j), 'id_Prop' + IntToStr(i), VarToStr(AFilterData.ObjData.Un_id_Prop));
            WriteString('FLT' + IntToStr(j), 'id_Rel' + IntToStr(i), VarToStr(AFilterData.ObjData.Un_id_Rel));
            WriteInteger('FLT' + IntToStr(j), 'CondCode' + IntToStr(i), ORD(AFilterData.CondCode));
            WriteString('FLT' + IntToStr(j), 'Par1' + IntToStr(i), AFilterData.Par1);
            WriteString('FLT' + IntToStr(j), 'Par2' + IntToStr(i), AFilterData.Par2);
          end;
        end;
      end;
    finally
      SL.Free;
    end;
  end;
end;

procedure TUFForm.CalcRowCount;
begin
  DrawGrid1.RowCount := 1 + FObjList.Count;
  if DrawGrid1.RowCount > 1 then DrawGrid1.FixedRows := 1;
end;

procedure TUFForm.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var R : TRect;
    S : String;
    Y : integer;
begin
  R := Rect;
  R.Left := R.Left + 2;
  R.Top := R.Top + 2;
  S := StringGrid1.Cells[ACol, ARow];
  StringGrid1.ColWidths[0] := StringGrid1.Width - 5;
  if not (gdFocused in State) or (S = '') then
  begin
    StringGrid1.Canvas.Font.Color := clWindowText;
    StringGrid1.Canvas.Brush.Color := clWindow;
  end
  else
  begin
    StringGrid1.Canvas.Font.Color := clWindow;
    StringGrid1.Canvas.Brush.Color := clHighlight;
  end;
  StringGrid1.Canvas.FillRect(Rect);

  Y := DrawText(StringGrid1.Canvas.Handle, PChar(S), -1, R, DT_WORDBREAK or DT_CALCRECT) + 5;
  if Y > StringGrid1.Height then
    StringGrid1.Height := Y;
  StringGrid1.RowHeights[0] := StringGrid1.Height;
  
  R.Bottom := R.Top + Y;
  DrawText(StringGrid1.Canvas.Handle, PChar(S), -1, R, DT_LEFT or DT_WORDBREAK);
end;

procedure TUFForm.aEditUnTM;
var i : integer;
begin
  if not(fBsnSelector1.ID > 0) then
  begin
    MessageBox(Handle, 'Не выбран бизнес', 'Выберите бизнес', MB_ICONWARNING + MB_OK);
    Exit;
  end;

  LC_TaskMaster.ClearFilterList;
  for i := 0 to UnivTaskMaster.FilterDataCount - 1 do
    CreateFilterItem(LC_TaskMaster, UnivTaskMaster.FilterData[i]);

  if ShowFlt(fConnection2, FID_Univ, Fid_user, fBsnSelector1.ID, FSelectObjEvent, Self, LC_TaskMaster) then
  begin
    FChanged := true;
    UnivTaskMaster.ClearFilterList;
    for i := 0 to LC_TaskMaster.FilterDataCount - 1 do
      CreateFilterItem(UnivTaskMaster, LC_TaskMaster.FilterData[i]);
    StringGrid1.Cells[0, 0] := GetFilterTextToDoc(UnivTaskMaster);
  end;
  CheckEnabled;
end;

procedure TUFForm.StringGrid1DblClick(Sender: TObject);
begin
  aEditUnTM;
end;

procedure TUFForm.RxSpeedButton1Click(Sender: TObject);
begin
  aEditUnTM;
end;

procedure TUFForm.RxSpeedButton2Click(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить условия?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    UnivTaskMaster.ClearFilterList;
    StringGrid1.Cells[0, 0] := '';
  end;
end;

procedure TUFForm.aAddGrpExecute(Sender: TObject);
var
  ID_Prop, id_Obj, id_Rel : Variant;
  DType : TUFType;
begin
  if ShowFltPropSelector(fConnection2, ID_Univ, Fid_user, fBsnSelector1.ID, Self, UnivTaskMaster, id_Obj, ID_Prop, id_Rel, DType, true, true, true) then
  begin
    with cdsGrp do
    begin
      if Locate('id_Rel;id_Obj;id_Prop', VarArrayOf([id_Rel, id_Obj, id_Prop]), [loCaseInsensitive, loPartialKey]) then
      begin
        MessageBox(Handle, 'Этот параметр уже выбран. Нельзя выбрать один и тот же параметр дважды', 'Этот параметр уже выбран', MB_ICONWARNING + MB_OK);

      end
      else
      begin
        Append;
        FieldByName('id_Rel').Value := id_Rel;
        FieldByName('id_Obj').Value := id_Obj;
        FieldByName('id_Prop').Value := ID_Prop;
        CalcGrpText;
        FChanged := true;
      end;
  //    Post;
    end;
  end;
end;

procedure TUFForm.aDelGrpExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить параметр "' + cdsGrp.FieldByName('GrpText').AsString+ '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    cdsGrp.Delete;
    FChanged := true;
  end;
end;

procedure TUFForm.aUpGrpExecute(Sender: TObject);
var ID_Obj, id_Prop, id_Rel, GrpText : Variant;
begin
  with cdsGrp do
  begin
    ID_Obj := FieldByName('ID_Obj').Value;
    id_Prop := FieldByName('id_Prop').Value;
    id_Rel := FieldByName('id_Rel').Value;
//    GrpText := FieldByName('GrpText').Value;
    if RecNo = RecordCount then
      Delete
    else
    begin
      Delete;
      Prior;
    end;
    Insert;

    FieldByName('ID_Obj').Value := ID_Obj;
    FieldByName('id_Prop').Value := id_Prop;
    FieldByName('id_Rel').Value := id_Rel;
 //   FieldByName('GrpText').Value := GrpText;
    CalcGrpText;
 //   Post;
  end;
end;

procedure TUFForm.aDownGrpExecute(Sender: TObject);
var ID_Obj, id_Prop, id_Rel, GrpText : Variant;
begin
  with cdsGrp do
  begin
    ID_Obj := FieldByName('ID_Obj').Value;
    id_Prop := FieldByName('id_Prop').Value;
    id_Rel := FieldByName('id_Rel').Value;
    GrpText := FieldByName('GrpText').Value;
    Delete;
    Next;
    if Eof then
      Append
    else
      Insert;

    FieldByName('ID_Obj').Value := ID_Obj;
    FieldByName('id_Prop').Value := id_Prop;
    FieldByName('id_Rel').Value := id_Rel;
    FieldByName('GrpText').Value := GrpText;

    Post;
  end;
end;

procedure TUFForm.dsGrpDataChange(Sender: TObject; Field: TField);
begin
  aDelGrp.Enabled := not cdsGrp.IsEmpty;
  aUpGrp.Enabled := cdsGrp.RecNo > 1;
  aDownGrp.Enabled := cdsGrp.RecNo < cdsGrp.RecordCount;
end;

procedure TUFForm.aAddAggExecute(Sender: TObject);
var
  ID_Prop, id_Obj, id_Rel : Variant;
  DType : TUFType;
begin
  if ShowFltPropSelector(fConnection2, ID_Univ, Fid_user, fBsnSelector1.ID, Self, UnivTaskMaster, id_Obj, ID_Prop, id_Rel, DType, true, true, false, false) then
  begin
    with cdsAggs do
    begin
      Append;
      FieldByName('id_Rel').Value := id_Rel;
      FieldByName('id_Prop').Value := ID_Prop;
      if DType = uftDate then
        FieldByName('AggCode').Value := Integer(uagMin)
      else
        FieldByName('AggCode').Value := Integer(uagSum);
      CalcAggText;
//      Post;
    end;
    FChanged := true;
  end;
end;

procedure TUFForm.aDelAggExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить параметр "' + cdsAggsAggText.AsString+ '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    cdsAggs.Delete;
    FChanged := true;
  end;
end;

procedure TUFForm.dsAggsDataChange(Sender: TObject; Field: TField);
begin
  aDelAgg.Enabled := not cdsAggs.IsEmpty;
end;

procedure TUFForm.CalcGrpText;
var
    AUFDBObj : TUFDBObj;
begin
  with cdsGrp do
  begin
    if not FieldByName('id_Prop').IsNull then
      AUFDBObj := UnivTaskMaster.PropDataByID[FieldByName('id_Prop').AsInteger, FieldByName('id_Rel').AsInteger]
    else
      AUFDBObj := UnivTaskMaster.ObjDataByID[FieldByName('id_Obj').AsInteger, FieldByName('id_Rel').AsInteger];
    if AUFDBObj <> nil then
    begin
      Edit;
      FieldByName('GrpText').AsString := AUFDBObj.FullName;

  //    FieldByName('id_Rel').Value := AUFDBObj.Un_id_Rel;
      FieldByName('id_RelParent').Value := AUFDBObj.Un_id_RelParent;
      FieldByName('RelField').AsString := AUFDBObj.Un_RelField;
      FieldByName('KeyField').AsString := AUFDBObj.Un_KeyField;

      FieldByName('TableName').AsString := AUFDBObj.Un_TableName;
      FieldByName('FieldName').AsString := AUFDBObj.Un_FieldName;
      FieldByName('ObjNameField').Value := AUFDBObj.Un_ObjNameField;
      Post;
    end;
  end;
end;

procedure TUFForm.CalcAggText;
var  APropData : TPropData;
begin
  with cdsAggs do
  begin
    APropData := UnivTaskMaster.PropDataByID[FieldByName('id_Prop').AsInteger, FieldByName('id_Rel').AsInteger];
    if APropData <> nil then
    begin
      Edit;
      FieldByName('AggText').AsString := APropData.FullName;

 //     FieldByName('id_Rel').Value := APropData.Un_id_Rel;
      FieldByName('id_RelParent').Value := APropData.Un_id_RelParent;
      FieldByName('RelField').AsString := APropData.Un_RelField;
      FieldByName('KeyField').AsString := APropData.Un_KeyField;

      FieldByName('TableName').AsString := APropData.Un_TableName;
      FieldByName('FieldName').AsString := APropData.Un_FieldName;

      Post;
    end;
  end;
end;

function TUFForm.CalcAggCode(AggType : TUFAggs): String;
begin
  case AggType of
    uagSum : Result := 'Сумма';
    uagAvg : Result := 'Среднее';
    uagCount : Result := 'Кол-во';
    uagMax : Result := 'Макс.';
    uagMin : Result := 'Мин.';
  end;
end;

procedure TUFForm.cdsAggsCondNameGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
var AggType : TUFAggs;
begin
  if not cdsAggsAggCode.IsNull then
  begin
    AggType := TUFAggs(cdsAggsAggCode.AsInteger);
    Text := CalcAggCode(AggType);
  end;
end;

procedure TUFForm.Button121Click(Sender: TObject);
var SL : TStrings;
begin
  SL := TStringList.Create;
  try
    GetSQLTree(SL);
    Memo1.Lines.Text := SL.Text;
  finally
    SL.Free;
  end;
end;

function TUFForm.GetSQLTree(SL : TStrings) : boolean;
var AObjectList, AAggList: TObjectList;
    AColList, AGrpList, ATableList, AOrderList : TStrings;
    GrpObj : TFltList;
    AggObj : TAggList;
    MObjD : TObjData;
begin
  AObjectList := TObjectList.Create(true);
  AAggList := TObjectList.Create(true);
  AColList := TStringList.Create;
  AGrpList := TStringList.Create;
  ATableList := TStringList.Create;
  AOrderList := TStringList.Create;
  try
    MObjD := UnivTaskMaster.MainObjData;
    GrpObj := TFltList.Create;
    AObjectList.Add(GrpObj);

    GrpObj.id_Rel := MObjD.Un_id_Rel;
    GrpObj.id_Prop := MObjD.Un_id_Obj;
    GrpObj.id_RelParent := MObjD.Un_id_RelParent;
    GrpObj.TableName := MObjD.Un_TableName;
    GrpObj.RelField := MObjD.Un_RelField;
    GrpObj.KeyField := MObjD.Un_KeyField;

    GrpObj.FieldName := MObjD.Un_FieldName;
    GrpObj.ObjNameField := MObjD.Un_ObjNameField;

    with cdsGrp do
    begin
      DisableControls;
      try
        First;
        while not Eof do
        begin
    //      if Indexid_Rel(AObjectList, FieldByName('id_Rel').AsInteger) = -1 then
          begin
            GrpObj := TFltList.Create;
            AObjectList.Add(GrpObj);
            GrpObj.id_Prop := FieldByName('id_Prop').Value;
            GrpObj.id_Rel := FieldByName('id_Rel').Value;
            GrpObj.id_RelParent := FieldByName('id_RelParent').Value;
            GrpObj.TableName := FieldByName('TableName').AsString;
            GrpObj.RelField := FieldByName('RelField').AsString;
            GrpObj.FieldName := FieldByName('FieldName').AsString;
            GrpObj.KeyField := FieldByName('KeyField').AsString;
            GrpObj.ObjNameField := FieldByName('ObjNameField').Value;
          end;
          Next;
        end;
        First;
      finally
        EnableControls;
      end;
    end;
    with cdsAggs do
    begin
      DisableControls;
      try
        First;
        while not Eof do
        begin
          AggObj := TAggList.Create;
          AAggList.Add(AggObj);
          
 //         AggObj.id_Prop := FieldByName('id_Prop').Value;
          AggObj.id_Rel := FieldByName('id_Rel').Value;
 //         AggObj.id_RelParent := FieldByName('id_RelParent').Value;
 //         AggObj.TableName := FieldByName('TableName').Value;
 //         AggObj.RelField := FieldByName('RelField').Value;
 //         AggObj.KeyField := FieldByName('KeyField').Value;
          AggObj.FieldName := FieldByName('FieldName').AsString;

          AggObj.AggsType := TUFAggs(FieldByName('AggCode').AsInteger);

          Next;
        end;
        First;
      finally
        EnableControls;
      end;
    end;
    if MakeSQLTree(AObjectList, AAggList, AColList, AGrpList, ATableList, AOrderList) then
    begin
      with SL do
      begin
        Clear;
        Add('SELECT');
        AddStrings(AColList);
        Add('FROM');
        AddStrings(ATableList);
        Add('JOIN #Tmp2 T ON T' + VarToStr(MObjD.Un_id_Rel) + '.ID_Oper = T.ID_Oper AND T' + VarToStr(MObjD.Un_id_Rel) + '.is_Mirr = T.is_Mirr' + ' AND (T.id_OperWare IS NULL OR T' + VarToStr(MObjD.Un_id_Rel) + '.id_OperWare = T.id_OperWare)');
        if AGrpList.Count > 0 then
        begin
          Add('GROUP BY');
          AddStrings(AGrpList);
          Add('ORDER BY');
          AddStrings(AOrderList);
        end;
      end;
    end;
  finally
    AObjectList.Free;
    AAggList.Free;
    AColList.Free;
    AGrpList.Free;
    ATableList.Free;
    AOrderList.Free;
  end;
end;

procedure TUFForm.GetTree;
var SL : TStrings;
    i : integer;
begin
  CheckFilter;
  Screen.Cursor := crSQLWait;
  SL := TStringList.Create;
  try
    GetSQLTree(SL);
    Screen.Cursor := crSQLWait;
    with cdsGetDataTree do
    begin
      Close;
      RemoteServer := TCustomRemoteServer(Connection);
      if ProviderName = '' then
      begin
        ProviderName := 'dsGetDataTree';
        Params.Clear;
        FetchParams;
      end;
      for i := 0 to cdsGetDataTree.Params.Count - 1 do
        Params[i].Value := Null;

      Params.ParamByName('@TreeSQL').Value := SL.Text;

      Params.ParamByName('@id_user').Value := Fid_user;
      if fBsnSelector1.ID > 0 then
        Params.ParamByName('@id_business').Value := fBsnSelector1.ID
      else
        Params.ParamByName('@id_business').Value := Null;

      if FObjList.Count = 0 then
      begin
        DoFilter(cdsGetDataTree, UnivTaskMaster, 0);
      end
      else
      begin
        for i := 0 to FObjList.Count - 1 do
        begin
          ShowProgressForm(Handle, i, FObjList.Count, 'Формирование запроса');
          DoFilter(cdsGetDataTree, TTaskMasterClass(FObjList.Objects[i]), i);
        end;
        CloseProgressForm;
      end;
      Open;
      fFltTree1.GetDataTree(cdsAggs, cdsGrp, cdsGetDataTree);
      fFltTree1.MakeTree(0, cdsGrp, cdsGetDataTree);
      fFltTree1.CalcAggsNodes(fFltTree1.dxTreeList, cdsAggs, cdsGrp, cdsGetDataTree);
      PageControl1.ActivePage := tsDataPg;
    end;
  finally
    EnableControl(tsDataPg);
    Screen.Cursor := crDefault;
    SL.Free;
  end;
end;

procedure TUFForm.GetDataTreeDB;
var i : integer;
    ACol : TdxDBTreeListColumn;
    AColumnClass: TdxDBTreeListColumnClass;
    S : String;
    AField : TField;
    ASG : TdxDBGridSummaryGroup;
    ASG_Item : TdxDBGridSummaryItem;
begin
{  Screen.Cursor := crSQLWait;
  THackdxDBGrid(AdxDBGrid).BeginLayout;
  try
    DataSource1.DataSet := cdsGetDataTree;
    with AdxDBGrid do
    begin
      BeginUpdate;
      DestroyColumns;
      Bands.Clear;
      Bands.Add;
      ClearGroupColumns;
      
      SummaryGroups.Clear;
      ASG := SummaryGroups.Add;
      ASG.DefaultGroup := true;
      ASG.BeginSummaryText := '[';
      ASG.EndSummaryText := ']';

      cdsGrp.First;
      i := 0;
      while not cdsGrp.Eof do
      begin
        AField := cdsGetDataTree.Fields[i];
        if AField is TbooleanField then
          AColumnClass := TdxDBGridCheckColumn
        else
          if AField is TDateTimeField then
          begin
            AColumnClass := TdxDBGridDateColumn;
            TDateTimeField(AField).DisplayFormat := 'dd.mm.yyyy hh.mm';
          end
          else
            if AField is TFloatField then
            begin
              AColumnClass := TdxDBGridCalcColumn;
              TFloatField(AField).DisplayFormat := '0.00';
            end
            else
              AColumnClass := TdxDBTreeListColumn;

        ACol := CreateColumn(AColumnClass);
        ACol.Caption := cdsGrp.FieldByName('GrpText').AsString;
        ACol.FieldName := AField.FieldName;

        cdsGrp.Next;
        inc(i);
      end;

      cdsAggs.First;
      i := cdsGrp.RecordCount;
      while not cdsAggs.Eof do
      begin
        AField := cdsGetDataTree.Fields[i];
        if AField is TbooleanField then
          AColumnClass := TdxDBGridCheckColumn
        else
          if AField is TDateTimeField then
          begin
            AColumnClass := TdxDBGridDateColumn;
            TDateTimeField(AField).DisplayFormat := 'dd.mm.yyyy hh.mm';
          end
          else
            if AField is TFloatField then
            begin
              AColumnClass := TdxDBGridCalcColumn;
              TFloatField(AField).DisplayFormat := '0.00';
            end
            else
              AColumnClass := TdxDBTreeListColumn;


          ACol := CreateColumn(AColumnClass);
          ACol.Caption := cdsAggs.FieldByName('AggText').AsString + ' (' + cdsAggs.FieldByName('CondName').DisplayText + ')';
          ACol.FieldName := AField.FieldName;

          if ACol is TdxDBGridCalcColumn then //TdxDBGridCurrencyColumn  then
          begin
            ACol.SummaryFooterType := cstSum;

            ASG_Item := ASG.SummaryItems.Add;
            ASG_Item.ColumnName := ACol.Name;
            ASG_Item.SummaryField := ACol.FieldName;
            ASG_Item.SummaryType := cstSum;
            ASG_Item.SummaryFormat := '0.00';

            ASG_Item := ASG.SummaryItems.Add;
            //   ASG_Item.ColumnName := ACol.Name;
            ASG_Item.SummaryField := ACol.FieldName;
            ASG_Item.SummaryType := cstSum;
            ASG_Item.SummaryFormat := S + '=0.00';
          end;

          cdsAggs.Next;
          inc(i);
        end;   

      for i := 0 to cdsGrp.RecordCount - 1 do
      begin
        AddGroupColumn(Columns[i]);
      end;
  //  Columns[0].Visible := false;
      KeyField := Columns[0].FieldName;
      Options := Options + [egoLoadAllRecords];
      ShowRowFooter := true;
    end;
  finally
    AdxDBGrid.EndUpdate;

    Screen.Cursor := crDefault;
    THackdxDBGrid(AdxDBGrid).EndLayout;
  end;
  for i := 0 to AdxDBGrid.ColumnCount - 1 do
    if AdxDBGrid.Columns[i].Width > 180 then
      AdxDBGrid.Columns[i].Width := 180;      }
end;

{ THackdxDBGrid }

procedure THackdxDBGrid.BeginLayout;
begin
  inherited;
end;

procedure THackdxDBGrid.EndLayout;
begin
  inherited;
end;

procedure TUFForm.ToolButton8Click(Sender: TObject);
begin
//*
end;

{ TDataObj }

constructor TDataObj.Create;
begin
  ValList := TVariantList.Create;
end;

destructor TDataObj.Destroy;
begin
  ValList.Free;
end;

procedure TUFForm.Button1Click(Sender: TObject);
begin
  GetTree;
end;

end.
