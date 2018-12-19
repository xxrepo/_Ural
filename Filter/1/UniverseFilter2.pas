unit UniverseFilter2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, menus,
  ExtCtrls, ComCtrls, StdCtrls, RxGrids, RXCtrls, Db,
  dbclient, mconnect;

{$R Ufrez2.res}
const
  NoParent = -2;
  DateMask                                   = 'dd.mm.yyyy';
  SQLDateMask                                = 'yyyy-mm-dd';
//  DateEditMask                                = 'dd' + DateSeparator +'mm'+ DateSeparator + 'yyyy';
  ArrMax                                     = 13;
  CondArray: array[0..ArrMax] of String     = ('Не пусто', 'Пусто', 'Не равно', 'Равно', 'Больше или равно', 'Меньше или равно', 'Больше', 'Меньше', 'Включает в себя', 'Находится между', 'Начинается с', 'Заканчивается', 'Входит в список', 'Не входит в список');
  SQLArray: array[0..ArrMax] of String     = (' Is not Null ', ' Is Null ', ' <> P1 ', ' = P1 ', ' >= P1 ', ' <= P1 ', ' > P1 ', ' < P1 ', ' Like ' + #39 + '%P1%' + #39 + ' ', ' Between P1 and P2 ', ' Like ' + #39 + 'P1%' + #39 + ' ', ' Like ' + #39 + '%P1' + #39 + ' ', ' In (P1) ', ' Not In (P1) ');
  Par1Capt  : array[0..ArrMax] of String     = ('', '', 'Значение', 'Значение', 'Значение', 'Значение', 'Значение', 'Значение', 'Значение', '1-е значение', 'Значение', 'Значение', 'Значение', 'Значение');
  Par2Capt : array[0..ArrMax] of String     = ('', '', '', '', '', '', '', '', '', '2-е значение', '', '', '', '');
  TypeArray: array[0..ArrMax, 0..2] of Byte = ((1, 1, 1), (1, 1, 1), (1, 1, 1), (1, 1, 1), (1, 0, 1), (1, 0, 1), (1, 0, 1), (1, 0, 1), (0, 1, 0), (1, 0, 1), (0, 1, 0), (0, 1, 0), (1, 1, 0), (1, 1, 0));

  CondArrayStr: array[0..ArrMax] of String     = ('указан(а)', 'не указан(а)', 'кроме: ', ': ', 'Больше или равно', 'Меньше или равно', 'Больше', 'Меньше', 'Включает в себя', 'Находится между', 'Начинается с', 'Заканчивается', ': ', 'кроме: ');
  CondArrayDate: array[0..ArrMax] of String     = ('указан(а)', 'не указан(а)', 'кроме: ', ': ', 'с(включительно)', 'до(включительно)', 'с', 'до', 'Включает в себя', 'в период', 'Начинается с', 'Заканчивается', ': ', 'кроме: ');
  CondArrayNum: array[0..ArrMax] of String     = ('указан(а)', 'не указан(а)', 'кроме: ', ': ', 'Больше или равно', 'Меньше или равно', 'Больше', 'Меньше', 'Включает в себя', 'Находится между', 'Начинается с', 'Заканчивается', ': ', 'кроме: ');

type
  TFilterData = class;
  TTaskMasterClass = class;
  TObjData = class;
  TMainData = class;

  TUniverseFilterStyle = (ufsMainTree, ufsObjView, ufsSaveBtn, ufsFieldsList, ufsCondList, ufsGroupList, ufsOrderList, ufsMayChangeFields, ufsMayChangeCond, ufsMayChangeGroup, ufsMayChangeOrder, fsMayCreateNew, fsMayDelete);
  TUniverseFilterStyles = set of TUniverseFilterStyle;

  TUniverseFilter2 = class(TPanel)
  private
    FTaskMaster: TTaskMasterClass;
    FMainTreeView: TTreeView;
    TBar                             : TToolBar;
    DeleteBtn, AddBtn, DelBtn, UpBtn, DownBtn, NewBtn, RefreshBtn, SaveBtn, SepBtn: TToolButton;
    mNewMenu: TPopupMenu;
    miAddNew, miAddChild: TMenuItem;
    CondControl          : TPageControl;
    FieldsSheet, FilterSheet, GroupSheet, OrderSheet: TTabSheet;
    ObjView                          : TTreeView;
    MSplitter, MSplitter2, FSplitter, Splitter             : TSplitter;
    FListView : TListView;
    FLVObjList : TList;
    fImgLst, fSelfImgLst                 : TImageList;
    CondBox, FilterListBox: TGroupBox;
    CondGrid                         : TRxDrawGrid;
    Label1, ParLabel1, ParLabel2     : TLabel;
    TypeCondBox                      : TComboBox;
    GrListBox, FieldsListBox, OrderListBox         : TListBox;
    WorkDS                           : TClientDataSet;
    WorkAct                          : TClientDataSet;
    ParEdit1, ParEdit2               : TEdit;
    ValList: TListBox;
    FSelectedNode : TTreeNode;
    FUniType: String;
    FDirectFilterString: String;
    FConnection: TCustomConnection;


    procedure MainViewChange(Sender: TObject; Node: TTreeNode);
    procedure MainViewExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
    procedure MainViewCollapsing(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
    procedure MainViewGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure MainViewGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure MainViewDblClick(Sender: TObject);
    procedure MainViewSetNodeImageIndex(Node: TTreeNode);

    procedure FLVOnData(Sender: TObject; Item: TListItem);
    procedure FLVOnDblClick(Sender: TObject);

//    procedure FieldsListBoxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
//    procedure OrderListBoxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
//    procedure GrListBoxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure CondGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);

    procedure FieldsListBoxAddItem(AObjData: TObjData);
    procedure OrderListBoxAddItem(AObjData: TObjData);
    procedure GrListBoxAddItem(AObjData: TObjData);

    procedure ListBoxClick(Sender: TObject);
    procedure ListBoxDblClick(Sender: TObject);
    procedure ListBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);

    procedure ObjViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ObjViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ObjViewChange(Sender: TObject; Node: TTreeNode);
    procedure ObjViewGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure ObjViewGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure ObjViewDblClick(Sender: TObject);
    procedure ObjViewExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);

    procedure SetImgLst(Value: TImageList);
    procedure SetEnabledButtons;
//    procedure SelBtnClick(Sender: TObject);
    procedure CondGridClick(Sender: TObject);
    procedure CondControlChange(Sender: TObject);
    procedure TypeCondBoxChange(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure UpBtnClick(Sender: TObject);
    procedure DownBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure FilterResize(Sender: TObject);
    procedure NewBtnClick(Sender: TObject);
    procedure NewChildBtnClick(Sender: TObject);
    procedure NewFilrer;
    procedure CondControlResizeCn(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
//    procedure FilterResizeCn(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
    function GetSelectedNode: TTreeNode;
    procedure SetSelectedNode(const Value: TTreeNode);
    procedure RefresheSelectedFilter;
    function GetFilterTextToDoc: String;
    procedure SaveFilter(AName: String);
    procedure SetDirectFilterString(const Value: String);
    procedure ListItemSetImageIndex(LI: TListItem);
    procedure GetChildNode(ANode: TTreeNode);
    procedure ShowChildInLV(Node: TTreeNode);
    procedure SetConnection(const Value: TCustomConnection);
  private
    { Private declarations }
    FUnivObjID : integer;
    FChildCreated: Boolean;
//    vSave: Boolean;
    fParentFilter: Integer;
    fID_Univ: Integer;
    fRefreshFilter: Boolean;
    fOnFillTree: TNotifyEvent;
//    SysConds: String;
//    OldFilterName: String;
    FStyle: TUniverseFilterStyles;
    FMainNodeName: String;
    FCaptionOrderSheet: String;
    FCaptionFilterSheet: String;
    FCaptionFieldSheet: String;
    FCaptionGroupSheet: String;
    fSelectedFilter: Integer;
    fNewCurrFilter: Integer;
    FFilterName: String;
    FAllowEmptyCondition: boolean;
    FMainNode: TTreeNode;
    procedure CalcUpDownPos;
    procedure BeginUpdateControl(AControl: TWinControl);
    procedure EndUpdateControl(AControl: TWinControl);
    procedure CheckUniverseFilterStyles;
    procedure SetRefreshFilter(Value: Boolean);
//    procedure ComboButtonClick(Sender: TObject);
    procedure ParamChange(Sender: TObject);
     procedure GetNewFilterParams(AFilterData: TFilterData; var P1, P2: String; SQLParam: Boolean);
    procedure FreeNode(Sender: TObject; Node: TTreeNode);
    procedure SafeFreeAndNil(var Obj);
    procedure SetID_Univ(Value: Integer);
    function NewFilterToSQL(FilterData: TFilterData): String;
    procedure SetMainNode(const Value: TTreeNode);
    function GetMainNode: TTreeNode;

    procedure NewFillTree(IDList: TList = nil);
    procedure SetStyle(const Value: TUniverseFilterStyles);
    procedure SetMainNodeName(const Value: String);
    procedure SetaptionOrderSheet(const Value: String);
    procedure SetCaptionFieldSheet(const Value: String);
    procedure SetCaptionFilterSheet(const Value: String);
    procedure SetCaptionGroupSheet(const Value: String);
    procedure SetSelectedFilter(const Value: Integer);
    procedure SetNewCurrFilter(const Value: Integer);
    procedure SetFilterName(const Value: String);
    procedure NewSetParamEditors(Cond: Integer);
    procedure GetNodeTDList(Node: TTreeNode);
    procedure GetNodeTDListCover(Node: TTreeNode);
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadMainTreeWidth(Reader: TReader);
    procedure WriteMainTreeWidth(Writer: TWriter);
    procedure ReadObjTreeWidth(Reader: TReader);
    procedure WriteObjTreeWidth(Writer: TWriter);
    procedure NewMenuPopup(Sender: TObject);

    procedure ParControlsFree;
//    function CreateQS(AObjData: TObjData): TEtranQuickSearch;
    procedure QSSelect(Sender: TObject);
    function GetSelCount: Integer;

//    function CreateValQS(FilterData: TFilterData; AVisible: boolean = true): TEtranQuickSearch;
    procedure ValListCreate(AFilterData: TFilterData);
    procedure ValListDblClick(Sender: TObject);
    procedure ValListChange;
//    procedure QSValListSelect(Q: TEtranQuickSearch) ;
    procedure Select(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure miEditClick(Sender: TObject);
    procedure miAddClick(Sender: TObject);
    procedure EditValList(Index: Integer);
    procedure miDelClick(Sender: TObject);


    function GetImageList: TImageList;
    //* Для построения запросов
    function MakeFieldsStr: String;
    function MakeGroupStr: String;
    function MakeOrderStr: String;
//    function MakeOtherCondStr: String;
    //* Для сохранения в базе
    function MakeWhereStr: String;
    function MakeSQLValList(FilterData: TFilterData): String;
    function MakeCondByWhereStr(AWhereStr: String): String;
    procedure SetShowButtonCaption(const Value: boolean);
    function GetShowButtonCaption: boolean;
  protected
    { Protected declarations }
 //   procedure CreateWnd; override;
    procedure SetParent(AParent: TWinControl); override;
    procedure CreateChildControls;
    procedure WMMouseActivate(var Message: TMessage); message WM_MOUSEACTIVATE;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    //* Для LM
    procedure SetFilterString(AFltString: String);
    function GetFilterString: String;
    //**************
  public
    { Public declarations }
    GroupNode: Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function FilterToStringDoc(FilterData: TFilterData): String;
    function FilterToStringDoc_GetVal(SelField, ID: Integer): String;
    procedure FilterToText(FilterData: TFilterData);

    procedure Initialize;
    procedure ShowFilterProp;

    function ExpandNode(ANode: TTreeNode): Boolean;
    procedure CollapseNode(ANode: TTreeNode);
    procedure ChangeNode(Node: TTreeNode);
    function CreateDataSet(DataSet: TClientDataSet): Boolean;
    procedure CreateDataSetByID(ANode: TTreeNode; DataSet: TClientDataSet);

    property SelCount     : Integer          read GetSelCount;
    property RefreshFilter: Boolean          read fRefreshFilter write SetRefreshFilter;

    property MainNode     : TTreeNode        read {FMainNode} GetMainNode write SetMainNode;
    property ID_Univ   : Integer       read fID_Univ      write SetID_Univ;
    property SelectedFilter    : Integer          read fSelectedFilter     write SetSelectedFilter;
    property CurrFilter   : Integer          read fNewCurrFilter    write SetNewCurrFilter;
    property FilterName: String read FFilterName write SetFilterName;

    property SelectedNode: TTreeNode read GetSelectedNode write SetSelectedNode;
//    property FMainNode:  TTreeNode        read fTestMainNode      write fTestMainNode;
  published
    { Published declarations }

    property Connection : TCustomConnection read FConnection write SetConnection;

    property ImgLst       : TImageList       read fImgLst        write SetImgLst;
    property OnFillTree   : TNotifyEvent     read fOnFillTree    write fOnFillTree;
    property Style: TUniverseFilterStyles read FStyle write SetStyle;
    property MainNodeName: String read FMainNodeName write SetMainNodeName;

    property DirectFilterString : String read FDirectFilterString write SetDirectFilterString;

    property CaptionFieldSheet: String read FCaptionFieldSheet write SetCaptionFieldSheet;
    property CaptionFilterSheet: String read FCaptionFilterSheet write SetCaptionFilterSheet;
    property CaptionGroupSheet: String read FCaptionGroupSheet write SetCaptionGroupSheet;
    property CaptionOrderSheet: String read FCaptionOrderSheet write SetaptionOrderSheet;

    property AllowEmptyCondition: boolean read FAllowEmptyCondition write FAllowEmptyCondition;
    property ShowButtonCaption: boolean read GetShowButtonCaption write SetShowButtonCaption;

    property UniType: String read FUniType write FUniType;
    property FilterString: String read GetFilterString write SetFilterString;
    property FilterTextToDoc: String read GetFilterTextToDoc;
  end;


  TTaskMasterClass = class
  private
    FOwner: TObject;
    FObjList: TList;
    FObjDataList: TList;
    FPropDataList: TList;

    FFilterList: TList;
    FMainDataList: TList;

    procedure ClearList(AList: TList);
    procedure CustomObjAdd(AObject: TObject; AList: TList);
    procedure CustomObjDel(AObject: TObject; AList: TList);
    function GetObject(i: Integer): TObject;
    procedure SetObject(i: Integer; const Value: TObject);
    function GetObjectsCount: Integer;
    function GetObjData(i: Integer): TObjData;
    function GetObjDataCount: Integer;
    procedure SetObjData(i: Integer; const Value: TObjData);
    function GetFilterData(i: Integer): TFilterData;
    function GetFilterDataCount: Integer;
    procedure SetFilterData(i: Integer; const Value: TFilterData);
    function GetMainData(i: Integer): TMainData;
    function GetMainDataCount: Integer;
    procedure SetMainData(i: Integer; const Value: TMainData);
  public
    constructor Create(AOwner: TObject);
    destructor Destroy; override;

    procedure ObjAdd(AObject: TObject);
    procedure ObjDel(AObject: TObject);

    procedure ClearObjList;
    procedure ClearObjDataList;
    procedure ClearPropDataList;

    procedure ClearFilterList;
    procedure ClearMainDataList;

    property Objects[i: Integer]: TObject read GetObject write SetObject;
    property ObjectsCount: Integer read GetObjectsCount;

    property ObjData[i: Integer]: TObjData read GetObjData write SetObjData;
    property ObjDataCount: Integer read GetObjDataCount;

    property FilterData[i: Integer]: TFilterData read GetFilterData write SetFilterData;
    property FilterDataCount: Integer read GetFilterDataCount;

    property MainData[i: Integer]: TMainData read GetMainData write SetMainData;
    property MainDataCount: Integer read GetMainDataCount;
  end;

  TUFClass = class
    FOwner: TTaskMasterClass;
    constructor Create(AOwner: TTaskMasterClass);
    destructor Destroy; override;
  end;

  TMainData = class(TUFClass)
  public
    ID            : Integer;
    ParentID      : Integer;
    Parent : TMainData;
    PrField       : Boolean;
    Name: String;
    ThisUser: boolean;
    HasSubFilter: boolean;
    CondStr, GrStr: String[200];
    constructor Create(AOwner: TTaskMasterClass);
  end;

  TObjData = class(TUFClass)
  private
    FPropList : TList;
  public
    ID, DType, DetParent, ObjID : Integer;
    PID : Variant;
    ObjName: String;
    ObjHidden, HasDetail: boolean;
    FieldKind: String[200];
    PrClass, Sel, Large: Boolean;
    ObjType: Integer;
    constructor Create(AOwner: TTaskMasterClass);
    destructor Destroy; override;
  end;

  TPropData = class(TUFClass)
  public
    id_Prop : Integer;
    FieldType: String;
    FieldDescr: String;
    isSelect: boolean;
    constructor Create(AOwner: TTaskMasterClass);
  end;

  TFilterData = class(TUFClass)
  public
    FObjData: TObjData;
    OperCode: Integer;
    Par1, Par2, Text         : String;
  end;
procedure Register;

implementation

uses
  CurrEdit, DateUtil, StrUtils, ToolEdit, ToolWin;

var   DateEditMask : String;

procedure Register;
begin
  RegisterComponents('Etran', [TUniverseFilter2]);
end;

{ TUniverseFilter2 }
procedure TUniverseFilter2.SetEnabledButtons;
begin
  if csDesigning in ComponentState then Exit;
  NewBtn.Enabled := (fsMayCreateNew in Self.Style) and (fConnection <> nil) and (FMainNode <> nil) and (ID_Univ <> - 1) and (SelectedFilter <> - 1);
  DeleteBtn.Enabled := (fsMayDelete in Self.Style) and (ID_Univ <> - 1) and (SelectedFilter <> - 1);
  RefreshBtn.Enabled := RefreshFilter;
  SaveBtn.Enabled := (SelCount > 0) and RefreshBtn.Enabled;
  if CondControl.ActivePage = FieldsSheet then
  begin
    with FieldsListBox do
    begin
      AddBtn.Enabled := (ufsMayChangeFields in Self.Style) and (ObjView.Selected <> nil) and (TObject(ObjView.Selected.Data) is TObjData) and not TObjData(ObjView.Selected.Data).PrClass and not TObjData(ObjView.Selected.Data).HasDetail {and (TObjData(ObjView.Selected.Data).FieldKind = 'Dim')} and (Items.IndexOfObject(TObjData(ObjView.Selected.Data)) = - 1);
      DelBtn.Enabled := Items.Count > 0;
      UpBtn.Enabled := ItemIndex > 0;
      DownBtn.Enabled := ItemIndex < Items.Count - 1;
    end;
  end
  else
    if CondControl.ActivePage = FilterSheet then
    begin
      AddBtn.Enabled := (ufsMayChangeCond in Self.Style) and (ObjView.Selected <> nil) and (TObject(ObjView.Selected.Data) is TObjData) and not TObjData(ObjView.Selected.Data).PrClass;
      DelBtn.Enabled := FTaskMaster.FilterDataCount > 0;
      UpBtn.Enabled := False;
      DownBtn.Enabled := False;
    end
    else
      if CondControl.ActivePage = GroupSheet then
      begin
        with GrListBox do
        begin
          AddBtn.Enabled := (ufsMayChangeGroup in Self.Style) and (ObjView.Selected <> nil) and (TObject(ObjView.Selected.Data) is TObjData) and not TObjData(ObjView.Selected.Data).PrClass {and (TObjData(ObjView.Selected.Data).FieldKind = 'Dim')} and (Items.IndexOfObject(TObjData(ObjView.Selected.Data)) = - 1);
          DelBtn.Enabled := Items.Count > 0;
          UpBtn.Enabled := ItemIndex > 0;
          DownBtn.Enabled := ItemIndex < Items.Count - 1;
        end;
      end
      else
        if CondControl.ActivePage = OrderSheet then
        begin
          with OrderListBox do
          begin
            AddBtn.Enabled := (ufsMayChangeOrder in Self.Style) and (ObjView.Selected <> nil) and (TObject(ObjView.Selected.Data) is TObjData) and not TObjData(ObjView.Selected.Data).PrClass {and (TObjData(ObjView.Selected.Data).FieldKind = 'Dim')} and (Items.IndexOfObject(TObjData(ObjView.Selected.Data)) = - 1);
            DelBtn.Enabled := Items.Count > 0;
            UpBtn.Enabled := ItemIndex > 0;
            DownBtn.Enabled := ItemIndex < Items.Count - 1;
          end;
      end;
end;

procedure TUniverseFilter2.SetImgLst(Value: TImageList);
begin
  fImgLst := Value;
  TBar.Images := GetImageList;
  ObjView.Images := GetImageList;
end;

constructor TUniverseFilter2.Create(AOwner: TComponent);
var ABitmap: TBitmap;
    i: Integer;
begin
  inherited Create(AOwner);
  fParentFilter := NoParent;
  FLVObjList := TList.Create;
  FAllowEmptyCondition := true;
  fSelectedFilter := -1;
  FSelectedNode := nil;
  FChildCreated := False;
  FStyle := [ufsMainTree, ufsObjView, ufsSaveBtn, ufsFieldsList, ufsCondList, ufsGroupList, ufsOrderList, ufsMayChangeFields, ufsMayChangeCond, ufsMayChangeGroup, ufsMayChangeOrder, fsMayCreateNew, fsMayDelete];
  ControlStyle := ControlStyle - [csAcceptsControls, csSetCaption] + [csOpaque];
  Align := alClient;
  fSelfImgLst := TImageList.Create(Self);

  ABitmap := TBitmap.Create;
  try
    for i := 0  to 15 do
    begin
      case i of
        0: ABitmap.LoadFromResourceName(HInstance, 'OPENFLD');
        1: ABitmap.LoadFromResourceName(HInstance, 'CLOSEFLD');
        2: ABitmap.LoadFromResourceName(HInstance, 'NEW');
        3: ABitmap.LoadFromResourceName(HInstance, 'REDCH');
        4: ABitmap.LoadFromResourceName(HInstance, 'ARROWLEFT');
        5: ABitmap.LoadFromResourceName(HInstance, 'ARROWRIGHT');
        6: ABitmap.LoadFromResourceName(HInstance, 'REFRESHE');
        7: ABitmap.LoadFromResourceName(HInstance, 'SAVE');
        8: ABitmap.LoadFromResourceName(HInstance, 'CH');
        9: ABitmap.LoadFromResourceName(HInstance, 'RELOAD');
        10: ABitmap.LoadFromResourceName(HInstance, 'ARROWDOWN');
        11: ABitmap.LoadFromResourceName(HInstance, 'ARROWUP');
        12: ABitmap.LoadFromResourceName(HInstance, 'DEL');
        13: ABitmap.LoadFromResourceName(HInstance, 'FILTER2');
        14: ABitmap.LoadFromResourceName(HInstance, 'FILTERITEM');
        15: ABitmap.LoadFromResourceName(HInstance, 'GRPNODE');
      end;
      fSelfImgLst.AddMasked(ABitmap, clSilver );
    end;
  finally
    ABitmap.free;
  end;
  FMainNodeName := 'Фильтры';

  FCaptionFieldSheet  := 'Поля';
  FCaptionFilterSheet := 'Фильтры';
  FCaptionGroupSheet  := 'Группировка';
  FCaptionOrderSheet  := 'Сортировка';

  FTaskMaster := TTaskMasterClass.Create(Self);

  OnResize := FilterResize;
//  OnConstrainedResize := FilterResizeCn;
//  FilterList := TList.Create;

//  fUnvID := - 1;
//  fOldFilter := - 1;
  GroupNode := False;
  WorkDs := TClientDataSet.Create(Self);
  WorkAct := TClientDataSet.Create(Self);
end;

procedure TUniverseFilter2.FilterResize(Sender: TObject);
begin
  if Assigned(CondControl) then
  begin
    BeginUpdateControl(CondControl);
    try
      CalcUpDownPos;
    finally
      EndUpdateControl(CondControl);
    end;
  end;
end;

{procedure TUniverseFilter2.SelBtnClick(Sender: TObject);
begin
  with TObjData(ObjView.Selected.Data) do
  begin
    Sel := not Sel;
    if Sel then
      SelCount := SelCount + 1
    else
      SelCount := SelCount - 1
  end;
  ObjView.Repaint;
  RefreshFilter := True;
end; }

procedure TUniverseFilter2.ObjViewChange(Sender: TObject; Node: TTreeNode);
begin
  SetEnabledButtons;
end;

procedure TUniverseFilter2.ObjViewDblClick(Sender: TObject);
var P: TPoint;
    Node: TTreeNode;
begin
  P := Mouse.CursorPos;
  P := ObjView.ScreenToClient(P);
  Node := ObjView.GetNodeAt(P.X, P.Y);
  if (Node = ObjView.Selected) and (AddBtn.Enabled) then
    AddBtn.Click;
end;

procedure TUniverseFilter2.ObjViewGetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  with Node do
  begin
    if TObject(Node.Data) is TObjData then
    begin
      if Expanded then
        ImageIndex := 0
      else
        ImageIndex := 1;
    end
    else
      if (TObject(Node.Data) is TPropData) and (TPropData(Node.Data).isSelect)  then
        ImageIndex := 8
      else
        ImageIndex := 2;
  end
end;

procedure TUniverseFilter2.ObjViewGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TUniverseFilter2.SetRefreshFilter(Value: Boolean);
begin
  fRefreshFilter := Value;
  SetEnabledButtons;
end;


{procedure TUniverseFilter2.ComboButtonClick(Sender: TObject);
begin
//
end; }

procedure TUniverseFilter2.ParamChange(Sender: TObject);
begin
  if Sender = ParEdit1 then
  begin
    if Sender is TDateEdit then
      FTaskMaster.FilterData[CurrFilter].Par1 := FloatToStr((Sender as TDateEdit).Date)
    else
      FTaskMaster.FilterData[CurrFilter].Par1 := TEdit(Sender).Text;
  end
  else
  begin
    if Sender is TDateEdit then
      FTaskMaster.FilterData[CurrFilter].Par2 := FloatToStr((Sender as TDateEdit).Date)
    else
      FTaskMaster.FilterData[CurrFilter].Par2 := TEdit(Sender).Text;
  end;
  FilterToText(FTaskMaster.FilterData[CurrFilter]);
  CondGrid.Invalidate;
  RefreshFilter := True
end;

procedure TUniverseFilter2.CondGridClick(Sender: TObject);
begin
  BeginUpdateControl(CondControl);
  try
    if (FTaskMaster.FilterDataCount > 0) and (CurrFilter <> CondGrid.Row) then CurrFilter := CondGrid.Row;
  finally
    EndUpdateControl(CondControl);
  end;
end;

procedure TUniverseFilter2.CondGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  S: String;
  Y: Integer;
begin
  if (FTaskMaster.FilterDataCount = 0) or (FTaskMaster.FilterDataCount < ARow) then Exit;
{  S := FilterToStringDoc(FTaskMaster.FilterData[ARow]);}
  if FTaskMaster.FilterData[ARow].Text = '' then
    FilterToText(FTaskMaster.FilterData[ARow]);
  S := FTaskMaster.FilterData[ARow].Text;
  if CondGrid.DefaultColWidth <> CondGrid.ClientWidth - 1 then
    CondGrid.DefaultColWidth := CondGrid.ClientWidth - 1;
  Y := DrawText(CondGrid.Canvas.Handle, PChar(S), - 1, Rect, dt_CalcRect or dt_WordBreak) + 5;
  CondGrid.RowHeights[ARow] := Y;
  Rect := CondGrid.CellRect(0, ARow);
  CondGrid.DrawMultiLine(Rect, S, taLeftJustify)
end;

procedure TUniverseFilter2.GetNewFilterParams(AFilterData: TFilterData; var P1, P2: String; SQLParam: Boolean);
var
  ToDate: Boolean;
//  Dm    : String;
begin
  P1 := '';
  P2 := '';
  with AFilterData do
  begin
    ToDate := (OperCode < ArrMax - 1) and (FObjData.DType = 2);
    if Par1 <> '' then
    begin
      if ToDate then
        P1 := FormatDateTime(SQLDateMask, StrToFloat(Par1))
      else
        P1 := Par1;
    end;
    if (Par2 <> '') and (OperCode in [9, 12]) then
    begin
      if ToDate then
        P2 := FormatDateTime(SQLDateMask, StrToFloat(Par2))
      else
        P2 := Par2;
    end;
  end;
end;

procedure TUniverseFilter2.TypeCondBoxChange(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ArrMax do
    if CondArray[I] = TypeCondBox.Text then
    begin
      FTaskMaster.FilterData[CurrFilter].OperCode := i;
      FilterToText(FTaskMaster.FilterData[CurrFilter]);
      CondGrid.Update;
      Break;
    end;
  CurrFilter := fNewCurrFilter;
  RefreshFilter := true;
  SetEnabledButtons;
end;

procedure TUniverseFilter2.AddBtnClick(Sender: TObject);
var
  D: TFilterData;
begin
  if csDesigning in ComponentState then Exit;
  if (TObjData(ObjView.Selected.Data).ObjType = 2) and
     (CondControl.ActivePage <> FilterSheet) then
    Exit;

  if CondControl.ActivePage = FieldsSheet then
  begin
    with FieldsListBox do
    begin
      if Items.IndexOfObject(TObjData(ObjView.Selected.Data)) = - 1 then
      begin
        FieldsListBoxAddItem(TObjData(ObjView.Selected.Data));
        TObjData(ObjView.Selected.Data).Sel := true;
      end;
     end;
  end
  else
    if CondControl.ActivePage = FilterSheet then
    begin
      D := TFilterData.Create(FTaskMaster);
      with D do
      begin
        FObjData := ObjView.Selected.Data;
        OperCode := - 1;
        Par1 := '';
        Par2 := ''
      end;
      with CondGrid do
      begin
        RowCount := FTaskMaster.FilterDataCount;
        Refresh;
        CurrFilter := RowCount - 1;
      end
    end
    else
      if CondControl.ActivePage = GroupSheet then
      begin
        with GrListBox do
          if Items.IndexOfObject(TObjData(ObjView.Selected.Data)) = - 1 then
          begin
            GrListBoxAddItem(TObjData(ObjView.Selected.Data));
      //      Items.AddObject('', TObjData(ObjView.Selected.Data));
      //      ItemIndex := Items.Count - 1;
          end;
      end
      else
        if CondControl.ActivePage = OrderSheet then
        begin
          with OrderListBox do
            if Items.IndexOfObject(TObjData(ObjView.Selected.Data)) = - 1 then
            begin
              OrderListBoxAddItem(TObjData(ObjView.Selected.Data));
             // Items.AddObject('', TObjData(ObjView.Selected.Data));
           //   ItemIndex := Items.Count - 1;
            end;
        end;
  RefreshFilter := True;
  ObjView.Refresh;  
  SetEnabledButtons;
end;

procedure TUniverseFilter2.DelBtnClick(Sender: TObject);
var
  I: Integer;
begin
  if csDesigning in ComponentState then Exit;
  if CondControl.ActivePage = FieldsSheet then
  begin
    with FieldsListBox do
    begin
      I := ItemIndex;
      if I > 0 then Dec(I);
      TObjData(Items.Objects[ItemIndex]).Sel := false;
      Items.Delete(ItemIndex);
      if Items.Count > 0 then ItemIndex := I;
    end;
  end
  else
    if CondControl.ActivePage = FilterSheet then
    begin
      with CondGrid do
      begin
        TObject(FTaskMaster.FilterData[Row]).Free;
        RowCount := RowCount - 1;
        Refresh;
        if FTaskMaster.FilterDataCount = 0 then
          CurrFilter := - 1
        else
          CurrFilter := Row;
      end;
    end
    else
      if CondControl.ActivePage = GroupSheet then
      begin
        with GrListBox do
        begin
          I := ItemIndex;
          if I > 0 then Dec(I);
          Items.Delete(ItemIndex);
          if Items.Count > 0 then ItemIndex := I;
        end;
      end
      else
        if CondControl.ActivePage = OrderSheet then
        begin
          with OrderListBox do
          begin
            I := ItemIndex;
            if I > 0 then Dec(I);
            Items.Delete(ItemIndex);
            if Items.Count > 0 then ItemIndex := I;
          end;
        end;
  RefreshFilter := True;
  ObjView.Refresh;  
  SetEnabledButtons;
end;

procedure TUniverseFilter2.UpBtnClick(Sender: TObject);
//var
//  S: String;
begin
  if csDesigning in ComponentState then Exit;
  if CondControl.ActivePage = FieldsSheet then
  begin
    with FieldsListBox do
    begin
      Items.Exchange(ItemIndex - 1, ItemIndex);
      Refresh;
    end;
  end
  else
    if CondControl.ActivePage = GroupSheet then
    begin
      with GrListBox do
      begin
        Items.Exchange(ItemIndex - 1, ItemIndex);
        Refresh;
      end;
    end
    else
      if CondControl.ActivePage = OrderSheet then
      begin
        with OrderListBox do
        begin
          Items.Exchange(ItemIndex - 1, ItemIndex);
          Refresh;
        end;
      end;
  RefreshFilter := True;
end;

procedure TUniverseFilter2.DownBtnClick(Sender: TObject);
//var
//  S: String;
begin
  if csDesigning in ComponentState then Exit;
  if CondControl.ActivePage = FieldsSheet then
  begin
    with FieldsListBox do
    begin
      Items.Exchange(ItemIndex + 1, ItemIndex);
      Refresh;
    end;
  end
  else
    if CondControl.ActivePage = GroupSheet then
    begin
      with GrListBox do
      begin
        Items.Exchange(ItemIndex + 1, ItemIndex);
        Refresh;
      end;
    end
    else
      if CondControl.ActivePage = OrderSheet then
      begin
        with OrderListBox do
        begin
          Items.Exchange(ItemIndex + 1, ItemIndex);
          Refresh;
        end;
      end;
  RefreshFilter := True;
end;

procedure TUniverseFilter2.NewBtnClick(Sender: TObject);
var
  I: Integer;
begin
  if csDesigning in ComponentState then Exit;
  fParentFilter := NoParent;
  TTreeView(MainNode.TreeView).Selected := nil;
  FTaskMaster.ClearFilterList;
  FieldsListBox.Items.Clear;
  GrListBox.Items.Clear;
  OrderListBox.Items.Clear;
  CurrFilter := -1;
  CondGrid.RowCount := 0;
  for I := 0 to FTaskMaster.ObjDataCount - 1 do
    FTaskMaster.ObjData[I].Sel := False;
  ObjView.Refresh;
  NewFilrer;
end;

procedure TUniverseFilter2.NewChildBtnClick(Sender: TObject);
begin
  if csDesigning in ComponentState then Exit;
  fParentFilter := SelectedFilter;
  NewFilrer;
end;

procedure TUniverseFilter2.NewFilrer;
//var
//  I: Integer;
begin
  FilterName := 'Новый фильтр';
  fSelectedFilter := -1;
  fRefreshFilter := False;
end;

procedure TUniverseFilter2.RefreshBtnClick(Sender: TObject);
begin
  if csDesigning in ComponentState then Exit;
  //SelectedFilter := SelectedFilter;
  RefresheSelectedFilter;
  RefreshFilter := False;
end;

procedure TUniverseFilter2.SaveBtnClick(Sender: TObject);
var
  N: String;
begin
  if csDesigning in ComponentState then Exit;
  if FilterName <> '' then
    N := FilterName
  else
    N := 'Новый фильтр';

  if not InputQuery('Наименование фильтра', 'Введите наименование', N) then Exit;
  if N = '' then Exit;

  SaveFilter(N);
end;

procedure TUniverseFilter2.SaveFilter(AName: String);
var
  FieldsStr, GroupStr, WhereStr, OrderStr: String;
  NR: boolean;
  Node: TTreeNode;
  IDList: TList;
begin
{  try
    FieldsStr := MakeFieldsStr;
    GroupStr := MakeGroupStr;
    OrderStr := MakeOrderStr;
    WhereStr := MakeWhereStr;

    with WorkAct do
    begin
      SQLActs.Clear;
      Sa := SQLActs.Add;
      with Sa do
      begin
        NameSQL := 'Set_User_Filter';
        with Params do
        begin
          Clear;
          with CreateParam(ftInteger, 'FID', ptInputOutput) do Value := SelectedFilter;
          with CreateParam(ftInteger, 'ParentID', ptInputOutput) do
            if fParentFilter = NoParent then
              Value := ''
            else
              Value := fParentFilter;
          with CreateParam(ftInteger, 'UNID', ptInput) do AsInteger := ID_Univ;
          with CreateParam(ftString, 'NAME', ptInput) do AsString := AName;
          with CreateParam(ftString, 'SELSTR', ptInput) do AsString := FieldsStr;
          with CreateParam(ftString, 'WHERESTR', ptInput) do AsMemo := WhereStr;
          with CreateParam(ftString, 'GROUPSTR', ptInput) do AsString := GroupStr;
          with CreateParam(ftString, 'ORDERSTR', ptInput) do AsString := OrderStr;
          CreateParam(ftInteger, 'USER_ORG_TYPE_ID', ptInput);
          CreateParam(ftInteger, 'USER_ORG_ID', ptInput);
          CreateParam(ftInteger, 'USER_POST', ptInput);
          CreateParam(ftInteger, 'USER_ID', ptInput);
        end;
        try
          Prepare;
          Apply;
        except
          on E: Exception do
          begin
            raise Exception.Create('Не могу сохранить фильтр ' + E.Message);
          end;
        end;
        RefreshFilter := false;

        NR := (TTreeView(MainNode.TreeView).Selected = nil);
        fSelectedFilter := Sa.Params.ParamByName('FID').AsInteger;
        IDList := TList.Create;
        IDList.Add(Pointer(fSelectedFilter));

        Node := TTreeView(MainNode.TreeView).Selected;
        if Node <> nil then
        begin
//          IDList := TList.Create;
//          IDList.Add(Pointer(fSelectedFilter));
          while (Node <> nil) and (TObject(Node.Data) is TMainData) and (TMainData(Node.Data).ID <> -1) do
          begin
            IDList.Add(Pointer(TMainData(Node.Data).ID));
            Node := Node.Parent;
          end;
        end;
        
        NewFillTree(IDList);
        
      end;
    end;   
  finally
    if IDList <> nil then IDList.Free;
//    if Assigned(fOnFillTree) then fOnFillTree(Self)
  end; }
end;

procedure TUniverseFilter2.CondControlChange(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TUniverseFilter2.SetParent(AParent: TWinControl);
begin
  inherited;
  if (AParent = nil) or (FChildCreated) then Exit;
  CreateChildControls;
  SetEnabledButtons;
end;

procedure TUniverseFilter2.FreeNode(Sender: TObject; Node: TTreeNode);
begin
  if (TObject(Node.Data) is TMainData) and (TMainData(Node.Data).PrField) then
  begin
    try
      TObject(Node.Data).Free;
    except
      on E: Exception do raise Exception.Create('Ошибка при удалении объекта из Node.Data ' + E.Message);
    end;
    Node.Data := nil;
  end;
end;

procedure TUniverseFilter2.DeleteBtnClick(Sender: TObject);
{var
  Sa: TSQLAct; }
begin
{  if csDesigning in ComponentState then Exit;
  if MessageRusDlg('Вы уверены что хотите удалить фильтр?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
  with WorkAct do
  begin
    SQLActs.Clear;
    Sa := SQLActs.Add;
    with Sa do
    begin
      NameSQL := 'Del_User_Filter';
      Params.Clear;
      with Params.CreateParam(ftInteger, 'FilterID', ptInputOutput) do Value := fSelectedFilter;
      try
        Prepare;
        Apply;
      except
        on E: Exception do
        begin
          raise Exception.Create('Не могу удалить фильтр ' + E.Message);
        end;
      end;
      NewFillTree;
    end
  end;   }
end;

destructor TUniverseFilter2.Destroy;
//var i: Integer;
begin
  ParControlsFree;

 { while FLVObjList.Count > 0 do
  begin
    TObject(FLVObjList[FLVObjList.Count - 1]).Free;
  end; }
  FLVObjList.Free;

  FTaskMaster.Free;
//******************
  Splitter.Free;
  MSplitter.Free;
 // fSelfImgLst.Free;

 { GrListBox.Free;
  CondGrid.Free;
  FilterListBox.Free;
  TypeCondBox.Free;
  ParLabel2.Free;
  ParLabel1.Free;
  Label1.Free;
  CondBox.Free;
  ObjView.Free;
  WorkAct.Free;
  WorkDs.Free;
  CondControl.Free;
  TBar.Free;  }
//***********
  inherited;
end;

procedure TUniverseFilter2.SafeFreeAndNil(var Obj);
begin
  try
    FreeAndNil(Obj);
  except
  end;
end;

procedure TUniverseFilter2.ShowFilterProp;
//var F: TUFForm;
begin
{  F := TUFForm.Create(Self);
  try
    F.Connection := Connection;
    F.ID_Univ := fNewUnvID;
    F.SelectedFilter :=  TMainData(TTreeView(MainNode.TreeView).Selected.Data).ID;
    F.Show;
  finally
  end; }
end;

procedure TUniverseFilter2.CreateDataSetByID(ANode: TTreeNode; DataSet: TClientDataSet);
{var
  tmpWorkList: TStringList;
  tmpFilterList: TList;
  i, j, Num    : Integer;
  D       : TFilterData;
  S  : String;
  tmpSelFields  : String;
  tmpCondFilter: String;
  tmpGroupFields  : String;
  tmpOrderFields  : String;
//  tmpPrpFilter  : String;
  N: TTreeNode;
  Value: Integer; }
begin
{  if ANode = nil then
    ANode := TTreeView(MainNode.TreeView).Selected;
  if (ANode = nil) or (not (TObject(ANode.Data) is TMainData)) then Exit;
  Value := TMainData(ANode.Data).ID;
  tmpWorkList := TStringList.Create;
  tmpFilterList := TList.Create;
  D := TFilterData.Create(FTaskMaster);
  DataSet.DisableControls;
  try
    if Value <> - 1 then
    begin
      with WorkDS do
      begin
        if Active then Close;
        NameSQL := 'Get_User_Filter_List';
        with Params do
        begin
          Clear;
          CreateParam(ftInteger, 'UNID', ptInput).AsInteger := ID_Univ;
          CreateParam(ftInteger, 'FILT_ID', ptInput).AsInteger := Value;
        end;
        try
          Open;
        except
          on E: Exception do
          begin
            raise Exception.Create('Не могу считать заданный фильтр  ' + E.Message);
          end;
        end;

        tmpSelFields := FieldByName('SELSTR').AsString;
        tmpOrderFields := FieldByName('OrderStr').AsString;
  //******************* Формирование группировки *****************
        if FieldByName('GROUPSTR').AsString <> '' then
        begin
          tmpWorkList.Text := ReplaceStr(Copy(FieldByName('GROUPSTR').AsString, 2, Length(FieldByName('GROUPSTR').AsString) - 2), ',', #13#10);
          tmpGroupFields := ',';
          Num := StrToInt(tmpWorkList[i]);
          for i := 0 to tmpWorkList.Count - 1 do
            for j := 0 to FTaskMaster.ObjDataCount - 1 do
              if not FTaskMaster.ObjData[j].PrClass and (FTaskMaster.ObjData[j].ID = Num) then
                tmpGroupFields := tmpGroupFields + IntToStr(j) + ',';
        end;
  //******************* Формирование условий *****************
        tmpCondFilter := '';
        if FieldByName('WHERESTR').AsString <> '' then
        begin
          tmpCondFilter := MakeCondByWhereStr(FieldByName('WHERESTR').AsString);
        end;
        Close;
      end;

//      tmpPrpFilter := '';

      N := ANode;
      if TMainData(N.Data).PrField then
      begin
        S := '';
        repeat
          if S <> '' then S := '|' + S;
          S := TMainData(N.Data).CondStr + S;
          N := N.Parent
        until not TMainData(N.Data).PrField;
        if tmpCondFilter <> '' then tmpCondFilter := tmpCondFilter + '|';
        tmpCondFilter := tmpCondFilter + S
      end;
  //************************************
      with DataSet do
      begin
        if Active then Close;
        Params.Clear;
        if NameSQL = '' then NameSQL := 'Get_Query';
        with Params do
        begin
          CreateParam(ftInteger,'UNID',ptInput).AsInteger := ID_Univ;
          CreateParam(ftString,'SEL_FIELDS',ptInput).AsString := tmpSelFields;
          CreateParam(ftString,'COND_FILTER',ptInput).AsMemo := tmpCondFilter;
          CreateParam(ftString,'GROUP_FIELDS',ptInput).AsString := tmpGroupFields;
          CreateParam(ftInteger,'DIST',ptInput).AsInteger := 0
        end;
        try
          Open;
        except
          on E: Exception do
          begin
            raise Exception.Create('Не могу открыть набор данных ' + E.Message);
          end;
        end
      end;
    end;
  except
  end;
  SafeFreeAndNil(tmpWorkList);
  SafeFreeAndNil(tmpFilterList);
  SafeFreeAndNil(D);
  DataSet.EnableControls;  }
end;

function TUniverseFilter2.NewFilterToSQL(FilterData: TFilterData): String;
var
  S1, S2: String;
//  S: String;
//  I, N        : Integer;
  ToDate: Boolean;
begin
  if FilterData.FObjData.ObjType = 1 then
  begin
  with FilterData do
  begin
    ToDate := (OperCode < ArrMax - 1) and (FilterData.FObjData.DType = 2);
    if Par1 <> '' then
    begin
      if ToDate then S1 := FormatDateTime(SQLDateMask, StrToFloat(Par1))
      else S1 := Par1
    end;
    if Par2 <> '' then
    begin
      if ToDate then S2 := FormatDateTime(SQLDateMask, StrToFloat(Par2))
      else S2 := Par2
    end;

    Result := IntToStr(FilterData.FObjData.ID) + SQLArray[OperCode];
    if FilterData.FObjData.DType > 0 then
    begin
      if (OperCode = ArrMax - 1) or (OperCode = ArrMax) then
      begin
        Result := IntToStr(FilterData.FObjData.ID) + MakeSQLValList(FilterData);
      {
        N := WordCount(S1, [';']);
        for I := 1 to N do
        begin
          S := ExtractWord(I, S1, [';']);
          if FilterData.FObjData.DType = 2 then
            S := FormatDateTime(SQLDateMask, StrToDateFmt(DateMask, S));
          S := #39 + S + #39;
          S1 := ReplaceStr(S1, ExtractWord(I, S1, [';']), S)
        end;
        S1 := ReplaceStr(S1, ';', ','); }
      end
      else
        if Pos('Like', Result) = 0 then
        begin
          if S1 <> '' then S1 := #39 + Trim(S1) + #39;
          if S2 <> '' then S2 := #39 + Trim(S2) + #39
        end;
    end
    else
      S1 := ReplaceStr(S1, ';', ',');
    if Pos('P1', Result) <> 0 then Result := ReplaceStr(Result, 'P1', S1);
    if Pos('P2', Result) <> 0 then Result := ReplaceStr(Result, 'P2', S2)
  end;
  Result := '(' + Result + ')';
  end
  else
    Result := '(c' + IntToStr(FilterData.FObjData.ID) + ')';
end;

function TUniverseFilter2.MakeSQLValList(FilterData: TFilterData): String;
var
//  S2: String;
  S, S1, Rez: String;
  I, N        : Integer;
//  ToDate: Boolean;
begin
  Result := '';
  if FilterData.OperCode < ArrMax - 1 then Exit;
  with FilterData do
  begin
    S1 := Par1;
    Result := SQLArray[OperCode];

    if FilterData.FObjData.DType > 0 then
    begin
      if OperCode in [ArrMax - 1, ArrMax] then
      begin
        N := WordCount(S1, [';']);
        for I := 1 to N do
        begin
          S := ExtractWord(I, S1, [';']);
          if FilterData.FObjData.DType = 2 then
            S := FormatDateTime(SQLDateMask, StrToDateFmt(DateMask, S));
          S := #39 + Trim(S) + #39;
          if Rez = '' then
            Rez := S
          else
            Rez := rez + ',' + S;
        end;
        S1 := ReplaceStr(S1, ';', ',');
        S1 := Rez;
      end;
    end
    else
      S1 := ReplaceStr(S1, ';', ',');
    if Pos('P1', Result) <> 0 then Result := ReplaceStr(Result, 'P1', S1);
  end;
end;

function TUniverseFilter2.MakeCondByWhereStr(AWhereStr: String): String;
var WorkList: TStringList;
    i, j, Num, cnt: Integer;
    S: String;
    D: TFilterData;
begin
  Result := '';
  WorkList := TStringList.Create;
  D := TFilterData.Create(FTaskMaster);
  try
    WorkList.Text := ReplaceStr(AWhereStr, '|', #13#10);
    for i := 0 to WorkList.Count - 1 do
    begin
      S := WorkList[I];
      cnt := WordCount(S, [',']);
      Num := StrToInt(ExtractWord(1, S, [',']));
      for j := 0 to FTaskMaster.ObjDataCount - 1 do
        if (not FTaskMaster.ObjData[j].PrClass) and  // Объект (Не класс)
           (FTaskMaster.ObjData[j].ID = Num) and  // ID
           (((cnt > 1) and (FTaskMaster.ObjData[j].ObjType = 1)) or // Объект
           ((cnt = 1) and (FTaskMaster.ObjData[j].ObjType = 2))) then  // Предопределенный фильтр
        begin
          D.FObjData := FTaskMaster.ObjData[j];
          Break;
        end;
      if cnt > 1 then
      begin
        D.OperCode := StrToInt(ExtractWord(2, S, [',']));
        if cnt >= 3 then
          D.Par1 := ExtractWord(3, S, [',']);
        if cnt = 4 then
          D.Par2 := ExtractWord(4, S, [',']);
        if Result <> '' then
          Result := Result + '|';
      end;
      Result := Result + NewFilterToSQL(D);
    end;
  finally
    WorkList.Free;
    D.Free;
  end;
end;

procedure TUniverseFilter2.SetID_Univ(Value: Integer);
var
  ObjData : TObjData;
  PropData : TPropData;
  Cnt, i : integer;
begin
  if fID_Univ = Value then
    Exit;
  fID_Univ := Value;
  FTaskMaster.ClearObjDataList;
  try
    with WorkDS do
    begin
      if Active then Close;
      RemoteServer := TCustomRemoteServer(FConnection);
      ProviderName := 'dsGetObj';
      Params.Clear;
      FetchParams;
      Params.ParamByName('@id_univ').Value := fID_Univ;
      try
        Open;
      except
        on E: Exception do begin
          raise Exception.Create('Не могу получить список объектов  ' + E.Message);
        end;
      end;
      FUnivObjID := TDispatchConnection(FConnection).AppServer.GetUnivObjID(fID_Univ);
      First;

//      ObjData := TObjData.Create(FTaskMaster);
//      ObjData.ID := FUnivObjID;

      while not EOF do
      begin
        ObjData := TObjData.Create(FTaskMaster);
        with ObjData do
        begin
          ID := FieldByName('id_Obj').AsInteger;
          PID := FieldByName('id_ObjParent').Value;
          ObjName := FieldByName('RelName').AsString;
        end;
        Next;
      end;
      Close;
      
      ProviderName := 'dsGetUnivPropList';
      Params.Clear;
      FetchParams;
      Params.ParamByName('@id_univ').Value := fID_Univ;
      try
        Open;
      except
        on E: Exception do begin
          raise Exception.Create('Не могу получить список объектов  ' + E.Message);
        end;
      end;

      Cnt := FTaskMaster.ObjDataCount;
      while not EOF do
      begin
        for i := 0 to Cnt - 1 do
        begin
          ObjData := FTaskMaster.ObjData[i];
          if (ObjData.ID = FieldByName('id_Obj').AsInteger) then
          begin
            PropData := TPropData.Create(FTaskMaster);
            PropData.id_Prop := FieldByName('id_Prop').AsInteger;
            PropData.FieldType := FieldByName('FieldType').AsString;
            PropData.FieldDescr := FieldByName('FieldDescr').AsString;
            ObjData.FPropList.Add(PropData);
          end;
        end;
        Next;
      end;
      Close;

    end;
  finally
    WorkDS.Close;
    GetNodeTDListCover(nil);
  end; 
end;

procedure TUniverseFilter2.GetNodeTDListCover(Node: TTreeNode);
begin
  ObjView.Items.BeginUpdate;
  try
    if Node <> nil then
      Node.DeleteChildren
    else
      ObjView.Items.Clear;
    GetNodeTDList(Node);
  finally
    if ObjView.Items.Count > 0 then
      ObjView.Items[0].Expand(False);
    ObjView.Items.EndUpdate;
  end;
end;

procedure TUniverseFilter2.GetNodeTDList(Node: TTreeNode);
var
  i, j : Integer;
  ObjData  : TObjData;
  N: TTreeNode;
  ACLID : Variant;
  Cnt: Integer;
begin
  { Вариант с рекурсией  }
  try
    if Node = nil then
    begin
      ACLID := Null;
      ObjView.Items.Clear;
    end
    else
    begin
      ACLID := TObjData(Node.Data).ID;
      Node.DeleteChildren;
    end;
    Cnt := FTaskMaster.ObjDataCount;
    for i := 0 to Cnt - 1 do
    begin
      ObjData := FTaskMaster.ObjData[i];
      if (ObjData.PID = ACLID) then
      begin
          N := ObjView.Items.AddChildObject(Node, ObjData.ObjName, ObjData);
          GetNodeTDList(N);
        for j := 0 to ObjData.FPropList.Count - 1 do
        begin
          ObjView.Items.AddChildObject(N, TPropData(ObjData.FPropList[j]).FieldDescr, ObjData.FPropList[j]);
        end;
      end;
    end;
  finally
    if Node <> nil then
      TObjData(Node.Data).HasDetail := Node.HasChildren;
  end;
end;

procedure TUniverseFilter2.SetMainNode(const Value: TTreeNode);
var
  D: TMainData;
begin
  FMainNode := Value;
//  FTaskMaster.ClearMainDataList;
  D := TMainData.Create(FTaskMaster);
  Value.Data := D;
  TTreeView(FMainNode.TreeView).OnDeletion := FreeNode;
  NewFillTree;
end;

function TUniverseFilter2.GetMainNode: TTreeNode;
begin
  Result := FMainNode;
end;

procedure TUniverseFilter2.NewFillTree(IDList: Tlist);
var
  N, Node: TTreeNode;
  M: TMainData;
  I, J, Num: Integer;
  WorkList: TStringList;
begin
{  if MainNode = nil then Exit;
  TTreeView(MainNode.TreeView).Items.BeginUpdate;
  try
    TTreeView(MainNode.TreeView).OnDeletion := FreeNode;
    MainNode.DeleteChildren;
    for i := FTaskMaster.MainDataCount - 1 downto 0 do
      if FTaskMaster.MainData[i] <> MainNode.Data then
        FTaskMaster.MainData[i].Free;

    MainNode.HasChildren := true;
    WorkList := TStringList.Create;
    with WorkDS do
    begin
      if Active then Close;
      NameSQL := 'Get_User_Filter_List';
      Params.Clear;
      Params.CreateParam(ftInteger,'UNID',ptInput).Value := ID_Univ;
      Params.CreateParam(ftInteger,'FILT_ID',ptInput).AsInteger := - 1;
      try
        Open;
      except
        on E: Exception do
        begin
          raise Exception.Create('Не могу получить список фильтров для выбранной схемы ' + E.Message);
        end;
      end;
      First;
      while not EOF do
      begin
        M := TMainData.Create(FTaskMaster);
        with M do
        begin
          ID := FieldByName('FILTER_ID').AsInteger;
          Name := FieldByName('NAME').AsString;
          ThisUser := FieldByName('USER_ID').AsString <> '';
          if FieldByName('PARENT_ID').AsString <> '' then
            ParentID := FieldByName('PARENT_ID').AsInteger;
          GrStr := FieldByName('GROUPSTR').AsString;
          CondStr := MakeCondByWhereStr(FieldByName('WHERESTR').AsString);

        end;
        Next;
      end;
      Close;
    end;
    for i := 0 to FTaskMaster.MainDataCount - 1 do
      if FTaskMaster.MainData[i].ParentID <> NoParent then
      begin
        for j := 0 to FTaskMaster.MainDataCount - 1 do
          if FTaskMaster.MainData[j].ID = FTaskMaster.MainData[i].ParentID then
          begin
            FTaskMaster.MainData[j].HasSubFilter := true;
            Break;
          end;
      end;

    for i := 0 to FTaskMaster.MainDataCount - 1 do
    begin
      M := FTaskMaster.MainData[i];
      if (M.ID <> -1) and (M.ParentID = NoParent) then
      begin
        N := TTreeView(MainNode.TreeView).Items.AddChildObject(MainNode, M.Name, M);
        N.HasChildren := (M.GrStr <> '') or (M.HasSubFilter);
        MainViewSetNodeImageIndex(N);
      end;
    end;
    if (IDList <> nil) and (SelectedFilter <> -1) then
    begin
      Node := MainNode;
      for i := IDList.Count - 1 downto 0 do
      begin
        Num := Integer(IDList[i]);
        for j := 0 to Node.Count - 1 do
        begin
          if TMainData(Node.Item[j].Data).ID = Num then
          begin
            Node := Node.Item[j];
            Node.Expand(false);
            Break;
          end;
        end;
      end;
      if Node <> nil then
        TTreeView(MainNode.TreeView).Selected := Node;
    end;
  finally
    WorkList.Free;
    TTreeView(MainNode.TreeView).Items.EndUpdate;
  end;
  if Assigned(fOnFillTree) then fOnFillTree(Self); }
end;

procedure TUniverseFilter2.GetChildNode(ANode: TTreeNode);
var
  FID, J, K: Integer;
  N, Node  : TTreeNode;
  WorkList : TStringList;
  FList    : TList;
  S, S2, tmpCondFilter: String;
  M        : TMainData;
  D        : TFilterData;
  i: Integer;
  OldCursor : TCursor;
begin
 { if (ANode.Count > 0) or not (TObject(ANode.Data) is TMainData) then Exit;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  TTreeView(MainNode.TreeView).Items.BeginUpdate;
  try
    D := TFilterData.Create(FTaskMaster);
    WorkList := TStringList.Create;
    FList := TList.Create;
    with WorkDS do
    begin
      FID := TMainData(ANode.Data).ID;

      if Active then Close;
  //******************* Формирование условий *****************
      tmpCondFilter := TMainData(ANode.Data).CondStr;

      N := ANode;
      if (N <> nil) and (TObject(N.Data) is TMainData) and (TMainData(N.Data).ParentID <> NoParent) then
      begin
        S2 := '';
        N := N.Parent;
        repeat
          if TMainData(N.Data).CondStr <> '' then
          begin
            if S2 <> '' then S2 := '|' + S2;
            S2 := TMainData(N.Data).CondStr + S2;
          end;
          N := N.Parent;
        until TMainData(N.Data).ID = -1;
        if tmpCondFilter <> '' then tmpCondFilter := tmpCondFilter + '|';
        tmpCondFilter := tmpCondFilter + S2;
      end;        

      if ANode.Count = 0 then
      begin
        for i := 0 to FTaskMaster.MainDataCount - 1 do
        begin
          if TMainData(ANode.Data).ID = FTaskMaster.MainData[i].ParentID then
          begin
            Node := TTreeView(MainNode.TreeView).Items.AddChildObject(ANode, FTaskMaster.MainData[i].Name, FTaskMaster.MainData[i]);
            Node.HasChildren := (FTaskMaster.MainData[i].GrStr <> '') or (FTaskMaster.MainData[i].HasSubFilter);
            MainViewSetNodeImageIndex(Node);
          end;
        end;
      end;
      if TMainData(ANode.Data).GrStr <> '' then
      begin
        NameSQL := 'Get_Query';
        Params.Clear;
        with Params do
        begin
          CreateParam(ftInteger,'UNID',ptInput).AsInteger := ID_Univ;
          CreateParam(ftString,'SEL_FIELDS',ptInput).AsString := TMainData(ANode.Data).GrStr;
          CreateParam(ftString,'ORD_FIELDS',ptInput).AsString := TMainData(ANode.Data).GrStr;
          CreateParam(ftString,'COND_FILTER',ptInput).AsString := tmpCondFilter;
          CreateParam(ftString,'GROUP_FIELDS',ptInput).AsString := S2;
          CreateParam(ftInteger,'DIST',ptInput).AsInteger := 1
        end;
        try
          Open;
        except
          on E: Exception do
          begin
            raise Exception.Create('Не могу открыть набор данных  ' + E.Message);
          end;
        end;
        if not IsEmpty then
        begin
          with WorkList do
          begin
            Clear;
            Text := ReplaceStr(Copy(TMainData(ANode.Data).GrStr, 2, Length(TMainData(ANode.Data).GrStr) - 2), ',', #13#10)
          end;
          while not EOF do
          begin
            N := ANode;
            Node := nil;
            for J := 0 to FieldCount - 1 do
            begin
              if Fields[J].AsString = '' then
                S := 'Не определено'
              else
                S := Fields[J].AsString;

              with TTreeView(MainNode.TreeView) do
                for K := 0 to Items.Count - 1 do
                if (Items[K].Parent = N) and (Items[K].Text = S) then
                  begin
                    Node := Items[K];
                    Break;
                  end;
              if Node = nil then
              begin
                M := TMainData.Create(FTaskMaster);
                Node := TTreeView(MainNode.TreeView).Items.AddChildObject(N, S, M);
                M.Name := S;
                for K := 0 to FTaskMaster.ObjDataCount - 1 do
                  with FTaskMaster.ObjData[K] do
                    if not PrClass and (IntToStr(ID) = WorkList[J]) then
                    begin
                      M.ID := FID;
                      M.PrField := True;
                      M.CondStr := '(' + ExtractWord(J + 1, Copy(TMainData(ANode.Data).GrStr, 2, Length(TMainData(ANode.Data).GrStr) - 2), [',']);
                      if Node.Text = 'Не определено' then
                        M.CondStr := M.CondStr + ' Is Null)'
                      else
                      begin
                        M.CondStr := M.CondStr + ' = ';
                        case DType of
                          0: M.CondStr := M.CondStr + Node.Text + ')';
                          1: M.CondStr := M.CondStr + #39 + Trim(Node.Text) + #39 + ')';
                          2: M.CondStr := M.CondStr + #39 + FormatDateTime('yyyy-mm-dd', StrToDateFmt('dd.mm.yyyy', Node.Text)) + #39 + ')'
                        end
                      end;
                      Break;
                    end;
                MainViewSetNodeImageIndex(Node);
              end;
              N := Node;
              Node := nil;
            end;
            Next;
          end
        end;
      end;
      Close;
    end;  
  except
  end;
  Screen.Cursor := OldCursor;
  D.Free;
  WorkDS.Close;
  WorkDS.Params.Clear;
  ANode.HasChildren := ANode.Count > 0;
  TTreeView(MainNode.TreeView).Items.EndUpdate;
  FList.Free;
  WorkList.Free;   }
end;

function TUniverseFilter2.ExpandNode(ANode: TTreeNode): Boolean;
begin
  if (ANode.Data = nil) or not(TObject(ANode.Data) is TMainData) or (TMainData(ANode.Data).ID = - 1) or TMainData(ANode.Data).PrField or (ANode.Count > 0) then
  begin
    Result := True;
  end
  else
  begin
    GetChildNode(ANode);
    Result := True;
  end;
  if not ANode.Expanded then
    ANode.Expand(False);
end;

{
function TUniverseFilter2.ExpandNode(ANode: TTreeNode): Boolean;
var
  FID, J, K: Integer;
  N, Node  : TTreeNode;
  WorkList : TStringList;
  FList    : TList;
  S, S2, tmpCondFilter: String;
  M        : TMainData;
  D        : TFilterData;
  i: Integer;
begin
  if (ANode.Data = nil) or not(TObject(ANode.Data) is TMainData) or (TMainData(ANode.Data).ID = - 1) or TMainData(ANode.Data).PrField or (ANode.Count > 0) then
  begin
    Result := True;
    try
      if not ANode.Expanded then
        ANode.Expand(False);
    except
    end;
  end
  else
  begin
    Result := False;
    TTreeView(MainNode.TreeView).Items.BeginUpdate;
    try
      D := TFilterData.Create(FTaskMaster);
      WorkList := TStringList.Create;
      FList := TList.Create;
      with WorkDS do
      begin
        FID := TMainData(ANode.Data).ID;

        if Active then Close;
    //******************* Формирование условий *****************
        tmpCondFilter := TMainData(ANode.Data).CondStr;

        N := ANode;
        if (N <> nil) and (TObject(N.Data) is TMainData) and (TMainData(N.Data).ParentID <> NoParent) then
        begin
          S2 := '';
          N := N.Parent;
          repeat
            if TMainData(N.Data).CondStr <> '' then
            begin
              if S2 <> '' then S2 := '|' + S2;
              S2 := TMainData(N.Data).CondStr + S2;
            end;
            N := N.Parent;
          until TMainData(N.Data).ID = -1;
          if tmpCondFilter <> '' then tmpCondFilter := tmpCondFilter + '|';
          tmpCondFilter := tmpCondFilter + S2;
        end;        

        if ANode.Count = 0 then
        begin
          for i := 0 to FTaskMaster.MainDataCount - 1 do
          begin
            if TMainData(ANode.Data).ID = FTaskMaster.MainData[i].ParentID then
            begin
              Node := TTreeView(MainNode.TreeView).Items.AddChildObject(ANode, FTaskMaster.MainData[i].Name, FTaskMaster.MainData[i]);
              Node.HasChildren := (FTaskMaster.MainData[i].GrStr <> '') or (FTaskMaster.MainData[i].HasSubFilter);
              MainViewSetNodeImageIndex(Node);
            end;
          end;
        end;
        if TMainData(ANode.Data).GrStr <> '' then
        begin
          NameSQL := 'Get_Query';
          Params.Clear;
          with Params do
          begin
            CreateParam(ftInteger,'UNID',ptInput).AsInteger := ID_Univ;
            CreateParam(ftString,'SEL_FIELDS',ptInput).AsString := TMainData(ANode.Data).GrStr;
            CreateParam(ftString,'ORD_FIELDS',ptInput).AsString := TMainData(ANode.Data).GrStr;
            CreateParam(ftString,'COND_FILTER',ptInput).AsString := tmpCondFilter;
            CreateParam(ftString,'GROUP_FIELDS',ptInput).AsString := S2;
            CreateParam(ftInteger,'DIST',ptInput).AsInteger := 1
          end;
          try
            Open;
          except
            on E: Exception do
            begin
              raise Exception.Create('Не могу открыть набор данных  ' + E.Message);
            end;
          end;
          if not IsEmpty then
          begin
            with WorkList do
            begin
              Clear;
              Text := ReplaceStr(Copy(TMainData(ANode.Data).GrStr, 2, Length(TMainData(ANode.Data).GrStr) - 2), ',', #13#10)
            end;
            while not EOF do
            begin
              N := ANode;
              Node := nil;
              for J := 0 to FieldCount - 1 do
              begin
                if Fields[J].AsString = '' then
                  S := 'Не определено'
                else
                  S := Fields[J].AsString;

                with TTreeView(MainNode.TreeView) do
                  for K := 0 to Items.Count - 1 do
                  if (Items[K].Parent = N) and (Items[K].Text = S) then
                    begin
                      Node := Items[K];
                      Break;
                    end;
                if Node = nil then
                begin
                  M := TMainData.Create(FTaskMaster);
                  Node := TTreeView(MainNode.TreeView).Items.AddChildObject(N, S, M);
                  M.Name := S;
                  for K := 0 to FTaskMaster.ObjDataCount - 1 do
                    with FTaskMaster.ObjData[K] do
                      if not PrClass and (IntToStr(ID) = WorkList[J]) then
                      begin
                        M.ID := FID;
                        M.PrField := True;
                        M.CondStr := '(' + ExtractWord(J + 1, Copy(TMainData(ANode.Data).GrStr, 2, Length(TMainData(ANode.Data).GrStr) - 2), [',']);
                        if Node.Text = 'Не определено' then
                          M.CondStr := M.CondStr + ' Is Null)'
                        else
                        begin
                          M.CondStr := M.CondStr + ' = ';
                          case DType of
                            0: M.CondStr := M.CondStr + Node.Text + ')';
                            1: M.CondStr := M.CondStr + #39 + Trim(Node.Text) + #39 + ')';
                            2: M.CondStr := M.CondStr + #39 + FormatDateTime('yyyy-mm-dd', StrToDateFmt('dd.mm.yyyy', Node.Text)) + #39 + ')'
                          end
                        end;
                        Break;
                      end;
                  MainViewSetNodeImageIndex(Node);
                end;
                N := Node;
                Node := nil;
              end;
              Next;
            end
          end;
        end;
        Close;
      end;  
      Result := True;
    except
    end;
    D.Free; 
    WorkDS.Close;
    WorkDS.Params.Clear;
    if not ANode.Expanded then
      ANode.Expand(False);
    ANode.HasChildren := ANode.Count > 0;
    TTreeView(MainNode.TreeView).Items.EndUpdate;
    FList.Free;
    WorkList.Free;
 //   if Assigned(fOnFillTree) then fOnFillTree(Self)
  end;
end;   }

procedure TUniverseFilter2.CollapseNode(ANode: TTreeNode);
//var i: Integer;
//    OldEvent: TTVCollapsingEvent;
begin
  if not ANode.Expanded then Exit;
  TTreeView(MainNode.TreeView).Items.BeginUpdate;
  try
    if (ANode <> MainNode) and (ANode.Data <> nil) and (TObject(ANode.Data) is TMainData) and not TMainData(ANode.Data).PrField then
      with ANode do
      begin
        TTreeView(MainNode.TreeView).OnDeletion := FreeNode;
        DeleteChildren;
        ANode.HasChildren := True;
      end;
    if ANode.Expanded then
      ANode.Collapse(False);
  finally
    TTreeView(MainNode.TreeView).Items.EndUpdate;
  end;
end;

procedure TUniverseFilter2.SetStyle(const Value: TUniverseFilterStyles);
begin
  FStyle := Value;
  CheckUniverseFilterStyles;
end;

procedure TUniverseFilter2.MainViewChange(Sender: TObject; Node: TTreeNode);
begin
//  ChangeNode(Node);
  ShowChildInLV(Node);
end;

procedure TUniverseFilter2.ShowChildInLV(Node: TTreeNode);
var i : integer;
    N : TTreeNode;
begin
  GetChildNode(Node);
  FLVObjList.Clear;
  FListView.Items.BeginUpdate;
  try
    FListView.Items.Clear;
    N := Node.getFirstChild;
    while N <> nil do
    begin
      FLVObjList.Add(N.Data);
      N := Node.GetNextChild(N);
    end;
  finally
    if Node = MainNode then
      FListView.Items.Count := FLVObjList.Count
    else
      FListView.Items.Count := FLVObjList.Count + 1;
    FListView.Items.EndUpdate;
  end;
end;

procedure TUniverseFilter2.MainViewCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  FMainTreeView.OnCollapsing := nil;
  CollapseNode(Node);
  FMainTreeView.OnCollapsing := MainViewCollapsing;
end;

procedure TUniverseFilter2.MainViewDblClick(Sender: TObject);
begin

end;

procedure TUniverseFilter2.MainViewExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  FMainTreeView.OnExpanding := nil;
  ExpandNode(Node);
  FMainTreeView.OnExpanding := MainViewExpanding;
end;

procedure TUniverseFilter2.MainViewGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
//  MainViewSetNodeImageIndex(Node);
  {with Node do
  begin
    if TObject(Data) is TMainData then
    begin
      if TMainData(Node.Data).ID = -1 then
      begin
        ImageIndex := 2;
      end
      else
        if TMainData(Node.Data).PrField then
        begin
          ImageIndex := 14;
        end
        else
          ImageIndex := 15;
    end
    else
      ImageIndex := -1;
  end;   }
end;


procedure TUniverseFilter2.MainViewSetNodeImageIndex(Node: TTreeNode);
begin
  with Node do
  begin
    if TObject(Data) is TMainData then
    begin
      if TMainData(Node.Data).ID = -1 then
      begin
        ImageIndex := 2;
      end
      else
        if TMainData(Node.Data).PrField then
        begin
          ImageIndex := 14;
        end
        else
          ImageIndex := 15;
    end
    else
      if Node = MainNode then
        ImageIndex := 2
      else
        ImageIndex := -1;
    SelectedIndex := ImageIndex;
  end;
end;

procedure TUniverseFilter2.MainViewGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
//  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TUniverseFilter2.CreateChildControls;
var i: Integer;
    AColumn : TListColumn;
//    ABitMap: TBitMap;
begin
  FChildCreated := true;
  TBar := TToolBar.Create(Self);
  with TBar do
  begin
    Parent := Self;
    Flat := True;
    AutoSize := True;
    EdgeBorders := [ebLeft,ebTop,ebRight,ebBottom];
    Images := fSelfImgLst;
    Transparent := true;
    ButtonWidth := 23;
    ButtonHeight := 21;
    Anchors := [akLeft,akTop,akRight];
    Wrapable := false;
//    ShowCaptions := FShowButtonCaption;
  end;
  mNewMenu := TPopupMenu.Create(Self);
  mNewMenu.OnPopup := NewMenuPopup;
  miAddNew:= TMenuItem.Create(Self);
  mNewMenu.Items.Add(miAddNew);
  with mNewMenu.Items[mNewMenu.Items.Count - 1] do
  begin
    Caption := 'Создать фильтр';
    OnClick := NewBtnClick;
  end;
  miAddChild := TMenuItem.Create(Self);
  mNewMenu.Items.Add(miAddChild);
  with mNewMenu.Items[mNewMenu.Items.Count - 1] do
  begin
    Caption := 'Создать дочерний фильтр';
    OnClick := NewChildBtnClick;
  end;

  for I := 0 to 9 do
  with TToolButton.Create(TBar) do
  begin
    Parent := TBar;
    ShowHint := True;
    case I of
       0: begin
             ImageIndex := 10;
             Hint := 'Переместить вниз';
             Caption := 'Вниз';
             OnClick := DownBtnClick;
           end;
       1: begin
             ImageIndex := 11;
             Hint := 'Переместить наверх';
             Caption := 'Вверх';
             OnClick := UpBtnClick;
           end;
       3: begin
             ImageIndex := 12;
             Hint := 'Удалить';
             Caption := 'Удалить';
             OnClick := DeleteBtnClick;
           end;
       4: begin
             ImageIndex := 7;
             Hint := 'Сохранить';
             Caption := 'Сохранить';
             OnClick := SaveBtnClick;
           end;

       5: begin
             ImageIndex := 9;
             Hint := 'Отменить изменения';
             Caption := 'Отменить';
             OnClick := RefreshBtnClick;
           end;
       6: begin
             ImageIndex := 2;
             Hint := 'Новый фильтр';
             Caption := 'Новый';
             OnClick := NewBtnClick;
             Style := tbsDropDown;
             DropdownMenu := mNewMenu;
           end;
       8: begin
             ImageIndex := 4;
             Hint := 'Удалить объект из списка';
             Caption := 'Удалить';
             OnClick := DelBtnClick;
           end;
       9: begin
             ImageIndex := 5;
             Hint := 'Добавить объект в список';
             Caption := 'Добавить';
             OnClick := AddBtnClick;
           end;
       2, 7: begin
                   Style := tbsSeparator;
                   Width := 8
                 end;
    end;
  end;

  AddBtn := TBar.Buttons[0];
  DelBtn := TBar.Buttons[1];
  NewBtn := TBar.Buttons[3];
  RefreshBtn := TBar.Buttons[4];
  SaveBtn := TBar.Buttons[5];
  DeleteBtn := TBar.Buttons[6];
  SepBtn := TBar.Buttons[7];
  UpBtn := TBar.Buttons[8];
  DownBtn := TBar.Buttons[9];

  FMainTreeView := TTreeView.Create(Self);
  with FMainTreeView do
  begin
    Constraints.MinWidth := 100;
    HideSelection := false;
    Parent := Self;
    Align := alLeft;
    ReadOnly := True;
    RowSelect := true;
    OnChange := MainViewChange;
    OnCollapsing := MainViewCollapsing;
    OnDblClick := MainViewDblClick;
    OnExpanding := MainViewExpanding;
    OnGetImageIndex := MainViewGetImageIndex;
    OnGetSelectedIndex := MainViewGetSelectedIndex;
    OnDeletion := FreeNode;
    Images := fSelfImgLst;
  end;
  
  Splitter := TSplitter.Create(nil);
  with Splitter do
  begin
    Parent := Self;
    Left := FMainTreeView.Left + FMainTreeView.Width + 1;
    Align := alLeft;
  end;

  FListView := TListView.Create(Self);
  with FListView do
  begin
    OnData := FLVOnData;
    OnDblClick := FLVOnDblClick;
    Constraints.MinWidth := 150;
    Parent := Self;
    Left := Splitter.Left + Splitter.Width + 1;
    Align := alLeft;
    ViewStyle := vsReport;

    AColumn := Columns.Add;
    AColumn.Width := 30;

    AColumn := Columns.Add;
    AColumn.Width := Width - 10;
    AColumn.Caption := 'Элемент';

    OwnerData := true;
    ReadOnly := true;
    RowSelect := true;
  end;

  MSplitter2 := TSplitter.Create(nil);
  with MSplitter2 do
  begin
    Parent := Self;
    Left := FListView.Left + FListView.Width + 1;
    Align := alLeft;
  end;

  ObjView := TTreeView.Create(Self);
  with ObjView do
  begin
    DragMode := dmAutomatic;
    HideSelection := false;
    Constraints.MinWidth := 150;
    Parent := Self;
    Left := MSplitter2.Left + MSplitter2.Width + 1;
    Align := alLeft;
    ReadOnly := True;
    RowSelect := true;
    OnChange := ObjViewChange;
    OnDblClick := ObjViewDblClick;
    OnExpanding := ObjViewExpanding;
    OnGetImageIndex := ObjViewGetImageIndex;
    OnGetSelectedIndex := ObjViewGetSelectedIndex;
    OnDragOver := ObjViewDragOver;
    OnDragDrop := ObjViewDragDrop;
//    OnDeletion := FreeNode;
    Images := fSelfImgLst;
    ShowRoot := false;
  end;

  MSplitter := TSplitter.Create(nil);
  with MSplitter do
  begin
    Parent := Self;
    Left := ObjView.Left + ObjView.Width + 1;
    Align := alLeft;
  end;


  CondControl := TPageControl.Create(Self);
  with CondControl do
  begin
    Constraints.MinWidth := 150;
    Parent := Self;
    Align := alClient;
    OnChange := CondControlChange;
    OnConstrainedResize := CondControlResizeCn;
//    OnResize := CondControlResize;
  end;

  for I := 0 to 3 do
    with TTabSheet.Create(Self) do
    begin
      PageControl := CondControl;
      case I of
        0: Caption := CaptionFieldSheet;
        1: Caption := CaptionFilterSheet;
        2: Caption := CaptionGroupSheet;
        3: Caption := CaptionOrderSheet;
      end
    end;
  FieldsSheet := CondControl.Pages[0];
  FilterSheet := CondControl.Pages[1];
  GroupSheet := CondControl.Pages[2];
  OrderSheet := CondControl.Pages[3];

  CondBox := TGroupBox.Create(Self);
  with CondBox do
  begin
    Parent := FilterSheet;
    Align := alTop;
    Height := 180;
    Caption := 'Условие фильтра';
    Constraints.MinHeight := Height;
  end;
  Label1 := TLabel.Create(Self);
  with Label1 do
  begin
    Parent := CondBox;
    Left := 7;
    Top := 25;
    Caption := 'Вид условия';
  end;
  ParLabel1 := TLabel.Create(Self);
  with ParLabel1 do
  begin
    Parent := CondBox;
    Left := 7;
    Top := 85;
  end;
  ParLabel2 := TLabel.Create(Self);
  with ParLabel2 do
  begin
    Parent := CondBox;
    Left := 182;
    Top := 85;
  end;
  TypeCondBox := TComboBox.Create(Self);
  with TypeCondBox do
  begin
    Anchors := Anchors + [akRight];
    Parent := CondBox;
    Left := 7;
    Top := 45;
    Style := csDropDownList;
    OnChange := TypeCondBoxChange;
  end;
  FSplitter := TSplitter.Create(Self);
  with FSplitter do
  begin
    Parent := FilterSheet;
    Top := CondBox.Top + CondBox.Height;
    Align := alTop;
  end;
  FilterListBox := TGroupBox.Create(Self);
  with FilterListBox do
  begin
    Parent := FilterSheet;
    Align := alClient;
    Caption := 'Список фильтров';
  end;
  CondGrid := TRxDrawGrid.Create(Self);
  with CondGrid do
  begin
    Parent := FilterListBox;
    Align := alClient;
    FixedCols := 0;
    FixedRows := 0;
    DefaultRowHeight := 1;
    Options := [goFixedVertLine,goFixedHorzLine,goHorzLine,goDrawFocusSelected,goRowSizing,goRowSelect];
    ColCount := 1;
    RowCount := 1;
    OnClick := CondGridClick;
    OnDrawCell := CondGridDrawCell;
    OnDragDrop := ListBoxDragDrop;
    OnDragOver := ListBoxDragOver;

  end;
  GrListBox := TListBox.Create(Self);
  with GrListBox do
  begin
    DragMode := dmAutomatic;
    Parent := GroupSheet;
    Align := alClient;
//    Style := lbOwnerDrawFixed;
    OnClick := ListBoxClick;
    OnDblClick := ListBoxDblClick;
    OnDragDrop := ListBoxDragDrop;
    OnDragOver := ListBoxDragOver;
//    OnDrawItem := GrListBoxDrawItem;
  end;
  FieldsListBox := TListBox.Create(Self); 
  with FieldsListBox do
  begin
    DragMode := dmAutomatic;
    Parent := FieldsSheet;
    Align := alClient;
//    Style := lbOwnerDrawFixed;
    OnClick := ListBoxClick;
//    OnDrawItem := FieldsListBoxDrawItem;
    OnDblClick := ListBoxDblClick;
    OnDragDrop := ListBoxDragDrop;
    OnDragOver := ListBoxDragOver;
  end;
  OrderListBox := TListBox.Create(Self);
  with OrderListBox do
  begin
    DragMode := dmAutomatic;
    Parent := OrderSheet;
    Align := alClient;
//    Style := lbOwnerDrawFixed;
    OnClick := ListBoxClick;
    OnDblClick := ListBoxDblClick;
    OnDragDrop := ListBoxDragDrop;
    OnDragOver := ListBoxDragOver;
//    OnDrawItem := OrderListBoxDrawItem;
  end;
  CondGrid.DefaultColWidth := CondGrid.ClientWidth - 1;
//  FMainTreeView.Items.Clear;
//  FMainNode := FMainTreeView.Items.AddChild(nil, FMainNodeName);
//  MainViewSetNodeImageIndex(FMainNode);
end;

procedure TUniverseFilter2.SetMainNodeName(const Value: String);
begin
  FMainNodeName := Value;
  if FMainNode <> nil then
    FMainNode.Text := FMainNodeName;
end;

procedure TUniverseFilter2.SetaptionOrderSheet(const Value: String);
begin
  FCaptionOrderSheet := Value;
  if Assigned(OrderSheet) then OrderSheet.Caption := Value;
end;

procedure TUniverseFilter2.SetCaptionFieldSheet(const Value: String);
begin
  FCaptionFieldSheet := Value;
  if Assigned(FieldsSheet) then FieldsSheet.Caption := Value;
end;

procedure TUniverseFilter2.SetCaptionFilterSheet(const Value: String);
begin
  FCaptionFilterSheet := Value;
  if Assigned(FilterSheet) then FilterSheet.Caption := Value;
end;

procedure TUniverseFilter2.SetCaptionGroupSheet(const Value: String);
begin
  FCaptionGroupSheet := Value;
  if Assigned(GroupSheet) then GroupSheet.Caption := Value;
end;

procedure TUniverseFilter2.Initialize;
begin
{  if FMainTreeView.Items.Count > 0 then
    MainNode := FMainTreeView.Items[0]
  else          
  begin   }
    FMainTreeView.Items.Clear;
    FMainNode := FMainTreeView.Items.AddChild(nil, FMainNodeName);
    MainViewSetNodeImageIndex(FMainNode);
    MainNode := MainNode;
    MainNode.Expand(false);
    FMainNode.Selected := true;

 { end;}
end;

procedure TUniverseFilter2.ChangeNode(Node: TTreeNode);
begin
  if TTreeView(MainNode.TreeView).Selected <> Node then  // Для синхронизации
    TTreeView(MainNode.TreeView).Selected := Node
  else
  begin
    FSelectedNode := Node;
    if (Node <> nil) and (TObject(Node.Data) is TMainData) then
    begin
      try
        SelectedFilter := TMainData(Node.Data).ID;
        GroupNode := TMainData(Node.Data).PrField;
        fParentFilter := TMainData(Node.Data).ParentID;
      except
      end;
    end;
  end;
end;

procedure TUniverseFilter2.SetSelectedFilter(const Value: Integer);
//var
//  WorkList: TStringList;
//  S       : String;
//  I, J, Num    : Integer;
//  D       : TFilterData;
begin
  if fSelectedFilter = Value then Exit;
  if RefreshFilter then
  begin
    if Application.MessageBox(PChar('Сохранить изменения в фильтре ' + FilterName + '?'), PChar('Фильтр был изменен'), MB_YESNO + MB_ICONQUESTION) = idYes then
      SaveBtnClick(nil);
  end;
  fSelectedFilter := Value;
  RefresheSelectedFilter;
end;

procedure TUniverseFilter2.RefresheSelectedFilter;
var
  WorkList: TStringList;
  ASELSTR, AWHERESTR, AGROUPSTR, AORDERSTR: String;
  I, J, Num    : Integer;
//  D       : TFilterData;
//  S: String
begin
{  try
    FTaskMaster.ClearFilterList;
    GrListBox.Items.BeginUpdate;
    FieldsListBox.Items.BeginUpdate;
    OrderListBox.Items.BeginUpdate;
    FieldsListBox.Items.Clear;
    GrListBox.Items.Clear;
    OrderListBox.Items.Clear;
    ObjView.Items.BeginUpdate;
    BeginUpdateControl(CondControl);
    with CondGrid do
    begin
      RowCount := 0;
      DefaultRowHeight := 1;
 //     Refresh;
    end;

    WorkList := TStringList.Create;
    for I := 0 to FTaskMaster.ObjDataCount - 1 do FTaskMaster.ObjData[I].Sel := False;
    if FSelectedFilter = - 1 then
    begin
      CurrFilter := - 1;
    end
    else
    with WorkDS do
    begin
      if Active then Close;
      NameSQL := 'Get_User_Filter_List';
      Params.Clear;
      with Params do
      begin
        CreateParam(ftInteger, 'UNID', ptInput).AsInteger := ID_Univ;
        CreateParam(ftInteger, 'FILT_ID', ptInput).AsInteger := FSelectedFilter;
      end;
      try
        Open;
      except
        on E: Exception do
        begin
          raise Exception.Create('Не могу считать заданный фильтр  ' + E.Message);
        end;
      end;
      FilterName := FieldByName('NAME').AsString;
      ASELSTR := FieldByName('SELSTR').AsString;
      AWHERESTR := FieldByName('WHERESTR').AsString;
      AGROUPSTR := FieldByName('GROUPSTR').AsString;
      AORDERSTR := WorkDS.FieldByName('ORDERSTR').AsString;
      Close;

      if ASELSTR <> '' then
      begin
        WorkList.Text := Trim(ReplaceStr(ASELSTR, ',', #13#10));
        for I := 0 to WorkList.Count - 1 do
        begin
          Num := StrToInt(WorkList[I]);
          for J := 0 to FTaskMaster.ObjDataCount - 1 do
            if (not FTaskMaster.ObjData[J].PrClass) and (FTaskMaster.ObjData[J].ID = Num) then
            begin
              FTaskMaster.ObjData[J].Sel := True;  //!!!
          //    FieldsListBox.Items.AddObject('', FTaskMaster.ObjData[J]);
              FieldsListBoxAddItem(FTaskMaster.ObjData[J]);
            end;
        end;
      end;
      SetFilterString(AWHERESTR);
     
      if AGROUPSTR <> '' then
      begin
        WorkList.Text := ReplaceStr(Copy(AGROUPSTR, 2, Length(AGROUPSTR) - 2), ',', #13#10);
        for I := 0 to WorkList.Count - 1 do
          for J := 0 to FTaskMaster.ObjDataCount - 1 do
            if not FTaskMaster.ObjData[J].PrClass and (IntToStr(FTaskMaster.ObjData[J].ID) = WorkList[I]) then
            begin
              GrListBoxAddItem(FTaskMaster.ObjData[J]);
          //    GrListBox.Items.AddObject('', FTaskMaster.ObjData[J]);
            end;
      end;
      if AORDERSTR <> '' then
      begin
        WorkList.Text := ReplaceStr(Copy(AORDERSTR, 2, Length(AORDERSTR) - 2), ',', #13#10);
        for I := 0 to WorkList.Count - 1 do
          for J := 0 to FTaskMaster.ObjDataCount - 1 do
            if not FTaskMaster.ObjData[J].PrClass and (IntToStr(FTaskMaster.ObjData[J].ID) = WorkList[I]) then
            begin
              OrderListBoxAddItem(FTaskMaster.ObjData[J]);
          //    OrderListBox.Items.AddObject('', FTaskMaster.ObjData[J]);
            end;
      end;
    end;
  except
  end;

  ObjView.Items.EndUpdate;
  with FieldsListBox do
  begin
    Items.EndUpdate;
    ItemIndex := 0;
  end;
  with GrListBox do
  begin
    Items.EndUpdate;
    ItemIndex := 0;
  end;
  with OrderListBox do
  begin
    Items.EndUpdate;
    ItemIndex := 0;
  end;
  EndUpdateControl(CondControl);
  FreeAndNil(WorkList);
  RefreshFilter := False;           }
end;

procedure TUniverseFilter2.SetNewCurrFilter(const Value: Integer);
var
  I, J, K: Integer;
begin
  fNewCurrFilter := Value;
  J := - 1;
  K := - 1;
  TypeCondBox.Items.Clear;
  try
    if Value = - 1 then
    begin
      ParLabel1.Caption := '';
      ParLabel2.Caption := '';
      ParControlsFree;
    end
    else
    begin
      CondGrid.Row := Value;
      if FTaskMaster.FilterData[Value].FObjData.ObjType = 1 then
      begin
        with TypeCondBox do
        begin
          for I := 0 to ArrMax do
            if TypeArray[I, FTaskMaster.FilterData[Value].FObjData.DType] = 1 then
            begin
              Items.Add(CondArray[I]);
              if I = FTaskMaster.FilterData[Value].OperCode then
              begin
                J := Items.Count - 1;
                K := I;
              end;
            end;
          DropDownCount := Items.Count;
          ItemIndex := J;
        end;
        NewSetParamEditors(K);
        FilterToText(FTaskMaster.FilterData[Value]);
        {for I := 0 to CondBox.ControlCount - 1 do
          CondBox.Controls[I].Enabled := Value > -1;}
      end;
      {else
        for I := 0 to CondBox.ControlCount - 1 do
        begin
          CondBox.Controls[I].Visible := (CondBox.Controls[I] = Label1) or (CondBox.Controls[I] = TypeCondBox);
          CondBox.Controls[I].Enabled := false;
        end;}
    end;
  except
  end;

  for I := 0 to CondBox.ControlCount - 1 do
    if Value > -1 then
      CondBox.Controls[I].Enabled := FTaskMaster.FilterData[Value].FObjData.ObjType = 1
    else
      CondBox.Controls[I].Enabled := false;

//  end;

end;

procedure TUniverseFilter2.SetFilterName(const Value: String);
begin
  FFilterName := Value;
end;

procedure TUniverseFilter2.NewSetParamEditors(Cond: Integer);
var D: TFilterData;
begin
 { ParControlsFree;
  if Cond = - 1 then
  begin
    ParLabel1.Caption := '';
    ParLabel2.Caption := '';
    Exit;
  end;           
  ParLabel1.Caption := Par1Capt[Cond];
  ParLabel2.Caption := Par2Capt[Cond];
  D := FTaskMaster.FilterData[CurrFilter];
  if ParLabel1.Caption <> '' then
  begin
    if ((Cond in [2, 3]) and (D.FObjData.DType <> 2) and (D.FObjData.HasDetail)) then
    begin
      qs := CreateQS(D.FObjData);
      if qs <> nil then
      begin
        with qs do
        begin
          if FTaskMaster.FilterData[CurrFilter].Par1 <> '' then
            KeyValue := FTaskMaster.FilterData[CurrFilter].Par1;
        end;
      end;
    end
    else
    if (Cond = ArrMax - 1) or (Cond = ArrMax) then
      begin
        ValListCreate(D);
      end
      else
      begin
        case D.FObjData.DType of
          0: TRxCalcEdit(ParEdit1) := TRxCalcEdit.Create(Self);
          1: //TComboEdit(ParEdit1) := TComboEdit.Create(Self);
          begin
            TComboEdit(ParEdit1) := CreateValQS(D);
            if TEtranQuickSearch(ParEdit1) <> nil then
            begin
              with TEtranQuickSearch(ParEdit1) do
              begin
                if FTaskMaster.FilterData[CurrFilter].Par1 <> '' then
                  KeyValue := FTaskMaster.FilterData[CurrFilter].Par1;
              end;
            end;
          end;
          2: TDateEdit(ParEdit1) := TDateEdit.Create(Self)
        end;
        with ParEdit1 do
        begin
          Left := 7;
          Top := 105;
          Font.Size := 8;
          if Par2Capt[Cond] <> '' then
            Width := (CondBox.ClientWidth - 34) Div 2
          else
            Width := TypeCondBox.Width;
          Parent := CondBox;
          TabOrder := 1;
          Font.Style := [];
          if ClassType = TRxCalcEdit then
          with TRxCalcEdit(ParEdit1) do
          begin
            AlignMent := taRightJustify;
           if D.Par1 <> '' then Value := StrToFloat(D.Par1)
          end
          else
            if ClassType = TDateEdit then
              with TDateEdit(ParEdit1) do
              begin
                YearDigits := dyFour;
            //    EditMask := DateEditMask;
                //  DirectInput := False;
                if D.Par1 <> '' then Date := StrToFloat(D.Par1);
              end
            else
           //   with TComboEdit(ParEdit1) do
              with TEtranQuickSearch(ParEdit1) do
              begin
                GlyphKind := gkEllipsis;
                Text := D.Par1;
             //   OnButtonClick := ComboButtonClick;
              end;
            OnChange := ParamChange;
        end;
      ParLabel1.Width := ParEdit1.Width;
    end;
  end;
  if ParLabel2.Caption <> '' then
  begin
    if (Cond = ArrMax - 1) or (Cond = ArrMax) then
      TComboEdit(ParEdit2) := TComboEdit.Create(CondBox)
    else
      case D.FObjData.DType of
        0: TRxCalcEdit(ParEdit2) := TRxCalcEdit.Create(CondBox);
        1: //TComboEdit(ParEdit2) := TComboEdit.Create(CondBox);
        begin
            TComboEdit(ParEdit2) := CreateValQS(D);
            if TEtranQuickSearch(ParEdit2) <> nil then
            begin
              with TEtranQuickSearch(ParEdit2) do
              begin
                if FTaskMaster.FilterData[CurrFilter].Par1 <> '' then
                  KeyValue := FTaskMaster.FilterData[CurrFilter].Par2;
              end;
            end;
          end;
        2: TDateEdit(ParEdit2) := TDateEdit.Create(CondBox);
      end;
    with ParEdit2 do
    begin
      Left := ParEdit1.Width + 27;
      Top := 105;
      Font.Size := 8;
      Width := (CondBox.ClientWidth - 34) div 2;
      Parent := CondBox;
      TabOrder := 2;
      Font.Style := [];
      if ClassType = TRxCalcEdit then
      with TRxCalcEdit(ParEdit2) do
      begin
        AlignMent := taRightJustify;
        if D.Par2 <> '' then
          Value := StrToFloat(D.Par2);
      end
      else
        if ClassType = TDateEdit then
          with TDateEdit(ParEdit2) do
          begin
            YearDigits := dyFour;
        //    EditMask := DateEditMask;
           // DirectInput := False;
            if D.Par2 <> '' then
              Date := StrToFloat(D.Par2)
          end
        else
          with TComboEdit(ParEdit2) do
          begin
            GlyphKind := gkEllipsis;
            Text := D.Par2;
          //  OnButtonClick := ComboButtonClick;
          end;
      OnChange := ParamChange;
    end;
    with ParLabel2 do
    begin
      Left := ParEdit2.Left;
      Width := ParEdit2.Width;
    end
  end;  }
end;

procedure TUniverseFilter2.ObjViewExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  if (Node.HasChildren) and (Node.Count = 0) and (TObject(Node.Data) is TObjData) then
  begin
    GetNodeTDList(Node);
  end;
end;

procedure TUniverseFilter2.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('MainTreeWidth', ReadMainTreeWidth, WriteMainTreeWidth, true);
  Filer.DefineProperty('ObjTreeWidth', ReadObjTreeWidth, WriteObjTreeWidth, true);
end;

procedure TUniverseFilter2.ReadMainTreeWidth(Reader: TReader);
var PropVal: Integer;
begin
  PropVal := Reader.ReadInteger;
  if Assigned(FMainTreeView) then
    FMainTreeView.Width := PropVal;
end;

procedure TUniverseFilter2.ReadObjTreeWidth(Reader: TReader);
var PropVal: Integer;
begin
  PropVal := Reader.ReadInteger;
  if Assigned(ObjView) then
    ObjView.Width := PropVal;
end;

procedure TUniverseFilter2.WriteMainTreeWidth(Writer: TWriter);
begin
  if Assigned(FMainTreeView) then
    Writer.WriteInteger(FMainTreeView.Width);
end;

procedure TUniverseFilter2.WriteObjTreeWidth(Writer: TWriter);
begin
  if Assigned(ObjView) then
    Writer.WriteInteger(ObjView.Width);
end;

function TUniverseFilter2.CreateDataSet(DataSet: TClientDataSet): Boolean;
var
  J: Integer;
  FieldsStr, GroupStr, CondStr, OrderStr, S2 : String;
  N: TTreeNode;
begin
{  if SelectedNode = nil then
    raise Exception.Create('Фильтр не выбран.' + #10 +
                           'Если вы создали новый фильтр, то его надо предварительно сохранить.');
  Result := False;
  FieldsStr := MakeFieldsStr;
  if FieldsStr = '' then
    raise Exception.Create('Не выбрано ни одно поле для запроса!!!');

  if FTaskMaster.FilterDataCount > 0 then
  begin
    CondStr := '';
    S2 := ',';
    for j := 0 to FTaskMaster.FilterDataCount - 1 do
    begin
      if CondStr <> '' then CondStr := CondStr + '|';
      CondStr := CondStr + NewFilterToSQL(FTaskMaster.FilterData[J]);
      S2 := S2 + IntToStr(FTaskMaster.FilterData[J].FObjData.ID) + ',';
    end;
  end;

  N := SelectedNode;
  if (N <> nil) and (TObject(N.Data) is TMainData) and (TMainData(N.Data).PrField) then
  begin
    S2 := '';
    repeat
      if S2 <> '' then S2 := '|' + S2;
      S2 := TMainData(N.Data).CondStr + S2;
      N := N.Parent
    until not TMainData(N.Data).PrField;
    if CondStr <> '' then CondStr := CondStr + '|';
    CondStr := CondStr + S2;
  end;

  N := SelectedNode;
  if (TObject(N.Data) is TMainData) and (TMainData(N.Data).ParentID <> NoParent) then
  begin
    S2 := '';
    N := N.Parent;
    repeat
      if TMainData(N.Data).CondStr <> '' then
      begin
        if S2 <> '' then S2 := '|' + S2;
        S2 := TMainData(N.Data).CondStr + S2;
      end;
      N := N.Parent;
    until TMainData(N.Data).ID = -1;
    if CondStr <> '' then CondStr := CondStr + '|';
    CondStr := CondStr + S2;    
  end;        

  if (not AllowEmptyCondition) and (CondStr = '') then
    raise Exception.Create('Не задано условие поиска!');

  GroupStr := MakeGroupStr;
  OrderStr := MakeOrderStr;

  if FDirectFilterString <> '' then
    CondStr := CondStr + '|' + FDirectFilterString;
  with DataSet do
  begin
    DisableControls;
    try
      if Active then Close;
      NameSQL := 'Get_Query';
      Params.Clear;
      with Params do
      begin
        CreateParam(ftInteger,'UNID',ptInput).AsInteger := ID_Univ;
        CreateParam(ftString,'SEL_FIELDS',ptInput).AsString := FieldsStr;
        CreateParam(ftString,'COND_FILTER',ptInput).AsMemo := CondStr;
        CreateParam(ftString,'GROUP_FIELDS',ptInput).AsString := GroupStr;
        CreateParam(ftString,'ORD_FIELDS',ptInput).AsString := OrderStr;
        CreateParam(ftInteger,'DIST',ptInput).AsInteger := 0
      end;
      try
        Open;
      except
        on E: Exception do
        begin
          raise Exception.Create('Не могу открыть набор данных ' + E.Message);
        end;
      end;
    finally
      EnableControls;
    end;
  end;
  Result := True;
  }
end;


//procedure TUniverseFilter2.FieldsListBoxDrawItem(Control: TWinControl;
//  Index: Integer; Rect: TRect; State: TOwnerDrawState);
//begin
//  with FieldsListBox do
//  begin
//    Canvas.FillRect(Rect);
//    Canvas.TextOut(Rect.Left, Rect.Top, {'Поле "' +} TObjData(Items.Objects[index]).ObjName {+ '"'})
//  end
//end;

//procedure TUniverseFilter2.OrderListBoxDrawItem(Control: TWinControl;
//  Index: Integer; Rect: TRect; State: TOwnerDrawState);
//begin
//  with OrderListBox do
//  begin
//    Canvas.FillRect(Rect);
//    Canvas.TextOut(Rect.Left, Rect.Top, {'Поле "' + }TObjData(Items.Objects[index]).ObjName {+ '"'});
//  end
//end;

//procedure TUniverseFilter2.GrListBoxDrawItem(Control: TWinControl; Index: Integer;
//  Rect: TRect; State: TOwnerDrawState);
//begin
//  with GrListBox do
//  begin
//    Canvas.FillRect(Rect);
//    Canvas.TextOut(Rect.Left, Rect.Top, {'Объект "' +} TObjData(Items.Objects[index]).ObjName{ + '"'})
//  end
//end;

procedure TUniverseFilter2.FieldsListBoxAddItem(AObjData: TObjData);
begin
  with FieldsListBox do
  begin
    Items.AddObject(AObjData.ObjName, AObjData);
    ItemIndex := Items.Count - 1;
    CondControl.Refresh;
  end
end;

procedure TUniverseFilter2.GrListBoxAddItem(AObjData: TObjData);
begin
  with GrListBox do
  begin
    Items.AddObject(AObjData.ObjName, AObjData);
    ItemIndex := Items.Count - 1;
  end
end;

procedure TUniverseFilter2.OrderListBoxAddItem(AObjData: TObjData);
begin
  with OrderListBox do
  begin
    Items.AddObject(AObjData.ObjName, AObjData);
    ItemIndex := Items.Count - 1;
  end
end;


function TUniverseFilter2.MakeFieldsStr: String;
var i: Integer;
begin
  with FieldsListBox do
    for i := 0 to Items.Count - 1 do
    begin
      if Result = '' then Result := ',';
      Result := Result + IntToStr(TObjData(FieldsListBox.Items.Objects[i]).ID) + ','
    end;
end;

function TUniverseFilter2.MakeGroupStr: String;
var i: Integer;
begin
  with GrListBox do
    for i := 0 to Items.Count - 1 do
    begin
      if Result = '' then Result := ',';
      Result := Result + IntToStr(TObjData(Items.Objects[i]).ID) + ','
    end;
end;

function TUniverseFilter2.MakeOrderStr: String;
var i: Integer;
begin
  with OrderListBox do
    for i := 0 to Items.Count - 1 do
    begin
      if Result = '' then Result := ',';
      Result := Result + IntToStr(TObjData(Items.Objects[i]).ID) + ','
    end;
end;

procedure TUniverseFilter2.ListBoxClick(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TUniverseFilter2.ListBoxDblClick(Sender: TObject);
begin
  if DelBtn.Enabled then DelBtn.Click;
end;

function TUniverseFilter2.MakeWhereStr: String;
var
  St: String;
  I: Integer;
//  J: Integer;
//  N, S,: String;
begin
  Result := '';
  with FTaskMaster do
    for I := 0 to FilterDataCount - 1 do
    begin
      with FTaskMaster.FilterData[i] do
        if FObjData.ObjType = 1 then
        begin
          if (OperCode = - 1) or ((Par1Capt[OperCode] <> '') and (Par1 = '')) or ((Par2Capt[OperCode] <> '') and (Par2 = '')) then
          begin
            CurrFilter := I;
            raise Exception.Create('Фильтр не заполнен ');
          end;
          St := IntToStr(FObjData.ID ) + ',' + IntToStr(OperCode);
          if Par1Capt[OperCode] <> '' then St := St + ',' + Par1;
          if Par2Capt[OperCode] <> '' then St := St + ',' + Par2;
        end
        else
          St := IntToStr(FObjData.ID);
      if Result <> '' then Result := Result + '|';
      Result := Result + St;
    end;
end;

{function TUniverseFilter2.MakeOtherCondStr: String;
begin

end;}

function TUniverseFilter2.FilterToStringDoc(FilterData: TFilterData): String;
var S1, S2, S: String;
    i: Integer;
    SL: TStringList;
begin
  GetNewFilterParams(FilterData, S1, S2, False);
  with FilterData do
  begin
    Result := FObjData.ObjName;
    if FObjData.ObjType = 2 then
      Exit;
    if OperCode <> - 1 then
    begin
    case FObjData.DType of
      0: Result := Result + ' ' + CondArrayNum[OperCode];
      1: Result := Result + ' ' + CondArrayStr[OperCode];
      2: Result := Result + ' ' + CondArrayDate[OperCode];
    end;
      if (S1 <> '') and (OperCode in [2..3, ArrMax - 1, ArrMax]) and
         (FilterData.FObjData.DType <> 2) and
         ((FObjData.HasDetail) {or (OperCode = ArrMax)}) then
      begin
        SL := TStringList.Create;
        try
          SL.Text := ReplaceStr(S1, ';', #13 + #10);
          S := '';
          for i := 0 to SL.Count - 1 do
          begin
            if S = '' then
              S := FilterToStringDoc_GetVal(FObjData.ID, StrToInt(SL[i]))
            else
              S := S + '; ' + FilterToStringDoc_GetVal(FObjData.ID, StrToInt(SL[i]));
          end;
          Result := Result + ' ' + S;
        finally
          SL.Free;
        end;
      end
      else
      begin

//*************
    if (OperCode < ArrMax - 1) and (FObjData.DType = 2) then
    begin
      if FilterData.Par1 <> '' then
        S1 := FormatDateTime(DateEditMask, StrToFloat(Par1));
      if (FilterData.Par2 <> '') and (FilterData.OperCode in [9, 12]) then
        S2 := FormatDateTime(DateEditMask, StrToFloat(Par2));
    end;
//*************

        if S1 <> '' then Result := Result + ' ' + S1;
        if S2 <> '' then Result := Result + ' и ' + S2;
      end;
    end;
  end;
end;

function TUniverseFilter2.FilterToStringDoc_GetVal(SelField,
  ID: Integer): String;
begin
{  with WorkDS do
  begin
    if Active then Close;
    NameSQL := 'Get_QSString';
    Params.Clear;
    UtilityGetParams(WorkDS);
    Params.ParamByName('UNID').AsInteger := ID_Univ;
    Params.ParamByName('Sel_Field').AsInteger := SelField;
    Params.ParamByName('Value').AsInteger := ID;
    try
      Open;
      try
        if (not IsEmpty) and (Fields.Count >= 2) then
            Result := Fields[1].AsString + ' (' + Fields[0].AsString + ')'
        else
            Result := IntToStr(ID);
      finally
        Close;
      end;
    except
      MessageRusDlg('Не могу получить значения.', mtError, [mbOk], 0);
      Exit;
    end;
  end;   }
end;

procedure TUniverseFilter2.FilterToText(FilterData: TFilterData);
begin
  FilterData.Text := FilterToStringDoc(FilterData);
end;

function TUniverseFilter2.GetImageList: TImageList;
begin
  if fImgLst = nil then
    Result := fSelfImgLst
  else
    Result := fImgLst;
end;

procedure TUniverseFilter2.WMMouseActivate(var Message: TMessage);
begin
  if csDesigning in ComponentState then
  begin
  end;
end;

procedure TUniverseFilter2.ParControlsFree;
begin
{  if qs <> nil then
  begin
    qs.Free;
    qs := nil;
  end;    }
  if ParEdit1 <> nil Then
  begin
    FreeAndNil(ParEdit1);
  end;
  if ParEdit2 <> nil Then
  begin
    FreeAndNil(ParEdit2);
  end;
  if ValList <> nil Then
  begin
    FreeAndNil(ValList);
  end;
end;
{
function TUniverseFilter2.CreateQS(AObjData: TObjData): TEtranQuickSearch;
var i, ChildrenCnt: Integer;
begin
  if qs <> nil then
    FreeAndNil(qs);

  qs := TEtranQuickSearch.Create(Self);
  if Connection.Owner <> nil then
    qs.NameConnection := Connection.Owner.Name + '.' + Connection.Name
  else
    qs.NameConnection := Connection.Name;
  qs.NameSQL := 'Get_QueryDict';
  qs.GlyphKind := gkEllipsis;
  qs.DialogCaption := AObjData.ObjName;
  qs.OnSelect := QSSelect;
  qs.DirectInput := true;
  qs.Left := 7;
  qs.Top := 105;
  qs.Width := CondBox.Width - 14;
  qs.Font.Size := 8;
  qs.Anchors := [akLeft, akRight, akTop];
  qs.Parent := CondBox;
  qs.Params.Clear;
  if AObjData.Large then
    qs.MinChars := 3;
  try
    qs.Params.BeginUpdate;
    with TQSParam(qs.Params.Add) do
    begin
      Name := 'UnID';
      ParamOptions := [];
      Value := ID_Univ;
    end;
    with TQSParam(qs.Params.Add) do
    begin
      Name := 'SEL_FIELDS';
      ParamOptions := [];
      Value := ',' + IntToStr(AObjData.ID) + ',';
    end;
    with TQSParam(qs.Params.Add) do
    begin
      Name := 'ORD_FIELDS';
      ParamOptions := [];
      Value := '';
    end;
    with TQSParam(qs.Params.Add) do
    begin
      Name := 'COND_FILTER';
      ParamOptions := [];
      Value := '';
    end;
    with TQSParam(qs.Params.Add) do
    begin
      Name := 'OTHERCONDID';
      ParamOptions := [];
      Value := '(((:p' + IntToStr(AObjData.ID) + ' = :q' + IntToStr(AObjData.ID) + ') and (:q' + IntToStr(AObjData.ID) + ' IS NOT NULL)) or (:q' + IntToStr(AObjData.ID) + ' IS NULL))';
    end;
    with TQSParam(qs.Params.Add) do
    begin
      Name := 'OTHERCONDCODE';
      ParamOptions := [];
      AsString := '(:p' + IntToStr(AObjData.ID) +
              ' LIKE :q' + IntToStr(AObjData.ID) + ' || ''%''' + ')';
    end;
    with TQSParam(qs.Params.Add) do
    begin
      Name := 'OTHERCONDNAME';
      ParamOptions := [];
      AsString := '(UPPER(:p' + IntToStr(AObjData.ID) +
              ' ) LIKE ''%'' || UPPER(:q' + IntToStr(AObjData.ID) + ') || ''%''' + ')';
    end;
    with TQSParam(qs.Params.Add) do
    begin
      Name := 'DIST';
      ParamOptions := [];
      Value := 1;
    end;
    with TQSParam(qs.Params.Add) do
    begin
      Name := 'q' + IntToStr(AObjData.ID);
      Caption := AObjData.ObjName;
      ParamOptions := [poKey, poResult];
    end;

    ChildrenCnt := 0;
    for i := 0 to FTaskMaster.ObjDataCount - 1 do
    begin
      if ((FTaskMaster.ObjData[i].DetParent = AObjData.ObjID) and (AObjData.DetParent = 0) and (not AObjData.PrClass))  then
      begin
        Inc(ChildrenCnt);
        qs.Params.ParamByName('SEL_FIELDS').AsString :=
        qs.Params.ParamByName('SEL_FIELDS').AsString + IntToStr(FTaskMaster.ObjData[i].ID) + ',';

        with TQSParam(qs.Params.Add) do
        begin
          Name := 'q' + IntToStr(FTaskMaster.ObjData[i].ID);
          Caption := FTaskMaster.ObjData[i].ObjName;
          if ChildrenCnt = 1 then
          begin
            ParamOptions := [poTextFilter, poNumberFilter, poResult, poVisible];
            qs.Params.ParamByName('OTHERCONDCODE').AsString :=
              '(:p' + IntToStr(FTaskMaster.ObjData[i].ID) +
              ' LIKE :q' + IntToStr(FTaskMaster.ObjData[i].ID) + ' || ''%''' + ')';
          end
          else if ChildrenCnt = 2 then
          begin
            ParamOptions := [poTextFilter, poResult, poVisible];
            qs.Params.ParamByName('OTHERCONDNAME').AsString :=
              '(UPPER(:p' + IntToStr(FTaskMaster.ObjData[i].ID) +
              ' ) LIKE ''%'' || UPPER(:q' + IntToStr(FTaskMaster.ObjData[i].ID) + ') || ''%''' + ')';
          end
          else
            ParamOptions := [poResult, poVisible];
          Width := 64;
       end;
      end;
    end;

    if ChildrenCnt = 0 then
    begin
      qs.Params[6].ParamOptions := [poKey, poResult, poTextFilter, poNumberFilter, poVisible];
      qs.Params[6].Width := 64;
    end;
  finally
    qs.Params.EndUpdate;
  end;
  Result := qs;
end;
}

procedure TUniverseFilter2.QSSelect(Sender: TObject);
begin
{  if FTaskMaster.FilterData[CurrFilter].Par1 <> VarToStr(qs.KeyValue) then
  begin
    FTaskMaster.FilterData[CurrFilter].Par1 := VarToStr(qs.KeyValue);
    FilterToText(FTaskMaster.FilterData[CurrFilter]);
    CondGrid.InvalidateCell(0, CurrFilter);
    RefreshFilter := True;
  end;  }
end;

function TUniverseFilter2.GetSelCount: Integer;
var i: Integer;
begin
  Result := 0;
  for i := 0 to FTaskMaster.ObjDataCount - 1 do
    if FTaskMaster.ObjData[i].Sel then Inc(Result);
end;

{
function TUniverseFilter2.CreateValQS(FilterData: TFilterData; AVisible: boolean = true): TEtranQuickSearch;
var i, ChildrenCnt: Integer;
    AddText: String;
begin
  Result := TEtranQuickSearch.Create(Self);
  try
    with Result do
    begin
      Params.BeginUpdate;
      if Self.Connection.Owner <> nil then
        NameConnection := Self.Connection.Owner.Name + '.' + Connection.Name
      else
        NameConnection := Self.Connection.Name;
      NameSQL := 'Get_QueryDict';

      GlyphKind := gkEllipsis;
      DialogCaption := FilterData.FObjData.ObjName;
      if not AVisible then
        OnChange := Select;
         
      DirectInput := true;
      Left := 7;
      Top := 105;
      Width := CondBox.Width - 14;
      Font.Size := 8;
      Anchors := [akLeft, akRight, akTop];
      Parent := CondBox;
      Visible := AVisible;
      Params.Clear;

      with TQSParam(Params.Add) do
      begin
        Name := 'UnID';
        ParamOptions := [];
        Value := ID_Univ;
      end;
      with TQSParam(Params.Add) do
      begin
        Name := 'SEL_FIELDS';
        ParamOptions := [];
        Value := ',' + IntToStr(FilterData.FObjData.ID) + ',';
      end;
      with TQSParam(Params.Add) do
      begin
        Name := 'ORD_FIELDS';
        ParamOptions := [];
        Value := '';
      end;
      with TQSParam(Params.Add) do
      begin
        Name := 'COND_FILTER';
        ParamOptions := [];
        Value := '';
      end;
      with TQSParam(Params.Add) do
      begin
        Name := 'OTHERCONDID';
        ParamOptions := [];
        Value := '(((:p' + IntToStr(FilterData.FObjData.ID) + ' = :q' + IntToStr(FilterData.FObjData.ID) + ') and (:q' + IntToStr(FilterData.FObjData.ID) + ' IS NOT NULL)) or (:q' + IntToStr(FilterData.FObjData.ID) + ' IS NULL))';
        if (FilterData.OperCode = ArrMax - 1) and
           (FilterData.Par1 <> '') then
          AddText := ' AND (NOT :p' + IntToStr(FilterData.FObjData.ID) + ' ' + MakeSQLValList(FilterData) + '))';
        if (FilterData.OperCode = ArrMax) and
           (FilterData.Par1 <> '') then
          AddText := ' AND (:p' + IntToStr(FilterData.FObjData.ID) + ' ' + MakeSQLValList(FilterData) + '))';
        if (FilterData.OperCode >= ArrMax - 1) and
           (FilterData.Par1 <> '') and
           (AddText <> '') then
          Value := '(' + Value + AddText;
      end;
      with TQSParam(Params.Add) do
      begin
        Name := 'OTHERCONDCODE';
        ParamOptions := [];
        AsString := '(:p' + IntToStr(FilterData.FObjData.ID) +
                ' LIKE :q' + IntToStr(FilterData.FObjData.ID) + ' || ''%''' + ')';
        if (FilterData.OperCode >= ArrMax - 1) and
           (FilterData.Par1 <> '') and
           (AddText <> '') then
          Value := '(' + AsString + AddText;
      end;
      with TQSParam(Params.Add) do
      begin
        Name := 'OTHERCONDNAME';
        ParamOptions := [];
        AsString := '(UPPER(:p' + IntToStr(FilterData.FObjData.ID) +
                ' ) LIKE ''%'' || UPPER(:q' + IntToStr(FilterData.FObjData.ID) + ') || ''%''' + ')';
        if (FilterData.OperCode >= ArrMax - 1) and
           (FilterData.Par1 <> '') and
           (AddText <> '') then
          AsString := '(' + AsString + AddText;
      end;
      with TQSParam(Params.Add) do
      begin
        Name := 'DIST';
        ParamOptions := [];
        Value := 1;
      end;
      with TQSParam(Params.Add) do
      begin
        Name := 'q' + IntToStr(FilterData.FObjData.ID);
        Caption := FilterData.FObjData.ObjName;
        ParamOptions := [poKey, poResult];
      end;

      ChildrenCnt := 0;
      for i := 0 to FTaskMaster.ObjDataCount - 1 do
      begin
        if ((FTaskMaster.ObjData[i].DetParent = FilterData.FObjData.ObjID) and (FilterData.FObjData.DetParent = 0) and (not FilterData.FObjData.PrClass))  then
        begin
          Inc(ChildrenCnt);
          Params.ParamByName('SEL_FIELDS').AsString :=
            Params.ParamByName('SEL_FIELDS').AsString + IntToStr(FTaskMaster.ObjData[i].ID) + ',';

          with TQSParam(Params.Add) do
          begin
            Name := 'q' + IntToStr(FTaskMaster.ObjData[i].ID);
            Caption := FTaskMaster.ObjData[i].ObjName;
            if ChildrenCnt = 1 then
            begin
              ParamOptions := [poTextFilter, poNumberFilter, poResult, poVisible];
              Params.ParamByName('OTHERCONDCODE').AsString :=
                '(:p' + IntToStr(FTaskMaster.ObjData[i].ID) +
                ' LIKE :q' + IntToStr(FTaskMaster.ObjData[i].ID) + ' || ''%''' + ')';
              if (FilterData.OperCode >= ArrMax - 1) and
                 (FilterData.Par1 <> '') and
                 (AddText <> '') then
                Params.ParamByName('OTHERCONDCODE').AsString := '(' + Params.ParamByName('OTHERCONDCODE').AsString + AddText;
            end
            else if ChildrenCnt = 2 then
            begin
              ParamOptions := [poTextFilter, poResult, poVisible];
              Params.ParamByName('OTHERCONDNAME').AsString :=
                '(UPPER(:p' + IntToStr(FTaskMaster.ObjData[i].ID) +
                ' ) LIKE ''%'' || UPPER(:q' + IntToStr(FTaskMaster.ObjData[i].ID) + ') || ''%''' + ')';
              if (FilterData.OperCode >= ArrMax - 1) and
                 (FilterData.Par1 <> '') and
                 (AddText <> '') then
                Params.ParamByName('OTHERCONDNAME').AsString := '(' + Params.ParamByName('OTHERCONDNAME').AsString + AddText;
            end
            else
              ParamOptions := [poResult, poVisible];
            Width := 64;
         end;
        end;
      end;

      if ChildrenCnt = 0 then
      begin
        Params[Params.Count - 1].ParamOptions := [poKey, poResult, poTextFilter, poNumberFilter, poVisible];
        Params[Params.Count - 1].Width := 64;
      end;

      Params.EndUpdate;
    end;
  except
    FreeAndNil(Result);
  end;
end;
}

procedure TUniverseFilter2.CheckUniverseFilterStyles;
var i, VCnt: Integer;
    ATabSheet: TTabSheet;
begin
  if Assigned(AddBtn) then
    AddBtn.Visible := (ufsMayChangeFields in Style) or (ufsMayChangeCond in Style) or (ufsMayChangeGroup in Style) or (ufsMayChangeOrder in Style);
  if Assigned(DelBtn) then
    DelBtn.Visible := (ufsMayChangeFields in Style) or (ufsMayChangeCond in Style) or (ufsMayChangeGroup in Style) or (ufsMayChangeOrder in Style);

  if Assigned(DeleteBtn) then
    DeleteBtn.Visible := (fsMayDelete in Style);

  if Assigned(NewBtn) then
    NewBtn.Visible := fsMayCreateNew in Style;
  if Assigned(SaveBtn) then
    SaveBtn.Visible := ufsSaveBtn in Style;

  if Assigned(SaveBtn) then
    SaveBtn.Visible := ufsSaveBtn in Style;

  if Assigned(FMainTreeView) then
  begin
    FMainTreeView.Visible := ufsMainTree in Style;
    if Assigned(Splitter) then
      Splitter.Visible := ufsMainTree in Style;
    if not FMainTreeView.Visible then
    begin
      if Assigned(Splitter) then
        Splitter.Visible := false;
    {  if Assigned(NewBtn) then
        NewBtn.Visible := false;
      if Assigned(SaveBtn) then
        SaveBtn.Visible := false;
      if Assigned(RefreshBtn) then
        RefreshBtn.Visible := false;
      if Assigned(DeleteBtn) then
        DeleteBtn.Visible := false;  }
    end;
  end;
  
  if Assigned(ObjView) then
    ObjView.Visible := ufsObjView in Style;

  if Assigned(ObjView) then
  begin
    ObjView.Visible := ufsObjView in Style;
    if Assigned(MSplitter) then
      MSplitter.Visible := ufsObjView in Style;
    if not ObjView.Visible then
    begin
      if Assigned(AddBtn) then
        AddBtn.Visible := false;
    end;
  end;
  
  if Assigned(FieldsSheet) then
  begin
    FieldsSheet.TabVisible := ufsFieldsList in Style;
    FieldsSheet.Visible := ufsFieldsList in Style;
  end;
  if Assigned(FilterSheet) then
  begin
    FilterSheet.TabVisible := ufsCondList in Style;
    FilterSheet.Visible := ufsCondList in Style;
  end;
  if Assigned(GroupSheet) then
  begin
    GroupSheet.TabVisible := ufsGroupList in Style;
    GroupSheet.Visible := ufsGroupList in Style;
  end;
  if Assigned(OrderSheet) then
  begin
    OrderSheet.TabVisible := ufsOrderList in Style;
    OrderSheet.Visible := ufsOrderList in Style;
  end;
  VCnt := 0;

  if Assigned(CondControl) then
  begin
    for i := 0 to CondControl.PageCount - 1 do
      if CondControl.Pages[i].Visible then Inc(VCnt);
    ATabSheet := CondControl.ActivePage;
    CondControl.ActivePage := nil;
    if VCnt = 1 then
    begin
      CondControl.ActivePage := ATabSheet;
      for i := 0 to CondControl.PageCount - 1 do
        if CondControl.Pages[i].Visible then
        begin
          CondControl.Pages[i].TabVisible := false;
          CondControl.ActivePageIndex := i;
        end;
    end
    else
    begin
      CondControl.ActivePageIndex := 0;
    end;
  end;
end;

procedure TUniverseFilter2.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  if (Operation = opRemove) and not (csDestroying in ComponentState) then
  begin
    if AComponent = fConnection then
      Connection := nil; 
    if AComponent = ImgLst then
      ImgLst := nil;
  end;
  inherited;
end;

procedure TUniverseFilter2.CondControlResizeCn(Sender: TObject;
  var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
begin
  BeginUpdateControl(CondControl);
  try
    if (TypeCondBox <> nil) and (CondBox <> nil) then
    begin
      TypeCondBox.Width := CondBox.ClientWidth - 14;
    end;
    if ParEdit1 <> nil then
    begin
      if ParEdit2 <> nil then
        ParEdit1.Width := (TypeCondBox.Width - 20) Div 2
      else
        ParEdit1.Width := TypeCondBox.Width;
      ParLabel1.Width := ParEdit1.Width
    end;
    if (ParEdit2 <> nil) and (ParEdit1 <> nil) then
    begin
      with ParEdit2 do
      begin
        Left := ParEdit1.Width + 27;
        Width := ParEdit1.Width
      end;
      with ParLabel2 do
      begin
        Left := ParEdit2.Left;
        Width := ParEdit2.Width
      end
    end;
    if CondGrid <> nil then
        CondGrid.DefaultColWidth := CondGrid.ClientWidth - 1;
    CalcUpDownPos;
  finally
    EndUpdateControl(CondControl);
  end;
end;

{procedure TUniverseFilter2.FilterResizeCn(Sender: TObject; var MinWidth,
  MinHeight, MaxWidth, MaxHeight: Integer);
begin
end; }

procedure TUniverseFilter2.BeginUpdateControl(AControl: TWinControl);
begin
  SendMessage(AControl.Handle, WM_SETREDRAW, 0, 0);
end;

procedure TUniverseFilter2.EndUpdateControl(AControl: TWinControl);
begin
  SendMessage(AControl.Handle, WM_SETREDRAW, 1, 0);
  AControl.Refresh;
end;

procedure TUniverseFilter2.CalcUpDownPos;
//var i, Pos: Integer;
begin
  if Assigned(TBar) and (TBar.ButtonCount >=9) and Assigned(CondControl) then
  begin
    SepBtn.Width := SepBtn.Width + CondControl.Left - UpBtn.Left;
 //   ShowButtonCaption := ShowButtonCaption;
  end;
end;

procedure TUniverseFilter2.ListBoxDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var APoint: TPoint;
    Index: Integer;
begin
  APoint.x := X;
  APoint.y := Y;
  if (Sender = Source) then
  begin
    with Sender as TListBox do
    begin
      Index := ItemAtPos(APoint, true);
      if Index = -1 then Index := Items.Count - 1;
      Items.Move(ItemIndex, Index);
      ItemIndex := Index;
    end;
  end
  else
    AddBtn.Click;
end;                        

procedure TUniverseFilter2.ListBoxDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var APoint: TPoint;
    AIndex: Integer;
begin
  if Sender = Source then
  begin
    with Sender as TListBox do
    begin
      APoint.x := X;
      APoint.y := Y;
      AIndex := ItemAtPos(APoint, true);
      if AIndex = -1 then AIndex := Items.Count - 1;
      Accept := AIndex <> ItemIndex;
    end;
  end
  else
    if (Source = ObjView) then
      Accept := AddBtn.Enabled
    else
      Accept := false;
end;

procedure TUniverseFilter2.ObjViewDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (Source = FieldsListBox) or
     (Source = GrListBox) or
     (Source = OrderListBox) then
    DelBtn.Click;
end;

procedure TUniverseFilter2.ObjViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source = FieldsListBox) or
     (Source = GrListBox) or
     (Source = OrderListBox) then
    Accept := DelBtn.Enabled;
end;


procedure TUniverseFilter2.ValListCreate(AFilterData: TFilterData);
var SL: TStringList;
    i: Integer;
    Menu: TPopupMenu;
    MenuItem: TMenuItem;
begin
  if ValList <> nil then
  begin
    FreeAndNil(ValList);
  end;
  ValList := TListBox.Create(Self);
  with ValList do
  begin
    Left := 7;
    Top := 105;
    Width := CondBox.Width - 14;
    Style := lbOwnerDrawFixed;
    Height := CondBox.Height - Top - 5;
    Font.Size := 8;
    Anchors := [akLeft, akRight, akTop, akBottom];
    Parent := CondBox;
    OnDblClick := ValListDblClick;
    if AFilterData.Par1 <> '' then
    begin
      try
        SL := TStringList.Create;
        SL.Text := ReplaceStr(AFilterData.Par1, ';', #13 + #10);
        for i := 0 to SL.Count - 1 do
        begin
          if AFilterData.FObjData.HasDetail then
            ValList.Items.AddObject(Trim(FilterToStringDoc_GetVal(AFilterData.FObjData.ID, StrToInt(SL[i]))), TObject(StrToInt(SL[i])))
          else
            ValList.Items.AddObject(Trim(SL[i]), nil);
        end
      finally
        SL.Free;
      end;
    end;
  end;
  Menu := TPopupMenu.Create(ValList);
  Menu.OnPopup := PopupMenuPopup;
  ValList.PopupMenu := Menu;

  MenuItem := TMenuItem.Create(Menu);
  with MenuItem do
  begin
    Caption := 'Редактировать';
    ShortCut := VK_RETURN;
    OnClick := miEditClick;
  end;
  Menu.Items.Add(MenuItem);

  MenuItem := TMenuItem.Create(Menu);
  with MenuItem do
  begin
    Caption := 'Добавить';
    ShortCut := VK_INSERT;
    OnClick := miAddClick;
  end;
  Menu.Items.Add(MenuItem);

  MenuItem := TMenuItem.Create(Menu);
  with MenuItem do
  begin
    Caption := 'Удалить';
    ShortCut := VK_DELETE;
    OnClick := miDelClick;
  end;
  Menu.Items.Add(MenuItem);
end;

procedure TUniverseFilter2.ValListDblClick(Sender: TObject);
begin
  if ValList.PopupMenu.Items[0].Enabled then
    miEditClick(nil);
end;

procedure TUniverseFilter2.miAddClick(Sender: TObject);
begin
  EditValList(-1);
end;

procedure TUniverseFilter2.miEditClick(Sender: TObject);
begin
  EditValList(ValList.ItemIndex);
end;

procedure TUniverseFilter2.EditValList(Index: Integer);
begin
{  QSrc := CreateValQS(FTaskMaster.FilterData[CurrFilter], false);
  if QSrc <> nil then
  begin
    with QSrc do
    begin
      if Index = -1 then
        KeyValue := ''
      else
        if FTaskMaster.FilterData [CurrFilter].Par1 <> '' then
          if ValList.Items.Objects[ValList.ItemIndex] = nil then
            KeyValue := ValList.Items[ValList.ItemIndex]
          else
            KeyValue := Integer(ValList.Items.Objects[ValList.ItemIndex]);
      ValList.ItemIndex := Index;
      ButtonClick;
 //     QSValListSelect;
      Free;
    end;
  end;  }
end;

procedure TUniverseFilter2.miDelClick(Sender: TObject);
begin
  ValList.Items.Delete(ValList.ItemIndex);
  ValListChange;
end;

procedure TUniverseFilter2.PopupMenuPopup(Sender: TObject);
begin
  ValList.PopupMenu.Items[0].Enabled := ValList.ItemIndex > -1;
  ValList.PopupMenu.Items[2].Enabled := ValList.ItemIndex > -1;
end;

procedure TUniverseFilter2.ValListChange;
var
  S, S2: String;
  I: Integer;
begin
  S := '';
  if FTaskMaster.FilterData[CurrFilter].FObjData.HasDetail then
  begin
    for I := 0 to ValList.Items.Count - 1 do
    if S <> '' then
      S := S + '; ' + IntToStr(Integer(ValList.Items.Objects[I]))
    else
      S := IntToStr(Integer(ValList.Items.Objects[I]));
  end
  else
  begin
    for I := 0 to ValList.Items.Count - 1 do
    if S <> '' then
      S := S + '; ' + ValList.Items[I]
    else
      S := ValList.Items[I];
  end;

  S2 := '';   
  for I := 0 to ValList.Items.Count - 1 do
  if S2 <> '' then
    S2 := S2 + '; ' + ValList.Items[I]
  else
    S2 := ValList.Items[I];

  FTaskMaster.FilterData[CurrFilter].Par1 := S;
//  FilterToText(FTaskMaster.FilterData[CurrFilter]);
  with FTaskMaster.FilterData[CurrFilter].FObjData do
  begin
    case DType of
      0: S := ObjName + ' ' + CondArrayNum[FTaskMaster.FilterData[CurrFilter].OperCode];
      1: S := ObjName + ' ' + CondArrayStr[FTaskMaster.FilterData[CurrFilter].OperCode];
      2: S := ObjName + ' ' + CondArrayDate[FTaskMaster.FilterData[CurrFilter].OperCode];
    end;
  end;
  FTaskMaster.FilterData[CurrFilter].Text := S + ' ' + S2;

  CondGrid.InvalidateCell(0, CurrFilter);
  RefreshFilter := True;
end;

{procedure TUniverseFilter2.QSValListSelect(Q: TEtranQuickSearch) ;
var S: String;
    ID: Integer;
begin
  if Q.SelectReason <> rClick then Exit;
  ValList.Items.BeginUpdate;
  try
    if ValList.ItemIndex = -1 then
    begin
      ValList.Items.Add('');
      ValList.ItemIndex := ValList.Items.Count - 1;
    end;

    if FTaskMaster.FilterData[CurrFilter].FObjData.HasDetail then
    begin
      ID := VarAsType(Q.KeyValue, varInteger);
      if ValList.Items.Objects[ValList.ItemIndex] <> TObject(ID) then
      begin
        S := FilterToStringDoc_GetVal(FTaskMaster.FilterData[CurrFilter].FObjData.ID, VarAsType(Q.KeyValue, varInteger));
        ValList.Items[ValList.ItemIndex] := S;
        ValList.Items.Objects[ValList.ItemIndex] := TObject(ID);
        ValListChange;
      end;
    end
    else
    begin
      ValList.Items.Objects[ValList.ItemIndex] := nil;
      if ValList.Items[ValList.ItemIndex] <> VarToStr(Q.KeyValue) then
      begin
        ValList.Items[ValList.ItemIndex] := VarToStr(Q.KeyValue);
        ValListChange;
      end;
    end;
  finally
    ValList.Items.EndUpdate;
  end;
end;
}

procedure TUniverseFilter2.NewMenuPopup(Sender: TObject);
var N: TTreeNode;
begin
//  N := TTreeView(MainNode.TreeView).Selected;
  N := SelectedNode;

  miAddNew.Enabled := (fsMayCreateNew in Self.Style) and (fConnection <> nil) and (FMainNode <> nil) and (ID_Univ <> - 1) and (SelectedFilter <> - 1);
  miAddChild.Enabled := miAddNew.Enabled and
    (MainNode <> nil) and (N <> nil) and (TObject(N.Data) is TMainData) and (TMainData(N.Data).GrStr = '') and (not TMainData(N.Data).PrField);
end;



procedure TUniverseFilter2.Select(Sender: TObject);
begin
 // QSValListSelect(Sender as TEtranQuickSearch);
end;

procedure TUniverseFilter2.SetShowButtonCaption(const Value: boolean);
begin
  if Assigned(TBar) then
  begin
    TBar.ShowCaptions := Value;
    if not Value then
    begin
      TBar.ButtonWidth := 23;
      TBar.ButtonHeight := 21;
    end;
  end;
end;

function TUniverseFilter2.GetShowButtonCaption: boolean;
begin
  if Assigned(TBar) then
    Result := TBar.ShowCaptions
  else
    Result := false;
end;

{procedure TUniverseFilter2.CreateWnd;
begin
  inherited;
  CreateChildControls;
  SetEnabledButtons;
end;  }



function TUniverseFilter2.GetSelectedNode: TTreeNode;
begin
  Result := FSelectedNode;
end;

procedure TUniverseFilter2.SetSelectedNode(const Value: TTreeNode);
begin
  if FSelectedNode <> Value then
    FSelectedNode := Value;
end;


function TUniverseFilter2.GetFilterString: String;
begin
  Result := MakeWhereStr;
end;

procedure TUniverseFilter2.SetFilterString(AFltString: String);
var WorkList: TStringList;
    i, J, cnt, Num: Integer;
    S: String;
    D: TFilterData;
begin
  WorkList := TStringList.Create;
  with CondGrid do
  begin
    RowCount := 0;
    DefaultRowHeight := 1;
  end;
  FTaskMaster.ClearFilterList;
  try
    if AFltString <> '' then
    begin
      WorkList.Text := ReplaceStr(AFltString, '|', #13#10);
      for I := 0 to WorkList.Count - 1 do
      begin
        S := WorkList[I];
        cnt := WordCount(S, [',']);
        Num := StrToInt(ExtractWord(1, S, [',']));
        D := TFilterData.Create(FTaskMaster);
        for J := 0 to FTaskMaster.ObjDataCount - 1 do
          if (not FTaskMaster.ObjData[J].PrClass) and
             (FTaskMaster.ObjData[J].ID = Num) and
             (((cnt > 1) and (FTaskMaster.ObjData[J].ObjType = 1)) or
             ((cnt = 1) and (FTaskMaster.ObjData[J].ObjType = 2))) then
          begin
            D.FObjData := FTaskMaster.ObjData[j];
            Break;
          end;
        if cnt > 1 then
        begin
          D.OperCode := StrToInt(ExtractWord(2, S, [',']));
          if cnt >= 3 then
            D.Par1 := ExtractWord(3, S, [',']);
          if cnt = 4 then
            D.Par2 := ExtractWord(4, S, [',']);
        end;
      end;
    end;
  finally
    WorkList.Free;
    with CondGrid do
    begin
      RowCount := FTaskMaster.FilterDataCount;
      if FTaskMaster.FilterDataCount > 0 then
        CurrFilter := 0
      else
        CurrFilter := -1;
    end;
  end;
end;

function TUniverseFilter2.GetFilterTextToDoc: String;
var i: Integer;
    N: Integer;
begin
  Result := '';
  N := FTaskMaster.FilterDataCount;
  for i := 0 to N - 1 do
  begin
    if Result <> '' then Result := Result + #13 + #10;
    if FTaskMaster.FilterData[i].Text = '' then FilterToText(FTaskMaster.FilterData[i]);
    Result := Result + FTaskMaster.FilterData[i].Text;
    //FilterToStringDoc(FTaskMaster.FilterData[i]);
  end;
end;

procedure TUniverseFilter2.SetDirectFilterString(const Value: String);
begin
  FDirectFilterString := Value;
end;

procedure TUniverseFilter2.FLVOnData(Sender: TObject; Item: TListItem);
var Obj : TObject;
    ind : integer;
begin
  if (Item.Index = 0) and (FMainTreeView.Selected <> MainNode) then
  begin
    Item.SubItems.Add('[..]');
    Item.ImageIndex := 0;
  end
  else
  begin
    if FMainTreeView.Selected = MainNode then
      ind := Item.Index
    else
      ind := Item.Index - 1;
    if ind < FLVObjList.Count then
    begin
      Obj := FLVObjList[ind];
      if Obj is TMainData then
      begin
        Item.Data := Obj;
        Item.SubItems.Add(TMainData(Obj).Name);
        ListItemSetImageIndex(Item);
      end;
    end;
  end;
end;

procedure TUniverseFilter2.ListItemSetImageIndex(LI : TListItem);
begin
  with LI do
  begin
    if TObject(Data) is TMainData then
    begin
      if TMainData(LI.Data).ID = -1 then
      begin
        ImageIndex := 3;
      end
      else
        if TMainData(Data).PrField then
        begin
          ImageIndex := 15;
        end
        else
          ImageIndex := 16;
    end;
  end;
end;

procedure TUniverseFilter2.FLVOnDblClick(Sender: TObject);
begin
  if (FListView.Selected <> nil) and (FMainTreeView.Selected <> nil) then
  begin
    if (FMainTreeView.Selected = MainNode) then
    begin
      FMainTreeView.Selected := FMainTreeView.Selected.Item[FListView.Selected.Index];
    end
    else
    begin
      if (FListView.Selected.Index = 0) then
      begin
        if (FMainTreeView.Selected.Parent <> nil) then
        begin
          FMainTreeView.Selected := FMainTreeView.Selected.Parent;
        end;
      end
      else
      begin
        FMainTreeView.Selected := FMainTreeView.Selected.Item[FListView.Selected.Index - 1];
      end;
    end;
  end;
  if FMainTreeView.Selected <> nil then
  begin
    FMainTreeView.Selected.Expand(false);
    ShowChildInLV(FMainTreeView.Selected);
  end;
end;

procedure TUniverseFilter2.SetConnection(const Value: TCustomConnection);
begin
  FConnection := Value;
end;

{ TUFClass }

constructor TUFClass.Create(AOwner: TTaskMasterClass);
begin
  inherited Create;
  FOwner := AOwner;
  if FOwner is TTaskMasterClass then
    FOwner.ObjAdd(self);
end;

destructor TUFClass.Destroy;
begin
  if FOwner is TTaskMasterClass then
    FOwner.ObjDel(self);
  inherited;        
end;

{ TMainData }

constructor TMainData.Create(AOwner: TTaskMasterClass);
begin
  inherited;
  ID := -1;
  ParentID := NoParent;
  ThisUser := false;
  HasSubFilter := false;
end;

{ TObjData }

constructor TObjData.Create(AOwner: TTaskMasterClass);
begin
  inherited;
  FPropList := TList.Create;
  
  PrClass := False;
  Sel := False;
  ObjHidden := false;
  HasDetail := false;
  DType := -1;
  PID := Null;
end;

destructor TObjData.Destroy;
var Obj: TObject;
begin
  while FPropList.Count > 0 do
  begin
    Obj := TObject(FPropList[FPropList.Count - 1]);
    FPropList.Delete(FPropList.Count - 1);
    Obj.Free;
  end;
  inherited;
end;

{ TTaskMasterClass }

constructor TTaskMasterClass.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  FObjList := TList.Create;
  FObjDataList := TList.Create;
  FPropDataList := TList.Create;

  FFilterList := TList.Create;
  FMainDataList := TList.Create;
end;

destructor TTaskMasterClass.Destroy;
begin
  ClearList(FObjList);
  FObjList.Free;
  ClearList(FObjDataList);
  FObjDataList.Free;
  ClearList(FPropDataList);
  FPropDataList.Free;

  ClearList(FFilterList);
  FFilterList.Free;
  ClearList(FMainDataList);
  FMainDataList.Free;
  inherited;
end;

procedure TTaskMasterClass.ClearList(AList: TList);
var Obj: TObject;
begin
  while AList.Count > 0 do
  begin
    Obj := TObject(AList[AList.Count - 1]);
    AList.Delete(AList.Count - 1);
    Obj.Free;
  end;
end;

procedure TTaskMasterClass.ObjAdd(AObject: TObject);
begin
  if AObject is TObjData then
    CustomObjAdd(AObject, FObjDataList)
  else
    if AObject is TFilterData then
      CustomObjAdd(AObject, FFilterList)
    else
      if AObject is TMainData then
        CustomObjAdd(AObject, FMainDataList)
      else
        if AObject is TPropData then
          CustomObjAdd(AObject, FPropDataList)
        else
          CustomObjAdd(AObject, FObjList);
end;

procedure TTaskMasterClass.ObjDel(AObject: TObject);
begin
  if AObject is TObjData then
    CustomObjDel(AObject, FObjDataList)
  else
    if AObject is TFilterData then
      CustomObjDel(AObject, FFilterList)
    else
      if AObject is TMainData then
        CustomObjDel(AObject, FMainDataList)
      else
        if AObject is TPropData then
          CustomObjDel(AObject, FPropDataList)
        else
          CustomObjDel(AObject, FObjList);
end;

procedure TTaskMasterClass.CustomObjAdd(AObject: TObject; AList: TList);
var N: Integer;
begin
  if Assigned(AObject) and Assigned(AList) then
  begin
    N := AList.IndexOf(AObject);
    if N = -1 then
      AList.Add(AObject);
  end;
end;

procedure TTaskMasterClass.CustomObjDel(AObject: TObject; AList: TList);
var N: Integer;
begin
  if Assigned(AObject) and Assigned(AList) then
  begin
    N := AList.IndexOf(AObject);
    if N <> -1 then
      AList.Delete(N);
  end;
end;

function TTaskMasterClass.GetObject(i: Integer): TObject;
begin
  Result := TObject(FObjList[i]);
end;

procedure TTaskMasterClass.SetObject(i: Integer; const Value: TObject);
begin
  FObjList[i] := Value;
end;

function TTaskMasterClass.GetObjectsCount: Integer;
begin
  Result := FObjList.Count;
end;

function TTaskMasterClass.GetObjData(i: Integer): TObjData;
begin
  Result := TObjData(FObjDataList[i]);
end;

function TTaskMasterClass.GetObjDataCount: Integer;
begin
  Result := FObjDataList.Count;
end;

procedure TTaskMasterClass.SetObjData(i: Integer; const Value: TObjData);
begin
  FObjDataList[i] := Value;
end;

function TTaskMasterClass.GetFilterData(i: Integer): TFilterData;
begin
  Result := TFilterData(FFilterList[i]);
end;

function TTaskMasterClass.GetFilterDataCount: Integer;
begin
  Result := FFilterList.Count;
end;

procedure TTaskMasterClass.SetFilterData(i: Integer; const Value: TFilterData);
begin
  FFilterList[i] := Value;
end;

function TTaskMasterClass.GetMainData(i: Integer): TMainData;
begin
  Result := TMainData(FMainDataList[i]);
end;

function TTaskMasterClass.GetMainDataCount: Integer;
begin
  Result := FMainDataList.Count;
end;

procedure TTaskMasterClass.SetMainData(i: Integer; const Value: TMainData);
begin
  FMainDataList[i] := Value;
end;

procedure TTaskMasterClass.ClearObjList;
begin
  ClearList(FObjList);
end;

procedure TTaskMasterClass.ClearObjDataList;
begin
  ClearList(FObjDataList);
end;

procedure TTaskMasterClass.ClearFilterList;
begin
  ClearList(FFilterList);
end;

procedure TTaskMasterClass.ClearMainDataList;
begin
  ClearList(FMainDataList);
end;

procedure TTaskMasterClass.ClearPropDataList;
begin
  ClearList(FObjDataList);
end;

{ TPropData }

constructor TPropData.Create(AOwner: TTaskMasterClass);
begin
  inherited;
  isSelect := false;
end;

initialization
  DateEditMask := 'dd' + DateSeparator +'mm'+ DateSeparator + 'yyyy';

end.
