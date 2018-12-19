unit uBsnSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl, Db, DBClient, Buttons;

type
  TBsnSelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    RxDBGrid1: TRxDBGrid;
    cdsBsn: TClientDataSet;
    DataSource1: TDataSource;
    cdsBsnid_business: TIntegerField;
    cdsBsnName: TStringField;
    btnDel: TSpeedButton;
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure btnDelClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure initialize(id_business : Variant; UID : Variant);
  end;

  function SelectBuisnes(var AID : Variant; var AName : String; UID : Variant; AOwner : TComponent = nil;
                         AShowbtnDel : boolean = true;
                         AAuto : boolean = false) : boolean;

  var
  BsnSelector: TBsnSelector;

implementation

uses foMyFunc, uDM, uMainForm;

function SelectBuisnes(var AID : Variant; var AName : String; UID : Variant; AOwner : TComponent;
                       AShowbtnDel : boolean;
                       AAuto : boolean) : boolean;
var F : TBsnSelector;
begin
  Result := false;
  F := TBsnSelector.Create(AOwner);
  try
    if AOwner is TWinControl then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, TWinControl(AOwner).Handle);
    F.btnDel.Visible := AShowbtnDel;
    F.initialize(AID, UID);
    if AAuto and (F.cdsBsn.RecordCount = 1) then
    begin
      AID := F.cdsBsnid_business.AsInteger;
      AName := F.cdsBsnName.AsString;
      Result := true;
    end
    else
    begin
      F.ShowModal;
      if F.ModalResult = mrOk then
      begin
        Result := true;
        AID := F.cdsBsnid_business.AsInteger;
        AName := F.cdsBsnName.AsString;
      end
      else
        if F.ModalResult = mrNo then
        begin
          Result := true;
          AID := Null;
          AName := '';
        end;
    end;
  finally
    F.Free;
  end;
end;


{$R *.DFM}

procedure TBsnSelector.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TBsnSelector.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TBsnSelector.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  btnOk.Enabled := not cdsBsn.IsEmpty;
end;

procedure TBsnSelector.initialize(id_business : Variant; UID : Variant);
begin
  with cdsBsn do
  begin
    Close;
    Params.ParamByName('@UID').Value := UID;
    Params.ParamByName('@id_User').Value := DM.IDUser;
    Open;
    Locate('id_business', id_business, []);
  end;
end;

procedure TBsnSelector.btnDelClick(Sender: TObject);
begin
  ModalResult := mrNo;
end;

procedure TBsnSelector.RxDBGrid1DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
  if btnOk.Enabled then
    btnOk.Click;
end;

end.
