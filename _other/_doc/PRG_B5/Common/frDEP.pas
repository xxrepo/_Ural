unit frDEP;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ActnList, RXCtrls, ComCtrls, ToolWin, Grids, DBGridEh, Menus,
  DBClient, Provider, Db, ADODB, StdCtrls, DBCtrls, ExtCtrls,
  frByObjFileList, frObjList, AdvMenus;

type
  TfDEP = class(TFrame)
    ImageList: TImageList;
    ActionList1: TActionList;
    qDocList: TADOQuery;
    dsPMList: TDataSource;
    DataSetProvider1: TDataSetProvider;
    cdsDep: TClientDataSet;
    pmOper: TAdvPopupMenu;
    Pending1: TMenuItem;
    RxDBGrid1: TDBGridEh;
    aGoOrg: TAction;
    qDocListID_CA: TBCDField;
    qDocListNAME: TWideStringField;
    qDocListADDR: TWideStringField;
    qDocListID_ICONS: TBCDField;
    qDocListDIRECTOR: TWideStringField;
    qDocListBUH: TWideStringField;
    cdsDepID_CA: TBCDField;
    cdsDepNAME: TWideStringField;
    cdsDepADDR: TWideStringField;
    cdsDepID_ICONS: TBCDField;
    cdsDepDIRECTOR: TWideStringField;
    cdsDepBUH: TWideStringField;
    cdsDepICN: TIntegerField;
    qDocListISGRP: TBCDField;
    cdsDepISGRP: TBCDField;
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarkerEh;
      IsDown: Boolean);
    procedure RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure dsPMListDataChange(Sender: TObject; Field: TField);
    procedure aGoOrgExecute(Sender: TObject);
  private
    Fid_DocType, Fid_CA : integer;
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure initialize(PID : integer = -1);

    procedure CloseAll;
  end;

implementation

uses uDM, foMyFunc, foMyFuncEh, uDocProp, uCAList, uArcProp;

{$R *.DFM}

procedure TfDEP.CloseAll;
begin
  cdsDep.Close
end;

procedure TfDEP.RxDBGrid1GetBtnParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarkerEh;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarkerEh(Column.Field);

end;

procedure TfDEP.RxDBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  ReOrderCDSEh(Column, '');

end;

procedure TfDEP.initialize(PID : integer);
var
      AID, i : integer;
begin
  with cdsDep do
  begin
    Close;
    Params.ParamByName('PID').Value := PID;
    Open;
    try
      First;
      while not Eof do
      begin
        if cdsDep.FieldByName('ID_ICONS').AsInteger > 0 then
        begin
          i := DM.IconIn(cdsDep.FieldByName('ID_ICONS').AsInteger, nil, ImageList);
          if i > 0 then
          begin
            Edit;
            cdsDep.FieldByName('ICN').AsInteger := i;
            Post;
          end;
        end;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
end;

procedure TfDEP.dsPMListDataChange(Sender: TObject; Field: TField);
begin
  aGoOrg.Enabled := not cdsDep.IsEmpty;
end;

constructor TfDEP.Create(AOwner: TCOmponent);
var TmpOwner: TCustomForm;
begin
  inherited;
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadEhGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
end;

destructor TfDEP.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    SaveEhGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName);
  end;
  inherited;

end;


procedure TfDEP.aGoOrgExecute(Sender: TObject);
begin
  ShowCAList(cdsDepID_CA.AsInteger, cdsDepISGRP.AsInteger);//
end;

end.
