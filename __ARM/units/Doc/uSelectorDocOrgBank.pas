unit uSelectorDocOrgBank;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frDocOrg, ActnList, ImgList, ComCtrls, ToolWin;

type
  TSelectorDocOrgBank = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cdsOrgBank: TClientDataSet;
    cdsOrgBankid_Doc_OrgBank: TAutoIncField;
    cdsOrgBankid_Doc_Org: TIntegerField;
    cdsOrgBankBank: TStringField;
    cdsOrgBankBIK: TBCDField;
    cdsOrgBankAcc: TStringField;
    cdsOrgBankCorAcc: TStringField;
    cdsOrgBankDefBank: TBooleanField;
    dsOrgBank: TDataSource;
    ImageList: TImageList;
    ActionList1: TActionList;
    aBankAdd: TAction;
    aBankEdit: TAction;
    aBankDel: TAction;
    ToolBar3: TToolBar;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    grBank: TRxDBGrid;
    procedure fDocOrg1RxDBGrid1DblClick(Sender: TObject);
    procedure aBankAddExecute(Sender: TObject);
    procedure aBankEditExecute(Sender: TObject);
    procedure aBankDelExecute(Sender: TObject);
    procedure dsOrgBankDataChange(Sender: TObject; Field: TField);
    procedure grBankCheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure grBankDblClick(Sender: TObject);
    procedure grBankDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grBankGetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
  private
    Fid_Doc_Org : integer;
    procedure ResetDef(AField: TField);
  public
    procedure Initialize(id_Doc_Org : integer);
  end;

var
  SelectorDocOrgBank: TSelectorDocOrgBank;
function ShowSelectorDocOrgBank(id_Doc_Org : integer; var ABank, ABIK, AAcc, ACorrAcc : Variant) : boolean;

implementation

uses uDM, foMyFunc, uBankData;

{$R *.DFM}

function ShowSelectorDocOrgBank(id_Doc_Org : integer; var ABank, ABIK, AAcc, ACorrAcc : Variant) : boolean;
var F : TSelectorDocOrgBank;
begin
  Result := false;
  F := TSelectorDocOrgBank.Create(nil);
  try
    with F do
    begin
      if Screen.ActiveForm <> nil then
        SetWindowLong(Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
      F.Initialize(id_Doc_Org);
      F.ShowModal;
      if F.ModalResult = mrOk then
      begin
        Result := true;
        ABank := F.cdsOrgBankBank.AsVariant;
        ABIK := F.cdsOrgBankBIK.AsVariant;
        AAcc := F.cdsOrgBankAcc.AsVariant;
        ACorrAcc := F.cdsOrgBankCorAcc.AsVariant;
      end;
    end;
  finally
    F.Free;
  end;
end;


procedure TSelectorDocOrgBank.Initialize(id_Doc_Org : integer);
begin
  Fid_Doc_Org := id_Doc_Org;
  with cdsOrgBank do
  begin
    Close;
    Params.ParamByName('@id_Doc_Org').Value := Fid_Doc_Org;
    Open;
  end;
end;


procedure TSelectorDocOrgBank.fDocOrg1RxDBGrid1DblClick(Sender: TObject);
var  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 if btnOk.enabled then
   btnOk.Click;
end;

procedure TSelectorDocOrgBank.aBankAddExecute(Sender: TObject);
var
    isDef : boolean;
    Bank, BIK, Acc, CorrAcc: String;
begin
  isDef := cdsOrgBank.IsEmpty;
  Bank := '';
  BIK := '';
  Acc := '';
  CorrAcc := '';
  if EditBankData(Bank, BIK, Acc, CorrAcc, isDef) then
  begin
    with cdsOrgBank do
    begin
      Append;
      cdsOrgBankBank.AsString := Bank;
      cdsOrgBankBIK.AsString := BIK;
      cdsOrgBankAcc.AsString := Acc;
      cdsOrgBankCorAcc.AsString := CorrAcc;
      if isDef then
        ResetDef(FieldByName('DefBank'));
      cdsOrgBankDefBank.AsBoolean := isDef;
      Post;
    end;
    if not CDSApplyUpdates(cdsOrgBank, 'id_Doc_Org', Fid_Doc_Org, true) then
      raise Exception.Create('Ошибка при сохранении');
  end;
end;

procedure TSelectorDocOrgBank.aBankEditExecute(Sender: TObject);
var
    isDef : boolean;
    Bank, BIK, Acc, CorrAcc: String;
begin
  isDef := cdsOrgBankDefBank.AsBoolean;
  Bank := cdsOrgBankBank.AsString;
  BIK := cdsOrgBankBIK.AsString;
  Acc := cdsOrgBankAcc.AsString;
  CorrAcc := cdsOrgBankCorAcc.AsString;
  if EditBankData(Bank, BIK, Acc, CorrAcc, isDef) then
  begin
    with cdsOrgBank do
    begin
      Edit;
      cdsOrgBankBank.AsString := Bank;
      cdsOrgBankBIK.AsString := BIK;
      cdsOrgBankAcc.AsString := Acc;
      cdsOrgBankCorAcc.AsString := CorrAcc;
      if isDef then
        ResetDef(FieldByName('DefBank'));
      cdsOrgBankDefBank.AsBoolean := isDef;
      Post;
    end;
    if not CDSApplyUpdates(cdsOrgBank, 'id_Doc_Org', Fid_Doc_Org, true) then
      raise Exception.Create('Ошибка при сохранении');
  end;
end;

procedure TSelectorDocOrgBank.ResetDef(AField: TField);
var F : Variant;
    isDef : boolean;
    OldRecNo : integer;
begin
  with AField.DataSet do
  begin
    Post;
    OldRecNo := RecNo;
    DisableControls;
    try
      First;
      while not Eof do
      begin
        Edit;
        AField.AsBoolean := false;
        Post;
        Next;
      end;
    finally
      RecNo := OldRecNo;
      EnableControls;
      Edit;
    end;
  end;
end;


procedure TSelectorDocOrgBank.aBankDelExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить банк "' + cdsOrgBankBank.AsString+ '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    cdsOrgBank.Delete;
    if not CDSApplyUpdates(cdsOrgBank, 'id_Doc_Org', Fid_Doc_Org, true) then
      raise Exception.Create('Ошибка при сохранении');
  end;
end;

procedure TSelectorDocOrgBank.dsOrgBankDataChange(Sender: TObject;
  Field: TField);
begin
  btnOk.enabled := not cdsOrgBank.isEmpty;
  aBankEdit.Enabled := not cdsOrgBank.IsEmpty;
  aBankDel.Enabled := not cdsOrgBank.IsEmpty;
end;

procedure TSelectorDocOrgBank.grBankCheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TSelectorDocOrgBank.grBankDblClick(Sender: TObject);
var  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 if btnOk.enabled then
   btnOk.Click;
end;

procedure TSelectorDocOrgBank.grBankDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var Style, cbSize   : Integer;
    R : TRect;
    ImgIndex : integer;
begin
  if (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
    Exit;
    
  if (Column.Field is TBooleanField) then
  begin
    if Column.Field.AsBoolean then
      Style := DFCS_CHECKED
    else
      Style := DFCS_BUTTONCHECK;

    R := Rect;
    cbSize := 15;
    if R.Bottom - R.Top > cbSize then
    begin
      R.Top := R.Top + (R.Bottom - R.Top - cbSize) div 2;
      R.Bottom := R.Top + cbSize;
    end;
    if R.Right - R.Left < cbSize then
    begin
      R.Right := R.Left + cbSize;
    end;

    if gdSelected in State then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clHighlight;
      TDBGrid(Sender).Canvas.FillRect(Rect);
    end;
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, Style);
  end
  else
  begin
    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TSelectorDocOrgBank.grBankGetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

end.
