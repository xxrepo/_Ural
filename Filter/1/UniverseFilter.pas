unit UniverseFilter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, menus,
  ExtCtrls, ComCtrls, StdCtrls, RxGrids, UDataSet, USetSqlAct, UEtranConnection, EtranQS, RXCtrls;

{$R Ufrez2.res}
const
  NoParent = -2;
  
  DateMask                                   = 'dd.mm.yyyy';
  SQLDateMask                                = 'yyyy-mm-dd';
  SQLTimeMask                                = 'hh:nn:ss';

  ArrMax                                     = 13;
  CondArray:  array[0..ArrMax] of String     = ('Не пусто', 'Пусто', 'Не равно', 'Равно', 'Больше или равно', 'Меньше или равно', 'Больше', 'Меньше', 'Включает в себя', 'Находится между', 'Начинается с', 'Заканчивается', 'Входит в список', 'Не входит в список');
  SQLArray:   array[0..ArrMax] of String     = (' Is not Null ', ' Is Null ', ' <> P1 ', ' = P1 ', ' >= P1 ', ' <= P1 ', ' > P1 ', ' < P1 ', ' Like ' + #39 + '%P1%' + #39 + ' ', ' Between P1 and P2 ', ' Like ' + #39 + 'P1%' + #39 + ' ', ' Like ' + #39 + '%P1' + #39 + ' ', ' In (P1) ', ' Not In (P1) ');
  Par1Capt  : array[0..ArrMax] of String     = ('', '', 'Значение', 'Значение', 'Значение', 'Значение', 'Значение', 'Значение', 'Значение', '1-е значение', 'Значение', 'Значение', 'Значение', 'Значение');
  Par2Capt  : array[0..ArrMax] of String     = ('', '', '', '', '', '', '', '', '', '2-е значение', '', '', '', '');
  TypeArray : array[0..ArrMax, 0..2] of Byte = ((1, 1, 1), (1, 1, 1), (1, 1, 1), (1, 1, 1), (1, 0, 1), (1, 0, 1), (1, 0, 1), (1, 0, 1), (0, 1, 0), (1, 0, 1), (0, 1, 0), (0, 1, 0), (1, 1, 0), (1, 1, 0));

  CondArrayStr : array[0..ArrMax] of String     = ('указан(а)', 'не указан(а)', 'кроме: ', ': ', 'Больше или равно', 'Меньше или равно', 'Больше', 'Меньше', 'Включает в себя', 'Находится между', 'Начинается с', 'Заканчивается', ': ', 'кроме: ');
  CondArrayDate: array[0..ArrMax] of String     = ('указан(а)', 'не указан(а)', 'кроме: ', ': ', 'с(включительно)', 'до(включительно)', 'с', 'до', 'Включает в себя', 'в период', 'Начинается с', 'Заканчивается', ': ', 'кроме: ');
  CondArrayNum : array[0..ArrMax] of String     = ('указан(а)', 'не указан(а)', 'кроме: ', ': ', 'Больше или равно', 'Меньше или равно', 'Больше', 'Меньше', 'Включает в себя', 'Находится между', 'Начинается с', 'Заканчивается', ': ', 'кроме: ');

type
  TFilterData = class;
  TTaskMasterClass = class;
  TTreeData = class;
  TMainData = class;

  TUniverseFilterStyle = (ufsMainTree, // Показывать дерево фильтров
                          ufsObjView,  // Показывать дерево объектов
                          ufsSaveBtn,  // Доступна кнопка "Сохранить"
                          ufsFieldsList, // Показывать закладку "Поля"
                          ufsCondList,   // Показывать закладку "Условия"
                          ufsGroupList,  // Показывать закладку "Группировка"
                          ufsOrderList,  // Показывать закладку "Сортировка"
                          ufsMayChangeFields,  // Можно менять набор полей
                          ufsMayChangeCond,    // Можно менять условия
                          ufsMayChangeGroup,   // Можно менять группировку
                          ufsMayChangeOrder,   // Можно менять сортировку
                          fsMayCreateNew,      // Можно создавать новые фильтры
                          fsMayDelete);        // Можно удалять фильтры
                          
  TUniverseFilterStyles = set of TUniverseFilterStyle;

  TUniverseFilter = class(TPanel)
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
    MSplitter, FSplitter, Splitter             : TSplitter;
    fImgLst, fSelfImgLst                 : TImageList;
    CondBox, FilterListBox: TGroupBox;
    CondGrid                         : TRxDrawGrid;
    Label1, ParLabel1, ParLabel2     : TLabel;
    TypeCondBox                      : TComboBox;
    GrListBox, FieldsListBox, OrderListBox         : TListBox;
    WorkDS                           : TEtranDataSet;
    WorkAct                          : TSetSqlAct;
    ParEdit1, ParEdit2               : TEdit;
    ParEditTime1, ParEditTime2 : TDateTimePicker;
    qs, QSrc: TEtranQuickSearch;
    ValList: TListBox;
    FSelectedNode: TTreeNode;
    FUniType: String;
    FDirectFilterString: String;

    procedure MainViewChange(Sender: TObject; Node: TTreeNode);
    procedure MainViewExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
    procedure MainViewCollapsing(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
    procedure MainViewGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure MainViewDblClick(Sender: TObject);
    procedure MainViewSetNodeImageIndex(Node: TTreeNode);

//    procedure FieldsListBoxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
//    procedure OrderListBoxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
//    procedure GrListBoxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure CondGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);

    procedure FieldsListBoxAddItem(ATreeData: TTreeData);
    procedure OrderListBoxAddItem(ATreeData: TTreeData);
    procedure GrListBoxAddItem(ATreeData: TTreeData);

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
    procedure RefresheSelectedFilter;   // обновляет фильтр (при сохранении)
    function GetFilterTextToDoc: String;
    procedure SaveFilter(AName: String);
    procedure SetDirectFilterString(const Value: String);
  private
    { Private declarations }
    FChildCreated: Boolean;
//    vSave: Boolean;
    fConnection: TEtranConnection;
    fParentFilter: Integer;
    fUniverseID: Integer;
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
    procedure BeginUpdateControl(AControl: TWinControl);  // Отключает перерисовку контролов
    procedure EndUpdateControl(AControl: TWinControl);    // Включает перерисовку контролов
    procedure CheckUniverseFilterStyles;
    procedure SetConnection(Value: TEtranConnection);
    procedure SetRefreshFilter(Value: Boolean);

    procedure ParamChange(Sender: TObject); // Обработчик события, при радактирований контрола "Значение параметра" 
    procedure GetNewFilterParams(AFilterData: TFilterData; var P1, P2: String; SQLParam: Boolean); // Формирует текстовое представление параметров
    procedure FreeNode(Sender: TObject; Node: TTreeNode);
    procedure SafeFreeAndNil(var Obj);
    procedure SetUniverseID(Value: Integer);
    function NewFilterToSQL(FilterData: TFilterData): String;  // Формирует условие SQL-запроса 
    procedure SetMainNode(const Value: TTreeNode);
    function GetMainNode: TTreeNode;

    procedure NewFillTree(IDList: TList = nil);  // Заполнение дерева фильтров (IDList - список ID фильтров, которые надо открыть)
    procedure SetStyle(const Value: TUniverseFilterStyles);
    procedure SetMainNodeName(const Value: String);
    procedure SetaptionOrderSheet(const Value: String);
    procedure SetCaptionFieldSheet(const Value: String);
    procedure SetCaptionFilterSheet(const Value: String);
    procedure SetCaptionGroupSheet(const Value: String);
    procedure SetSelectedFilter(const Value: Integer);
    procedure SetNewCurrFilter(const Value: Integer);
    procedure SetFilterName(const Value: String);
    procedure NewSetParamEditors(Cond: Integer);   // Создает контролы для редактирования условий
    procedure GetNodeTDList(Node: TTreeNode);
    procedure GetNodeTDListCover(Node: TTreeNode);
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadMainTreeWidth(Reader: TReader);
    procedure WriteMainTreeWidth(Writer: TWriter);
    procedure ReadObjTreeWidth(Reader: TReader);
    procedure WriteObjTreeWidth(Writer: TWriter);
    procedure NewMenuPopup(Sender: TObject);

    procedure ParControlsFree;  // Удаляет контролы-редакторы параметров
    function CreateQS(ATreeData: TTreeData): TEtranQuickSearch; // Создает QuickSearch для редактирования параметров
    procedure QSSelect(Sender: TObject);  // Обработчик события Select в QuickSearch
    function GetSelCount: Integer;

    function CreateValQS(FilterData: TFilterData; AVisible: boolean = true): TEtranQuickSearch; // Создает QuickSearch набора параметров (входит в список)
    procedure ValListCreate(AFilterData: TFilterData);  // Создает TListBox для редактирования набора параметров 
    procedure ValListDblClick(Sender: TObject);
    procedure ValListChange;
    procedure QSValListSelect(Q: TEtranQuickSearch) ; // Обработчик события Select в QuickSearch

    procedure Select(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    
    procedure miEditClick(Sender: TObject);
    procedure miAddClick(Sender: TObject);
    procedure EditValList(Index: Integer);
    procedure miDelClick(Sender: TObject);


    function GetImageList: TImageList;
    //* Для построения запросов
    function MakeFieldsStr: String;   // Формирует список возвращаемых полей
    function MakeGroupStr : String;   // Формирует список полей для группировки
    function MakeOrderStr : String;   // Формирует список полей для сортировки
    function MakeCondByWhereStr(AWhereStr: String): String; // Формирует условие SQL запроса

    function MakeWhereStr : String;   // Формирует условие запроса (для сохранения в базе)
    
    function MakeSQLValList(FilterData: TFilterData): String;  // Формирует список для условий "входит/не входит в список"
    
    procedure SetShowButtonCaption(const Value: boolean);
    function GetShowButtonCaption: boolean;
  protected
    { Protected declarations }
    procedure SetParent(AParent: TWinControl); override;
    procedure CreateChildControls;  // Создает дочерние контролы

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    //* Для LM
    procedure SetFilterString(AFltString: String); // Разбирает строку и отображает визуально условия фильтра 
    function GetFilterString: String;              // Формирует условие запроса (для сохранения в базе) 
    //**************
  public
    { Public declarations }
    GroupNode: Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function FilterToStringDoc(FilterData: TFilterData): String;  // Текстовое представление условий фильтра
    function FilterToStringDoc_GetVal(SelField, ID: Integer): String; // получить значение из базы (элемент списка)
    procedure FilterToText(FilterData: TFilterData); // Заполняет свойство Text объекта 

    procedure Initialize;       // Заполняет свое дерево фильтров

    function ExpandNode(ANode: TTreeNode): Boolean;  // Раскрыть ноду дерева объектов
    procedure CollapseNode(ANode: TTreeNode);        // Закрыть ноду дерева объектов
    procedure ChangeNode(Node: TTreeNode);           // Перейти на другую ноду дерева объектов
    
    function CreateDataSet(DataSet: TEtranDataSet): Boolean; // Выполнить запрос фильтра к базе
    procedure CreateDataSetByID(ANode: TTreeNode; DataSet: TEtranDataSet);  // Выполнить запрос фильтра к базе (фильтр из выбранной ноды)

    property SelCount     : Integer          read GetSelCount; // Количество полей возвращаемых в запросе
    property RefreshFilter: Boolean          read fRefreshFilter write SetRefreshFilter;

    property MainNode     : TTreeNode        read GetMainNode write SetMainNode;  // Нода, к которой добавляется дерево фильтров
    property UniverseID   : Integer       read fUniverseID      write SetUniverseID;  // Номер юниверса
    property SelectedFilter    : Integer          read fSelectedFilter     write SetSelectedFilter; // Выбранный фильтр
    property CurrFilter   : Integer          read fNewCurrFilter    write SetNewCurrFilter;         // выбранное условие фильтра
    property FilterName : String read FFilterName write SetFilterName;

    property SelectedNode: TTreeNode read GetSelectedNode write SetSelectedNode;  // Выбранная нода в дереве фильтров
  published
    { Published declarations }
    property Connection   : TEtranConnection read fConnection    write SetConnection;
    property ImgLst       : TImageList       read fImgLst        write SetImgLst;
    property OnFillTree   : TNotifyEvent     read fOnFillTree    write fOnFillTree;
    property Style: TUniverseFilterStyles read FStyle write SetStyle;
    property MainNodeName: String read FMainNodeName write SetMainNodeName;

    property DirectFilterString : String read FDirectFilterString write SetDirectFilterString; // Постоянное условие, добавка к условиям фильтра

    // Заголовки закладок
    property CaptionFieldSheet: String read FCaptionFieldSheet write SetCaptionFieldSheet;
    property CaptionFilterSheet: String read FCaptionFilterSheet write SetCaptionFilterSheet;
    property CaptionGroupSheet: String read FCaptionGroupSheet write SetCaptionGroupSheet;
    property CaptionOrderSheet: String read FCaptionOrderSheet write SetaptionOrderSheet;


    property AllowEmptyCondition: boolean read FAllowEmptyCondition write FAllowEmptyCondition; // разрешено не задавать условие поиска
    property ShowButtonCaption: boolean read GetShowButtonCaption write SetShowButtonCaption;

    property UniType: String read FUniType write FUniType;
    property FilterString: String read GetFilterString write SetFilterString; // Строка с условиями для сохранения в базе
    property FilterTextToDoc: String read GetFilterTextToDoc;     // Текст условия для документов
  end;


  // *** Класс-контейнер для всех объектов, порождаемых фильтром.
  // Отслеживает их количество, позволяет отлавливать утечки памяти
  TTaskMasterClass = class
  private
    FOwner: TObject;
    FObjList: TList;
    FTreeDataList: TList;
    FFilterList: TList;
    FMainDataList: TList;

    procedure ClearList(AList: TList);
    procedure CustomObjAdd(AObject: TObject; AList: TList);
    procedure CustomObjDel(AObject: TObject; AList: TList);
    function GetObject(i: Integer): TObject;
    procedure SetObject(i: Integer; const Value: TObject);
    function GetObjectsCount: Integer;
    function GetTreeData(i: Integer): TTreeData;
    function GetTreeDataCount: Integer;
    procedure SetTreeData(i: Integer; const Value: TTreeData);
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

    procedure ClearObjList;     // Удалить все объекты
    procedure ClearTreeDataList;   // Удалить объекты TTreeData
    procedure ClearFilterList;     // Удалить объекты TFilterData
    procedure ClearMainDataList;   // Удалить объекты TMainData

    // Все объекты фильтра
    property Objects[i: Integer]: TObject read GetObject write SetObject;
    property ObjectsCount: Integer read GetObjectsCount;

    // Объекты TTreeData
    property TreeData[i: Integer]: TTreeData read GetTreeData write SetTreeData;
    property TreeDataCount: Integer read GetTreeDataCount;

    // Объекты TFilterData
    property FilterData[i: Integer]: TFilterData read GetFilterData write SetFilterData;
    property FilterDataCount: Integer read GetFilterDataCount;

    // Объекты TMainData
    property MainData[i: Integer]: TMainData read GetMainData write SetMainData;
    property MainDataCount: Integer read GetMainDataCount;
  end;

  // *** Предок для всех объектов, порождаемых фильтром
  // Добавляет себя при создании в нужные списки и автоматически удаляется из них при дестрое 
  TUFClass = class
    FOwner: TTaskMasterClass;
    constructor Create(AOwner: TTaskMasterClass);
    destructor Destroy; override;
  end;

  TMainData = class(TUFClass)
  public
    ID            : Integer;   // Идентификатор
    ParentID      : Integer;   // Родительский фильтр
    Parent : TMainData;        // Ссылка на родителя
    PrField       : Boolean;
    Name: String;
    ThisUser: boolean;         // Создан для данного пользователя (не унаследован)
    HasSubFilter: boolean;     // Имеет вложенные фильтры
    CondStr, GrStr: String[200];  // Условия/гриппировка
    constructor Create(AOwner: TTaskMasterClass);
  end;

  TTreeData = class(TUFClass)
  public
    ID, PID,
    DType, // Тип поля 0 - число, 1 - строка, 2 - дата
    DetParent, ObjID: Integer;
    ObjName: String;
    ObjHidden, HasDetail: boolean;
    FieldKind: String[200];
    PrClass, Sel, Large: Boolean;
    ObjType: Integer;
    constructor Create(AOwner: TTaskMasterClass);
  end;

  TFilterData = class(TUFClass)
  public
    FTreeData: TTreeData;
    OperCode: Integer;
    Par1, Par2, // Условия фильтра
    Text : String; // Текст фильтра
  end;
procedure Register;

implementation

uses
  CurrEdit, DateUtil, DB, RusDlg, StrUtils, ToolEdit, ToolWin,
  UEtranUtilities, {U_SelItems,} USQLActs;

var   DateEditMask : String;

procedure Register;
begin
  RegisterComponents('Etran', [TUniverseFilter]);
end;

function UFFormatDateTimeEx(ADate : TDateTime) : String;
var intX : integer;
    RealX : Extended;
    S : String; 
begin
  // Преобразует дату-время в строку
  if Int(ADate) <> 0 then
    S := SQLDateMask;

  if Frac(ADate) <> 0 then
  begin
    if S = '' then
      S := SQLTimeMask     // Если это время то дату не показываем
    else
      S := S + ' ' + SQLTimeMask;
  end;

  if S <> '' then
    Result := FormatDateTime(S, ADate)
  else
    Result := '';
end;

function UFStrToFloatDef(Str : String) : Extended;
var S : String;
begin
  // Преобразует строку в целое число, по умолчанию возвращает ноль
  if DecimalSeparator = '.' then
    S := ','
  else
    S := '.';
  S := ReplaceStr(Str, S, DecimalSeparator);
  if trim(S) <> '' then
    Result := StrToFloat(S)
  else
    Result := 0;
end;

{ TUniverseFilter }
procedure TUniverseFilter.SetEnabledButtons;
begin
  // В зависимоти от состояния фильтра делаем доступными/недоступными кнопки редактирования и сохранения 
  if csDesigning in ComponentState then Exit;
  NewBtn.Enabled := (fsMayCreateNew in Self.Style) and (fConnection <> nil) and (FMainNode <> nil) and (UniverseID <> - 1) and (SelectedFilter <> - 1);
  DeleteBtn.Enabled := (fsMayDelete in Self.Style) and (UniverseID <> - 1) and (SelectedFilter <> - 1);
  RefreshBtn.Enabled := RefreshFilter;
  SaveBtn.Enabled := (SelCount > 0) and RefreshBtn.Enabled;
  if CondControl.ActivePage = FieldsSheet then
  begin
    with FieldsListBox do
    begin
      AddBtn.Enabled := (ufsMayChangeFields in Self.Style) and (ObjView.Selected <> nil) and (TObject(ObjView.Selected.Data) is TTreeData) and not TTreeData(ObjView.Selected.Data).PrClass and not TTreeData(ObjView.Selected.Data).HasDetail {and (TTreeData(ObjView.Selected.Data).FieldKind = 'Dim')} and (Items.IndexOfObject(TTreeData(ObjView.Selected.Data)) = - 1);
      DelBtn.Enabled := Items.Count > 0;
      UpBtn.Enabled := ItemIndex > 0;
      DownBtn.Enabled := ItemIndex < Items.Count - 1;
    end;
  end
  else
    if CondControl.ActivePage = FilterSheet then
    begin
      AddBtn.Enabled := (ufsMayChangeCond in Self.Style) and (ObjView.Selected <> nil) and (TObject(ObjView.Selected.Data) is TTreeData) and not TTreeData(ObjView.Selected.Data).PrClass;
      DelBtn.Enabled := FTaskMaster.FilterDataCount > 0;
      UpBtn.Enabled := False;
      DownBtn.Enabled := False;
    end
    else
      if CondControl.ActivePage = GroupSheet then
      begin
        with GrListBox do
        begin
          AddBtn.Enabled := (ufsMayChangeGroup in Self.Style) and (ObjView.Selected <> nil) and (TObject(ObjView.Selected.Data) is TTreeData) and not TTreeData(ObjView.Selected.Data).PrClass {and (TTreeData(ObjView.Selected.Data).FieldKind = 'Dim')} and (Items.IndexOfObject(TTreeData(ObjView.Selected.Data)) = - 1);
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
            AddBtn.Enabled := (ufsMayChangeOrder in Self.Style) and (ObjView.Selected <> nil) and (TObject(ObjView.Selected.Data) is TTreeData) and not TTreeData(ObjView.Selected.Data).PrClass {and (TTreeData(ObjView.Selected.Data).FieldKind = 'Dim')} and (Items.IndexOfObject(TTreeData(ObjView.Selected.Data)) = - 1);
            DelBtn.Enabled := Items.Count > 0;
            UpBtn.Enabled := ItemIndex > 0;
            DownBtn.Enabled := ItemIndex < Items.Count - 1;
          end;
      end;
end;

procedure TUniverseFilter.SetImgLst(Value: TImageList);
begin
  fImgLst := Value;
  TBar.Images := GetImageList;
  ObjView.Images := GetImageList;
end;

constructor TUniverseFilter.Create(AOwner: TComponent);
var ABitmap: TBitmap;
    i: Integer;
begin
  inherited Create(AOwner);
  fParentFilter := NoParent;
  
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

  GroupNode := False;
  WorkDs := TEtranDataSet.Create(Self);
  WorkAct := TSetSQLAct.Create(Self);
end;

procedure TUniverseFilter.FilterResize(Sender: TObject);
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

procedure TUniverseFilter.ObjViewChange(Sender: TObject; Node: TTreeNode);
begin
  SetEnabledButtons;
end;

procedure TUniverseFilter.SetConnection(Value: TEtranConnection);
begin
  fConnection := Value;
  WorkDS.Connection := Value;
  WorkAct.Connection := Value;
end;

procedure TUniverseFilter.ObjViewDblClick(Sender: TObject);
var P: TPoint;
    Node: TTreeNode;
begin
  P := Mouse.CursorPos;
  P := ObjView.ScreenToClient(P);
  Node := ObjView.GetNodeAt(P.X, P.Y); // Проверяем, на выделеной ли ноде сделан двойной клик
  if (Node = ObjView.Selected) and (AddBtn.Enabled) then
    AddBtn.Click;
end;

procedure TUniverseFilter.ObjViewGetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  with Node do
  begin
    if TTreeData(Node.Data).PrClass then
    begin
      if Expanded then
        ImageIndex := 0
      else
        ImageIndex := 1;
    end
    else
      if TTreeData(Node.Data).Sel then
        ImageIndex := 8
      else
        ImageIndex := 2;
  end
end;

procedure TUniverseFilter.ObjViewGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TUniverseFilter.SetRefreshFilter(Value: Boolean);
begin
  fRefreshFilter := Value;
  SetEnabledButtons;
end;

procedure TUniverseFilter.ParamChange(Sender: TObject);
var E : Extended;
begin
  if Sender = ParEdit1 then
  begin
    if Sender is TDateEdit then
    begin
      if (ParEditTime1.Checked) then // Учитывать время?
        FTaskMaster.FilterData[CurrFilter].Par1 := FloatToStr(TDateEdit(ParEdit1).Date + Frac(ParEditTime1.Time))
      else
        FTaskMaster.FilterData[CurrFilter].Par1 := FloatToStr(TDateEdit(ParEdit1).Date); // Только дата
    end
    else
      FTaskMaster.FilterData[CurrFilter].Par1 := TEdit(Sender).Text; // Изменен текст условия
  end
  else
  if Sender = ParEdit2 then
  begin
    if Sender is TDateEdit then
    begin
      if (ParEditTime2.Checked) then
        FTaskMaster.FilterData[CurrFilter].Par2 := FloatToStr(TDateEdit(ParEdit2).Date + Frac(ParEditTime2.Time))
      else
        FTaskMaster.FilterData[CurrFilter].Par2 := FloatToStr(TDateEdit(ParEdit2).Date);
    end
    else
      FTaskMaster.FilterData[CurrFilter].Par2 := TEdit(Sender).Text;
  end;
  
  if (Sender = ParEditTime1) then
  begin
    if (ParEditTime1.Checked) then
      FTaskMaster.FilterData[CurrFilter].Par1 := FloatToStr(TDateEdit(ParEdit1).Date + Frac(ParEditTime1.Time))
    else
      FTaskMaster.FilterData[CurrFilter].Par1 := FloatToStr(TDateEdit(ParEdit1).Date);
  end;

  if (Sender = ParEditTime2) then
  begin
    if (ParEditTime2.Checked) then
      FTaskMaster.FilterData[CurrFilter].Par2 := FloatToStr(TDateEdit(ParEdit2).Date + Frac(ParEditTime2.Time))
    else
      FTaskMaster.FilterData[CurrFilter].Par2 := FloatToStr(TDateEdit(ParEdit2).Date);
  end;

  FilterToText(FTaskMaster.FilterData[CurrFilter]); // Пересчет текста условия
  CondGrid.Invalidate;
  RefreshFilter := True
end;

procedure TUniverseFilter.CondGridClick(Sender: TObject);
begin
  BeginUpdateControl(CondControl);
  try
    if (FTaskMaster.FilterDataCount > 0) and (CurrFilter <> CondGrid.Row) then CurrFilter := CondGrid.Row;
  finally
    EndUpdateControl(CondControl);
  end;
end;

procedure TUniverseFilter.CondGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  S: String;
  Y: Integer;
begin
  if (FTaskMaster.FilterDataCount = 0) or (FTaskMaster.FilterDataCount < ARow) then Exit;
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

procedure TUniverseFilter.GetNewFilterParams(AFilterData: TFilterData; var P1, P2: String; SQLParam: Boolean);
var
  ToDate: Boolean;
  E : Extended;
begin
  P1 := '';
  P2 := '';
  with AFilterData do
  begin
    ToDate := (OperCode < ArrMax - 1) and (FTreeData.DType = 2);
    if Par1 <> '' then
    begin
      if ToDate then
        P1 := UFFormatDateTimeEx(UFStrToFloatDef(Par1))
      else
        P1 := Par1;
    end;
    if (Par2 <> '') and (OperCode in [9, 12]) then
    begin
      if ToDate then
        P2 := UFFormatDateTimeEx(UFStrToFloatDef(Par2))
      else
        P2 := Par2;
    end;
  end;
end;

procedure TUniverseFilter.TypeCondBoxChange(Sender: TObject);
var
  I: Integer;
begin
  // Изменен вид условия
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

procedure TUniverseFilter.AddBtnClick(Sender: TObject);
var
  D: TFilterData;
begin
  // Нажата кнопка "Добавить"
  if csDesigning in ComponentState then Exit;
  if (TTreeData(ObjView.Selected.Data).ObjType = 2) and
     (CondControl.ActivePage <> FilterSheet) then
    Exit;
  // В зависимости от выбранной закладки добавляем поле
  if CondControl.ActivePage = FieldsSheet then
  begin
    with FieldsListBox do
    begin
      if Items.IndexOfObject(TTreeData(ObjView.Selected.Data)) = - 1 then
      begin
        FieldsListBoxAddItem(TTreeData(ObjView.Selected.Data));
        TTreeData(ObjView.Selected.Data).Sel := true;
      end;
     end;
  end
  else
    if CondControl.ActivePage = FilterSheet then
    begin
      D := TFilterData.Create(FTaskMaster);
      with D do
      begin
        FTreeData := ObjView.Selected.Data;
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
          if Items.IndexOfObject(TTreeData(ObjView.Selected.Data)) = - 1 then
          begin
            GrListBoxAddItem(TTreeData(ObjView.Selected.Data));
          end;
      end
      else
        if CondControl.ActivePage = OrderSheet then
        begin
          with OrderListBox do
            if Items.IndexOfObject(TTreeData(ObjView.Selected.Data)) = - 1 then
            begin
              OrderListBoxAddItem(TTreeData(ObjView.Selected.Data));
            end;
        end;
  RefreshFilter := True;
  ObjView.Refresh;  
  SetEnabledButtons;
end;

procedure TUniverseFilter.DelBtnClick(Sender: TObject);
var
  I: Integer;
begin
  // Нажата кнопка "Удалить"
  if csDesigning in ComponentState then Exit;
  // В зависимости от выбранной закладки удаляем поле
  if CondControl.ActivePage = FieldsSheet then
  begin
    with FieldsListBox do
    begin
      I := ItemIndex;
      if I > 0 then Dec(I);
      TTreeData(Items.Objects[ItemIndex]).Sel := false;
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

procedure TUniverseFilter.UpBtnClick(Sender: TObject);
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

procedure TUniverseFilter.DownBtnClick(Sender: TObject);
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

procedure TUniverseFilter.NewBtnClick(Sender: TObject);
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
  for I := 0 to FTaskMaster.TreeDataCount - 1 do
    FTaskMaster.TreeData[I].Sel := False;
  ObjView.Refresh;
  NewFilrer;
end;

procedure TUniverseFilter.NewChildBtnClick(Sender: TObject);
begin
  if csDesigning in ComponentState then Exit;
  fParentFilter := SelectedFilter;
  NewFilrer;
end;

procedure TUniverseFilter.NewFilrer;
begin
  FilterName := 'Новый фильтр';
  fSelectedFilter := -1;
  fRefreshFilter := False;
end;

procedure TUniverseFilter.RefreshBtnClick(Sender: TObject);
begin
  if csDesigning in ComponentState then Exit;
  RefresheSelectedFilter;
  RefreshFilter := False;
end;

procedure TUniverseFilter.SaveBtnClick(Sender: TObject);
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

procedure TUniverseFilter.SaveFilter(AName: String);
var
  Sa : TSQLAct;
  FieldsStr, GroupStr, WhereStr, OrderStr: String;
//  NR: boolean;
  Node: TTreeNode;
  IDList: TList;
begin
  try
    // Фориреум строки для сохранения условий фильтра
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
          with CreateParam(ftInteger, 'UNID', ptInput) do AsInteger := UniverseID;
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

       // Формируем список ID фильтров, которые надо открыть в дереве
        fSelectedFilter := Sa.Params.ParamByName('FID').AsInteger;
        IDList := TList.Create;
        IDList.Add(Pointer(fSelectedFilter));

        Node := TTreeView(MainNode.TreeView).Selected;
        if Node <> nil then
        begin
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
  end;
end;

procedure TUniverseFilter.CondControlChange(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TUniverseFilter.SetParent(AParent: TWinControl);
begin
  inherited;
  if (AParent = nil) or (FChildCreated) then Exit;
  CreateChildControls;
  SetEnabledButtons;
end;

procedure TUniverseFilter.FreeNode(Sender: TObject; Node: TTreeNode);
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

procedure TUniverseFilter.DeleteBtnClick(Sender: TObject);
var
  Sa: TSQLAct;
begin
  if csDesigning in ComponentState then Exit;
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
  end
end;

destructor TUniverseFilter.Destroy;
begin
  ParControlsFree;

  FTaskMaster.Free;
  Splitter.Free;
  MSplitter.Free;
  inherited;
end;

procedure TUniverseFilter.SafeFreeAndNil(var Obj);
begin
  try
    FreeAndNil(Obj);
  except
  end;
end;

procedure TUniverseFilter.CreateDataSetByID(ANode: TTreeNode; DataSet: TEtranDataSet);
var
  tmpWorkList: TStringList;
  tmpFilterList: TList;
  i, j, Num    : Integer;
  D       : TFilterData;
  S  : String;
  tmpSelFields  : String;
  tmpCondFilter: String;
  tmpGroupFields  : String;
  tmpOrderFields  : String;
  N: TTreeNode;
  Value: Integer;
begin
  if ANode = nil then
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
          CreateParam(ftInteger, 'UNID', ptInput).AsInteger := UniverseID;
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
            for j := 0 to FTaskMaster.TreeDataCount - 1 do
              if not FTaskMaster.TreeData[j].PrClass and (FTaskMaster.TreeData[j].ID = Num) then
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
          CreateParam(ftInteger,'UNID',ptInput).AsInteger := UniverseID;
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
  DataSet.EnableControls;
end;

function TUniverseFilter.NewFilterToSQL(FilterData: TFilterData): String;
var
  S1, S2: String;
  ToDate: Boolean;
begin
  if FilterData.FTreeData.ObjType = 1 then
  begin
  with FilterData do
  begin
    ToDate := (OperCode < ArrMax - 1) and (FilterData.FTreeData.DType = 2);
    if Par1 <> '' then
    begin
      if ToDate then S1 := UFFormatDateTimeEx(UFStrToFloatDef(Par1))
      else S1 := Par1
    end;
    if Par2 <> '' then
    begin
      if ToDate then S2 := UFFormatDateTimeEx(UFStrToFloatDef(Par2))
      else S2 := Par2
    end;

    Result := IntToStr(FilterData.FTreeData.ID) + SQLArray[OperCode];
    if FilterData.FTreeData.DType > 0 then
    begin
      if (OperCode = ArrMax - 1) or (OperCode = ArrMax) then
      begin
        Result := IntToStr(FilterData.FTreeData.ID) + MakeSQLValList(FilterData);
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
    Result := '(c' + IntToStr(FilterData.FTreeData.ID) + ')';
end;

function TUniverseFilter.MakeSQLValList(FilterData: TFilterData): String;
var
  S, S1, Rez: String;
  I, N        : Integer;
begin
  Result := '';
  if FilterData.OperCode < ArrMax - 1 then Exit;
  with FilterData do
  begin
    S1 := Par1;
    Result := SQLArray[OperCode];

    if FilterData.FTreeData.DType > 0 then
    begin
      if OperCode in [ArrMax - 1, ArrMax] then
      begin
        N := WordCount(S1, [';']);
        for I := 1 to N do
        begin
          S := ExtractWord(I, S1, [';']);
          if FilterData.FTreeData.DType = 2 then
            S := UFFormatDateTimeEx(StrToDateFmt(DateMask, S));


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

function TUniverseFilter.MakeCondByWhereStr(AWhereStr: String): String;
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
      for j := 0 to FTaskMaster.TreeDataCount - 1 do
        if (not FTaskMaster.TreeData[j].PrClass) and  // Объект (Не класс)
           (FTaskMaster.TreeData[j].ID = Num) and  // ID
           (((cnt > 1) and (FTaskMaster.TreeData[j].ObjType = 1)) or // Объект
           ((cnt = 1) and (FTaskMaster.TreeData[j].ObjType = 2))) then  // Предопределенный фильтр
        begin
          D.FTreeData := FTaskMaster.TreeData[j];
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

procedure TUniverseFilter.SetUniverseID(Value: Integer);
var
  D : TTreeData;
  ClID: Integer;
begin
  // Читает список объектов для юниверса
  if fUniverseID = Value then Exit;
  fUniverseID := Value;
  FTaskMaster.ClearTreeDataList;   // Чистим список фильтров
  try
    with WorkDS do
    begin
      if Active then Close;
      NameSQL := 'Get_Class_List';
      Params.Clear;
      Params.CreateParam(ftInteger, 'UNID', ptInput).AsInteger := fUniverseID;
      Params.CreateParam(ftString, 'UNTYPE', ptInput).AsString := FUniType; 
      try
        Open;
      except
        on E: Exception do begin
          raise Exception.Create('Не могу получить список классов  ' + E.Message);
        end;
      end;
      First;
      ClID := - 1;
      while not EOF do
      begin
        if ClID <> FieldByName('CLASS_ID').AsInteger then
        begin
          D := TTreeData.Create(FTaskMaster);
          with D do
          begin
            ID := FieldByName('CLASS_ID').AsInteger;
            PID := FieldByName('CLS_BASECLASSID').AsInteger;
            ObjName := FieldByName('CLS_NAME').AsString;
            ObjHidden := FieldByName('OBJ_HIDDEN').AsString = 'Y';
            DetParent := FieldByName('DETPARENT').AsInteger;
            ObjID := FieldByName('OBJECT_ID').AsInteger;
            PrClass := True;
          end;
          ClID := D.ID
        end;
        if FieldByName('OBJ_HIDDEN').AsString = 'N' then
        begin
          D := TTreeData.Create(FTaskMaster);
          with D do
          begin
            ObjType := FieldByName('ObjectType').AsInteger;
            ID := FieldByName('OBJECT_ID').AsInteger;
            PID := FieldByName('CLASS_ID').AsInteger;
            ObjName := FieldByName('OBJ_NAME').AsString;
            ObjHidden := FieldByName('OBJ_HIDDEN').AsString = 'Y';
            DetParent := FieldByName('DETPARENT').AsInteger;
            ObjID := FieldByName('OBJECT_ID').AsInteger;
            Large := Odd(FieldByName('Large').AsInteger);
            if FieldByName('FIELDDATATYPE').AsString = 'Num' then
              DType := 0
            else
              if FieldByName('FIELDDATATYPE').AsString = 'Char' then
                DType := 1
              else
                DType := 2;
            FieldKind := FieldByName('FIELDKIND').AsString;
          end;
        end;
        Next;
      end;
      Close;
    end;
  finally
    GetNodeTDListCover(nil);  // Заполняем дерево объектов
  end;
end;

procedure TUniverseFilter.GetNodeTDListCover(Node: TTreeNode);
begin
  // Обертка для заполнения дерева
  // Отключает отрисовку
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

procedure TUniverseFilter.GetNodeTDList(Node: TTreeNode);
var
  i: Integer;
  TreeData  : TTreeData;
  N: TTreeNode;
  ACLID, AObjID, ADetParent: Integer;
  APrClass: Boolean;
  Cnt: Integer;
begin
  { Заполнение дерева объектов. Вариант с рекурсией  }
  try
    if Node = nil then
    begin
      ACLID := 0;
      AObjID := 0;
      ADetParent := -1;
      APrClass := true;
    end
    else
    begin
      ACLID := TTreeData(Node.Data).ID;
      AObjID := TTreeData(Node.Data).ObjID;
      ADetParent := TTreeData(Node.Data).DetParent;
      APrClass := TTreeData(Node.Data).PrClass;
      Node.DeleteChildren;
    end;
    if (Node = nil) or (TTreeData(Node.Data).PrClass) or (TTreeData(Node.Data).DetParent = 0)then
    begin
      Cnt := FTaskMaster.TreeDataCount;
      for i := 0 to Cnt - 1 do
      begin
        TreeData := FTaskMaster.TreeData[i];
        if ((TreeData.PID = ACLID) and (APrClass) and (TreeData.DetParent = 0)) or
           ((TreeData.DetParent = AObjID) and (ADetParent = 0) and (not APrClass))  then
        begin
          N := ObjView.Items.AddChildObject(Node, TreeData.ObjName, TreeData);
          GetNodeTDList(N);
        end;
      end;
    end;
  finally
    if Node <> nil then
      TTreeData(Node.Data).HasDetail := Node.HasChildren;
  end;  
end;

procedure TUniverseFilter.SetMainNode(const Value: TTreeNode);
var
  D: TMainData;
begin
  FMainNode := Value;
  D := TMainData.Create(FTaskMaster);
  Value.Data := D;
  TTreeView(FMainNode.TreeView).OnDeletion := FreeNode;
  NewFillTree;
end;

function TUniverseFilter.GetMainNode: TTreeNode;
begin
  Result := FMainNode;
end;

procedure TUniverseFilter.NewFillTree(IDList: Tlist);
var
  N, Node: TTreeNode;
  M: TMainData;
  I, J, Num: Integer;
  WorkList: TStringList;
begin
  if MainNode = nil then Exit;
  TTreeView(MainNode.TreeView).Items.BeginUpdate;
  try
    // Чистим список фильтров
    TTreeView(MainNode.TreeView).OnDeletion := FreeNode;
    MainNode.DeleteChildren;
    for i := FTaskMaster.MainDataCount - 1 downto 0 do
      if FTaskMaster.MainData[i] <> MainNode.Data then
        FTaskMaster.MainData[i].Free;
    // **********************
    MainNode.HasChildren := true;
    WorkList := TStringList.Create;
    with WorkDS do
    begin
      if Active then Close;
      NameSQL := 'Get_User_Filter_List';
      Params.Clear;
      Params.CreateParam(ftInteger,'UNID',ptInput).Value := UniverseID;
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

    // проверяем имеет ли фильтр дочерние фильтры
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

    // Заполняем дерево фильтров
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

    // Раскрываем нужные узлы
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
  if Assigned(fOnFillTree) then fOnFillTree(Self);
end;

function TUniverseFilter.ExpandNode(ANode: TTreeNode): Boolean;
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
  if (ANode.Data = nil) or not(TObject(ANode.Data) is TMainData) or (TMainData(ANode.Data).ID = - 1) or TMainData(ANode.Data).PrField or (ANode.Count > 0) {!!!} then
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
        // Добавляем в узел дочерние фильтры
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
        // Вычитываем группировки (если есть)
        if TMainData(ANode.Data).GrStr <> '' then
        begin
          NameSQL := 'Get_Query';
          Params.Clear;
          with Params do
          begin
            CreateParam(ftInteger,'UNID',ptInput).AsInteger := UniverseID;
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
            // Добавляем группировки в дерево
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

                // проверяем, создан ли уже такой узем
                with TTreeView(MainNode.TreeView) do
                  for K := 0 to Items.Count - 1 do
                  if (Items[K].Parent = N) and (Items[K].Text = S) then
                    begin
                      Node := Items[K];
                      Break;
                    end;
                // если узла нет, то добавляем    
                if Node = nil then
                begin
                  M := TMainData.Create(FTaskMaster);
                  Node := TTreeView(MainNode.TreeView).Items.AddChildObject(N, S, M);
                  for K := 0 to FTaskMaster.TreeDataCount - 1 do
                    with FTaskMaster.TreeData[K] do
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
  end;
end;

procedure TUniverseFilter.CollapseNode(ANode: TTreeNode);
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

procedure TUniverseFilter.SetStyle(const Value: TUniverseFilterStyles);
begin
  FStyle := Value;
  CheckUniverseFilterStyles;
end;

procedure TUniverseFilter.MainViewChange(Sender: TObject; Node: TTreeNode);
begin
  ChangeNode(Node);
end;

procedure TUniverseFilter.MainViewCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  FMainTreeView.OnCollapsing := nil;
  CollapseNode(Node);
  FMainTreeView.OnCollapsing := MainViewCollapsing;
end;

procedure TUniverseFilter.MainViewDblClick(Sender: TObject);
begin

end;

procedure TUniverseFilter.MainViewExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  FMainTreeView.OnExpanding := nil;
  ExpandNode(Node);
  FMainTreeView.OnExpanding := MainViewExpanding;
end;

procedure TUniverseFilter.MainViewSetNodeImageIndex(Node: TTreeNode);
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

procedure TUniverseFilter.MainViewGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
//  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TUniverseFilter.CreateChildControls;
var i: Integer;
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

  ObjView := TTreeView.Create(Self);
  with ObjView do
  begin
    DragMode := dmAutomatic;
    HideSelection := false;
    Constraints.MinWidth := 150;
    Parent := Self;
    Left := Splitter.Left + Splitter.Width + 1;
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

procedure TUniverseFilter.SetMainNodeName(const Value: String);
begin
  FMainNodeName := Value;
  if FMainNode <> nil then
    FMainNode.Text := FMainNodeName;
end;

procedure TUniverseFilter.SetaptionOrderSheet(const Value: String);
begin
  FCaptionOrderSheet := Value;
  if Assigned(OrderSheet) then OrderSheet.Caption := Value;
end;

procedure TUniverseFilter.SetCaptionFieldSheet(const Value: String);
begin
  FCaptionFieldSheet := Value;
  if Assigned(FieldsSheet) then FieldsSheet.Caption := Value;
end;

procedure TUniverseFilter.SetCaptionFilterSheet(const Value: String);
begin
  FCaptionFilterSheet := Value;
  if Assigned(FilterSheet) then FilterSheet.Caption := Value;
end;

procedure TUniverseFilter.SetCaptionGroupSheet(const Value: String);
begin
  FCaptionGroupSheet := Value;
  if Assigned(GroupSheet) then GroupSheet.Caption := Value;
end;

procedure TUniverseFilter.Initialize;
begin
  FMainTreeView.Items.Clear;
  FMainNode := FMainTreeView.Items.AddChild(nil, FMainNodeName);
  MainViewSetNodeImageIndex(FMainNode);
  MainNode := MainNode;
end;

procedure TUniverseFilter.ChangeNode(Node: TTreeNode);
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

procedure TUniverseFilter.SetSelectedFilter(const Value: Integer);
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

procedure TUniverseFilter.RefresheSelectedFilter;
var
  WorkList: TStringList;
  ASELSTR, AWHERESTR, AGROUPSTR, AORDERSTR: String;
  I, J, Num    : Integer;
begin
  try
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
    end;

    WorkList := TStringList.Create;
    for I := 0 to FTaskMaster.TreeDataCount - 1 do FTaskMaster.TreeData[I].Sel := False;
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
        CreateParam(ftInteger, 'UNID', ptInput).AsInteger := UniverseID;
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
          for J := 0 to FTaskMaster.TreeDataCount - 1 do
            if (not FTaskMaster.TreeData[J].PrClass) and (FTaskMaster.TreeData[J].ID = Num) then
            begin
              FTaskMaster.TreeData[J].Sel := True;  //!!!
              FieldsListBoxAddItem(FTaskMaster.TreeData[J]);
            end;
        end;
      end;
      SetFilterString(AWHERESTR);
     
      if AGROUPSTR <> '' then
      begin
        WorkList.Text := ReplaceStr(Copy(AGROUPSTR, 2, Length(AGROUPSTR) - 2), ',', #13#10);
        for I := 0 to WorkList.Count - 1 do
          for J := 0 to FTaskMaster.TreeDataCount - 1 do
            if not FTaskMaster.TreeData[J].PrClass and (IntToStr(FTaskMaster.TreeData[J].ID) = WorkList[I]) then
            begin
              GrListBoxAddItem(FTaskMaster.TreeData[J]);
            end;
      end;
      if AORDERSTR <> '' then
      begin
        WorkList.Text := ReplaceStr(Copy(AORDERSTR, 2, Length(AORDERSTR) - 2), ',', #13#10);
        for I := 0 to WorkList.Count - 1 do
          for J := 0 to FTaskMaster.TreeDataCount - 1 do
            if not FTaskMaster.TreeData[J].PrClass and (IntToStr(FTaskMaster.TreeData[J].ID) = WorkList[I]) then
            begin
              OrderListBoxAddItem(FTaskMaster.TreeData[J]);
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
  RefreshFilter := False;
end;

procedure TUniverseFilter.SetNewCurrFilter(const Value: Integer);
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
      if FTaskMaster.FilterData[Value].FTreeData.ObjType = 1 then
      begin
        with TypeCondBox do
        begin
          for I := 0 to ArrMax do
            if TypeArray[I, FTaskMaster.FilterData[Value].FTreeData.DType] = 1 then
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
      end;
    end;
  except
  end;

  for I := 0 to CondBox.ControlCount - 1 do
    if Value > -1 then
      CondBox.Controls[I].Enabled := FTaskMaster.FilterData[Value].FTreeData.ObjType = 1
    else
      CondBox.Controls[I].Enabled := false;
end;

procedure TUniverseFilter.SetFilterName(const Value: String);
begin
  FFilterName := Value;
end;

procedure TUniverseFilter.NewSetParamEditors(Cond: Integer);
var D: TFilterData;
begin
  // В зависимости от типа данных и вида условия создается нужный контрол
  ParControlsFree;
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
    if ((Cond in [2, 3]) and (D.FTreeData.DType <> 2) and (D.FTreeData.HasDetail)) {or (Cond = ArrMax)} then
    begin
      qs := CreateQS(D.FTreeData);
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
        ValListCreate(D);  // Список
      end
      else
      begin
        case D.FTreeData.DType of
          0: TRxCalcEdit(ParEdit1) := TRxCalcEdit.Create(Self);
          1:   // QuickSearch
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
          2:
          begin
            TDateEdit(ParEdit1) := TDateEdit.Create(Self);
            ParEditTime1 := TDateTimePicker.Create(Self);
          end;
        end;
        with ParEdit1 do
        begin
          Left := 7;
          Top := 105;
          Font.Size := 8;
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
                if D.Par1 <> '' then Date := UFStrToFloatDef(D.Par1);
              end
            else
              with TEtranQuickSearch(ParEdit1) do
              begin
                GlyphKind := gkEllipsis;
                Text := D.Par1;
              end;
            OnChange := ParamChange;
        end;
        if ParEditTime1 <> nil then
        begin
          with ParEditTime1 do
          begin
            OnChange := ParamChange;
            Parent := CondBox;
            Kind := dtkTime;
            ShowCheckbox := true;
            Checked := false;
            Left := ParEdit1.Width + 27;
            Top := 105;
            Font.Size := 8;
            if Frac(UFStrToFloatDef(D.Par1)) <> 0 then
            begin
              Time := Frac(UFStrToFloatDef(D.Par1));
              Checked := true; 
            end
            else
              Checked := false;
          end;
        end;
      ParLabel1.Width := ParEdit1.Width;
    end;
  end;
  if ParLabel2.Caption <> '' then
  begin
    if (Cond = ArrMax - 1) or (Cond = ArrMax) then
      TComboEdit(ParEdit2) := TComboEdit.Create(CondBox)
    else
      case D.FTreeData.DType of
        0: TRxCalcEdit(ParEdit2) := TRxCalcEdit.Create(CondBox);
        1: 
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
        2:
        begin
          TDateEdit(ParEdit2) := TDateEdit.Create(CondBox);
          ParEditTime2 := TDateTimePicker.Create(Self);
        end;
      end;
    with ParEdit2 do
    begin
      Left := ParEdit1.Width + 27;
      Top := 105;
      Font.Size := 8;
      Parent := CondBox;
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
            if D.Par2 <> '' then
              Date := UFStrToFloatDef(D.Par2)
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
    if ParEditTime2 <> nil then
    begin
      with ParEditTime2 do
      begin
        OnChange := ParamChange;
        Parent := CondBox;
        Kind := dtkTime;
        ShowCheckbox := true;
        Checked := false;
        Top := 105;
        Font.Size := 8;
        if Frac(UFStrToFloatDef(D.Par2)) <> 0 then
        begin
          Time := Frac(UFStrToFloatDef(D.Par2));
          Checked := true;
        end
        else
          Checked := false;
      end;
    end;
    with ParLabel2 do
    begin
      Left := ParEdit2.Left;
      Width := ParEdit2.Width;
    end
  end;
  if ParEditTime1 <> nil then
    ParEditTime1.TabOrder := 2;
  if ParEdit2 <> nil then
  begin
    if ParEditTime1 = nil then
      ParEdit2.TabOrder := 2
    else
      ParEdit2.TabOrder := 3;
  end;  
  if ParEditTime2 <> nil then
    ParEditTime2.TabOrder := 4;
end;

procedure TUniverseFilter.ObjViewExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  if (Node.HasChildren) and (Node.Count = 0) and (TObject(Node.Data) is TTreeData) then
  begin
    GetNodeTDList(Node);
  end;
end;

procedure TUniverseFilter.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('MainTreeWidth', ReadMainTreeWidth, WriteMainTreeWidth, true);
  Filer.DefineProperty('ObjTreeWidth', ReadObjTreeWidth, WriteObjTreeWidth, true);
end;

procedure TUniverseFilter.ReadMainTreeWidth(Reader: TReader);
var PropVal: Integer;
begin
  PropVal := Reader.ReadInteger;
  if Assigned(FMainTreeView) then
    FMainTreeView.Width := PropVal;
end;

procedure TUniverseFilter.ReadObjTreeWidth(Reader: TReader);
var PropVal: Integer;
begin
  PropVal := Reader.ReadInteger;
  if Assigned(ObjView) then
    ObjView.Width := PropVal;
end;

procedure TUniverseFilter.WriteMainTreeWidth(Writer: TWriter);
begin
  if Assigned(FMainTreeView) then
    Writer.WriteInteger(FMainTreeView.Width);
end;

procedure TUniverseFilter.WriteObjTreeWidth(Writer: TWriter);
begin
  if Assigned(ObjView) then
    Writer.WriteInteger(ObjView.Width);
end;

function TUniverseFilter.CreateDataSet(DataSet: TEtranDataSet): Boolean;
var
//  I: Integer;
  J: Integer;
  FieldsStr, GroupStr, CondStr, OrderStr, S2 : String;
  N: TTreeNode;
begin
  if SelectedNode = nil then
    raise Exception.Create('Фильтр не выбран.' + #10 +
                           'Если вы создали новый фильтр, то его надо предварительно сохранить.');
  Result := False;
  FieldsStr := MakeFieldsStr;
  if FieldsStr = '' then
    raise Exception.Create('Не выбрано ни одно поле для запроса!!!');

  // Формируются условия
  if FTaskMaster.FilterDataCount > 0 then
  begin
    CondStr := '';
    S2 := ',';
    for j := 0 to FTaskMaster.FilterDataCount - 1 do
    begin
      if CondStr <> '' then CondStr := CondStr + '|';
      CondStr := CondStr + NewFilterToSQL(FTaskMaster.FilterData[J]);
      S2 := S2 + IntToStr(FTaskMaster.FilterData[J].FTreeData.ID) + ',';
    end;
  end;

  // Для группировок добавляем условия
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

  // Для дочерних фильтров, добавляем условия родителей
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
        CreateParam(ftInteger,'UNID',ptInput).AsInteger := UniverseID;
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
  Result := True
end;

procedure TUniverseFilter.FieldsListBoxAddItem(ATreeData: TTreeData);
begin
  with FieldsListBox do
  begin
    Items.AddObject(ATreeData.ObjName, ATreeData);
    ItemIndex := Items.Count - 1;
    CondControl.Refresh;
  end
end;

procedure TUniverseFilter.GrListBoxAddItem(ATreeData: TTreeData);
begin
  with GrListBox do
  begin
    Items.AddObject(ATreeData.ObjName, ATreeData);
    ItemIndex := Items.Count - 1;
  end
end;

procedure TUniverseFilter.OrderListBoxAddItem(ATreeData: TTreeData);
begin
  with OrderListBox do
  begin
    Items.AddObject(ATreeData.ObjName, ATreeData);
    ItemIndex := Items.Count - 1;
  end
end;


function TUniverseFilter.MakeFieldsStr: String;
var i: Integer;
begin
  with FieldsListBox do
    for i := 0 to Items.Count - 1 do
    begin
      if Result = '' then Result := ',';
      Result := Result + IntToStr(TTreeData(FieldsListBox.Items.Objects[i]).ID) + ','
    end;
end;

function TUniverseFilter.MakeGroupStr: String;
var i: Integer;
begin
  with GrListBox do
    for i := 0 to Items.Count - 1 do
    begin
      if Result = '' then Result := ',';
      Result := Result + IntToStr(TTreeData(Items.Objects[i]).ID) + ','
    end;
end;

function TUniverseFilter.MakeOrderStr: String;
var i: Integer;
begin
  with OrderListBox do
    for i := 0 to Items.Count - 1 do
    begin
      if Result = '' then Result := ',';
      Result := Result + IntToStr(TTreeData(Items.Objects[i]).ID) + ','
    end;
end;

procedure TUniverseFilter.ListBoxClick(Sender: TObject);
begin
  SetEnabledButtons;
end;

procedure TUniverseFilter.ListBoxDblClick(Sender: TObject);
begin
  if DelBtn.Enabled then DelBtn.Click;
end;

function TUniverseFilter.MakeWhereStr: String;
var
  S,  St: String;
  I: Integer;
begin
  Result := '';
  with FTaskMaster do
    for I := 0 to FilterDataCount - 1 do
    begin
      with FTaskMaster.FilterData[i] do
        if FTreeData.ObjType = 1 then
        begin
          if (OperCode = - 1) or ((Par1Capt[OperCode] <> '') and (Par1 = '')) or ((Par2Capt[OperCode] <> '') and (Par2 = '')) then
          begin
            CurrFilter := I;
            raise Exception.Create('Фильтр не заполнен ');
          end;
          St := IntToStr(FTreeData.ID ) + ',' + IntToStr(OperCode);
          if Par1Capt[OperCode] <> '' then
          begin
            if FTreeData.DType = 2 then
              S := ReplaceStr(Par1, ',', '.')
            else
              S := Par1;
              St := St + ',' + S;
          end;
          if Par2Capt[OperCode] <> '' then
          begin
            if FTreeData.DType = 2 then
              S := ReplaceStr(Par2, ',', '.')
            else
              S := Par2;
              St := St + ',' + S;
          end;
        end
        else
          St := IntToStr(FTreeData.ID);
      if Result <> '' then Result := Result + '|';
      Result := Result + St;
    end;
end;

function TUniverseFilter.FilterToStringDoc(FilterData: TFilterData): String;
var S1, S2, S: String;
    i: Integer;
    SL: TStringList;
begin
  GetNewFilterParams(FilterData, S1, S2, False);
  with FilterData do
  begin
    Result := FTreeData.ObjName;
    if FTreeData.ObjType = 2 then
      Exit;
    if OperCode <> - 1 then
    begin
    case FTreeData.DType of
      0: Result := Result + ' ' + CondArrayNum[OperCode];
      1: Result := Result + ' ' + CondArrayStr[OperCode];
      2: Result := Result + ' ' + CondArrayDate[OperCode];
    end;
      if (S1 <> '') and (OperCode in [2..3, ArrMax - 1, ArrMax]) and
         (FilterData.FTreeData.DType <> 2) and
         ((FTreeData.HasDetail) {or (OperCode = ArrMax)}) then
      begin
        SL := TStringList.Create;
        try
          SL.Text := ReplaceStr(S1, ';', #13 + #10);
          S := '';
          for i := 0 to SL.Count - 1 do
          begin
            if S = '' then
              S := FilterToStringDoc_GetVal(FTreeData.ID, StrToInt(SL[i]))
            else
              S := S + '; ' + FilterToStringDoc_GetVal(FTreeData.ID, StrToInt(SL[i]));
          end;
          Result := Result + ' ' + S;
        finally
          SL.Free;
        end;
      end
      else
      begin

//*************
    if (OperCode < ArrMax - 1) and (FTreeData.DType = 2) then
    begin
      if FilterData.Par1 <> '' then
        S1 := UFFormatDateTimeEx(UFStrToFloatDef(Par1));

      if (FilterData.Par2 <> '') and (FilterData.OperCode in [9, 12]) then
        S2 := UFFormatDateTimeEx(UFStrToFloatDef(Par2));
    end;
//*************

        if S1 <> '' then Result := Result + ' ' + S1;
        if S2 <> '' then Result := Result + ' и ' + S2;
      end;
    end;
  end;
end;

function TUniverseFilter.FilterToStringDoc_GetVal(SelField,
  ID: Integer): String;
begin
  with WorkDS do
  begin
    if Active then Close;
    NameSQL := 'Get_QSString';
    Params.Clear;
    UtilityGetParams(WorkDS);
    Params.ParamByName('UNID').AsInteger := UniverseID;
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
  end;
end;

procedure TUniverseFilter.FilterToText(FilterData: TFilterData);
begin
  FilterData.Text := FilterToStringDoc(FilterData);
end;

function TUniverseFilter.GetImageList: TImageList;
begin
  if fImgLst = nil then
    Result := fSelfImgLst
  else
    Result := fImgLst;
end;

procedure TUniverseFilter.ParControlsFree;
begin
  if qs <> nil then
  begin
    qs.Free;
    qs := nil;
  end;   
  if ParEdit1 <> nil Then
  begin
    FreeAndNil(ParEdit1);
  end;
  if ParEdit2 <> nil Then
  begin
    FreeAndNil(ParEdit2);
  end;
  if ParEditTime1 <> nil Then
  begin
    FreeAndNil(ParEditTime1);
  end;
  if ParEditTime2 <> nil Then
  begin
    FreeAndNil(ParEditTime2);
  end;             
  
  if ValList <> nil Then
  begin
    FreeAndNil(ValList);
  end;
end;

function TUniverseFilter.CreateQS(ATreeData: TTreeData): TEtranQuickSearch;
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
  qs.DialogCaption := ATreeData.ObjName;
  qs.OnSelect := QSSelect;
  qs.DirectInput := true;
  qs.Left := 7;
  qs.Top := 105;
  qs.Width := CondBox.Width - 14;
  qs.Font.Size := 8;
  qs.Anchors := [akLeft, akRight, akTop];
  qs.Parent := CondBox;
  qs.Params.Clear;
  if ATreeData.Large then
    qs.MinChars := 3;
  try
    qs.Params.BeginUpdate;
    with TQSParam(qs.Params.Add) do
    begin
      Name := 'UnID';
      ParamOptions := [];
      Value := UniverseID;
    end;
    with TQSParam(qs.Params.Add) do
    begin
      Name := 'SEL_FIELDS';
      ParamOptions := [];
      Value := ',' + IntToStr(ATreeData.ID) + ',';
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
      Value := '(((:p' + IntToStr(ATreeData.ID) + ' = :q' + IntToStr(ATreeData.ID) + ') and (:q' + IntToStr(ATreeData.ID) + ' IS NOT NULL)) or (:q' + IntToStr(ATreeData.ID) + ' IS NULL))';
    end;
    with TQSParam(qs.Params.Add) do
    begin
      Name := 'OTHERCONDCODE';
      ParamOptions := [];
      AsString := '(:p' + IntToStr(ATreeData.ID) +
              ' LIKE :q' + IntToStr(ATreeData.ID) + ' || ''%''' + ')';
    end;
    with TQSParam(qs.Params.Add) do
    begin
      Name := 'OTHERCONDNAME';
      ParamOptions := [];
      AsString := '(UPPER(:p' + IntToStr(ATreeData.ID) +
              ' ) LIKE ''%'' || UPPER(:q' + IntToStr(ATreeData.ID) + ') || ''%''' + ')';
    end;
    with TQSParam(qs.Params.Add) do
    begin
      Name := 'DIST';
      ParamOptions := [];
      Value := 1;
    end;
    with TQSParam(qs.Params.Add) do
    begin
      Name := 'q' + IntToStr(ATreeData.ID);
      Caption := ATreeData.ObjName;
      ParamOptions := [poKey, poResult];
    end;

    ChildrenCnt := 0;
    for i := 0 to FTaskMaster.TreeDataCount - 1 do
    begin
      if ((FTaskMaster.TreeData[i].DetParent = ATreeData.ObjID) and (ATreeData.DetParent = 0) and (not ATreeData.PrClass))  then
      begin
        Inc(ChildrenCnt);
        qs.Params.ParamByName('SEL_FIELDS').AsString :=
        qs.Params.ParamByName('SEL_FIELDS').AsString + IntToStr(FTaskMaster.TreeData[i].ID) + ',';

        with TQSParam(qs.Params.Add) do
        begin
          Name := 'q' + IntToStr(FTaskMaster.TreeData[i].ID);
          Caption := FTaskMaster.TreeData[i].ObjName;
          if ChildrenCnt = 1 then
          begin
            ParamOptions := [poTextFilter, poNumberFilter, poResult, poVisible];
            qs.Params.ParamByName('OTHERCONDCODE').AsString :=
              '(:p' + IntToStr(FTaskMaster.TreeData[i].ID) +
              ' LIKE :q' + IntToStr(FTaskMaster.TreeData[i].ID) + ' || ''%''' + ')';
          end
          else if ChildrenCnt = 2 then
          begin
            ParamOptions := [poTextFilter, poResult, poVisible];
            qs.Params.ParamByName('OTHERCONDNAME').AsString :=
              '(UPPER(:p' + IntToStr(FTaskMaster.TreeData[i].ID) +
              ' ) LIKE ''%'' || UPPER(:q' + IntToStr(FTaskMaster.TreeData[i].ID) + ') || ''%''' + ')';
          end
          else
            ParamOptions := [poResult, poVisible];
          Width := 64;
       end;
      end;
    end;

    if ChildrenCnt = 0 {qs.Params.Count = 7} then
    begin
      qs.Params[6].ParamOptions := [poKey, poResult, poTextFilter, poNumberFilter, poVisible];
      qs.Params[6].Width := 64;
    end;
  finally
    qs.Params.EndUpdate;
  end;
  Result := qs;
end;

procedure TUniverseFilter.QSSelect(Sender: TObject);
begin
  if FTaskMaster.FilterData[CurrFilter].Par1 <> VarToStr(qs.KeyValue) then
  begin
    FTaskMaster.FilterData[CurrFilter].Par1 := VarToStr(qs.KeyValue);
    FilterToText(FTaskMaster.FilterData[CurrFilter]);
    CondGrid.InvalidateCell(0, CurrFilter);
    RefreshFilter := True;
  end;
end;

function TUniverseFilter.GetSelCount: Integer;
var i: Integer;
begin
  Result := 0;
  for i := 0 to FTaskMaster.TreeDataCount - 1 do
    if FTaskMaster.TreeData[i].Sel then Inc(Result);
end;

function TUniverseFilter.CreateValQS(FilterData: TFilterData; AVisible: boolean = true): TEtranQuickSearch;
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
      DialogCaption := FilterData.FTreeData.ObjName;
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
        Value := UniverseID;
      end;
      with TQSParam(Params.Add) do
      begin
        Name := 'SEL_FIELDS';
        ParamOptions := [];
        Value := ',' + IntToStr(FilterData.FTreeData.ID) + ',';
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
        Value := '(((:p' + IntToStr(FilterData.FTreeData.ID) + ' = :q' + IntToStr(FilterData.FTreeData.ID) + ') and (:q' + IntToStr(FilterData.FTreeData.ID) + ' IS NOT NULL)) or (:q' + IntToStr(FilterData.FTreeData.ID) + ' IS NULL))';
        if (FilterData.OperCode = ArrMax - 1) and
           (FilterData.Par1 <> '') then
          AddText := ' AND (NOT :p' + IntToStr(FilterData.FTreeData.ID) + ' ' + MakeSQLValList(FilterData) + '))';
        if (FilterData.OperCode = ArrMax) and
           (FilterData.Par1 <> '') then
          AddText := ' AND (:p' + IntToStr(FilterData.FTreeData.ID) + ' ' + MakeSQLValList(FilterData) + '))';
        if (FilterData.OperCode >= ArrMax - 1) and
           (FilterData.Par1 <> '') and
           (AddText <> '') then
          Value := '(' + Value + AddText;
      end;
      with TQSParam(Params.Add) do
      begin
        Name := 'OTHERCONDCODE';
        ParamOptions := [];
        AsString := '(:p' + IntToStr(FilterData.FTreeData.ID) +
                ' LIKE :q' + IntToStr(FilterData.FTreeData.ID) + ' || ''%''' + ')';
        if (FilterData.OperCode >= ArrMax - 1) and
           (FilterData.Par1 <> '') and
           (AddText <> '') then
          Value := '(' + AsString + AddText;
      end;
      with TQSParam(Params.Add) do
      begin
        Name := 'OTHERCONDNAME';
        ParamOptions := [];
        AsString := '(UPPER(:p' + IntToStr(FilterData.FTreeData.ID) +
                ' ) LIKE ''%'' || UPPER(:q' + IntToStr(FilterData.FTreeData.ID) + ') || ''%''' + ')';
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
        Name := 'q' + IntToStr(FilterData.FTreeData.ID);
        Caption := FilterData.FTreeData.ObjName;
        ParamOptions := [poKey, poResult];
      end;

      ChildrenCnt := 0;
      for i := 0 to FTaskMaster.TreeDataCount - 1 do
      begin
        if ((FTaskMaster.TreeData[i].DetParent = FilterData.FTreeData.ObjID) and (FilterData.FTreeData.DetParent = 0) and (not FilterData.FTreeData.PrClass))  then
        begin
          Inc(ChildrenCnt);
          Params.ParamByName('SEL_FIELDS').AsString :=
            Params.ParamByName('SEL_FIELDS').AsString + IntToStr(FTaskMaster.TreeData[i].ID) + ',';

          with TQSParam(Params.Add) do
          begin
            Name := 'q' + IntToStr(FTaskMaster.TreeData[i].ID);
            Caption := FTaskMaster.TreeData[i].ObjName;
            if ChildrenCnt = 1 then
            begin
              ParamOptions := [poTextFilter, poNumberFilter, poResult, poVisible];
              Params.ParamByName('OTHERCONDCODE').AsString :=
                '(:p' + IntToStr(FTaskMaster.TreeData[i].ID) +
                ' LIKE :q' + IntToStr(FTaskMaster.TreeData[i].ID) + ' || ''%''' + ')';
              if (FilterData.OperCode >= ArrMax - 1) and
                 (FilterData.Par1 <> '') and
                 (AddText <> '') then
                Params.ParamByName('OTHERCONDCODE').AsString := '(' + Params.ParamByName('OTHERCONDCODE').AsString + AddText;
            end
            else if ChildrenCnt = 2 then
            begin
              ParamOptions := [poTextFilter, poResult, poVisible];
              Params.ParamByName('OTHERCONDNAME').AsString :=
                '(UPPER(:p' + IntToStr(FTaskMaster.TreeData[i].ID) +
                ' ) LIKE ''%'' || UPPER(:q' + IntToStr(FTaskMaster.TreeData[i].ID) + ') || ''%''' + ')';
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

procedure TUniverseFilter.CheckUniverseFilterStyles;
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

procedure TUniverseFilter.Notification(AComponent: TComponent;
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

procedure TUniverseFilter.CondControlResizeCn(Sender: TObject;
  var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
begin
  BeginUpdateControl(CondControl);
  OnConstrainedResize := nil;
  try
    if (TypeCondBox <> nil) and (CondBox <> nil) then
    begin
      TypeCondBox.Width := CondBox.ClientWidth - 14;
    end;
    
    if ParEdit1 <> nil then
    begin
      if (ParEditTime1 <> nil) and (ParEdit2 <> nil) then
        ParEdit1.Width := (CondBox.ClientWidth - 50) div 4
      else
        if (ParEditTime1 = nil) and (ParEdit2 = nil) then
          ParEdit1.Width := TypeCondBox.Width
        else              
          ParEdit1.Width := (CondBox.ClientWidth - 50) div 2;
      
      ParLabel1.Width := ParEdit1.Width
    end;

    if (ParEdit1 <> nil) and (ParEditTime1 <> nil) then
    begin
      ParEditTime1.Left := ParEdit1.Left + ParEdit1.Width + 5;
      ParEditTime1.Width := ParEdit1.Width;
    end;
    
    if (ParEdit2 <> nil) and (ParEdit1 <> nil) then
    begin
      with ParEdit2 do
      begin
        if ParEditTime1 = nil then
          Left := ParEdit1.Width + 20
        else
          Left := ParEditTime1.Left + ParEditTime1.Width + 20;
        Width := ParEdit1.Width
      end;
      with ParLabel2 do
      begin
        Left := ParEdit2.Left;
        Width := ParEdit2.Width
      end
    end;
    if (ParEditTime2 <> nil) and (ParEdit2 <> nil) and (ParEditTime1 <> nil) then
    begin
      ParEditTime2.Left := ParEdit2.Left + ParEdit2.Width + 5;
      ParEditTime2.Width := ParEditTime1.Width;
    end;
    if CondGrid <> nil then
        CondGrid.DefaultColWidth := CondGrid.ClientWidth - 1;
    CalcUpDownPos;
  finally
    OnConstrainedResize := CondControlResizeCn;
    EndUpdateControl(CondControl);
  end;
end;

{procedure TUniverseFilter.FilterResizeCn(Sender: TObject; var MinWidth,
  MinHeight, MaxWidth, MaxHeight: Integer);
begin
end; }

procedure TUniverseFilter.BeginUpdateControl(AControl: TWinControl);
begin
  SendMessage(AControl.Handle, WM_SETREDRAW, 0, 0);
end;

procedure TUniverseFilter.EndUpdateControl(AControl: TWinControl);
begin
  SendMessage(AControl.Handle, WM_SETREDRAW, 1, 0);
  AControl.Refresh;
end;

procedure TUniverseFilter.CalcUpDownPos;
//var i, Pos: Integer;
begin
  if Assigned(TBar) and (TBar.ButtonCount >=9) and Assigned(CondControl) then
  begin
    SepBtn.Width := SepBtn.Width + CondControl.Left - UpBtn.Left;
 //   ShowButtonCaption := ShowButtonCaption;
  end;
end;

procedure TUniverseFilter.ListBoxDragDrop(Sender, Source: TObject; X,
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

procedure TUniverseFilter.ListBoxDragOver(Sender, Source: TObject; X,
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

procedure TUniverseFilter.ObjViewDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (Source = FieldsListBox) or
     (Source = GrListBox) or
     (Source = OrderListBox) then
    DelBtn.Click;
end;

procedure TUniverseFilter.ObjViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source = FieldsListBox) or
     (Source = GrListBox) or
     (Source = OrderListBox) then
    Accept := DelBtn.Enabled;
end;


procedure TUniverseFilter.ValListCreate(AFilterData: TFilterData);
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
          if AFilterData.FTreeData.HasDetail then
            ValList.Items.AddObject(Trim(FilterToStringDoc_GetVal(AFilterData.FTreeData.ID, StrToInt(SL[i]))), TObject(StrToInt(SL[i])))
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

procedure TUniverseFilter.ValListDblClick(Sender: TObject);
begin
  if ValList.PopupMenu.Items[0].Enabled then
    miEditClick(nil);
end;

procedure TUniverseFilter.miAddClick(Sender: TObject);
begin
  EditValList(-1);
end;

procedure TUniverseFilter.miEditClick(Sender: TObject);
begin
  EditValList(ValList.ItemIndex);
end;

procedure TUniverseFilter.EditValList(Index: Integer);
begin
  QSrc := CreateValQS(FTaskMaster.FilterData[CurrFilter], false);
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
  end;
end;

procedure TUniverseFilter.miDelClick(Sender: TObject);
begin
  ValList.Items.Delete(ValList.ItemIndex);
  ValListChange;
end;

procedure TUniverseFilter.PopupMenuPopup(Sender: TObject);
begin
  ValList.PopupMenu.Items[0].Enabled := ValList.ItemIndex > -1;
  ValList.PopupMenu.Items[2].Enabled := ValList.ItemIndex > -1;
end;

procedure TUniverseFilter.ValListChange;
var
  S, S2: String;
  I: Integer;
begin
  S := '';
  if FTaskMaster.FilterData[CurrFilter].FTreeData.HasDetail then
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
  with FTaskMaster.FilterData[CurrFilter].FTreeData do
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

procedure TUniverseFilter.QSValListSelect(Q: TEtranQuickSearch) ;
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

    if FTaskMaster.FilterData[CurrFilter].FTreeData.HasDetail then
    begin
      ID := VarAsType(Q.KeyValue, varInteger);
      if ValList.Items.Objects[ValList.ItemIndex] <> TObject(ID) then
      begin
        S := FilterToStringDoc_GetVal(FTaskMaster.FilterData[CurrFilter].FTreeData.ID, VarAsType(Q.KeyValue, varInteger));
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

procedure TUniverseFilter.NewMenuPopup(Sender: TObject);
var N: TTreeNode;
begin
//  N := TTreeView(MainNode.TreeView).Selected;
  N := SelectedNode;

  miAddNew.Enabled := (fsMayCreateNew in Self.Style) and (fConnection <> nil) and (FMainNode <> nil) and (UniverseID <> - 1) and (SelectedFilter <> - 1);
  miAddChild.Enabled := miAddNew.Enabled and
    (MainNode <> nil) and (N <> nil) and (TObject(N.Data) is TMainData) and (TMainData(N.Data).GrStr = '') and (not TMainData(N.Data).PrField);
end;



procedure TUniverseFilter.Select(Sender: TObject);
begin
  QSValListSelect(Sender as TEtranQuickSearch);
end;

procedure TUniverseFilter.SetShowButtonCaption(const Value: boolean);
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

function TUniverseFilter.GetShowButtonCaption: boolean;
begin
  if Assigned(TBar) then
    Result := TBar.ShowCaptions
  else
    Result := false;
end;

{procedure TUniverseFilter.CreateWnd;
begin
  inherited;
  CreateChildControls;
  SetEnabledButtons;
end;  }



function TUniverseFilter.GetSelectedNode: TTreeNode;
begin
  Result := FSelectedNode;
end;

procedure TUniverseFilter.SetSelectedNode(const Value: TTreeNode);
begin
  if FSelectedNode <> Value then
    FSelectedNode := Value;
end;


function TUniverseFilter.GetFilterString: String;
begin
  Result := MakeWhereStr;
end;

procedure TUniverseFilter.SetFilterString(AFltString: String);
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
        for J := 0 to FTaskMaster.TreeDataCount - 1 do
          if (not FTaskMaster.TreeData[J].PrClass) and
             (FTaskMaster.TreeData[J].ID = Num) and
             (((cnt > 1) and (FTaskMaster.TreeData[J].ObjType = 1)) or
             ((cnt = 1) and (FTaskMaster.TreeData[J].ObjType = 2))) then
          begin
            D.FTreeData := FTaskMaster.TreeData[j];
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

function TUniverseFilter.GetFilterTextToDoc: String;
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

procedure TUniverseFilter.SetDirectFilterString(const Value: String);
begin
  FDirectFilterString := Value;
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

{ TTreeData }

constructor TTreeData.Create(AOwner: TTaskMasterClass);
begin
  inherited;
  PrClass := False;
  Sel := False;
  ObjHidden := false;
  HasDetail := false;
  DType := -1;
end;

{ TTaskMasterClass }

constructor TTaskMasterClass.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  FObjList := TList.Create;
  FTreeDataList := TList.Create;
  FFilterList := TList.Create;
  FMainDataList := TList.Create;
end;

destructor TTaskMasterClass.Destroy;
begin
  ClearList(FObjList);
  FObjList.Free;
  ClearList(FTreeDataList);
  FTreeDataList.Free;
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
  if AObject is TTreeData then
    CustomObjAdd(AObject, FTreeDataList)
  else
    if AObject is TFilterData then
      CustomObjAdd(AObject, FFilterList)
    else
      if AObject is TMainData then
        CustomObjAdd(AObject, FMainDataList)
      else
        CustomObjAdd(AObject, FObjList);
end;

procedure TTaskMasterClass.ObjDel(AObject: TObject);
begin
  if AObject is TTreeData then
    CustomObjDel(AObject, FTreeDataList)
  else
    if AObject is TFilterData then
      CustomObjDel(AObject, FFilterList)
    else
      if AObject is TMainData then
        CustomObjDel(AObject, FMainDataList)
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

function TTaskMasterClass.GetTreeData(i: Integer): TTreeData;
begin
  Result := TTreeData(FTreeDataList[i]);
end;

function TTaskMasterClass.GetTreeDataCount: Integer;
begin
  Result := FTreeDataList.Count;
end;

procedure TTaskMasterClass.SetTreeData(i: Integer; const Value: TTreeData);
begin
  FTreeDataList[i] := Value;
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

procedure TTaskMasterClass.ClearTreeDataList;
begin
  ClearList(FTreeDataList);
end;

procedure TTaskMasterClass.ClearFilterList;
begin
  ClearList(FFilterList);
end;

procedure TTaskMasterClass.ClearMainDataList;
begin
  ClearList(FMainDataList);
end;

initialization
  DateEditMask := 'dd' + DateSeparator +'mm'+ DateSeparator + 'yyyy';

end.
