unit frByObjFileList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, ADODB, ActnList, ImgList, foMyFunc, ShellApi, Grids,
  DBGrids, RXDBCtrl, ComCtrls, ToolWin, Menus, {$IFDEF VER150} Variants,{$ENDIF} StdCtrls, AdvMenus,
  AdvToolBar;

type
  TfByObjFileList = class(TFrame)
    qryFile: TADOQuery;
    dsFile: TDataSource;
    ImageList: TImageList;
    ActionList1: TActionList;
    aAddFile: TAction;
    aEditFile: TAction;
    aDelFile: TAction;
    aOpenFile: TAction;
    ToolBar3: TToolBar;
    ToolButton15: TToolButton;
    ToolButton17: TToolButton;
    ToolButton25: TToolButton;
    RxDBGrid3: TRxDBGrid;
    pmFile: TAdvPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem6: TMenuItem;
    N7: TMenuItem;
    N1: TMenuItem;
    SaveDialog1: TSaveDialog;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    aSaveFile: TAction;
    aVizaSet: TAction;
    aVizaUnSet: TAction;
    N2: TMenuItem;
    Button1: TButton;
    qryUPDFile: TADOQuery;
    qryFileID_FILE: TBCDField;
    qryFileNAME: TWideStringField;
    qryFileFCOMMENT: TWideStringField;
    qGetPic: TADOQuery;
    AdvDockPanel1: TAdvDockPanel;
    ToolBar2: TAdvToolBar;
    AdvToolBarButton1: TAdvToolBarButton;
    AdvToolBarButton2: TAdvToolBarButton;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    AdvToolBarSeparator2: TAdvToolBarSeparator;
    AdvToolBarButton3: TAdvToolBarButton;
    AdvToolBarSeparator3: TAdvToolBarSeparator;
    AdvToolBarButton4: TAdvToolBarButton;
    procedure aAddFileExecute(Sender: TObject);
    procedure aEditFileExecute(Sender: TObject);
    procedure aDelFileExecute(Sender: TObject);
    procedure aOpenFileExecute(Sender: TObject);
    procedure dsFileDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure aSaveFileExecute(Sender: TObject);
    procedure RxDBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure aToBuffExecute(Sender: TObject);
    procedure aVizaSetExecute(Sender: TObject);
    procedure aVizaUnSetExecute(Sender: TObject);
  private
    FID_CA, Fid_DocBase : integer;
    ASort : String;
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;

    procedure Initialize(AID_CA, Aid_DocBase : integer);
    procedure CloseAll;
  end;

implementation

uses uDM, uInputQuery_File;

{$R *.dfm}

{ TfByObjFileList }

procedure TfByObjFileList.CloseAll;
begin
  qryFile.Close
end;

procedure TfByObjFileList.Initialize(AID_CA, Aid_DocBase: integer);
var XXX : integer;
begin
  FID_CA := AID_CA;
  Fid_DocBase := Aid_DocBase;

  
  with qryFile do
  begin
    Close;
    Parameters.ParamByName('ID_CA').Value := FID_CA;
    Parameters.ParamByName('id_DocBase').Value := Fid_DocBase;
    Open;
  end;
  aAddFile.Enabled := (FID_CA > 0) or (Fid_DocBase > 0);

end;

procedure TfByObjFileList.aAddFileExecute(Sender: TObject);
var AName, AFile: string;
    S : String;

  fstm: TFileStream;
  stm: TStream;
  FSize, XXX : integer;
  QRY : TADOQuery;
begin
  if InputQuery_File(AName, AFile) then
  begin
    with qryUPDFile do
    begin
      Close;
      Parameters.ParamByName('ID_CA').Value := FID_CA;
      if Parameters.ParamByName('ID_CA').Value = -1 then
        Parameters.ParamByName('ID_CA').Value := Null;

      Parameters.ParamByName('id_DocBase').Value := Fid_DocBase;
      if Parameters.ParamByName('id_DocBase').Value = -1 then
        Parameters.ParamByName('id_DocBase').Value := Null;

      Parameters.ParamByName('FComment').Value := AName;
      Parameters.ParamByName('Name').Value := AFile;
      Parameters.ParamByName('BODY').LoadFromFile(AFile, ftBlob);
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

procedure TfByObjFileList.aEditFileExecute(Sender: TObject);
begin
//*
end;

procedure TfByObjFileList.aDelFileExecute(Sender: TObject);
var S : String;
    XXX : integer;
begin

  if MessageBox(Handle, PChar('Delete file "' + dsFile.DataSet.FieldByName('NAME').AsString + '"?'), ' ', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    S := 'DELETE FROM DW_FILE WHERE id_File=' + dsFile.DataSet.FieldByName('id_File').AsString;
    if DM.ExecSQL(S) then
    begin
      dsFile.DataSet.Close;
      dsFile.DataSet.Open;
    end;
  end;
end;

procedure TfByObjFileList.aOpenFileExecute(Sender: TObject);
var S : String;
begin
  with qGetPic do
  begin
    try
      Screen.Cursor := crSQLWait;
      Parameters.ParamByName('id_File').Value := dsFile.DataSet.FieldByName('id_File').AsInteger;
      Open;
      S := DM.GetTmpDirName + ExtractFileName(dsFile.DataSet.FieldByName('NAme').AsString);
      TBlobField(FieldByName('Body')).SaveToFile(S);
    finally
      Screen.Cursor := crDefault;
      Close;
    end;
    ShellExecute(0, 'open', PChar(S), nil, nil, SW_SHOW);
  end;
end;

procedure TfByObjFileList.dsFileDataChange(Sender: TObject; Field: TField);
begin
  aEditFile.Enabled := not dsFile.DataSet.IsEmpty;
  aDelFile.Enabled := not dsFile.DataSet.IsEmpty;// and dsFile.DataSet.FieldByName('CheckDate').IsNull;
  aOpenFile.Enabled := not dsFile.DataSet.IsEmpty;
  aSaveFile.Enabled := not dsFile.DataSet.IsEmpty;

end;

procedure TfByObjFileList.RxDBGrid3DblClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=Mouse.CursorPos;
  P:=THackGrid(Sender).ScreenToClient(P);
  if P.y<=THackGrid(Sender).RowHeights[0] then
    Exit;
 aOpenFile.Execute;
end;

procedure TfByObjFileList.aSaveFileExecute(Sender: TObject);
var S : String;
begin
  S := dsFile.DataSet.FieldByName('Name').AsString;
  SaveDialog1.FileName := S;
  if SaveDialog1.Execute then
  begin
  with qryFile do
    begin
      Screen.Cursor := crSQLWait;
      try
        Parameters.ParamByName('id_File').Value := dsFile.DataSet.FieldByName('id_File').AsInteger;
        Open;
        TBlobField(FieldByName('Body')).SaveToFile(SaveDialog1.FileName);
        MessageBox(Handle, PChar('File "' + SaveDialog1.FileName + '" saved succesfully'), 'Ок', MB_ICONINFORMATION + mb_Ok);

      finally
        Screen.Cursor := crDefault;
        Close;
      end;
    end;
  end;
end;

procedure TfByObjFileList.RxDBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var IconIndex : word;
    S, s2 : String;
    R: TRect;
    ImgIndex : integer;
    SmallIcon : HICON;
begin
  if gdSelected in State then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clHighlight;
    TDBGrid(Sender).Canvas.FillRect(Rect);
  end
  else
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clWindow;
    TDBGrid(Sender).Canvas.FillRect(Rect);
  end;
  if (Column.Field is TDateTimeField) and (not Column.Field.IsNull) then
    S := FormatDateTime('yyyy-mm-dd hh:nn', Column.Field.AsDateTime)
  else
    S := Column.Field.AsString;
  R := Rect;
  if UpperCase(Column.Field.FieldName) = 'NAME' then
  begin
    R.Top := R.Top + 2;
    S2 := UpperCase(ExtractFileExt(Column.Field.AsString));

    GetAssociatedIcon(S2, nil, @SmallIcon);
    if SmallIcon <> 0 then
      DrawIconEx(RxDBGrid3.Canvas.Handle, R.Left, R.Top, SmallIcon, 16, 16, 0, RxDBGrid3.Canvas.Brush.Handle, DI_NORMAL);
    R.Left := R.Left + 16 + 5;
    DrawText((Sender as TDBGrid).Canvas.Handle, PChar(S), -1, R, DT_LEFT or DT_END_ELLIPSIS);
    DestroyIcon(SmallIcon);
   end
  else
  begin
    if (Column.Field is TDateTimeField) and (not Column.Field.IsNull) then
    begin
      R.Top := R.Top + 2;
      DrawText((Sender as TDBGrid).Canvas.Handle, PChar(S), -1, R, DT_LEFT or DT_END_ELLIPSIS)
    end
    else
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;   

end;

constructor TfByObjFileList.Create(AOwner: TComponent);
var TmpOwner: TCustomForm;
begin
  inherited;           
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid3, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName + Owner.ClassName);
  end;
end;

destructor TfByObjFileList.Destroy;
var TmpOwner: TCustomForm;
begin
  TmpOwner := GetControlOwner(self);
  if TmpOwner is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid3, SRegPath + '\' + TForm(TmpOwner).Name + '\' + ClassName + Owner.ClassName);
  end;
  inherited;
end;

procedure TfByObjFileList.aToBuffExecute(Sender: TObject);
begin
//*
end;

procedure TfByObjFileList.aVizaSetExecute(Sender: TObject);
begin
{  if MessageBox(Handle, PChar('Утвердить "' + dsFile.DataSet.FieldByName('Name').AsString + '"?'), 'Подтвердите утверждение', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  if DM.SetViza(FEObjType, dsFile.DataSet.FieldByName('id_File').AsInteger, true, true) then
  begin
    TADOQuery(dsFile.DataSet).Close;
    TADOQuery(dsFile.DataSet).Open;
  end;}
end;

procedure TfByObjFileList.aVizaUnSetExecute(Sender: TObject);
begin
 { if MessageBox(Handle, PChar('Снять утверждение с "' + dsFile.DataSet.FieldByName('Name').AsString + '"?'), 'Подтвердите снятие утверждения', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  if DM.SetViza(FEObjType, dsFile.DataSet.FieldByName('id_File').AsInteger, false, true) then
  begin
    TADOQuery(dsFile.DataSet).Close;
    TADOQuery(dsFile.DataSet).Open;
  end;}
end;

end.
