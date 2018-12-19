unit frKomp;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBClient, Menus;

type
  TfKomp = class(TFrame)
    cbMat: TComboBox;
    cbW: TComboBox;
    cbColor: TComboBox;
    cbMat2: TComboBox;
    cbW2: TComboBox;
    cbColor2: TComboBox;
    cbMat3: TComboBox;
    cbW3: TComboBox;
    cbColor3: TComboBox;
    lb2: TLabel;
    lb3: TLabel;
    cdsInvDict: TClientDataSet;
    cdsInvDictid_Inv_Dict: TAutoIncField;
    cdsInvDictxType: TIntegerField;
    cdsInvDictVal: TStringField;
    cdsInvDictDeleted: TBooleanField;
    lb4: TLabel;
    cbMat4: TComboBox;
    cbW4: TComboBox;
    cbColor4: TComboBox;
    lb5: TLabel;
    cbMat5: TComboBox;
    cbW5: TComboBox;
    cbColor5: TComboBox;
    cdsInvC: TClientDataSet;
    cdsInvCID: TAutoIncField;
    cdsInvCID1: TIntegerField;
    cdsInvCID2: TIntegerField;
    cdsInvCID3: TIntegerField;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure cbMatChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    constructor Create(AOwner : TCOmponent); override;
    procedure UnAdd(Capt: String; xType: integer; xxCB : TComboBox);
  public
    function GetKomp : String;
    procedure SetKomp(S : String);
  end;

implementation

uses uDM, foMyFunc;

{$R *.DFM}

procedure TfKomp.cbMatChange(Sender: TObject);
begin
  cbMat2.Enabled := (cbMat.ItemIndex >= 0) and (cbW.ItemIndex >= 0);
  cbW2.Enabled := cbMat2.Enabled;
  cbColor2.Enabled := cbMat2.Enabled;
  lb2.Enabled := cbMat2.Enabled;

  cbMat3.Enabled := cbMat2.Enabled and (cbMat2.ItemIndex >= 0) and (cbW2.ItemIndex >= 0);
  cbW3.Enabled := cbMat3.Enabled;
  cbColor3.Enabled := cbMat3.Enabled;
  lb3.Enabled := cbMat3.Enabled;   

  cbMat4.Enabled := cbMat3.Enabled and (cbMat3.ItemIndex >= 0) and (cbW3.ItemIndex >= 0);
  cbW4.Enabled := cbMat4.Enabled;
  cbColor4.Enabled := cbMat4.Enabled;
  lb4.Enabled := cbMat4.Enabled;

  cbMat5.Enabled := cbMat4.Enabled and (cbMat4.ItemIndex >= 0) and (cbW4.ItemIndex >= 0);
  cbW5.Enabled := cbMat5.Enabled;
  cbColor5.Enabled := cbMat5.Enabled;
  lb5.Enabled := cbMat5.Enabled;
end;

constructor TfKomp.Create(AOwner: TCOmponent);
begin
  inherited;
  cbMat.Items.Clear();
  cbMat2.Items.Clear();
  cbMat3.Items.Clear();
  cbMat4.Items.Clear();
  cbMat5.Items.Clear();
 
  cbW.Items.Clear();
  cbW2.Items.Clear();
  cbW3.Items.Clear();
  cbW4.Items.Clear();
  cbW5.Items.Clear();
 
  cbColor.Items.Clear();
  cbColor2.Items.Clear();
  cbColor3.Items.Clear();
  cbColor4.Items.Clear();
  cbColor5.Items.Clear();

  with cdsInvDict do
  begin
    Close;
    Params.ParamByName('@xType').Value := null;
    Open;

    First;
    while not Eof do
    begin
      if cdsInvDictxType.AsInteger = 1 then
      begin
        cbMat.Items.Add(cdsInvDictVal.AsString);
        cbMat2.Items.Add(cdsInvDictVal.AsString);
        cbMat3.Items.Add(cdsInvDictVal.AsString);
        cbMat4.Items.Add(cdsInvDictVal.AsString);
        cbMat5.Items.Add(cdsInvDictVal.AsString);
      end;
      if cdsInvDictxType.AsInteger = 2 then
      begin
        cbW.Items.Add(cdsInvDictVal.AsString);
        cbW2.Items.Add(cdsInvDictVal.AsString);
        cbW3.Items.Add(cdsInvDictVal.AsString);
        cbW4.Items.Add(cdsInvDictVal.AsString);
        cbW5.Items.Add(cdsInvDictVal.AsString);
      end;
      if cdsInvDictxType.AsInteger = 3 then
      begin
        cbColor.Items.Add(cdsInvDictVal.AsString);
        cbColor2.Items.Add(cdsInvDictVal.AsString);
        cbColor3.Items.Add(cdsInvDictVal.AsString);
        cbColor4.Items.Add(cdsInvDictVal.AsString);
        cbColor5.Items.Add(cdsInvDictVal.AsString);
      end;
      Next;
    end;
  end;
end;

function TfKomp.GetKomp: String;
begin
  Result := cbMat.Items[cbMat.ItemIndex];
  Result := Result + cbW.Items[cbW.ItemIndex];
  Result := Result + cbColor.Items[cbColor.ItemIndex];

  if cbMat2.Enabled and (cbMat2.ItemIndex >= 0) then
  begin
    Result := Result + '/'+ cbMat2.Items[cbMat2.ItemIndex];
    Result := Result + cbW2.Items[cbW2.ItemIndex];
    Result := Result + cbColor2.Items[cbColor2.ItemIndex];
  end;

  if cbMat3.Enabled and (cbMat3.ItemIndex >= 0) then
  begin
    Result := Result + '/'+ cbMat3.Items[cbMat3.ItemIndex];
    Result := Result + cbW3.Items[cbW3.ItemIndex];
    Result := Result + cbColor3.Items[cbColor3.ItemIndex];
  end;

  if cbMat4.Enabled and (cbMat4.ItemIndex >= 0) then
  begin
    Result := Result + '/'+ cbMat4.Items[cbMat4.ItemIndex];
    Result := Result + cbW4.Items[cbW4.ItemIndex];
    Result := Result + cbColor4.Items[cbColor4.ItemIndex];
  end;

  if cbMat5.Enabled and (cbMat5.ItemIndex >= 0) then
  begin
    Result := Result + '/'+ cbMat5.Items[cbMat5.ItemIndex];
    Result := Result + cbW5.Items[cbW5.ItemIndex];
    Result := Result + cbColor5.Items[cbColor5.ItemIndex];
  end;
end;

procedure TfKomp.SetKomp(S: String);
  procedure SetVV(CB : TComboBox; Val : String);
  var i : integer;
  begin
    CB.ItemIndex := -1;
    if (Val > '') then
    begin
      i := CB.Items.IndexOf(Val);
      CB.ItemIndex := i;
      cbMatChange(nil);
    end;
  end;
  function GetS(ID : integer) : String;
  begin
    Result := '';
    if ID > 0 then
    begin
      with cdsInvDict do
      begin
        First;
        while not Eof do
        begin
          if cdsInvDictid_Inv_Dict.AsInteger = ID then
          begin
            Result := cdsInvDictVal.AsString;
            Break;
          end;
          Next;
        end;
      end;
    end;
  end;
var S1, S2, S3 : String;
begin
  with cdsInvDict do
  begin
    Close;
    Params.ParamByName('@xType').Value := null;
    Open;
  end;
  with cdsInvC do
  begin
    Close;
    Params.ParamByName('@Komp').Value := S;
    Open;

    First;
    while not Eof do
    begin
      S1 := GetS(cdsInvCID1.AsInteger);
      S2 := GetS(cdsInvCID2.AsInteger);
      S3 := GetS(cdsInvCID3.AsInteger);
      if cdsInvCID.AsInteger = 1 then
      begin
        SetVV(cbMat, S1);
        SetVV(cbW, S2);
        SetVV(cbColor, S3);
      end;
      if cdsInvCID.AsInteger = 2 then
      begin
        SetVV(cbMat2, S1);
        SetVV(cbW2, S2);
        SetVV(cbColor2, S3);
      end;
      if cdsInvCID.AsInteger = 3 then
      begin
        SetVV(cbMat3, S1);
        SetVV(cbW3, S2);
        SetVV(cbColor3, S3);
      end;
      if cdsInvCID.AsInteger = 4 then
      begin
        SetVV(cbMat4, S1);
        SetVV(cbW4, S2);
        SetVV(cbColor4, S3);
      end;
      if cdsInvCID.AsInteger = 5 then
      begin
        SetVV(cbMat5, S1);
        SetVV(cbW5, S2);
        SetVV(cbColor5, S3);
      end;

      Next;
    end;
  end;
end;

procedure TfKomp.N1Click(Sender: TObject);
begin

  UnAdd('Добавить состав', 1, PopupMenu1.PopupComponent as TComboBox);
end;

procedure TfKomp.N2Click(Sender: TObject);
begin
  UnAdd('Добавить толщину', 2, PopupMenu2.PopupComponent as TComboBox);
end;

procedure TfKomp.N3Click(Sender: TObject);
begin
  UnAdd('Добавить цвет', 3, PopupMenu3.PopupComponent as TComboBox);
end;

procedure TfKomp.UnAdd(Capt: String; xType : integer; xxCB : TComboBox);
  procedure AddVal(CB : TComboBox; Val : String);
  var i : integer;
  begin
    CB.items.Add(Val);
    if CB = xxCB then
    begin
      i := CB.Items.IndexOf(Val);
      CB.ItemIndex := i;
    end;
  end;
var S : String;
    ID : integer;
begin
  if InputBoxKrm(Capt, 'Значение', S) then
  begin
    ID := DM.rsCA.AppServer.Inv_DictAdd(xType, S);
    if ID <> -1 then
    begin
      if xType = 1 then
      begin
        AddVal(cbMat, S);
        AddVal(cbMat2, S);
        AddVal(cbMat3, S);
        AddVal(cbMat4, S);
        AddVal(cbMat5, S);
      end;
      if xType = 2 then
      begin
        AddVal(cbW, S);
        AddVal(cbW2, S);
        AddVal(cbW3, S);
        AddVal(cbW4, S);
        AddVal(cbW5, S);
      end;
      if xType = 3 then
      begin
        AddVal(cbColor, S);
        AddVal(cbColor2, S);
        AddVal(cbColor3, S);
        AddVal(cbColor4, S);
        AddVal(cbColor5, S);
      end;
    end;
  end;
end;
end.
