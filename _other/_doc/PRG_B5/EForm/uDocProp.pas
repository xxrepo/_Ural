unit uDocProp;

interface

uses
  Windows, Messages, {$IFDEF VER150} Variants,{$ENDIF} SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBCtrls,
  RxLookup, Db, ADODB, Provider, MtUPDPrv, DBClient, ExtDlgs, jpeg, ImgList,
  RXDBCtrl, ComCtrls, ActnList, ToolWin, Grids, DBGrids, frDocProp;

type
  TDocProp = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fDocProp1: TfDocProp;
    Button1: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure fDocProp1Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
    function SaveProp : boolean;
    procedure Initialize(ACopy  :boolean; id_DocBase : integer; id_DocType : integer; id_CA : integer);
  end;
                   
var
  DocProp: TDocProp;
function ShowDocProp(ACopy  :boolean; var id_DocBase : integer; id_DocType : integer = -1; id_CA : integer = -1): boolean;

implementation

uses uDM, foMyFunc, uDTSelector, uDocList;

{$R *.DFM}
function ShowDocProp(ACopy : boolean; var id_DocBase : integer; id_DocType : integer; id_CA : integer): boolean;
var F : TDocProp;
    b : boolean;
begin
  Result := false;
  F := TDocProp.Create(nil);
  try
    F.Initialize(ACopy, id_DocBase, id_DocType, id_CA);
    F.ShowModal;
    if (F.ModalResult = mrOk) or (F.ModalResult = mrYes) then
    begin
      Result := F.SaveProp;
      id_DocBase := F.fDocProp1.Fid_DocBase;

      if (F.ModalResult = mrYes) and assigned(DocList) then
      begin
        Result := true;
        DocList.fDoc1.FAddEvent := true;
      end;
    end;
  finally
    F.Free;
  end;
end;

procedure TDocProp.btnOkClick(Sender: TObject);
var S2 : String;
begin
  if fDocProp1.cdsDocProp.State in [dsEdit, dsInsert] then fDocProp1.cdsDocProp.Post;
 { if DBEdit1.Text = '' then
  begin
    MessageBox(Handle, 'Не выбран тип документа!', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(DBEdit1.Handle);
    ModalResult := mrNone;
    Exit;
  end;     }
{  if lcCA.KeyValue = Null then
  begin
    MessageBox(Handle, 'Organization not selected!', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(lcCA.Handle);
    ModalResult := mrNone;
    Exit;
  end;
  if (DBDateEdit1.Date=0) and (DBDateEdit1.Enabled) then
  begin
    MessageBox(Handle, 'Date not selected!', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(DBDateEdit1.Handle);
    ModalResult := mrNone;
    Exit;
  end;    }
 { if (DBEdit3.Text = '') and (DBEdit3.Enabled) then
  begin
    MessageBox(Handle, 'Number not selected!', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(DBEdit3.Handle);
    ModalResult := mrNone;
    Exit;
  end;    }


 { S2 := 'SELECT id_CA FROM DW_DocBase WHERE Deleted=0 AND id_DocBase<>' + Inttostr(Fid_DocBase) + 'AND  UPPER(Name) = ' + '''' + AnsiUpperCase(Trim(DBEdit1.Text)) + '''';
  if DM.xxx_Group_Check_v2(S2) then
  begin
    ModalResult := mrNone;
    Windows.SetFocus(DBEdit1.Handle);
    raise Exception.Create('Organization "' + DBEdit1.Text + '" already exists');
  end; }
end;

procedure TDocProp.Initialize(ACopy  :boolean; id_DocBase: integer; id_DocType : integer; id_CA : integer);
begin
  fDocProp1.Initialize(ACopy, id_DocBase, id_DocType, id_CA);
  if not fDocProp1.cdsDocProp.FieldByName('DateClosed').IsNull then
   Button1.Enabled := false;
end;

function TDocProp.SaveProp: boolean;
begin
  Result := fDocProp1.SaveProp;
end;



procedure TDocProp.Button1Click(Sender: TObject);
begin
  if fDocProp1.cdsDocProp.State in [dsEdit, dsInsert] then fDocProp1.cdsDocProp.Post;

end;

procedure TDocProp.fDocProp1Button2Click(Sender: TObject);
begin
  fDocProp1.Button2Click(Sender);

end;

procedure TDocProp.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name);

end;

procedure TDocProp.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + Name);

end;

end.
