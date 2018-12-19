unit uBlnDetail_2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, frBsnSelector, foMyFunc, frArcLite,
  Mask, ToolEdit, Menus, Db, DBClient, DBGridEh;

type
  TBlnDetail_2 = class(TForm)
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
    fArcLite1: TfArcLite;
    Label2: TLabel;
    dtTo: TDateTimePicker;
    dtTimeTo: TDateTimePicker;
    Label3: TLabel;
    cdsArcLite_v2: TClientDataSet;
    cdsCRep: TClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dtToChange(Sender: TObject);
  private
    FBlnDetail : TBlnDetailData;
    FB_CR : boolean;
    procedure InitializeClick;
    function GetBlnDateTime: Variant;
    procedure SetBlnDateTime(const Value: Variant);
  public
    procedure Initialize_CR(ABlnDetail : TBlnDetailData);
    procedure Initialize(ABlnDetail : TBlnDetailData);
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
    property BlnDateTime : Variant read GetBlnDateTime write SetBlnDateTime;
  end;

var
  BlnDetail_2: TBlnDetail_2;

  procedure ShowBlnDetail_2(ABlnDetail : TBlnDetailData);

  procedure ShowCRDetail_2(ACaption : String; ABlnDetail : TBlnDetailData);

implementation

uses uDM;

{$R *.DFM}

procedure ShowCRDetail_2(ACaption : String; ABlnDetail : TBlnDetailData);
var F : TBlnDetail_2;
    i : integer;
begin
  F := TBlnDetail_2.Create(nil);
  try
    LoadFormSettingsToRegistry(F, SRegPath + '\' + F.ClassName + 'CR');
    F.fArcLite1.Setid_business(24);
    F.Caption := ACaption;
    F.FB_CR := true;
    for i := 0 to F.fArcLite1.RxDBGrid1.Columns.Count - 1 do
    begin
      if (Uppercase(F.fArcLite1.RxDBGrid1.Columns[i].FieldName) = 'WORKSUM') and (F.fArcLite1.RxDBGrid1.Columns[i].Tag = -1) then
      begin
        F.fArcLite1.RxDBGrid1.Columns[i].FieldName := 'S_in';
        F.fArcLite1.RxDBGrid1.Columns[i].Visible := true;
        F.fArcLite1.RxDBGrid1.Columns[i].Title.Caption := 'Компенсации';
        F.fArcLite1.RxDBGrid1.Columns[i].Footer.ValueType := fvtSum;
        F.fArcLite1.RxDBGrid1.Columns[i].Index := 1;
      //  Break;
      end;
      if (Uppercase(F.fArcLite1.RxDBGrid1.Columns[i].FieldName) = 'WORKSUM') and (F.fArcLite1.RxDBGrid1.Columns[i].Tag = 0) then
      begin
        F.fArcLite1.RxDBGrid1.Columns[i].FieldName := 'S_OUT';
        F.fArcLite1.RxDBGrid1.Columns[i].Visible := true;
        F.fArcLite1.RxDBGrid1.Columns[i].Title.Caption := 'Затраты';
        F.fArcLite1.RxDBGrid1.Columns[i].Footer.ValueType := fvtSum;
        F.fArcLite1.RxDBGrid1.Columns[i].Index := 0;
      end;
    end;
    F.fArcLite1.RxDBGrid1.SumList.Active := true;
    F.fArcLite1.RxDBGrid1.FooterRowCount := 1;
    F.Panel3.Visible := false;

    F.Panel5.Visible := false;
    F.fArcLite1.dsArc.DataSet := F.cdsCRep;
    F.Show;
    F.Repaint;
    F.Initialize_CR(ABlnDetail);
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;


procedure ShowBlnDetail_2(ABlnDetail : TBlnDetailData);
var F : TBlnDetail_2;
begin
//  DM.Rights_GetUserRights(6, Null);
  F := TBlnDetail_2.Create(nil);
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

constructor TBlnDetail_2.Create(AOwner: TCOmponent);
var    V : Variant;
begin
  inherited;
  FB_CR := false;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  fArcLite1.ToolBar2.Visible := true;
  LoadValFromRegistry(V, SRegPath + '\' + Name, 'id_Bsn');
//  if V <> Null then
//    fRptFrame1.fBsnSelector1.ID := V;
  dtTo.Date := Now;
  dtTimeTo.Time := Time;
  dtTo.Checked := false;
  dtTimeTo.Enabled := false;
  dtTimeTo.Checked := false;

end;

procedure TBlnDetail_2.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TBlnDetail_2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TBlnDetail_2.btnCancelClick(Sender: TObject);
begin
  Close;
end;

destructor TBlnDetail_2.Destroy;
begin
//  SaveValToRegistry(fRptFrame1.dtFrom.Date, SRegPath + '\' + Name, 'dtFrom');
//  SaveValToRegistry(fRptFrame1.dtTo.Date, SRegPath + '\' + Name, 'dtTo');
//  SaveValToRegistry(fRptFrame1.fBsnSelector1.ID, SRegPath + '\' + Name, 'id_Bsn');
  inherited;

end;

procedure TBlnDetail_2.fBsnSelector1Button1Click(Sender: TObject);
var Old : Variant;
begin
  Old := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if fBsnSelector1.ID <> Old then
    InitializeClick;
end;

procedure TBlnDetail_2.Button1Click(Sender: TObject);
begin
  InitializeClick;
end;

procedure TBlnDetail_2.InitializeClick;
begin
  if FB_CR then
  begin
    Screen.Cursor := crSQLWait;
    try
      fArcLite1.dsArc.DataSet.Close;
      fArcLite1.dsArc.DataSet.Open;
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else
  begin
    FBlnDetail.id_business := fBsnSelector1.ID;
    FBlnDetail.DateFrom := Null;
    FBlnDetail.DateTo := BlnDateTime;
    Initialize(FBlnDetail);
  end;
end;

procedure TBlnDetail_2.Initialize(ABlnDetail: TBlnDetailData);
var FFF : Extended;
    ADate : Variant;
begin
  fArcLite1.Setid_business(ABlnDetail.id_business);
  FBlnDetail := ABlnDetail;

  if fBsnSelector1.ID <> FBlnDetail.id_business then
    fBsnSelector1.ID := FBlnDetail.id_business;

  BlnDateTime := FBlnDetail.DateTo;

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
      with TClientDataSet(fArcLite1.dsArc.DataSet) do
      begin
        Close;
        Params.ParamByName('@id_business').Value := FBlnDetail.id_business;
        ADate := BlnDateTime;
        if ADate = Null then
          Params.ParamByName('@Date').Value := ADate
         else
           Params.ParamByName('@Date').AsDateTime := ADate {- 2};


        Params.ParamByName('@isRawZ').Value := FBlnDetail.isRawZ;
        Params.ParamByName('@isNotRawZ').Value := FBlnDetail.isNotRawZ;
        Params.ParamByName('@isCRN').Value := FBlnDetail.isCRN;
        Params.ParamByName('@isUp').Value := FBlnDetail.isUp;
        Params.ParamByName('@isDown').Value := FBlnDetail.isDown;
        Params.ParamByName('@isInFromManuf').Value := FBlnDetail.isInFromManuf;

        Params.ParamByName('@id_Manufact').Value := FBlnDetail.id_Manufact;
        Open;

        DisableControls;
        First;
        FFF := 0;
        while not Eof do
        begin
          FFF := FFF + FieldByName('WorkSum').AsFloat;
          Next;
        end;
        First;
        edSum.Text := FormatFloat('#0.00', FFF);
     //   edSum.Text := Trim(StringReplace(FormatFloat('### ### ### ##0.00', FFF), ' ', '', [rfReplaceAll]));
      end;
    end;
  finally
    fArcLite1.dsArc.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TBlnDetail_2.FormDestroy(Sender: TObject);
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

procedure TBlnDetail_2.dtToChange(Sender: TObject);
var B : boolean;
begin
  B := dtTimeTo.Checked and dtTimeTo.Enabled;
  dtTimeTo.Enabled := dtTo.Checked;
  dtTimeTo.Checked := B;
  Label1.Enabled := dtTo.Checked;

end;

function TBlnDetail_2.GetBlnDateTime: Variant;
begin
  if dtTo.Checked then
  begin
    Result := Int(dtTo.Date);
    if dtTimeTo.Enabled and dtTimeTo.Checked then
      Result := Result + Frac(dtTimeTo.Time)
    else
      Result := GetDateAdv(dtTo.Date, true)
  end
  else
    Result := Null;
end;

procedure TBlnDetail_2.SetBlnDateTime(const Value: Variant);
var TTT : Extended;
    Year, Month, Day, Hour, Min, Sec, MSec: Word;
    V : Variant;
begin
  if BlnDateTime = Value then
    Exit;
  if Value = Null then
  begin
    dtTo.Checked := false;
  end
  else
  begin
    DecodeDate(Value, Year, Month, Day);
    DecodeTime(Value, Hour, Min, Sec, MSec);
    if (Hour=23) and (Min=59) and (Sec=59) and (MSec>0) then
      V := EncodeDate(Year, Month, Day)
    else
      V := Value;

    TTT := Frac(V);
    dtTo.Date := V;
    dtTimeTo.Time := TTT;
    dtTo.Checked := true;
    dtTimeTo.Checked := TTT <> 0;
  end;
  dtTimeTo.Enabled := dtTo.Checked;
  Label1.Enabled := dtTo.Checked;
end;

procedure TBlnDetail_2.Initialize_CR(ABlnDetail: TBlnDetailData);
var FFF : Extended;
    ADate : Variant;
begin
  fArcLite1.Setid_business(ABlnDetail.id_business);
  FBlnDetail := ABlnDetail;

  BlnDateTime := FBlnDetail.DateTo;

  Screen.Cursor := crSQLWait;
  try
      with TClientDataSet(fArcLite1.dsArc.DataSet) do
      begin
        Close;
        Params.ParamByName('@DateFrom').Value := FBlnDetail.DateFrom;
        Params.ParamByName('@DateTo').Value := FBlnDetail.DateTo;
        Params.ParamByName('@id_Rep').Value := FBlnDetail.id_Rep;
        Params.ParamByName('@id_X').Value := FBlnDetail.id_X;
        Params.ParamByName('@V').Value := 2;

        Open;

        DisableControls;
     {   First;
        FFF := 0;
        while not Eof do
        begin
          FFF := FFF + FieldByName('S_OUT').AsFloat;
          Next;
        end;
        First;
        edSum.Text := FormatFloat('#0.00', FFF);        }
      end;
  finally
    fArcLite1.dsArc.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

end.
