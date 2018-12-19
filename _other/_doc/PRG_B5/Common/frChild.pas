unit frChild;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, Provider, DBClient, ImgList,
  ActnList, ToolWin, ComCtrls, DBGridEh, Menus, AdvSplitter, AdvMenus;

type
  TfChild = class(TFrame)
    qDates2: TADOQuery;
    qDatesDATEFROM: TDateTimeField;
    dsDates: TDataSource;
    Splitter1: TAdvSplitter;
    dsCAPar: TDataSource;
    qCAPar2: TADOQuery;
    qCAParID_RELITEMS: TBCDField;
    qCAParID_REL: TBCDField;
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
    Panel1: TPanel;
    dbgCA: TDBGridEh;
    dspDates: TDataSetProvider;
    cdsDates: TClientDataSet;
    cdsDatesDATEFROM: TDateTimeField;
    Panel2: TPanel;
    dbgDates: TDBGrid;
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
    qCAPar2ID_CA: TBCDField;
    cdsCAParID_CA: TBCDField;
    qCAPar2DATEFROM: TDateTimeField;
    cdsCAParDATEFROM: TDateTimeField;
    PopupMenu1: TAdvPopupMenu;
    Gotoorganization1: TMenuItem;
    ShowOrgChart1: TMenuItem;
    qCAPar2ISGRP: TBCDField;
    cdsCAParISGRP: TBCDField;
    qCAPar2ACTAMOUNT: TBCDField;
    cdsCAParACTAMOUNT: TBCDField;
    aGoOrg: TAction;
    aShowOrgChart: TAction;
    procedure dsDatesDataChange(Sender: TObject; Field: TField);
    procedure dsCAParDataChange(Sender: TObject; Field: TField);
    procedure aDelDateExecute(Sender: TObject);
    procedure aGoOrgExecute(Sender: TObject);
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

procedure TfChild.CloseAll;
begin
  cdsCAPar.Close;
  cdsDates.Close;
end;

procedure TfChild.initialize(ID_CA: integer);
begin
        cdsDates.IndexDefs.Clear;
        cdsDates.IndexDefs.Add('ixDATEFROM', 'DATEFROM', [ixDescending]);
        cdsDates.IndexName := 'ixDATEFROM';

  FID_CA := ID_CA;
  cdsDates.Close;
  cdsDates.Params.ParamByName('id_CA').Value := FID_CA;
  cdsDates.Open;
  cdsCAPar.Close;
  cdsCAPar.Params.ParamByName('id_CA').Value := FID_CA;
  cdsCAPar.Open;
end;

procedure TfChild.dsDatesDataChange(Sender: TObject; Field: TField);
begin
  cdsCAPar.Filter := 'DateFrom=' + '''' + DateToStr( cdsDatesDateFrom.AsDateTime) + '''';
  cdsCAPar.Filtered := true;
  aGoOrg.Enabled := not cdsCAPar.IsEmpty;
  aShowOrgChart.Enabled := aGoOrg.Enabled;
//  aAddDate.Enabled := not cdsDates.IsEmpty;
end;

constructor TfChild.Create(AOwner: TCOmponent);
var TmpOwner: TCustomForm;
begin
  inherited;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
    LoadEhGridSettingsFromRegistry(dbgCA, SRegPath + '\' + TForm(TmpOwner).Name + '\q' + ClassName);
  end;
end;

destructor TfChild.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    SaveSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
    SaveEhGridSettingsToRegistry(dbgCA, SRegPath + '\' + TForm(TmpOwner).Name + '\q' + ClassName);
  end;
  inherited;
end;


function TfChild.CheckData(id_Rel : integer): boolean;
begin
{  if qDatesID_REL.AsInteger = id_Rel then
  begin
    if cdsCAParSSS.AsVariant <> 100 then
  end;  }
end;

procedure TfChild.dsCAParDataChange(Sender: TObject; Field: TField);
begin
  aShowOrgChart.Enabled := not cdsCAPar.IsEmpty;
  aGoOrg.Enabled := not cdsCAPar.IsEmpty;
end;

procedure TfChild.SaveProp(ID_CA: integer);
 begin
 end;

procedure TfChild.aDelDateExecute(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Do you realy want to delete data?'), '?', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    cdsDates.Delete;
    while not cdsCAPar.IsEmpty do
      cdsCAPar.Delete;
  //  CheckData(qDatesID_REL.AsInteger);
  end;
end;

procedure TfChild.aGoOrgExecute(Sender: TObject);
begin
  ShowCAList(cdsCAParID_Ca.AsInteger, cdsCAParISGRP.AsInteger);//

end;

end.
