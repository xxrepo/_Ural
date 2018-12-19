unit uBlnDetail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, frBsnSelector, foMyFunc, frArcLite,
  Mask, ToolEdit, Menus, Db, DBClient;

type
  TBlnDetail = class(TForm)
    Panel1: TPanel;
    btnCancel: TButton;
    Panel3: TPanel;
    Label1: TLabel;
    edSum: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    Panel5: TPanel;
    fBsnSelector1: TfBsnSelector;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    dtFrom: TDateEdit;
    dtTo: TDateEdit;
    fArcLite1: TfArcLite;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FBlnDetail : TBlnDetailData;
    procedure InitializeClick;
  public
    procedure Initialize(ABlnDetail : TBlnDetailData);
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  BlnDetail: TBlnDetail;

  procedure ShowBlnDetail(ABlnDetail : TBlnDetailData);

implementation

uses uDM;

{$R *.DFM}

procedure ShowBlnDetail(ABlnDetail : TBlnDetailData);
var F : TBlnDetail;
begin
 // DM.Rights_GetUserRights(6, Null);
  F := TBlnDetail.Create(nil);
  try
    F.Show;
    F.Repaint;
    F.Initialize(ABlnDetail);
  LoadFormSettingsToRegistry(F, SRegPath + '\' + F.Name
//  + VarToStr(ABlnDetail.id_business)
  + VarToStr(ABlnDetail.isRawZ)
  + VarToStr(ABlnDetail.isNotRawZ)
  + VarToStr(ABlnDetail.isCRN)
  + VarToStr(ABlnDetail.isUp)
  + VarToStr(ABlnDetail.isDown)
  + VarToStr(ABlnDetail.isInFromManuf)
//  + VarToStr(ABlnDetail.id_Manufact)
  );
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

{ TRptForm }

constructor TBlnDetail.Create(AOwner: TCOmponent);
var    V : Variant;
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  fArcLite1.ToolBar2.Visible := true;
  LoadValFromRegistry(V, SRegPath + '\' + Name, 'id_Bsn');
//  if V <> Null then
//    fRptFrame1.fBsnSelector1.ID := V;

end;

procedure TBlnDetail.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TBlnDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TBlnDetail.btnCancelClick(Sender: TObject);
begin
  Close;
end;

destructor TBlnDetail.Destroy;
begin
//  SaveValToRegistry(fRptFrame1.dtFrom.Date, SRegPath + '\' + Name, 'dtFrom');
//  SaveValToRegistry(fRptFrame1.dtTo.Date, SRegPath + '\' + Name, 'dtTo');
//  SaveValToRegistry(fRptFrame1.fBsnSelector1.ID, SRegPath + '\' + Name, 'id_Bsn');
  inherited;

end;

procedure TBlnDetail.fBsnSelector1Button1Click(Sender: TObject);
var Old : Variant;
begin
  Old := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if fBsnSelector1.ID <> Old then
    InitializeClick;
end;

procedure TBlnDetail.Button1Click(Sender: TObject);
begin
  InitializeClick;
end;

procedure TBlnDetail.InitializeClick;
begin
  FBlnDetail.id_business := fBsnSelector1.ID;
  FBlnDetail.DateFrom := dtFrom.Date;
  FBlnDetail.DateTo := dtTo.Date;
  Initialize(FBlnDetail);
end;

procedure TBlnDetail.Initialize(ABlnDetail: TBlnDetailData);
var FFF : Extended;
begin
  fArcLite1.Setid_business(ABlnDetail.id_business);
  FBlnDetail := ABlnDetail;

  if fBsnSelector1.ID <> FBlnDetail.id_business then
    fBsnSelector1.ID := FBlnDetail.id_business;

  dtFrom.Date := FBlnDetail.DateFrom;
  dtTo.Date := FBlnDetail.DateTo;

  if FBlnDetail.isRawZ then
    Caption := 'Сырьевые затраты'
  else
    if FBlnDetail.isNotRawZ then
      Caption := 'Несырьевые затраты'
    else
      if FBlnDetail.isCRN then
        Caption := 'Курсовые изменения'
      else
        if FBlnDetail.isUp then
          Caption := 'Прибыль'
        else
          if FBlnDetail.isInFromManuf then
            Caption := 'Приход с производства'
          else
            if FBlnDetail.isUp then
              Caption := 'Прибыль'
            else
              if FBlnDetail.isDown then
                Caption := 'Убыток';

  Screen.Cursor := crSQLWait;
  try
    if fBsnSelector1.ID > 0 then
    begin
      fArcLite1.Initialize(FBlnDetail);
      with fArcLite1.cdsArcLite do
      begin
        DisableControls;
        First;
        FFF := 0;
        while not Eof do
        begin
          FFF := FFF + FieldByName('WorkSum').AsFloat;
          Next;
        end;
        First;
        edSum.Text := Trim(StringReplace(FormatFloat('### ### ### ##0.00', FFF), ' ', '', [rfReplaceAll]));
      end;
    end;
  finally
    fArcLite1.cdsArcLite.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TBlnDetail.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + Name
//  + VarToStr(FBlnDetail.id_business)
  + VarToStr(FBlnDetail.isRawZ)
  + VarToStr(FBlnDetail.isNotRawZ)
  + VarToStr(FBlnDetail.isCRN)
  + VarToStr(FBlnDetail.isUp)
  + VarToStr(FBlnDetail.isInFromManuf)
//  + VarToStr(FBlnDetail.id_Manufact)
  );
end;

end.
