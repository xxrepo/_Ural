unit uCurList;

interface

uses
  Windows, Messages, SysUtils, {$IFDEF VER150} Variants,{$ENDIF}  Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ActnList, ADODB, Provider, DB, DBClient, Grids,
  DBGrids, ComCtrls, ToolWin, Menus, AdvMenus;

type
  TCurList = class(TForm)
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
  CurList: TCurList;
procedure ShowCurList;

implementation

uses uDM;

{$R *.dfm}

procedure ShowCurList;
begin
  DM.Rights_GetUserRights(7);
  if not Assigned(CurList) then
  begin
    CurList := TCurList.Create(Application.MainForm);
    CurList.WindowState := wsMaximized;
    CurList.Initialize;
  end
  else
  begin
    CurList.WindowState := wsMaximized;
    CurList.BringToFront;
  end;
end;


procedure TCurList.Initialize;
var i : integer;
begin
  aRefreshe.Execute;

  
  dsDataDataChange(nil, nil);
end;

procedure TCurList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCurList.FormDestroy(Sender: TObject);
begin
  CurList := nil;
end;

destructor TCurList.Destroy;
begin
  inherited;

end;


procedure TCurList.aNewExecute(Sender: TObject);
var S : String;
    id : integer;
begin
  if InputQuery('New currency', 'Name', S) then
  begin
    if trim(S) <> '' then
    begin
      DM.ExecSQL('insert into dw_Cur(CurName) VALUES(' + '''' + S + '''' + ' )');
      ID := DM.GetMaxID('select max(id_Cur) AS ID FROM dw_Cur');
      cdsData.Close;
      cdsData.Open;
      cdsData.Locate('id_Cur', ID, []);
    end;
  end;
end;

procedure TCurList.aEditExecute(Sender: TObject);
var S : String;
    id : integer;
begin
  S := cdsData.FieldByName('CurName').AsString;
  ID := cdsData.FieldByName('id_Cur').AsInteger;
  if InputQuery('Edit currency', 'Name', S) then
  begin
    if trim(S) <> '' then
    begin
      DM.ExecSQL('UPDATE dw_Cur SET CurName = ' + '''' + S + '''' + ' WHERE id_Cur = ' + cdsData.FieldByName('id_Cur').AsString);
      cdsData.Close;
      cdsData.Open;
      cdsData.Locate('id_Cur', ID, []);
    end;
  end;
end;

procedure TCurList.aDelExecute(Sender: TObject);
var S2 : String;
begin
  if MessageBox(Handle, PChar('Do you realy want to delete item?'), '?', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    S2 := 'UPDATE dw_Cur SET Deleted=1 WHERE id_Cur=' + cdsData.FieldByName('id_Cur').AsString;

    DM.ExecSQL(S2);
    aRefreshe.Execute;
  end;
end;

procedure TCurList.aRefresheExecute(Sender: TObject);
var
    id, i : integer;
begin
  if cdsData.Active then
    ID := cdsData.FieldByName('id_Cur').AsInteger;
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
  cdsData.Locate('id_Cur', ID, []);
end;

procedure TCurList.aUpExecute(Sender: TObject);
begin
  MoveRec(-1);
end;

procedure TCurList.MoveRec(APos: integer);
var X, ID : integer;
begin
  with cdsData do
  begin
    DisableControls;
    try
      ID := cdsData.FieldByName('id_Cur').AsInteger;
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
        DM.ExecSQL('UPDATE dw_Cur SET OrderID = ' + IntToStr(cdsData.FieldByName('OrderID').AsInteger) + ' WHERE id_Cur = ' + cdsData.FieldByName('id_Cur').AsString);
        Next;
      end;
    finally
      aRefreshe.Execute;
      cdsData.Locate('id_Cur', ID, []);
      EnableControls;
    end;
  end;

end;


procedure TCurList.aDownExecute(Sender: TObject);
begin
  MoveRec(1);
end;

procedure TCurList.dsDataDataChange(Sender: TObject; Field: TField);
begin
  aEdit.Enabled := not cdsData.IsEmpty;
  aDel.Enabled := not cdsData.IsEmpty;
  aUp.Enabled := not cdsData.IsEmpty and (cdsData.RecNo > 1);
  aDown.Enabled := not cdsData.IsEmpty and (cdsData.RecNo < cdsData.RecordCount);
end;

end.
