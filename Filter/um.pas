unit um;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UniverseFilter, Db, ADODB, MConnect, DBClient, SConnect, StdCtrls, Mask,
  ToolEdit, RXSpin, Grids, DBGrids, ComCtrls, ExtCtrls,
  contnrs;

type
  TForm1 = class(TForm)
    SocketConnection1: TSocketConnection;
    ClientDataSet1: TClientDataSet;
    Button1: TButton;
    ADOConnection1: TADOConnection;
    Button2: TButton;
    Memo1: TMemo;
    RxSpinEdit1: TRxSpinEdit;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    TabSheet3: TTabSheet;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UniverseFilterForm, uFltEng, UniverseFilterUnit2, uGridUtils;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var ID : integer;
begin
  ID := Round(RxSpinEdit1.Value);
  EditFilter(SocketConnection1, 1, '', ID,
  [ufsObjView, 
  {ufsFieldsList,} ufsCondList, {ufsGroupList, ufsOrderList, }
  ufsMayChangeFields, ufsMayChangeCond, ufsMayChangeGroup, ufsMayChangeOrder]
  )
end;

procedure TForm1.Button2Click(Sender: TObject);
var S, S2 : String;
    ID, i : integer;

    SL, SLSQL, SLFieldNames  : TStringList;
begin
  ID := Round(RxSpinEdit1.Value);

  SL := TStringList.Create;
  SLSQL := TStringList.Create;
  SLFieldNames := TStringList.Create;
  try
    // Формируем список полей
    if MakeFieldList(ADOQuery1, ID, SL, SLFieldNames) then
    begin
      SLSQL.Add('SELECT');
      SLSQL.AddStrings(SL);
    end
    else
      raise Exception.Create('f');
    // Список таблиц
    if MakeTableList(ADOQuery1, ID, SL) then
    begin
      SLSQL.Add('FROM');
      SLSQL.AddStrings(SL);
    end
    else
      raise Exception.Create('f');
    // Формируем строку WHERE
    if MakeWhereList(ADOQuery1, ID, SL) then
    begin
      if SL.Text <> '' then
      begin
        SLSQL.Add('WHERE');
        SLSQL.AddStrings(SL);
      end;
    end
    else
      raise Exception.Create('f');

    // Формируем Сортировку
    if MakeOrderList(ADOQuery1, ID, SL) then
    begin
      if SL.Text <> '' then
      begin
        SLSQL.Add('ORDER BY');
        SLSQL.AddStrings(SL);
      end;
    end
    else
      raise Exception.Create('f');

    // Формируем группировку

    Memo1.Lines.Assign(SLSQL);
    with ADOQuery2 do
    begin
      Close;
      SQL.Assign(SLSQL);
      Open;
      for i := 0 to SLFieldNames.Count - 1 do
      begin
        Fields[i].DisplayLabel := SLFieldNames[i];
      end;
    end;
    TKrmDBGrid(DBGrid1).CalcColumnsWidth;

  finally
    SL.Free;
    SLFieldNames.Free;
    SLSQL.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var FUserName, FPassword : String;
begin
  SocketConnection1.Open;
  FUserName := '1';
  FPassword := '';
  if SocketConnection1.AppServer.DoLogin(FUserName, FPassword) = 1 then
    Caption := 'Юзер - ' + SocketConnection1.AppServer.FIO
end;

procedure TForm1.Button3Click(Sender: TObject);
var
    AWhereList : TStringList;
    Obj : TTableList;
    ObjList : TObjectList;
    ID : integer;
  function Indexid_Rel(id_Rel : integer) : integer;
  var j : integer;
  begin
    Result := -1;
    for j := 0 to ObjList.Count - 1 do
    begin
      if TTableList(ObjList[j]).id_Rel = id_Rel then
      begin
        Result := j;
        Break;
      end;
    end;
  end;
begin
  ID := Round(RxSpinEdit1.Value);
  AWhereList := TStringList.Create;
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'EXEC FLT_Eng_CondStr_Ext ' + IntToStr(ID);
  ADOQuery1.Open;

  ObjList := TObjectList.Create(true);
  with ADOQuery1 do
  begin
    First;
    try
      while not Eof do
      begin
        if not FieldByName('isDetail').AsBoolean then
        begin
          if Indexid_Rel(FieldByName('id_Rel').AsInteger) = -1 then
          begin
            Obj := TTableList.Create;
            ObjList.Add(Obj);
            Obj.id_Rel := ADOQuery1.FieldByName('id_Rel').AsInteger;
            Obj.id_RelParent := ADOQuery1.FieldByName('id_RelParent').Value;
            Obj.TableName := ADOQuery1.FieldByName('TableName').AsString;
            Obj.RelField := ADOQuery1.FieldByName('RelField').AsString;
            Obj.KeyField := ADOQuery1.FieldByName('KeyField').AsString;
          end;
        end;
        Next;
      end;

      MakeTableList222(ObjList, AWhereList);
      Memo1.Lines.Text := AWhereList.Text;

    finally
      ObjList.Free;
    end;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
    AWhereList : TStringList;
    ID, i : integer;
    Obj : TFltList;
    ObjList : TObjectList;
begin
  ID := Round(RxSpinEdit1.Value);
  AWhereList := TStringList.Create;
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'EXEC FLT_Eng_CondStr_Ext ' + IntToStr(ID);
  ADOQuery1.Open;

  ObjList := TObjectList.Create(true);
  with ADOQuery1 do
  begin
    First;
    try
      while not Eof do
      begin
        if not ADOQuery1.FieldByName('CondCode').IsNull then
        begin
          Obj := TFltList.Create;
          ObjList.Add(Obj);
          Obj.id_Rel := ADOQuery1.FieldByName('id_Rel').AsInteger;
          Obj.id_RelParent := ADOQuery1.FieldByName('id_RelParent').Value;
          Obj.TableName := ADOQuery1.FieldByName('TableName').AsString;
          Obj.RelField := ADOQuery1.FieldByName('RelField').AsString;
          Obj.KeyField := ADOQuery1.FieldByName('KeyField').AsString;

          Obj.id_Prop := ADOQuery1.FieldByName('id_Prop').Value;
          Obj.Par1 := ADOQuery1.FieldByName('Par1').AsString;
          Obj.Par2 := ADOQuery1.FieldByName('Par2').AsString;
          Obj.CondCode := ADOQuery1.FieldByName('CondCode').Value;
          Obj.isDetail := ADOQuery1.FieldByName('isDetail').AsBoolean;
          Obj.FieldType := ADOQuery1.FieldByName('FieldType').AsString;
          Obj.FieldName := ADOQuery1.FieldByName('FieldName').AsString;
        end;
        Next;
      end;

      MakeWhereList222(ObjList, AWhereList);
      Memo1.Lines.Text := AWhereList.Text;

    finally
      ObjList.Free;
    end;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
    ASQL : TStringList;
    ID, i : integer;
    Obj : TFltList;
    ObjList : TObjectList;
begin
  ID := Round(RxSpinEdit1.Value);
  ASQL := TStringList.Create;
  try
    Memo1.Lines.Clear;
    if MakeSQL(ADOQuery1, ASQL, ID) then
      Memo1.Lines.AddStrings(ASQL);
  finally
    ASQL.Free;
  end;
end;

end.
