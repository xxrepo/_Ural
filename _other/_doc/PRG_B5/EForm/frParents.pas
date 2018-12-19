unit frParents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, Provider, DBClient, ImgList,
  ActnList, ToolWin, ComCtrls, DBGridEh, Menus, RxMemDS, AdvSplitter, AdvMenus;

type
  TfParents = class(TFrame)
    qDates2: TADOQuery;
    dsDates: TDataSource;
    Splitter1: TAdvSplitter;
    dsCAPar: TDataSource;
    qCAPar2: TADOQuery;
    qCAParID_RELITEMS: TBCDField;
    qCAParID_PARENT: TBCDField;
    qCAParAPRC: TBCDField;
    qCAParNAME: TWideStringField;
    cdsCAPar: TClientDataSet;
    dspCAPar: TDataSetProvider;
    cdsCAParID_RELITEMS: TBCDField;
    cdsCAParID_REL: TBCDField;
    cdsCAParID_PARENT: TBCDField;
    cdsCAParAPRC: TBCDField;
    cdsCAParNAME: TWideStringField;
    ImageList: TImageList;
    ActionList1: TActionList;
    aAddOwner: TAction;
    aDelOwner: TAction;
    aRefreshGrp: TAction;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    cdsCAParSSS: TAggregateField;
    dbgCA: TDBGridEh;
    dspDates: TDataSetProvider;
    aAddDate: TAction;
    aEditDate: TAction;
    aDelDate: TAction;
    Panel2: TPanel;
    dbgDates: TDBGrid;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    qDateadd: TADOQuery;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    DateTimeField1: TDateTimeField;
    BCDField3: TBCDField;
    qDateEdit: TADOQuery;
    BCDField4: TBCDField;
    BCDField5: TBCDField;
    DateTimeField2: TDateTimeField;
    BCDField6: TBCDField;
    aGoOrg: TAction;
    PopupMenu1: TAdvPopupMenu;
    Gotoorganization1: TMenuItem;
    cdsDates: TClientDataSet;
    qCAPar2ID_REL: TBCDField;
    qDates2ID_REL2: TBCDField;
    cdsDatesDATEFROM: TDateTimeField;
    qDates2DATEFROM: TDateTimeField;
    cdsDatesID_REL2: TBCDField;
    aShowOrgChart: TAction;
    ShowOrgChart1: TMenuItem;
    qDates2ACTAMOUNT: TBCDField;
    qDates2ACTPRICE: TBCDField;
    qDates2ID_CUR: TBCDField;
    qDates2CURNAME: TWideStringField;
    cdsDatesACTAMOUNT: TBCDField;
    cdsDatesACTPRICE: TBCDField;
    cdsDatesID_CUR: TBCDField;
    cdsDatesCURNAME: TWideStringField;
    qCAPar2ACTAMOUNT: TBCDField;
    cdsCAParACTAMOUNT: TBCDField;
    qCAPar2ISGRP: TBCDField;
    cdsCAParISGRP: TBCDField;
    procedure dsDatesDataChange(Sender: TObject; Field: TField);
    procedure aAddOwnerExecute(Sender: TObject);
    procedure aDelOwnerExecute(Sender: TObject);
    procedure aRefreshGrpExecute(Sender: TObject);
    procedure cdsCAParAfterPost(DataSet: TDataSet);
    procedure dsCAParDataChange(Sender: TObject; Field: TField);
    procedure dbgCAGetFooterParams(Sender: TObject; DataCol, Row: Integer;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      var Alignment: TAlignment; State: TGridDrawState; var Text: String);
    procedure dbgCAKeyPress(Sender: TObject; var Key: Char);
    procedure dbgCAGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure aAddDateExecute(Sender: TObject);
    procedure aEditDateExecute(Sender: TObject);
    procedure aDelDateExecute(Sender: TObject);
    procedure aGoOrgExecute(Sender: TObject);
    procedure cdsDatesACTPRICEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    FID_CA : integer;
  public
    procedure initialize(ID_CA : integer = -1);
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;

    function CheckData(id_Rel : integer = -1) : boolean;

    procedure SaveProp(ID_CA : integer = -1);
    procedure CloseAll;
  end;

implementation

uses uDM, foMyFunc, foMyFuncEh, uInputBoxDate, uCASelector, uCAList;

{$R *.dfm}

{ TfParents }

procedure TfParents.initialize(ID_CA: integer);
begin
        cdsDates.IndexDefs.Clear;
        cdsDates.IndexDefs.Add('ixDATEFROM', 'DATEFROM', [ixDescending]);
        cdsDates.IndexName := 'ixDATEFROM';

  FID_CA := ID_CA;
  cdsDates.Close;
  cdsDates.Params.ParamByName('id_CA').Value := FID_CA;
  cdsDates.Open;

{  qDates2.Close;
  qDates2.Parameters.ParamByName('id_CA').Value := FID_CA;
  qDates2.Open;
  cdsDates.Open;
  qDates2.First;
  while not qDates2.Eof do
  begin
    cdsDates.Append;
    cdsDatesDATEFROM.AsVariant := trunc(qDates2DATEFROM.AsVariant);
    cdsDatesID_REL2.AsVariant := qDates2ID_REL2.AsVariant;
    cdsDates.Post;
    qDates2.Next;
  end;
  qDates2.Close;
       }
  cdsCAPar.Close;
  cdsCAPar.Params.ParamByName('id_CA').Value := FID_CA;
  cdsCAPar.Open;
end;

procedure TfParents.dsDatesDataChange(Sender: TObject; Field: TField);
begin
  cdsCAPar.Filter := 'id_Rel=' + IntToStr(cdsDatesID_REL2.AsInteger);
  cdsCAPar.Filtered := true;
  aAddOwner.Enabled := not cdsDates.IsEmpty;
  aDelOwner.Enabled := not cdsCAPar.IsEmpty;
  aGoOrg.Enabled := not cdsCAPar.IsEmpty;
  aShowOrgChart.Enabled := aGoOrg.Enabled;
  
//  aAddDate.Enabled := not cdsDates.IsEmpty;
  aEditDate.Enabled := not cdsDates.IsEmpty;
  aDelDate.Enabled := not cdsDates.IsEmpty;
end;

constructor TfParents.Create(AOwner: TCOmponent);
var TmpOwner: TCustomForm;
begin
  inherited;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + TForm(TmpOwner).Name + '\q' + ClassName);
    LoadEhGridSettingsFromRegistry(dbgCA, SRegPath + '\' + TForm(TmpOwner).Name + '\q' + ClassName);
  end;
end;

destructor TfParents.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    SaveSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + TForm(TmpOwner).Name + '\q' + ClassName);
    SaveEhGridSettingsToRegistry(dbgCA, SRegPath + '\' + TForm(TmpOwner).Name + '\q' + ClassName);
  end;
  inherited;
end;


function TfParents.CheckData(id_Rel : integer): boolean;
begin
  Result := true;
  with cdsDates do
  begin
    First;
    while not Eof do
    begin
      if not (cdsCAParSSS.AsVariant = cdsDatesACTAMOUNT.AsInteger) then
      begin
        Windows.SetFocus(dbgCA.Handle);
        dbgCA.Col := 1;
        Result := false;
        break;
      end; 
      Next;
    end;
  end;
end;

procedure TfParents.aAddOwnerExecute(Sender: TObject);
var AID : integer;
    AName : String;
begin
  if ShowCASelector(AID, AName) then
  begin
    if (Fid_CA <> AID) and not cdsCAPar.Locate('id_Parent', AID, []) then
    begin
      cdsCAPar.Append;
      cdsCAPar.FieldByName('id_Parent').AsInteger := AID;
      cdsCAPar.FieldByName('id_Rel').AsInteger := cdsDatesID_REL2.AsInteger;
      cdsCAPar.FieldByName('NAME').AsString := AName;
      cdsCAPar.Post;
      dbgCA.Col := 1;
      Windows.SetFocus(dbgCA.Handle);
    end;
  end;
end;

procedure TfParents.aDelOwnerExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Do you realy want to delete owner?'), '?', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    cdsCAPar.Delete;
    CheckData(cdsDatesID_REL2.AsInteger);
  end;
end;

procedure TfParents.aRefreshGrpExecute(Sender: TObject);
begin
//
end;

procedure TfParents.cdsCAParAfterPost(DataSet: TDataSet);
begin
//  CheckData(cdsDatesID_REL2.AsInteger);
end;

procedure TfParents.dsCAParDataChange(Sender: TObject; Field: TField);
begin
  aShowOrgChart.Enabled := not cdsCAPar.IsEmpty;
  aGoOrg.Enabled := not cdsCAPar.IsEmpty;
  aDelOwner.Enabled := not cdsCAPar.IsEmpty;
end;

procedure TfParents.dbgCAGetFooterParams(Sender: TObject; DataCol,
  Row: Integer; Column: TColumnEh; AFont: TFont; var Background: TColor;
  var Alignment: TAlignment; State: TGridDrawState; var Text: String);
begin
  if cdsCAParSSS.AsVariant <> cdsDatesACTAMOUNT.AsInteger then
  begin
    AFont.Color := clRed;
  //  Background := clWindow;
  end
  else
    if cdsCAParSSS.AsVariant = cdsDatesACTAMOUNT.AsInteger then
      AFont.Color := clGreen;
end;

procedure TfParents.dbgCAKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = '.') or (Key = ',') then
    Key := DecimalSeparator;
    if (Key = #13) then
    begin
      if cdsCAPar.State = dsEdit then
        cdsCAPar.Post
      else
      begin
        with TDBGrideh(Sender) do
          if selectedindex < fieldcount - 1 then
            selectedindex := selectedindex + 1
          else
            selectedindex := 0;   
      end;
    end;
end;

procedure TfParents.SaveProp(ID_CA: integer);
var S : String;
    ID_REL : integer;
begin
  if ID_CA > 0 then
    FID_CA := ID_CA;
  S := 'delete from DW_RelItems where id_rel in (Select id_rel FROM DW_Rel where id_CA=' + IntToStr(Fid_CA) + ')';
  DM.ExecSQL(S);
  S := 'delete from DW_Rel where id_CA=' + IntToStr(Fid_CA);
  DM.ExecSQL(S);
  try
    cdsDates.First;

    while not cdsDates.Eof do
    begin
    //  if cdsDatesID_REL.IsNull then
      begin
        qDateadd.Parameters.ParamByName('id_CA').Value := FID_CA;
        qDateadd.Parameters.ParamByName('datefrom').Value := cdsDatesDATEFROM.Value;
        qDateadd.Parameters.ParamByName('ActAmount').Value := cdsDatesActAmount.Value;
        qDateadd.Parameters.ParamByName('ACTPRICE').Value := cdsDatesACTPRICE.Value;
        qDateadd.Parameters.ParamByName('ID_CUR').Value := cdsDatesID_CUR.Value;
        qDateadd.ExecSQL;
        ID_REL := DM.GetMaxID('select max(id_Rel) AS ID from DW_Rel');
      end;
    {  else
      begin
        ID_REL := cdsDatesID_REL.AsInteger;
        qDateEdit.Parameters.ParamByName('id_CA').Value := FID_CA;
        qDateEdit.Parameters.ParamByName('datefrom').Value := cdsDatesDATEFROM.Value;
        qDateEdit.ExecSQL;
      end; }
      with cdsCAPar do
      begin
        First;
        while not Eof do
        begin
          S := 'insert into DW_RelItems(id_Rel, id_Parent, APrc) VALUES(' + IntToStr(ID_REL)
            + ', ' + IntToStr(cdsCAParID_PARENT.AsInteger)
            + ', ' + StringReplace(FormatFloat('0.00', cdsCAParAPRC.AsFloat), ',', '.', []) + ')';
          DM.ExecSQL(S);
          Next;
        end;
      end;
      cdsDates.Next;
    end;
  except
  end;   
end;

procedure TfParents.dbgCAGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if Column.Field = cdsCAParAPRC then
  begin
    if cdsCAParSSS.AsVariant <> cdsDatesACTAMOUNT.AsInteger then
    begin
      AFont.Color := clRed;
    end
    else
   //   if (cdsCAParSSS.AsVariant = cdsDatesACTAMOUNT.AsInteger) then
   //     AFont.Color := clWindowText;
  end;
end;

procedure TfParents.aAddDateExecute(Sender: TObject);
var ADate: Variant;
    ActAmount : integer;
    ActPrice : Currency;
    id_Cur : Variant;
    CURNAME : String;
begin
  ADate := now;
  if InputBoxDate('', '', ADate, ActAmount, ActPrice, id_Cur, CURNAME) then
  begin
    if cdsDates.Locate('DATEFROM', ADate, []) then
    begin
      MessageBox(Handle, 'This date already inputed!', '', MB_OK + MB_ICONERROR);
      Abort;
    end;
    cdsDates.Append;
    cdsDatesACTAMOUNT.AsInteger := ActAmount;
    cdsDatesActPrice.AsVariant := ActPrice;
    cdsDatesid_Cur.AsVariant := id_Cur;
    cdsDatesCURNAME.AsString := CURNAME;
    
    cdsDatesDATEFROM.AsDateTime := ADate;
    cdsDatesID_REL2.AsInteger := -cdsDates.RecordCount - 1;
    cdsDates.Post;
  end;
end;

procedure TfParents.aEditDateExecute(Sender: TObject);
var ADate: Variant;
    ActAmount, ID_REL2 : integer;
    ActPrice : Currency;
    id_Cur : Variant;
    CURNAME : String;
begin
  ADate := cdsDatesDATEFROM.AsDateTime;
  ActAmount := cdsDatesACTAMOUNT.AsInteger;
  ActPrice := cdsDatesActPrice.AsFloat;
  id_Cur := cdsDatesid_Cur.AsVariant;
  ID_REL2 := cdsDatesID_REL2.AsInteger;

  if InputBoxDate('', '', ADate, ActAmount, ActPrice, id_Cur, CURNAME) then
  begin
    if cdsDates.Locate('DATEFROM', ADate, []) and (ID_REL2 <> cdsDatesID_REL2.AsInteger) then
    begin
      MessageBox(Handle, 'This date already inputed!', '', MB_OK + MB_ICONERROR);
      Abort;
    end;
    cdsDates.Edit;
    cdsDatesACTAMOUNT.AsInteger := ActAmount;
    cdsDatesActPrice.AsVariant := ActPrice;
    cdsDatesid_Cur.AsVariant := id_Cur;
    cdsDatesCURNAME.AsString := CURNAME;

    cdsDatesDATEFROM.AsDateTime := ADate;
    cdsDates.Post;
  end;
end;

procedure TfParents.aDelDateExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Do you realy want to delete data?'), '?', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    cdsDates.Delete;
    while not cdsCAPar.IsEmpty do
      cdsCAPar.Delete;
  //  CheckData(qDatesID_REL.AsInteger);
  end;
end;

procedure TfParents.CloseAll;
begin
  cdsCAPar.Close;
  cdsDates.Close;
end;

procedure TfParents.aGoOrgExecute(Sender: TObject);
begin
  ShowCAList(cdsCAParID_PARENT.AsInteger, cdsCAParISGRP.AsInteger);//
end;

procedure TfParents.cdsDatesACTPRICEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   Text := FormatFloat('0.####', cdsDatesACTPRICE.AsFloat) + ' ' + cdsDatesCURNAME.AsString;
end;

end.
