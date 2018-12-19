unit uDocOrg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frDocOrg, DBCtrls, Mask, ComCtrls, ActnList, ImgList, ToolWin;

type
  TDocOrg = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    cdsDocOrg: TClientDataSet;
    cdsDocOrgid_Doc_Org: TAutoIncField;
    cdsDocOrgOrgName: TStringField;
    cdsDocOrgAddress: TStringField;
    cdsDocOrgChif: TStringField;
    cdsDocOrgBuh: TStringField;
    cdsDocOrgOKPO: TStringField;
    cdsDocOrgOKPD: TStringField;
    cdsDocOrgINN: TBCDField;
    cdsDocOrgid_business: TIntegerField;
    cdsDocOrgKPP: TStringField;
    cdsDocOrgDefOrg: TBooleanField;
    cdsDocOrgVAT: TBCDField;
    cdsDocOrgDisabledOrg: TBooleanField;
    DataSource2: TDataSource;
    cdsOrgBank: TClientDataSet;
    dsOrgBank: TDataSource;
    cdsOrgBankid_Doc_OrgBank: TAutoIncField;
    cdsOrgBankid_Doc_Org: TIntegerField;
    cdsOrgBankBank: TStringField;
    cdsOrgBankBIK: TBCDField;
    cdsOrgBankAcc: TStringField;
    cdsOrgBankCorAcc: TStringField;
    cdsOrgBankDefBank: TBooleanField;
    cdsOrgDetVAT: TClientDataSet;
    dsOrgDetVAT: TDataSource;
    cdsOrgDetVATid_OrgDet: TAutoIncField;
    cdsOrgDetVATid_Doc_Org: TIntegerField;
    cdsOrgDetVATVal: TStringField;
    cdsOrgDetVATDT: TIntegerField;
    cdsOrgDetCasser: TClientDataSet;
    dsOrgDetCasser: TDataSource;
    cdsOrgDetCasserid_OrgDet: TAutoIncField;
    cdsOrgDetCasserid_Doc_Org: TIntegerField;
    cdsOrgDetCasserVal: TStringField;
    cdsOrgDetCasserDT: TIntegerField;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    PageControl1: TPageControl;
    tsBank: TTabSheet;
    tsCasser: TTabSheet;
    tsVAT: TTabSheet;
    grBank: TRxDBGrid;
    ActionList1: TActionList;
    aBankAdd: TAction;
    aBankEdit: TAction;
    ImageList: TImageList;
    aBankDel: TAction;
    aCassAdd: TAction;
    aCassEdit: TAction;
    aCassDel: TAction;
    aVatAdd: TAction;
    aVatEdit: TAction;
    aVatDel: TAction;
    grCass: TRxDBGrid;
    grVAT: TRxDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    cdsOrgDetVATDefDet: TBooleanField;
    cdsOrgDetCasserDefDet: TBooleanField;
    ToolBar3: TToolBar;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure grBankCheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure grBankDblClick(Sender: TObject);
    procedure grBankDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grBankGetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure aBankAddExecute(Sender: TObject);
    procedure aBankEditExecute(Sender: TObject);
    procedure aBankDelExecute(Sender: TObject);
    procedure aCassAddExecute(Sender: TObject);
    procedure aCassEditExecute(Sender: TObject);
    procedure aCassDelExecute(Sender: TObject);
    procedure aVatAddExecute(Sender: TObject);
    procedure aVatEditExecute(Sender: TObject);
    procedure aVatDelExecute(Sender: TObject);
    procedure grCassDblClick(Sender: TObject);
    procedure grVATDblClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsOrgBankDataChange(Sender: TObject; Field: TField);
    procedure dsOrgDetVATDataChange(Sender: TObject; Field: TField);
    procedure dsOrgDetCasserDataChange(Sender: TObject; Field: TField);
  private
    Fid_Doc_Org : integer;
    function SaveProp : boolean;
    procedure ResetDef(AField: TField);
  public
    procedure Initialize(id_Bsn : integer; var id_Doc_Org : integer);
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  end;

var
  DocOrg: TDocOrg;
function EditDocOrg(id_Bsn : integer; var id_Doc_Org : integer) : boolean;

implementation

uses uDM, foMyFunc, uInputBoxDigit_Def, uInputBoxStr_Def, uBankData;

{$R *.DFM}

function EditDocOrg(id_Bsn : integer; var id_Doc_Org : integer) : boolean;
var F : TDocOrg;
begin
  Result := false;
  F := TDocOrg.Create(nil);
  try
    with F do
    begin
      if Screen.ActiveForm <> nil then
        SetWindowLong(Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
      F.Initialize(id_Bsn, id_Doc_Org);
      F.ShowModal;
      if F.ModalResult = mrOk then
      begin
        Result := F.SaveProp;
        id_Doc_Org := F.Fid_Doc_Org;
      end;
    end;
  finally
    F.Free;
  end;
end;


procedure TDocOrg.Initialize(id_Bsn : integer; var id_Doc_Org : integer);
begin
  Fid_Doc_Org := id_Doc_Org;
  with cdsDocOrg do
  begin
    Close;
    Params.ParamByName('@id_Doc_Org').Value := id_Doc_Org;
    Open;
    if id_Doc_Org = -1 then
    begin
      Edit;
      cdsDocOrgid_business.AsInteger := id_Bsn;
      cdsDocOrgDefOrg.AsBoolean := false;
      Post;
    end;
  end;
  with cdsOrgBank do
  begin
    Close;
    Params.ParamByName('@id_Doc_Org').Value := id_Doc_Org;
    Open;
  end;
  with cdsOrgDetVAT do
  begin
    Close;
    Params.ParamByName('@id_Doc_Org').Value := id_Doc_Org;
    Params.ParamByName('@DT').Value := 1;
    Open;
  end;
  with cdsOrgDetCasser do
  begin
    Close;
    Params.ParamByName('@id_Doc_Org').Value := id_Doc_Org;
    Params.ParamByName('@DT').Value := 2;
    Open;
  end;
  ActiveControl := DBEdit1;
end;


procedure TDocOrg.grBankCheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TDocOrg.grBankDblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aBankEdit.Execute;
end;

procedure TDocOrg.grBankDrawColumnCell(Sender: TObject;
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

procedure TDocOrg.grBankGetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TDocOrg.aBankAddExecute(Sender: TObject);
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
  end;
end;

procedure TDocOrg.aBankEditExecute(Sender: TObject);
var
    isDef : boolean;
    Bank, BIK, Acc, CorrAcc: String;
begin
  isDef := cdsOrgBankDefBank.AsBoolean;
  Bank := cdsOrgBankBank.AsString;
  BIK := cdsOrgBankBIK.DisplayText;
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
  end;
end;

procedure TDocOrg.aBankDelExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить банк "' + cdsOrgBankBank.AsString+ '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    cdsOrgBank.Delete;
  end;
end;

procedure TDocOrg.aCassAddExecute(Sender: TObject);
var F : Variant;
    isDef : boolean;
    OldRecNo : integer;
begin
  F := '';
  isDef := cdsOrgDetCasser.IsEmpty;
  if InputBoxStr_Def(Handle, 'Кассир', 'Значение', F, isDef) then
  begin
    with cdsOrgDetCasser do
    begin
      Append;
      cdsOrgDetCasserVal.AsString := F;
      cdsOrgDetCasserDT.AsInteger := 2;
      if isDef then
        ResetDef(FieldByName('DefDet'));
      cdsOrgDetCasserDefDet.AsBoolean := isDef;
      Post;
    end;
  end;
end;


procedure TDocOrg.aCassEditExecute(Sender: TObject);
var F : Variant;
    isDef : boolean;
begin
  F := cdsOrgDetCasserVal.AsString;
  isDef := cdsOrgDetCasserDefDet.AsBoolean;
  if InputBoxStr_Def(Handle, 'Кассир', 'Значение', F, isDef) then
  begin
    with cdsOrgDetCasser do
    begin
      Edit;
      cdsOrgDetCasserVal.AsString := F;
      if isDef then
        ResetDef(FieldByName('DefDet'));
      cdsOrgDetCasserDefDet.AsBoolean := isDef;
      Post;
    end;
  end;
end;

procedure TDocOrg.aCassDelExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить товар "' + cdsOrgDetCasserVal.AsString+ '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    cdsOrgDetCasser.Delete;
  end;
end;

procedure TDocOrg.aVatAddExecute(Sender: TObject);
var F : Variant;
    isDef : boolean;
begin
  F := 0;
  isDef := cdsOrgDetVAT.IsEmpty;
  if InputBoxDigit_Def(Handle, 'НДС', 'Значение', F, isDef) then
  begin
    with cdsOrgDetVAT do
    begin
      Append;
      cdsOrgDetVATVal.AsVariant := F;
      cdsOrgDetVATDT.AsInteger := 1;
      if isDef then
        ResetDef(FieldByName('DefDet'));
      cdsOrgDetVATDefDet.AsBoolean := isDef;
      Post;
    end;
  end;
end;

procedure TDocOrg.aVatEditExecute(Sender: TObject);
var F : Variant;
    isDef : boolean;
begin
  F := cdsOrgDetVATVal.AsFloat;
  isDef := cdsOrgDetVATDefDet.AsBoolean;
  if InputBoxDigit_Def(Handle, 'НДС', 'Значение', F, isDef) then
  begin
    with cdsOrgDetVAT do
    begin
      Edit;
      cdsOrgDetVATVal.AsVariant := F;
      if isDef then
        ResetDef(FieldByName('DefDet'));
      cdsOrgDetVATDefDet.AsBoolean := isDef;
      Post;
    end;
  end;
//*
end;

procedure TDocOrg.aVatDelExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Удалить НДС "' + cdsOrgDetVATVal.AsString+ '"?'), 'Подтвердите удаление', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    cdsOrgDetVAT.Delete;
  end;
end;

procedure TDocOrg.grCassDblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aCassEdit.Execute;
end;

procedure TDocOrg.grVATDblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aVATEdit.Execute;
end;

constructor TDocOrg.Create(AOwner: TComponent);
begin
  inherited;
  PageControl1.ActivePage := tsBank;
  if Owner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(grBank, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
    LoadGridSettingsFromRegistry(grCass, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + '1');
    LoadGridSettingsFromRegistry(grVAT, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + '2');
  end;
end;

destructor TDocOrg.Destroy;
begin
  if Owner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(grBank, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName);
    SaveGridSettingsToRegistry(grCass, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + '1');
    SaveGridSettingsToRegistry(grVAT, SRegPath + '\' + TForm(Owner).ClassName + '\' + ClassName + '2');
  end;
  inherited;

end;

procedure TDocOrg.btnOkClick(Sender: TObject);
begin
  with DBEdit1 do
    if trim(Text) = '' then
    begin
      MessageBox(Handle, 'Не введено название', 'Введены не все данные', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;
  ModalResult := mrOK;
end;

function TDocOrg.SaveProp: boolean;
var OldCursor : TCursor;
    tmpID, X : integer;
    Address, Buh, Chif: OleVariant;
    DefOrg, DisabledOrg: WordBool;
    id_business: Integer;
    INN, KPP, OKPD, OKPO, OrgName, VAT: OleVariant;
begin
  tmpID := Fid_Doc_Org;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try
    Address := cdsDocOrgAddress.AsVariant;
    Buh := cdsDocOrgBuh.AsVariant;
    Chif := cdsDocOrgChif.AsVariant;
    DefOrg := cdsDocOrgDefOrg.AsBoolean;
    DisabledOrg := cdsDocOrgDisabledOrg.AsBoolean;
    id_business := cdsDocOrgid_business.AsInteger;
    INN := cdsDocOrgINN.AsVariant;
    KPP := cdsDocOrgKPP.AsVariant;
    OKPD := cdsDocOrgOKPD.AsVariant;
    OKPO := cdsDocOrgOKPO.AsVariant;
    OrgName := cdsDocOrgOrgName.AsVariant;
    VAT := cdsDocOrgVAT.AsVariant;

    X := DM.rsCA.AppServer.Doc_OrgEdit(Fid_Doc_Org, Address, Buh, Chif,
               DefOrg, DisabledOrg, id_business, INN, KPP, OKPD, OKPO, OrgName, VAT);

    if X = -1 then
      raise Exception.Create('Ошибка при сохранении свойств');
    if Fid_Doc_Org = -1 then
      tmpID := X;
      
    if not CDSApplyUpdates(cdsOrgBank, 'id_Doc_Org', tmpID, true) then
      raise Exception.Create('Ошибка при сохранении');
    if not CDSApplyUpdates(cdsOrgDetVAT, 'id_Doc_Org', tmpID, true) then
      raise Exception.Create('Ошибка при сохранении');
    if not CDSApplyUpdates(cdsOrgDetCasser, 'id_Doc_Org', tmpID, true) then
      raise Exception.Create('Ошибка при сохранении');

    CommitTrans(DM.rsCA);
    Result := true;
  except
    on E : Exception do
    begin
      Screen.Cursor := OldCursor;
      RollbackTrans(DM.rsCA);
      Fid_Doc_Org := tmpID;
      raise Exception.Create(E.Message);
    end;
  end;
  Screen.Cursor := OldCursor;
end;

procedure TDocOrg.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TDocOrg.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TDocOrg.dsOrgBankDataChange(Sender: TObject; Field: TField);
begin
  aBankEdit.Enabled := not cdsOrgBank.IsEmpty;
  aBankDel.Enabled := not cdsOrgBank.IsEmpty;
end;

procedure TDocOrg.dsOrgDetVATDataChange(Sender: TObject; Field: TField);
begin
  aVatEdit.Enabled := not cdsOrgDetVAT.IsEmpty;
  aVatDel.Enabled := not cdsOrgDetVAT.IsEmpty;
end;

procedure TDocOrg.dsOrgDetCasserDataChange(Sender: TObject; Field: TField);
begin
  aCassEdit.Enabled := not cdsOrgDetCasser.IsEmpty;
  aCassDel.Enabled := not cdsOrgDetCasser.IsEmpty;
end;

procedure TDocOrg.ResetDef(AField: TField);
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


end.
