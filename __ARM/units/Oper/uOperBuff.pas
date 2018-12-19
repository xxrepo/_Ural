unit uOperBuff;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uDM,
  frArc, frBuffSelector, DB, DBClient, ExtCtrls, StdCtrls, Buttons, Menus,
  ActnList, ImgList;

type
  TOperBuff = class(TForm)
    fArc1: TfArc;
    pnDate: TPanel;
    Label1: TLabel;
    edObjName: TEdit;
    BitBtn1: TBitBtn;
    ActionList1: TActionList;
    ImageList1: TImageList;
    aLoad: TAction;
    aSave: TAction;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure fArc1dsArcDataChange(Sender: TObject; Field: TField);
    procedure aLoadExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
  private
    FID_Buff : integer;
  public
    procedure Initialize;
  end;

var
  OperBuff: TOperBuff;

implementation

uses uBuffSelector;

{$R *.DFM}

procedure TOperBuff.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TOperBuff.FormDestroy(Sender: TObject);
begin
  OperBuff := nil;
end;

procedure TOperBuff.Initialize;
begin
  fArc1.pnDate.Visible := false;
  fArc1.pnDate.Visible := false;
  fArc1.dsArc.DataSet := DM.cdsLCBuff;
  fArc1.aBuffAdd.Visible := true;
  fArc1.aBuffDel.Visible := true;

 // fArc1.DisableEditAct;

  fArc1.aNewCopyOper2.Visible := true;
  fArc1.aProperty.Visible := true;
  fArc1.aDelete.Visible := true;
  fArc1.aNewCor.Visible := true;

  edObjName.Text := 'Временный буфер';
  FID_Buff := -13;

end;

procedure TOperBuff.BitBtn1Click(Sender: TObject);
var ID : integer;
    S : String;
begin
  Screen.Cursor := crSQLWait;
  try
    ID := FID_Buff;
    if SelectBuff(ID, S) then
    begin
      FID_Buff := ID;
      edObjName.Text := S;
      if FID_Buff = -13 then
      begin
        DM.cdsOPBuff.Close;
        fArc1.dsArc.DataSet := DM.cdsLCBuff;
      end
      else
      begin
        fArc1.dsArc.DataSet := DM.cdsOPBuff;
        with DM.cdsOPBuff do
        begin
          Close;
          DM.cdsOPBuff.Params.ParamByName('@id_Buff').Value := FID_Buff;
          Open;
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TOperBuff.fArc1dsArcDataChange(Sender: TObject; Field: TField);
begin
  fArc1.dsArcDataChange(Sender, Field);
  aSave.Enabled := not TDataSource(Sender).DataSet.IsEmpty;
end;

procedure TOperBuff.aLoadExecute(Sender: TObject);
var F: TextFile;
    S : String;
    SL : TStringList;
    i : integer;
begin
  if OpenDialog1.Execute then
  begin
    if not fArc1.dsArc.DataSet.IsEmpty then
    begin
      case MessageBox(Handle, Pchar('В буфере находится ' + IntToStr(fArc1.dsArc.DataSet.RecordCount) + ' операций' + #13 + #10 +
                    'Очистить буфер перед загрузкой?'), 'Очистить буфер?', MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONQUESTION) of
        IDYES :
        begin
          with DM.cdsOPBuff do
          begin
            Last;
            while not IsEmpty do
              DM.UnDelOperFromBuff(fArc1.dsArc.DataSet);
          end;
        end;
        IDCANCEL : Abort;
      end;
    end;
    AssignFile(F, OpenDialog1.Filename);
    Screen.Cursor := crSQLWait;
    try
      Reset(F);
      Read(F, S);

      if FID_Buff = -13 then
      begin
        with DM.cdsBufImp do
        begin
          Close;
          Params.ParamByName('@LDList').Value := S;
          try
            Open;
            First;
            while not Eof do
            begin
              DM.UnAddOperToBuff(DM.cdsBufImp , -13);
              Next;
            end;
          finally
            Close;
          end;
        end;
      end
      else
      begin
        SL := TStringList.Create;
        try
          SL.Text := Trim(StringReplace(S, ',', #13 + #10, [rfReplaceAll, rfIgnoreCase]));
          for i := 0 to SL.Count - 1 do
            DM.rsCA.AppServer.OP_BuffAddItem(FID_Buff, StrToInt(SL[i]));
        finally
          fArc1.aRefreshe.Execute;
          SL.Free;
        end;
      end;
    finally
      Screen.Cursor := crDefault;
      CloseFile(F);
    end;
  end;
end;

procedure TOperBuff.aSaveExecute(Sender: TObject);
var F: TextFile;
    S : String;
begin
  if SaveDialog1.Execute then
  begin
    AssignFile(F, SaveDialog1.Filename);
    rewrite (f);
    try
      with fArc1.dsArc.DataSet do
      begin
        First;
        while not Eof do
        begin
          S := ',' + FieldByName('id_Oper').AsString;
          Write(F, S);

          Next;
        end;
      end;
    finally
      CloseFile(F);
    end;
  end;
end;

end.
