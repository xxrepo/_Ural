unit frObjList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, ADODB, ActnList, ImgList, foMyFunc, ShellApi, Grids,
  DBGrids, RXDBCtrl, ComCtrls, ToolWin, Menus, {$IFDEF VER150} Variants,{$ENDIF} StdCtrls, AdvMenus;

type
  TfObjList = class(TFrame)
    qryFile: TADOQuery;
    dsFile: TDataSource;
    ImageList: TImageList;
    ActionList1: TActionList;
    aAddFile: TAction;
    aEditFile: TAction;
    aDelFile: TAction;
    ToolBar3: TToolBar;
    ToolButton15: TToolButton;
    ToolButton17: TToolButton;
    RxDBGrid3: TRxDBGrid;
    pmFile: TAdvPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem6: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N1: TMenuItem;
    ImageList1: TImageList;
    aVizaSet: TAction;
    aVizaUnSet: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    qryFileNAME: TWideStringField;
    qryFileFCOMMENT: TWideStringField;
    ToolButton1: TToolButton;
    qryIns: TADOQuery;
    BCDField1: TBCDField;
    StringField1: TWideStringField;
    StringField2: TWideStringField;
    qryUPD: TADOQuery;
    BCDField2: TBCDField;
    StringField3: TWideStringField;
    StringField4: TWideStringField;
    qryFileID_DOC: TBCDField;
    qryFileDOCVID: TBCDField;
    qryFileAPLACE: TWideStringField;
    qryFileFDATE: TDateTimeField;
    qryFileID_CA: TBCDField;
    qryFileDATECREATE: TDateTimeField;
    qryFileID_DOCBASE: TBCDField;
    qryFileAMOUNT: TBCDField;
    procedure aAddFileExecute(Sender: TObject);
    procedure aEditFileExecute(Sender: TObject);
    procedure aDelFileExecute(Sender: TObject);
    procedure dsFileDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure aToBuffExecute(Sender: TObject);
    procedure aVizaSetExecute(Sender: TObject);
    procedure aVizaUnSetExecute(Sender: TObject);
  private
    FID_CA, Fid_DocBase, FDocVid : integer;
    ASort : String;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;

    procedure Initialize(AID_CA, Aid_DocBase, DocVid : integer);
    procedure CloseAll;
    procedure GetSett;
  end;

implementation

uses uDM, uInputQuery_File, InputQuery_Obj;

{$R *.dfm}

{ TfByObjFileList }

procedure TfObjList.CloseAll;
begin
  qryFile.Close
end;

procedure TfObjList.Initialize(AID_CA, Aid_DocBase, DocVid: integer);
var XXX : integer;
begin
  FID_CA := AID_CA;
  Fid_DocBase := Aid_DocBase;
  FDocVid := DocVid;
  
  with qryFile do
  begin
    Close;
    Parameters.ParamByName('ID_CA').Value := FID_CA;
    Parameters.ParamByName('id_DocBase').Value := Fid_DocBase;
    Parameters.ParamByName('DocVid').Value := FDocVid;
    Open;
  end;
  aAddFile.Enabled := (FID_CA > 0) or (Fid_DocBase > 0);

end;

procedure TfObjList.aAddFileExecute(Sender: TObject);
var AName, Placed, Comment : string;
  Amount : integer;
begin
  if ShowInputQuery_Obj(AName, Placed, Comment, Amount) then
  begin
    with qryIns do
    begin
      Close;
      Parameters.ParamByName('ID_CA').Value := FID_CA;
      Parameters.ParamByName('DocVid').Value := FDocVid;
      Parameters.ParamByName('id_DocBase').Value := Fid_DocBase;
      Parameters.ParamByName('FComment').Value := Comment;
      Parameters.ParamByName('Name').Value := AName;
      Parameters.ParamByName('APlace').Value := Placed;
      Parameters.ParamByName('Amount').Value := Amount;

      if Parameters.ParamByName('ID_CA').Value = -1 then
        Parameters.ParamByName('ID_CA').Value := Null;
      if Parameters.ParamByName('id_DocBase').Value = -1 then
        Parameters.ParamByName('id_DocBase').Value := Null;

      try
        Screen.Cursor := crSQLWait;
        ExecSQL;
      finally
        Screen.Cursor := crDefault;
        dsFile.DataSet.Close;
        dsFile.DataSet.Open;
      end;
    end;
  end;  
end;

procedure TfObjList.aEditFileExecute(Sender: TObject);
var AName, Placed, Comment : string;
  Amount : integer;
begin
  AName := qryFileNAME.AsString;
  Placed := qryFileAPLACE.AsString;
  Comment := qryFileFComment.AsString;
  Amount := qryFileAmount.AsInteger;
  if ShowInputQuery_Obj(AName, Placed, Comment, Amount) then
  begin
    with qryUPD do
    begin
      Close;
      Parameters.ParamByName('id_DOC').Value := qryFileID_DOC.AsInteger;
      Parameters.ParamByName('FComment').Value := Comment;
      Parameters.ParamByName('Name').Value := AName;
      Parameters.ParamByName('APlace').Value := Placed;
      Parameters.ParamByName('Amount').Value := Amount;



      try
        Screen.Cursor := crSQLWait;
        ExecSQL;
      finally
        Screen.Cursor := crDefault;
        dsFile.DataSet.Close;
        dsFile.DataSet.Open;
      end;
    end;
  end;  
end;

procedure TfObjList.aDelFileExecute(Sender: TObject);
var S : String;
    XXX : integer;
begin

  if MessageBox(Handle, PChar('Delete document "' + dsFile.DataSet.FieldByName('NAME').AsString + '"?'), ' ', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    S := 'DELETE FROM DW_Doc WHERE id_DOC=' + dsFile.DataSet.FieldByName('id_DOC').AsString;
    if DM.ExecSQL(S) then
    begin
      dsFile.DataSet.Close;
      dsFile.DataSet.Open;
    end;
  end;
end;

procedure TfObjList.dsFileDataChange(Sender: TObject; Field: TField);
begin
  aEditFile.Enabled := not dsFile.DataSet.IsEmpty;
  aDelFile.Enabled := not dsFile.DataSet.IsEmpty;// and dsFile.DataSet.FieldByName('CheckDate').IsNull;
end;

procedure TfObjList.RxDBGrid3DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aEditFile.Execute;
end;

procedure TfObjList.GetSett;
var      TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid3, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName + Owner.ClassName + Inttostr(Tag));
  end;
end;


constructor TfObjList.Create(AOwner: TComponent);
var TmpOwner: TCustomForm;
begin
  inherited;
end;

destructor TfObjList.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid3, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName + Owner.ClassName + Inttostr(Tag));
  end;
  inherited;
end;

procedure TfObjList.aToBuffExecute(Sender: TObject);
begin
//*
end;

procedure TfObjList.aVizaSetExecute(Sender: TObject);
begin
{  if MessageBox(Handle, PChar('Утвердить "' + dsFile.DataSet.FieldByName('Name').AsString + '"?'), 'Подтвердите утверждение', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  if DM.SetViza(FEObjType, dsFile.DataSet.FieldByName('id_File').AsInteger, true, true) then
  begin
    TADOQuery(dsFile.DataSet).Close;
    TADOQuery(dsFile.DataSet).Open;
  end;}
end;

procedure TfObjList.aVizaUnSetExecute(Sender: TObject);
begin
 { if MessageBox(Handle, PChar('Снять утверждение с "' + dsFile.DataSet.FieldByName('Name').AsString + '"?'), 'Подтвердите снятие утверждения', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  if DM.SetViza(FEObjType, dsFile.DataSet.FieldByName('id_File').AsInteger, false, true) then
  begin
    TADOQuery(dsFile.DataSet).Close;
    TADOQuery(dsFile.DataSet).Open;
  end;}
end;

end.
