unit uSearchResult;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, contnrs, Db, DBClient, frArc, mconnect, ExtCtrls, ActnList;

const  xxxSRegPath2 = '\SOFTWARE\FO\EMng';

type
  TSearchResult = class(TForm)
    cdsSQLStr: TClientDataSet;
    fArc1: TfArc;
    cdsData: TClientDataSet;
    Panel2: TPanel;
    btnCancel: TButton;
    ActionList1: TActionList;
    Action1: TAction;
    cdsCondList2: TClientDataSet;
    cdsCondList2CondNum: TIntegerField;
    cdsCondList2RNum: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FConnection: TCustomConnection;
    procedure MakeIDSearchSQL(ACondNum: integer; ASQL, FltExtPatam: TStrings);
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;

    procedure Initialize(AConnection : TCustomConnection; id_Flt, id_user : integer);
  end;

var
  SearchResult: TSearchResult;
procedure ShowSearchResult(AConnection : TCustomConnection; id_Flt, id_user : integer);

implementation

uses UniverseFilter, UniverseFilterUnit2, foMyFunc;

procedure ShowSearchResult(AConnection : TCustomConnection; id_Flt, id_user : integer);
var F : TSearchResult;
begin
//  DM.Rights_GetUserRights(6, Null);
  F := TSearchResult.Create(nil);
  try
    F.Show;
    F.Repaint;
    F.Initialize(AConnection, id_Flt, id_user);
    
  except
    F.Free;
  end;
end;

{$R *.DFM}

{ TSearchResult }

constructor TSearchResult.Create(AOwner: TCOmponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  fArc1.aRefreshe.Visible := false;
  fArc1.MayRefreshe := false;
//  fArc1.ToolBar2.Visible := false;
  fArc1.pnDate.Visible := false;
  fArc1.dsArc.DataSet := cdsData;
end;

procedure TSearchResult.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

destructor TSearchResult.Destroy;
begin
  inherited;

end;

procedure TSearchResult.Initialize(AConnection : TCustomConnection; id_Flt, id_user: integer);
var i : integer;
    id_business : Variant;
    ASQL: TStrings;
    FltExtPatam: TStrings;
begin
  DisableControl(Self);
  Screen.Cursor := crSQLWait;
  ASQL := TStringList.Create;
  FltExtPatam := TStringList.Create;
  try
    FConnection := AConnection;
    Caption := TDispatchConnection(FConnection).AppServer.GetFilterName(id_Flt);
    with cdsSQLStr do
    begin
      Close;
      RemoteServer := TCustomRemoteServer(FConnection);
      Params.ParamByName('@id_Filter').Value := id_Flt;
      Open;
      id_business := FieldByName('id_business').Value;
      fArc1.id_business := FieldByName('id_business').Value;
    end;

    with cdsData do
    begin
      Close;
      RemoteServer := TCustomRemoteServer(FConnection);
      if ProviderName = '' then
      begin
        ProviderName := 'dsGetData2';
        Params.Clear;
        FetchParams;
      end;
      for i := 0 to Params.Count - 1 do
        Params[i].Value := Null;
      Params.ParamByName('@id_user').Value := id_user;
      Params.ParamByName('@id_business').Value := id_business;
    end;

    with cdsCondList2 do
    begin
      Close;
      RemoteServer := TCustomRemoteServer(FConnection);
      Params.ParamByName('@id_Filter').Value := id_Flt;
      try
        Open;
        i := 0;
        First;
        while not Eof do
        begin
          ASQL.Clear;
          FltExtPatam.Clear;
          MakeIDSearchSQL(cdsCondList2CondNum.AsInteger, ASQL, FltExtPatam);

          cdsData.Params.ParamByName('@SQLText' + IntToStr(i)).Value := ASQL.Text;
          if FltExtPatam.Text = '' then
            cdsData.Params.ParamByName('@FltExtPatam' + IntToStr(i)).Value := Null
          else
            cdsData.Params.ParamByName('@FltExtPatam' + IntToStr(i)).Value := trim(FltExtPatam.Text);

          Next;
          inc(i);
        end;
      finally
        Close;
      end;
    end;
    cdsData.Open;
  finally
    EnableControl(Self);
    Screen.Cursor := crDefault;
    ASQL.Free;
    FltExtPatam.Free;
  end;
end;

procedure TSearchResult.MakeIDSearchSQL(ACondNum: integer; ASQL: TStrings; FltExtPatam: TStrings);
var
    SL : TStringList;
    Obj : TFltList;
    ObjTable : TTableList;
    ObjList, ObjList2 : TObjectList;
    id_business : Variant;
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
  SL := TStringList.Create;
  ObjList := TObjectList.Create(true);
  ObjList2 := TObjectList.Create(true);
  with cdsSQLStr do
  begin
    First;
    try
      while not Eof do
      begin
        if FieldByName('CondNum').IsNull or
           (FieldByName('CondNum').AsInteger = ACondNum) or
           (FieldByName('CondNum').AsInteger = -1) then
        begin
          if Indexid_Rel(FieldByName('id_Rel').AsInteger) = -1 then
          begin
            if ((not FieldByName('CondCode').IsNull) and (not FieldByName('id_Prop').IsNull))
                or (FieldByName('id_RelParent').IsNull) then
            begin
              ObjTable := TTableList.Create;
              ObjList.Add(ObjTable);
              ObjTable.id_Rel := FieldByName('id_Rel').AsInteger;
              ObjTable.id_RelParent := FieldByName('id_RelParent').Value;
              ObjTable.TableName := FieldByName('TableName').AsString;
              ObjTable.RelField := FieldByName('RelField').AsString;
              ObjTable.KeyField := FieldByName('KeyField').AsString;

              ObjTable.isDetail := FieldByName('isDetail').AsBoolean;
              ObjTable.isExtParam := FieldByName('isExtParam').AsBoolean;
            end;
          end;
          
          if (not FieldByName('CondCode').IsNull) or (FieldByName('id_RelParent').IsNull) then
          begin
            Obj := TFltList.Create;
            ObjList2.Add(Obj);
            Obj.id_Rel := FieldByName('id_Rel').AsInteger;
            Obj.id_RelParent := FieldByName('id_RelParent').Value;
            Obj.TableName := FieldByName('TableName').AsString;
            Obj.RelField := FieldByName('RelField').AsString;
            Obj.KeyField := FieldByName('KeyField').AsString;

            Obj.id_Prop := FieldByName('id_Prop').Value;
            Obj.Par1 := FieldByName('Par1').AsString;
            Obj.Par2 := FieldByName('Par2').AsString;
            Obj.CondCode := FieldByName('CondCode').Value;

            Obj.isDetail := FieldByName('isDetail').AsBoolean;
            Obj.isExtParam := FieldByName('isExtParam').AsBoolean;

            Obj.FieldType := FieldByName('FieldType').AsString;
            Obj.FieldName := FieldByName('FieldName').AsString;
          end;
        end;
        Next;
      end;

      MakeTableList222(ObjList, SL);
      ASQL.AddStrings(SL);

      SL.Clear;
      MakeWhereList222(ObjList2, SL, FltExtPatam);
      if SL.Count > 0 then
      begin
        ASQL.Add('WHERE');
        ASQL.AddStrings(SL);
      end;
    finally
      ObjList.Free;
      ObjList2.Free;
      SL.Free;
    end;
  end;
end;

procedure TSearchResult.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TSearchResult.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TSearchResult.Action1Execute(Sender: TObject);
var F : TForm;
    Memo : TMemo;
begin
  F := TForm.Create(Self);
  try
    Memo := TMemo.Create(F);
    Memo.Parent := F;
    Memo.Align := alClient;
    Memo.Lines.Text := cdsData.Params.ParamByName('@SQLText').AsString;
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure TSearchResult.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, xxxSRegPath2 + '\' + Name);
end;

procedure TSearchResult.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, xxxSRegPath2 + '\' + Name);
end;

end.
