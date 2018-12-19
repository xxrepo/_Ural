unit frBalanceArc;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ActnList, ImgList, Grids, DBGrids, RXDBCtrl, Menus,
  Db, DBClient, frBsnSelector, StdCtrls, Buttons, ExtCtrls;

type
  TfBalanceArc = class(TFrame)
    RxDBGrid1: TRxDBGrid;
    ImageList: TImageList;
    ActionList1: TActionList;
    aOpenBefore: TAction;
    aRefresh2: TAction;
    ToolBar: TToolBar;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    cdsRezGetList: TClientDataSet;
    dsFltList: TDataSource;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    cdsRezGetListid_Rez: TAutoIncField;
    cdsRezGetListDateCreate: TDateTimeField;
    cdsRezGetListid_business: TIntegerField;
    cdsRezGetListName: TStringField;
    ToolButton1: TToolButton;
    aOpenAfter: TAction;
    N1: TMenuItem;
    pnDate: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    dtTo: TDateTimePicker;
    dtFrom: TDateTimePicker;
    BitBtn2: TBitBtn;
    fBsnSelector1: TfBsnSelector;
    procedure aOpenBeforeExecute(Sender: TObject);
    procedure aRefresh2Execute(Sender: TObject);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure dsFltListDataChange(Sender: TObject; Field: TField);
    procedure aOpenAfterExecute(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    Fid_Bsn : integer;
  public
    constructor Create(AOwner : TComponent); override;
    procedure Initialize(id_Bsn : integer);
  end;

implementation

uses foMyFunc, uDM, uBalanceBsn;

{$R *.DFM}


procedure TfBalanceArc.aRefresh2Execute(Sender: TObject);
 var
  id:Integer;
begin
  ID := cdsRezGetListid_Rez.AsInteger;
  with cdsRezGetList do
  begin
    Close;
    Open;
   Locate('id_rez', Id, [loCaseInsensitive]);
  end;
end;

procedure TfBalanceArc.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfBalanceArc.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfBalanceArc.Initialize(id_Bsn : integer);
begin
  Fid_Bsn := id_Bsn;
  with cdsRezGetList do
  begin
    Close;
    Params.ParamByName('@id_business').Value := id_Bsn;
    Params.ParamByName('@DateFrom').AsDateTime := GetDateAdv(dtFrom.Date, false);
    Params.ParamByName('@DateTo').AsDateTime := GetDateAdv(dtTo.Date, true);
    Open;
  end;
end;

procedure TfBalanceArc.dsFltListDataChange(Sender: TObject; Field: TField);
begin
  aOpenBefore.Enabled := not cdsRezGetList.IsEmpty;
  aOpenAfter.Enabled := not cdsRezGetList.IsEmpty;
end;

procedure TfBalanceArc.aOpenAfterExecute(Sender: TObject);
var V : Variant;
begin
  V := cdsRezGetListDateCreate.AsDateTime + 1/(24*3600);
  ShowBlnBsn(Fid_Bsn, V, 0); 
end;

procedure TfBalanceArc.aOpenBeforeExecute(Sender: TObject);
var V : Variant;
begin
  V := cdsRezGetListDateCreate.AsDateTime - 1/(24*3600);
  ShowBlnBsn(Fid_Bsn, V, 0);
end;


procedure TfBalanceArc.BitBtn2Click(Sender: TObject);
begin
  Initialize(fBsnSelector1.ID);
end;

constructor TfBalanceArc.Create(AOwner: TComponent);
begin
  inherited;
  dtFrom.Date := Now - 30;
  dtTo.Date := Now;

end;

end.
