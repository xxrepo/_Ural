unit frBuffSelector;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, Db, DBClient, ImgList, ComCtrls, ToolWin,
  ActnList, Menus;

type
  TfBuffSelector = class(TFrame)
    RxDBGrid1: TRxDBGrid;
    cdsBuffList: TClientDataSet;
    cdsBuffListid_Buff: TAutoIncField;
    cdsBuffListid_User: TIntegerField;
    cdsBuffListName: TStringField;
    cdsBuffListDateCreate: TDateTimeField;
    DataSource1: TDataSource;
    ilImage: TImageList;
    ImageList: TImageList;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ToolButton5: TToolButton;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;

    procedure Initialize;
  end;

implementation

uses uDM, foMyFunc;

{$R *.DFM}

procedure TfBuffSelector.Initialize;
begin
  with cdsBuffList do
  begin
    Close;
    Params.ParamByName('@id_user').Value := DM.IDUser;
    Open;
    First;
    Insert;
 //   cdsBuffListid_Buff.AsInteger := -13; // Локальный буфер
    cdsBuffListName.AsString := 'Временный буфер';
    Post;
  end;
end;

procedure TfBuffSelector.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfBuffSelector.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfBuffSelector.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  aEdit.Enabled := not cdsBuffList.IsEmpty;
  aDel.Enabled := not cdsBuffList.IsEmpty;
end;

procedure TfBuffSelector.RxDBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
//*
end;

procedure TfBuffSelector.RxDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var ImgIndex : integer;
    R : TRect;
begin
  R := Rect;
  if Column.Field = cdsBuffListName then
  begin
    if cdsBuffListid_Buff.IsNull then
      ImgIndex := -1
    else
      ImgIndex := 0;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    ilImage.Draw(TDBGrid(Sender).Canvas, R.Left + 2, R.Top + 1, ImgIndex);

    if ImgIndex > -1 then
      R.Left := R.Left + ilImage.Width + 2
    else
      R.Left := R.Left + 2;
  end;
  TDBGrid(Sender).Canvas.TextRect(R, R.Left, R.Top, Column.Field.AsString);
end;

constructor TfBuffSelector.Create(AOwner: TCOmponent);
begin
  inherited;
  if Owner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
end;

destructor TfBuffSelector.Destroy;
begin
  if Owner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
  end;
  inherited;
end;

procedure TfBuffSelector.aAddExecute(Sender: TObject);
var
  ID:Variant;
  S : String;
  id_Bsn : Variant;
begin
  ID := -1;
  S := 'Название буфера';
  if InputBoxKrm('Новый буфер', 'Название', S) then
  begin
    ID := DM.rsCA.AppServer.OP_BuffAdd(S);
    if ID <> -1 then
      with cdsBuffList do
      begin
        Initialize;
        Locate('id_Buff', Id, [loCaseInsensitive]);
      end;
  end;
end;

procedure TfBuffSelector.aEditExecute(Sender: TObject);
var
  ID:Variant;
  S : String;
  id_Bsn : Variant;
begin
  ID := cdsBuffList.FieldByName('id_Buff').Value ;
  S := cdsBuffList.FieldByName('Name').Value ;
  if InputBoxKrm('Буфер', 'Название', S) then
  begin
    if DM.rsCA.AppServer.OP_BuffEdit(ID, S) = 1 then
      with cdsBuffList do
      begin
        Initialize;
        Locate('id_Buff', Id, [loCaseInsensitive]);
      end;
  end;
end;

procedure TfBuffSelector.aDelExecute(Sender: TObject);
var
  ID:Variant;
begin
  ID := cdsBuffList.FieldByName('id_Buff').Value;
  if DM.rsCA.AppServer.OP_BuffDel(ID) = 1 then
    cdsBuffList.Delete;
end;

procedure TfBuffSelector.aRefreshExecute(Sender: TObject);
 var
  id:Variant;
begin
  with cdsBuffList do
  begin
    Id := FieldByName('id_Buff').AsInteger;
    Initialize;
    Locate('id_Buff', Id, [loCaseInsensitive]);
  end;
end;

end.
