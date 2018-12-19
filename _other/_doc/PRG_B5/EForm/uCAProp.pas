unit uCAProp;

interface

uses
  Windows, Messages, {$IFDEF VER150} Variants,{$ENDIF} SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBCtrls,
  RxLookup, Db, ADODB, Provider, MtUPDPrv, DBClient, ExtDlgs, jpeg, ImgList,
  RXDBCtrl, ComCtrls, ActnList, ToolWin, Grids, DBGrids, 
  RxCombos, AdvOfficePager;

type
  TLineStyleObj = class

  end;
  
  TCAProp = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    qCur: TADOQuery;
    dsCur: TDataSource;
    qCAProp2: TADOQuery;
    dsCAProp: TDataSource;
    cdsCAProp: TClientDataSet;
    SQLUpdateDSProvider1: TSQLUpdateDSProvider;
    DataSetProvider1: TDataSetProvider;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    OpenPictureDialog1: TOpenPictureDialog;
    qPicSave: TADOQuery;
    qPicUpd: TADOQuery;
    ilButtons: TImageList;
    qStat: TADOQuery;
    dsStat: TDataSource;
    pcInfo: TAdvOfficePager;
    tsMain: TAdvOfficePage;
    Panel1: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Button1: TButton;
    RxDBCalcEdit2: TRxDBCalcEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    cbSTATUSNAME: TDBComboBox;
    edAIndex: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    Label10: TLabel;
    Bevel1: TBevel;
    DBEdit2: TDBEdit;
    Label12: TLabel;
    ColorDialog1: TColorDialog;
    procedure btnOkClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbLineStyleDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
    Fid_CA : Variant;
  public
    function SaveProp : boolean;
    procedure Initialize(id_CA : integer; ACopy : boolean);
  end;
                   
var
  CAProp: TCAProp;
function ShowCAProp(var id_CA : integer; ACopy : boolean = false): boolean;

implementation

uses uDM, foMyFunc;

{$R *.DFM}
function ShowCAProp(var id_CA : integer; ACopy : boolean): boolean;
var F : TCAProp;
begin
  Result := false;
  F := TCAProp.Create(nil);
  try
    F.Initialize(id_CA, ACopy);
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := F.SaveProp;
      id_CA := F.Fid_CA;
    end;
  finally
    F.Free;
  end;
end;

procedure TCAProp.btnOkClick(Sender: TObject);
var S2 : String;
begin
  if cdsCAProp.State in [dsEdit, dsInsert] then cdsCAProp.Post;
  if DBEdit1.Text = '' then
  begin
    pcInfo.ActivePage := tsMain;
    MessageBox(Handle, 'Name not input!', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(DBEdit1.Handle);
    ModalResult := mrNone;
    Exit;
  end;
 { if edAIndex.Text = '' then
  begin
    MessageBox(Handle, 'Index not input!', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(edAIndex.Handle);
    ModalResult := mrNone;
    Exit;
  end;  }


  S2 := 'SELECT id_CA FROM DW_CA WHERE Deleted=0 AND isGRP=1 and id_CA<>' + Inttostr(Fid_CA) + 'AND  UPPER(Name) = ' + '''' + AnsiUpperCase(Trim(DBEdit1.Text)) + '''';
  if DM.xxx_Group_Check_v2(S2) then
  begin
    pcInfo.ActivePage := tsMain;
    ModalResult := mrNone;
    Windows.SetFocus(DBEdit1.Handle);
    raise Exception.Create('Organization "' + DBEdit1.Text + '" already exists');
  end;
  S2 := 'SELECT id_CA FROM DW_CA WHERE isGRP=1 and Deleted=0 AND id_CA<>' + Inttostr(Fid_CA) + 'AND  UPPER(Aindex) = ' + '''' + AnsiUpperCase(Trim(edAIndex.Text)) + '''';
  if (Trim(edAIndex.Text) <> '') and DM.xxx_Group_Check_v2(S2) then
  begin
    ModalResult := mrNone;
    Windows.SetFocus(edAIndex.Handle);
    raise Exception.Create('Index "' + edAIndex.Text + '" already exists');
  end;

end;

procedure TCAProp.Initialize(id_CA: integer; ACopy : boolean);
var S : String;
   i : integer;
   Year, Month, Day: Word;
begin
  pcInfo.ActivePage := tsMain;
  qCur.Open;
  with qStat do
  begin
    Close;
    Open;
    First;
    while not Eof do
    begin
      cbSTATUSNAME.Items.Add(qStat.FieldbyNAme('STATUSNAME').AsString);
      Next;
    end;
  end;
  
  Fid_CA := id_CA;

  with cdsCAProp do
  begin
    Close;
    Params.ParamByName('id_CA').Value := Fid_CA;
    Open;
    if Fid_CA = -1 then
    begin
      Edit;
      Post;
    end;
  end;
  if ACopy then
    Fid_CA := -1;
  if Fid_CA = -1 then
    Caption := 'New organization'
  else
    Caption := 'Organization ' + cdsCAProp.FieldByName('NAME').AsString;
  try
    if cdsCAProp.FieldByName('ID_ICONS').AsInteger > 0 then
    begin
      DM.IconIn(cdsCAProp.FieldByName('ID_ICONS').AsInteger, Image1, nil);
    end;
  except
  end;

end;

function TCAProp.SaveProp: boolean;
var i, id_Icons : integer;
    ADOQ : TADOQuery;
    stm: TMemoryStream;
begin
  if cdsCAProp.State in [dsEdit, dsInsert] then cdsCAProp.Post;

  id_Icons := cdsCAProp.FieldByName('ID_ICONS').AsInteger;
  if (Image1.Picture.Graphic <> nil) and  (not Image1.Picture.Graphic.Empty) and (cdsCAProp.FieldByName('ID_ICONS').AsVariant = Null) then
  begin
    with qPicSave do
    begin
      stm := TMemoryStream.Create;
      try
        Image1.Picture.Graphic.SaveToStream(stm);
        stm.Position := 0;
        Parameters.ParamByName('pic').LoadFromStream(stm, ftBlob);
      finally
        stm.Free;
      end;

      ExecSQL;
    end;
    id_Icons := DM.GetMaxID('select max(id_Icons) AS ID FROM DW_Icons');
  end; 


  if Fid_CA = -1 then
    ADOQ := ADOQuery1
  else
    ADOQ := ADOQuery2;

  with cdsCAProp do
  begin
    if cdsCAProp.State in [dsEdit, dsInsert] then cdsCAProp.Post;

    for i := 0 to ADOQ.Parameters.Count - 1 do
    begin
      if FindField(ADOQ.Parameters[i].Name) <> nil then
      begin
        ADOQ.Parameters[i].Value := FindField(ADOQ.Parameters[i].Name).Value;
      //  ADOQ.Parameters[i].DataType := TDataType(FindField(ADOQ.Parameters[i].Name).FieldKind);
      end;
    end;
      if id_Icons > 0 then
        ADOQ.Parameters.ParamByName('id_Icons').Value := id_Icons
      else
        ADOQ.Parameters.ParamByName('id_Icons').Value := Null;

    ADOQ.ExecSQL;
  end;
  if Fid_CA = -1 then
  begin
    Fid_CA := DM.GetMaxID('select max(id_CA) AS ID FROM DW_CA');
    DM.AddToProtocol(Fid_CA, Null, 1);
  end;{
  else
    DM.AddToProtocol(Fid_CA, Null, 2)};

  Result := true;
end;

procedure TCAProp.Button1Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.fileName);
    cdsCAProp.Edit;
    cdsCAProp.FieldByName('ID_ICONS').AsVariant := Null;
    cdsCAProp.Post;
  end;
end;

procedure TCAProp.cbLineStyleDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var X, Y : integer;
begin

end;

end.
