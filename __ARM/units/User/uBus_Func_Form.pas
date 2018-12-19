unit uBus_Func_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Db, DBClient, Grids, DBGrids, frBsnSelector,
  ActnList, ComCtrls, frObjList;

type
  TBus_Func_Form = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    OkButton: TButton;
    Button2: TButton;
    ClientDataSet1: TClientDataSet;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    ClientDataSet2: TClientDataSet;
    AutoIncField2: TAutoIncField;
    StringField2: TStringField;
    IntegerField2: TIntegerField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    fBsnSelector1: TfBsnSelector;
    ClientDataSet1id_Business: TIntegerField;
    ClientDataSet1id_Group: TIntegerField;
    ClientDataSet2id_Business: TIntegerField;
    ClientDataSet2id_Group: TIntegerField;
    ActionList1: TActionList;
    aAddOne: TAction;
    aAddAll: TAction;
    aDelOne: TAction;
    aDelAll: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel7: TPanel;
    Splitter1: TSplitter;
    Panel8: TPanel;
    Label18: TLabel;
    DBGrid1: TDBGrid;
    Panel9: TPanel;
    sbAddOne1: TSpeedButton;
    sbDelOne1: TSpeedButton;
    sbAddAll1: TSpeedButton;
    sbDelAll1: TSpeedButton;
    Panel10: TPanel;
    Label19: TLabel;
    DBGrid2: TDBGrid;
    cdsPermitGetListAcc: TClientDataSet;
    cdsPermitGetListAccid_Permit: TAutoIncField;
    cdsPermitGetListAccid_Group: TIntegerField;
    cdsPermitGetListAccid_Acc: TIntegerField;
    cdsPermitGetListAccid_Acc_Group: TIntegerField;
    cdsPermitGetListAccid_ContrAgent: TIntegerField;
    cdsPermitGetListAccid_CAGroup: TIntegerField;
    cdsPermitGetListAccName: TStringField;
    cdsPermitGetListAccid_business: TIntegerField;
    fObjListAcc: TfObjList;
    fObjListCA: TfObjList;
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure aAddOneExecute(Sender: TObject);
    procedure aDelOneExecute(Sender: TObject);
    procedure aAddAllExecute(Sender: TObject);
    procedure aDelAllExecute(Sender: TObject);
    procedure DBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DBGrid1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DBGrid2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid2DragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    { Private declarations }
    function CheckComplitInput : boolean;

  protected
        UnComplits:string;
    Fid_Business:integer;
    Fid_Group:integer;
  public
    function  SaveData : boolean;
    procedure Init(id_Group, id_Business : integer);
  end;

var
  Bus_Func_Form: TBus_Func_Form;

implementation
  uses uFormsAPI_Admin,uFormsAPI_Users, uListBoxesUtils, foMyFunc, uDM;
{$R *.DFM}

procedure TBus_Func_Form.OkButtonClick(Sender: TObject);
begin
 {}CheckComplitInput;
end;

function TBus_Func_Form.CheckComplitInput : boolean;
begin
 Result:=True;
 UnComplits:='';
 OkButton.ModalResult:=mrOk;

end;

procedure TBus_Func_Form.FormCreate(Sender: TObject);
begin
  Fid_Business := -1;
end;

procedure TBus_Func_Form.Init(id_Group, id_Business : integer);
var FFF : TListBox;
begin
  TabSheet2.TabVisible := DM.DefB_APN <= 0;
  TabSheet3.TabVisible := DM.DefB_APN <= 0;
  PageControl1.ActivePageIndex := 0;

  Fid_Business := id_Business;
  Fid_Group := id_Group;

  fBsnSelector1.ID := Fid_Business;
  fBsnSelector1.Button1.visible := false;
  

  with ClientDataSet1 do
  begin
    Close;
    Params.ParamByName('@id_Group').Value := Fid_Group;
    Params.ParamByName('@id_Business').Value := Fid_Business;
    Params.ParamByName('@Has').Value := 0;
    Open;

    IndexDefs.Clear;
    IndexDefs.Add('xxx', 'FuncName', []);
    IndexName := 'xxx';
  end;
  with ClientDataSet2 do
  begin
    Close;
    Params.ParamByName('@id_Group').Value := Fid_Group;
    Params.ParamByName('@id_Business').Value := Fid_Business;
    Params.ParamByName('@Has').Value := 1;
    Open;
    
    IndexDefs.Clear;
    IndexDefs.Add('xxx', 'FuncName', []);
    IndexName := 'xxx';
  end;
  if DM.DefB_APN <= 0 then
  begin
      fObjListAcc.Initialize([eotFin, eotFinGroup], Fid_Business, 40, false);
      fObjListCA.Initialize([eotCA, eotCAGroup], Fid_Business, 40, false);
    with cdsPermitGetListAcc do
    begin
      Close;
      Params.ParamByName('@id_Group').Value := Fid_Group;
      Params.ParamByName('@CA').Value := true;
      Params.ParamByName('@Acc').Value := true ;
      Params.ParamByName('@id_Business').Value := Fid_Business;
    
      Open;
      First;
      while not eof do
      begin

        if not cdsPermitGetListAccid_Acc.IsNull then
          fObjListAcc.AddID(eotFin, cdsPermitGetListAccid_Acc.AsInteger);
        if not cdsPermitGetListAccid_Acc_Group.IsNull then
          fObjListAcc.AddID(eotFinGroup, cdsPermitGetListAccid_Acc_Group.AsInteger);


        if not cdsPermitGetListAccid_ContrAgent.IsNull then
          fObjListCA.AddID(eotCA, cdsPermitGetListAccid_ContrAgent.AsInteger);
        if not cdsPermitGetListAccid_CAGroup.IsNull then
          fObjListCA.AddID(eotCAGroup, cdsPermitGetListAccid_CAGroup.AsInteger);
        Next;
      end;
    end;
  //  RightsGrid.Visible := not IsEmpty;
  end;
end;


function TBus_Func_Form.SaveData: boolean;
var i : integer;
  AEObjType: TEObjType;
  vId:integer;
begin
  Result := false;
  if not CDSApplyUpdates(ClientDataSet2, '', -1) then
    raise Exception.Create('Ошибка при сохранении прав');

  if DM.DefB_APN <= 0 then
  begin
    with cdsPermitGetListAcc do
    begin
      First;
      while not Eof do
      begin
        if not cdsPermitGetListAccid_Acc.IsNull then
        begin
          AEObjType := eotFin;
          vId := cdsPermitGetListAccid_Acc.AsInteger;
        end;

        if not cdsPermitGetListAccid_Acc_Group.IsNull  then
        begin
          AEObjType := eotFinGroup;
          vId := cdsPermitGetListAccid_Acc_Group.AsInteger;
        end;

        if not cdsPermitGetListAccid_ContrAgent.IsNull  then
        begin
          AEObjType := eotCA;
          vId := cdsPermitGetListAccid_ContrAgent.AsInteger;
        end;


        if not cdsPermitGetListAccid_CAGroup.IsNull  then
        begin
          AEObjType := eotCAGroup;
          vId := cdsPermitGetListAccid_CAGroup.AsInteger;
        end;

        if not fObjListAcc.InList(AEObjType, vID)then
           Delete
        else
          Next;
      end;
    
      fObjListAcc.mtList.DisableControls;
      fObjListCA.mtList.DisableControls;
      fObjListAcc.mtList.First;
      while not fObjListAcc.mtList.Eof do
      begin
        if TEObjType(fObjListAcc.mtListIDType.AsInteger) = eotFin then
          if not Locate('id_Acc', fObjListAcc.mtListID.AsInteger, []) then
          begin
            Append;
            cdsPermitGetListAccid_business.AsInteger := Fid_Business;
            cdsPermitGetListAcc.FieldByName('id_Acc').AsInteger := fObjListAcc.mtListID.AsInteger;
            Post;
          end;   
        if TEObjType(fObjListAcc.mtListIDType.AsInteger) = eotFinGroup then
          if not Locate('id_Acc_Group', fObjListAcc.mtListID.AsInteger, []) then
          begin
            Append;
            cdsPermitGetListAccid_business.AsInteger := Fid_Business;
            cdsPermitGetListAcc.FieldByName('id_Acc_Group').AsInteger := fObjListAcc.mtListID.AsInteger;
            Post;
          end;   
        fObjListAcc.mtList.Next;
      end;

      fObjListCA.mtList.First;
      while not fObjListCA.mtList.Eof do
      begin
        if TEObjType(fObjListCA.mtListIDType.AsInteger) = eotCA then
          if not Locate('id_ContrAgent', fObjListCA.mtListID.AsInteger, []) then
          begin
            Append;
            cdsPermitGetListAccid_business.AsInteger := Fid_Business;
            cdsPermitGetListAcc.FieldByName('id_ContrAgent').AsInteger := fObjListCA.mtListID.AsInteger;
            Post;
          end;
        if TEObjType(fObjListCA.mtListIDType.AsInteger) = eotCAGroup then
          if not Locate('id_CAGroup', fObjListCA.mtListID.AsInteger, []) then
          begin
            Append;
            cdsPermitGetListAccid_business.AsInteger := Fid_Business;
            cdsPermitGetListAcc.FieldByName('id_CAGroup').AsInteger := fObjListCA.mtListID.AsInteger;
            Post;
          end;
        fObjListCA.mtList.Next;
      end;
    end;
      fObjListAcc.mtList.EnableControls;
      fObjListCA.mtList.EnableControls;

    if not CDSApplyUpdates(cdsPermitGetListAcc, 'id_Group', Fid_Group) then
      raise Exception.Create('Ошибка при сохранении');
  end;
  
  Result := true;
end;

procedure TBus_Func_Form.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  aAddOne.Enabled := not ClientDataSet1.IsEmpty;
  aAddAll.Enabled := not ClientDataSet1.IsEmpty;
end;

procedure TBus_Func_Form.DataSource2DataChange(Sender: TObject;
  Field: TField);
begin
  aDelOne.Enabled := not ClientDataSet2.IsEmpty;
  aDelAll.Enabled := not ClientDataSet2.IsEmpty;
end;

procedure TBus_Func_Form.aAddOneExecute(Sender: TObject);
begin
  with ClientDataSet2 do
  begin
    Append;
    FieldByName('id_Func').Value := ClientDataSet1.FieldByName('id_Func').Value;
    FieldByName('FuncName').Value := ClientDataSet1.FieldByName('FuncName').Value;
    FieldByName('id_Business').Value := Fid_Business;
    FieldByName('id_Group').Value := Fid_Group;
    Post;
  end;
  ClientDataSet1.Delete;
end;

procedure TBus_Func_Form.aDelOneExecute(Sender: TObject);
begin
  with ClientDataSet1 do
  begin
    Append;
    FieldByName('id_Func').Value := ClientDataSet2.FieldByName('id_Func').Value;
    FieldByName('FuncName').Value := ClientDataSet2.FieldByName('FuncName').Value;
    Post;
  end;
  ClientDataSet2.Delete;
end;

procedure TBus_Func_Form.aAddAllExecute(Sender: TObject);
begin
  with ClientDataSet2 do
  begin
    ClientDataSet1.First;
    while not ClientDataSet1.Eof do
    begin
      Append;
      FieldByName('id_Func').Value := ClientDataSet1.FieldByName('id_Func').Value;
      FieldByName('FuncName').Value := ClientDataSet1.FieldByName('FuncName').Value;
      FieldByName('id_Business').Value := Fid_Business;
      FieldByName('id_Group').Value := Fid_Group;
      Post;

      ClientDataSet1.Delete;
    end;
  end;
end;

procedure TBus_Func_Form.aDelAllExecute(Sender: TObject);
begin
  with ClientDataSet1 do
  begin
    ClientDataSet2.First;
    while not ClientDataSet2.Eof do
    begin
      Append;
      FieldByName('id_Func').Value := ClientDataSet2.FieldByName('id_Func').Value;
      FieldByName('FuncName').Value := ClientDataSet2.FieldByName('FuncName').Value;

      Post;

      ClientDataSet2.Delete;
    end;
  end;
end;

procedure TBus_Func_Form.DBGrid1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source = DBGrid2;
end;

procedure TBus_Func_Form.DBGrid1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  aDelOne.Execute;
end;

procedure TBus_Func_Form.DBGrid2DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source = DBGrid1;
end;

procedure TBus_Func_Form.DBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aAddOne.Execute;
end;

procedure TBus_Func_Form.DBGrid2DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  aDelOne.Execute;

end;

procedure TBus_Func_Form.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if (ssLeft in Shift) and (THackGrid(Sender).RowHeights[0] < Y) then
    (Sender as TDBGrid).BeginDrag(true);
end;

procedure TBus_Func_Form.DBGrid2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if (ssLeft in Shift) and (THackGrid(Sender).RowHeights[0] < Y) then
    (Sender as TDBGrid).BeginDrag(true);
end;

procedure TBus_Func_Form.DBGrid2DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  aAddOne.Execute;
end;

end.
