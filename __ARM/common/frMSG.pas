unit frMSG;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, ImgList, Menus, Db, DBClient, Grids,
  DBGrids, RXDBCtrl, RXCtrls, StdCtrls, Mask, ToolEdit, ExtCtrls, foMyFunc,
  Registry;

type
  TfMSG = class(TFrame)
    ilMenu: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ActionList1: TActionList;
    aNew: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    RxDBGrid1: TRxDBGrid;
    cdsMSG: TClientDataSet;
    DataSourceCurrency: TDataSource;
    PopupMenu1: TPopupMenu;
    Action11: TMenuItem;
    N1: TMenuItem;
    cdsMSGid_Msg: TAutoIncField;
    cdsMSGBody: TStringField;
    cdsMSGDateCreate: TDateTimeField;
    cdsMSGid_User: TIntegerField;
    cdsMSGWasRead: TBooleanField;
    cdsMSGRepBody: TStringField;
    cdsMSGid_State: TIntegerField;
    cdsMSGStateName: TStringField;
    cdsMSGDateClose: TDateTimeField;
    cdsMSGFIO: TStringField;
    pmWR: TPopupMenu;
    miNotRead: TMenuItem;
    miAll_Read: TMenuItem;
    pmUser: TPopupMenu;
    miSelf: TMenuItem;
    miAllUser: TMenuItem;
    pmClosed: TPopupMenu;
    miClosed: TMenuItem;
    miAll_Closed: TMenuItem;
    pnDate: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    dtFrom: TDateEdit;
    dtTo: TDateEdit;
    Panel3: TPanel;
    RxSpeedButton8: TRxSpeedButton;
    RxSpeedButton9: TRxSpeedButton;
    RxSpeedButton10: TRxSpeedButton;
    miNonClised: TMenuItem;
    miRead: TMenuItem;
    Action1: TAction;
    aExp: TAction;
    aWasRead: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    procedure aNewExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure miAllUserClick(Sender: TObject);
    procedure RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DataSourceCurrencyDataChange(Sender: TObject; Field: TField);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure aExpExecute(Sender: TObject);
    procedure aWasReadExecute(Sender: TObject);
  private
    procedure RefresheInt(id_MSG: integer);
    procedure ReColorFilter;
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;

    procedure Initialize;
    procedure DoRefrMsg(var Msg: TMessage); message xxx_RefrMsg;
  end;

implementation

uses uDM, uMSGProp;

{$R *.DFM}

{ TfMSG }

procedure TfMSG.Initialize;
begin
  RefresheInt(-1);
end;

procedure TfMSG.RefresheInt(id_MSG: integer);
var OldRecNo : integer;
    OldCur : TCursor;
    i : integer;
begin
  with cdsMSG do
  begin
    BeginUpdateControl(RxDBGrid1);

    DisableControls;
    OldCur := Screen.Cursor;
    Screen.Cursor := crSQLWait;
    Enabled := false;
    try
      if id_MSG = -1 then
        id_MSG := FieldByName('id_MSG').AsInteger;
      if Active and not IsEmpty then
        OldRecNo := RecNo
      else
        OldRecNo := -1;
      Close;

      Params.ParamByName('@DateFrom').AsDateTime := GetDateAdv(dtFrom.Date, false);
      Params.ParamByName('@DateTo').AsDateTime := GetDateAdv(dtTo.Date, true);

      if miNotRead.Checked then
        Params.ParamByName('@WasRead').Value := false;
      if miRead.Checked then
        Params.ParamByName('@WasRead').Value := true;
      if miAll_Read.Checked then
        Params.ParamByName('@WasRead').Value := Null;

      if miClosed.Checked then
        Params.ParamByName('@Closed').Value := false;
      if miNonClised.Checked then
        Params.ParamByName('@Closed').Value := true;
      if miAll_Closed.Checked then
        Params.ParamByName('@Closed').Value := Null;

      if miSelf.Checked then
        Params.ParamByName('@id_User').Value := DM.IDUser
      else
        Params.ParamByName('@id_User').Value := Null;

      Open;
      RxDBGrid1.SelectedRows.Clear;
      if not Locate('id_MSG', id_MSG, []) and (OldRecNo <> -1) then
      begin
        if (OldRecNo <= RecordCount) then
          RecNo := OldRecNo
        else
          Last;
      end;
    finally
      Screen.Cursor := OldCur;
      EnableControls;
      EndUpdateControl(RxDBGrid1);
      Enabled := true;
    end;
  end;
end;


procedure TfMSG.aNewExecute(Sender: TObject);
begin
  ShowMSGProp(Handle, -1);
end;

procedure TfMSG.aEditExecute(Sender: TObject);
begin
  ShowMSGProp(Handle, cdsMSGid_Msg.AsInteger);
end;

procedure TfMSG.aDelExecute(Sender: TObject);
begin
//*
end;

procedure TfMSG.aRefreshExecute(Sender: TObject);
begin
  RefresheInt(cdsMSGid_Msg.AsInteger);
end;
        
procedure TfMSG.DoRefrMsg(var Msg: TMessage);
begin
  RefresheInt(Msg.WParam);
end;

procedure TfMSG.miAllUserClick(Sender: TObject);
begin
  if (Sender as TMenuItem).RadioItem then
    (Sender as TMenuItem).Checked := true
  else
    (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
  ReColorFilter;
end;

procedure TfMSG.ReColorFilter;
var i : integer;
begin
  if not miAll_Read.Checked then
  begin
    RxSpeedButton8.Font.Color := clRed;
  end
  else
  begin
    RxSpeedButton8.Font.Color := clWindowText;
  end;


  if not miAllUser.Checked then
  begin
    RxSpeedButton9.Font.Color := clRed;
  end
  else
  begin
    RxSpeedButton9.Font.Color := clWindowText;
  end;

  if not miAll_Closed.Checked then
  begin
    RxSpeedButton10.Font.Color := clRed;
  end
  else
  begin
    RxSpeedButton10.Font.Color := clWindowText;
  end;
end;

constructor TfMSG.Create(AOwner: TCOmponent);
var Reg : TRegistry;
    i : integer;
    Own : TCustomForm;

begin
  inherited;
  dtTo.Date := Now;
  dtFrom.Date := Now - 7;//IncMonth(Now, -1);

  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin
    LoadGridSettingsFromRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName);
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(SRegPath + '\' + TForm(Own).ClassName + '\pmOperFilter', false) then
      begin
        with pmWR do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            if Reg.ValueExists(Items[i].Name) then
              Items[i].Checked := Reg.ReadBool(Items[i].Name);
          end;
        end;
        with pmUser do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            if Reg.ValueExists(Items[i].Name) then
              Items[i].Checked := Reg.ReadBool(Items[i].Name);
          end;
        end;

        with pmClosed do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            if Reg.ValueExists(Items[i].Name) then
              Items[i].Checked := Reg.ReadBool(Items[i].Name);
          end;
        end; 
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
      ReColorFilter;
    end;
  end;
end;

destructor TfMSG.Destroy;
var
    Reg : TRegistry;
    i : integer;
    Own : TCustomForm;
begin
  Own := GetControlOwner(Self);
  if Own is TCustomForm then
  begin
    SaveGridSettingsToRegistry(RxDBGrid1, SRegPath + '\' + TForm(Own).ClassName + '\' + ClassName);                                      
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(SRegPath + '\' + TForm(Own).ClassName + '\pmOperFilter', true) then
      begin
        with pmWR do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            Reg.WriteBool(Items[i].Name, Items[i].Checked)
          end;
        end;
      
        with pmUser do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            Reg.WriteBool(Items[i].Name, Items[i].Checked)
          end;
        end;
        with pmClosed do
        begin
          for i := 0 to Items.Count - 1 do
          begin
            Reg.WriteBool(Items[i].Name, Items[i].Checked)
          end;
        end;
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  end;
  inherited;
end;

procedure TfMSG.RxDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var R : TRect;
    S : String;
    Y, Y2 : integer;
    Style, cbSize   : Integer;
begin
  if not (Sender as TDBGrid).DataSource.DataSet.IsEmpty then
  begin
    if not (Sender as TDBGrid).DataSource.DataSet.FieldByName('WasRead').AsBoolean then
       TDBGrid(Sender).Canvas.Font.Style := [fsBold];
    if (gdSelected in State) then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clHighlight;
      TDBGrid(Sender).Canvas.FillRect(Rect);
    end;

    if Column.Field is TBooleanField then
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
      R := Rect;
      if (Column.Field = cdsMSGBody) or (Column.Field = cdsMSGRepBody) then
      begin
        S := Column.Field.AsString;
        Y := DrawText((Sender as TDBGrid).Canvas.Handle, PChar(S), -1, R, DT_WORDBREAK or DT_CALCRECT);
        if Y > 200 then Y := 200;
        if Y > THackGrid(Sender).RowHeights[THackGrid(Sender).DataLink.ActiveRecord + 1] then
          THackGrid(Sender).RowHeights[THackGrid(Sender).DataLink.ActiveRecord + 1] := Y;
        R := Rect;
        R.Bottom := R.Top + Y;
        DrawText((Sender as TDBGrid).Canvas.Handle, PChar(S), -1, R, DT_LEFT or DT_WORDBREAK);
      end
      else
        RxDBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    //    DrawText((Sender as TDBGrid).Canvas.Handle, PChar(Column.Field.Display), -1, R, DT_LEFT or DT_WORDBREAK);
    end;
  end;
end;

procedure TfMSG.DataSourceCurrencyDataChange(Sender: TObject;
  Field: TField);
begin
  aEdit.Enabled := not cdsMSG.IsEmpty;
  aDel.Enabled := not cdsMSG.IsEmpty;
  aWasRead.Enabled := not cdsMSG.IsEmpty and not cdsMSGWasRead.AsBoolean;
end;

procedure TfMSG.RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aEdit.Execute;
end;

procedure TfMSG.Action1Execute(Sender: TObject);
begin
  aDel.Visible := true;
  aWasRead.Visible := true;
end;

procedure TfMSG.RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
  Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TfMSG.RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TfMSG.aExpExecute(Sender: TObject);
begin
  Enabled := false;
  aExp.Enabled := false;
  Repaint;
  try
    GreedToExcel(RxDBGrid1, 'Сообщения');
  finally
    Enabled := true;
    aExp.Enabled := true;
  end;
end;

procedure TfMSG.aWasReadExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Пометить как прочтенную?', 'Подтвердите прочтение', MB_YESNO + MB_ICONQUESTION) = idYes then
    if DM.rsCA.AppServer.MSG_SetWasRead(cdsMSGid_Msg.AsInteger, true) = 1 then
      aRefresh.Execute;
end;

end.
