unit uFTList;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF VER150} Variants,{$ENDIF}  Classes, Graphics, Controls, Forms,
  Dialogs, frCA, ImgList, ActnList, ADODB, Provider, DB, DBClient, Grids,
  DBGrids, ComCtrls, ToolWin, Menus, AdvMenus;

type
  TFTList = class(TForm)
    ActionList1: TActionList;
    aNew: TAction;
    ilMenu: TImageList;
    aEdit: TAction;
    aDel: TAction;
    aRefreshe: TAction;
    aUp: TAction;
    aDown: TAction;
    cdsData: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    qQQQ: TADOQuery;
    dsData: TDataSource;
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    PopupMenu1: TAdvPopupMenu;
    New1: TMenuItem;
    Edit1: TMenuItem;
    aDel1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure aNewExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefresheExecute(Sender: TObject);
    procedure aUpExecute(Sender: TObject);
    procedure aDownExecute(Sender: TObject);
    procedure dsDataDataChange(Sender: TObject; Field: TField);
  private
    procedure MoveRec(APos: integer);
    { Private declarations }
  public
    procedure Initialize;
    destructor Destroy; override;
  end;

var
  FTList: TFTList;
procedure ShowFTList;

implementation

uses uDM;

{$R *.dfm}

procedure ShowFTList;
begin
  DM.Rights_GetUserRights(7);
  if not Assigned(FTList) then
  begin
    FTList := TFTList.Create(Application.MainForm);
    FTList.WindowState := wsMaximized;
    FTList.Initialize;
  end
  else
  begin
    FTList.WindowState := wsMaximized;
    FTList.BringToFront;
  end;
end;


{ TDivisionTree }

procedure TFTList.Initialize;
var i : integer;
begin
  aRefreshe.Execute;

  
  dsDataDataChange(nil, nil);
end;

procedure TFTList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFTList.FormDestroy(Sender: TObject);
begin
  FTList := nil;
end;

destructor TFTList.Destroy;
begin
  inherited;

end;


procedure TFTList.aNewExecute(Sender: TObject);
var S : String;
    id : integer;
begin
  if InputQuery('New type', 'Name', S) then
  begin
    if trim(S) <> '' then
    begin
      DM.ExecSQL('insert into dw_FT(FTName) VALUES(' + '''' + S + '''' + ' )');
      ID := DM.GetMaxID('select max(id_FT) AS ID FROM dw_FT');
      cdsData.Close;
      cdsData.Open;
      cdsData.Locate('id_FT', ID, []);
    end;
  end;
end;

procedure TFTList.aEditExecute(Sender: TObject);
var S : String;
    id : integer;
begin
  S := cdsData.FieldByName('FTName').AsString;
  ID := cdsData.FieldByName('id_FT').AsInteger;
  if InputQuery('Edit type', 'Name', S) then
  begin
    if trim(S) <> '' then
    begin
      DM.ExecSQL('UPDATE dw_FT SET FTName = ' + '''' + S + '''' + ' WHERE id_FT = ' + cdsData.FieldByName('id_FT').AsString);
      cdsData.Close;
      cdsData.Open;
      cdsData.Locate('id_FT', ID, []);
    end;
  end;
end;

procedure TFTList.aDelExecute(Sender: TObject);
var S2 : String;
begin
  if MessageBox(Handle, PChar('Do you realy want to delete item?'), '?', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    S2 := 'UPDATE dw_FT SET Deleted=1 WHERE id_FT=' + cdsData.FieldByName('id_FT').AsString;

    DM.ExecSQL(S2);
    aRefreshe.Execute;
  end;
end;

procedure TFTList.aRefresheExecute(Sender: TObject);
var
    id, i : integer;
begin
  if cdsData.Active then
    ID := cdsData.FieldByName('id_FT').AsInteger;
  cdsData.Close;
  cdsData.Open;
  with cdsData do
  begin
      IndexDefs.Clear;
      IndexDefs.Add('ixOrdNum', 'OrderID', [ixCaseInsensitive]);
      IndexName := 'ixOrdNum';
      First;
      i := 0;
      while not Eof do
      begin
        Edit;
        cdsData.FieldByName('OrderID').AsInteger := i;
        inc(i);
        Post;

        Next;
      end;
  end;
  cdsData.Locate('id_FT', ID, []);
end;

procedure TFTList.aUpExecute(Sender: TObject);
begin
  MoveRec(-1);
end;

procedure TFTList.MoveRec(APos: integer);
var X, ID : integer;
begin
  with cdsData do
  begin
    DisableControls;
    try
      ID := cdsData.FieldByName('id_FT').AsInteger;
      X := -(cdsData.FieldByName('OrderID').AsInteger + APos);
      Edit;
      cdsData.FieldByName('OrderID').AsInteger := X;
      Post;
       
      if Locate('OrderID', -X, [loCaseInsensitive, loPartialKey]) then
      begin
        Edit;
        cdsData.FieldByName('OrderID').AsInteger := cdsData.FieldByName('OrderID').AsInteger - APos;
        Post;
      end;
      if Locate('OrderID', X, [loCaseInsensitive, loPartialKey]) then
      begin
        Edit;
        cdsData.FieldByName('OrderID').AsInteger := -cdsData.FieldByName('OrderID').AsInteger;
        Post;
      end;

      First;
      while not Eof do
      begin
        DM.ExecSQL('UPDATE dw_FT SET OrderID = ' + IntToStr(cdsData.FieldByName('OrderID').AsInteger) + ' WHERE id_FT = ' + cdsData.FieldByName('id_FT').AsString);
        Next;
      end;
    finally
      aRefreshe.Execute;
      cdsData.Locate('id_FT', ID, []);
      EnableControls;
    end;
  end;

end;


procedure TFTList.aDownExecute(Sender: TObject);
begin
  MoveRec(1);
end;

procedure TFTList.dsDataDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsData.IsEmpty;
  aDel.Enabled := not cdsData.IsEmpty;
  aUp.Enabled := not cdsData.IsEmpty and (cdsData.RecNo > 1);
  aDown.Enabled := not cdsData.IsEmpty and (cdsData.RecNo < cdsData.RecordCount);
end;

end.
