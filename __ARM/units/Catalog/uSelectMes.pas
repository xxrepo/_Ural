unit uSelectMes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RXSpin,foMyFunc, ComCtrls, frCurSelector, RxLookup,
  Db, DBClient;

type
  TSelectMes = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    PageControl1: TPageControl;
    tsCur: TTabSheet;
    tsFormal: TTabSheet;
    tsFunc: TTabSheet;
    fCurSelector: TfCurSelector;
    tsMes: TTabSheet;
    cdsFormal: TClientDataSet;
    cdsFormalid_FormalDistrib: TAutoIncField;
    cdsFormalName: TStringField;
    dsFormal: TDataSource;
    cdsFunc: TClientDataSet;
    cdsFuncid_FuncDistrib: TAutoIncField;
    cdsFuncName: TStringField;
    dsFunc: TDataSource;
    Label8: TLabel;
    lcFormalDistrib: TRxDBLookupCombo;
    Label10: TLabel;
    lcFuncDistrib: TRxDBLookupCombo;
    cdsWMes: TClientDataSet;
    cdsWMesid_Measure: TIntegerField;
    cdsWMesName: TStringField;
    cdsWMesShortName: TStringField;
    cdsWMesid_BaseMeasure: TIntegerField;
    cdsWMesKoef: TFloatField;
    cdsWMesDisabled: TBooleanField;
    dsWMes: TDataSource;
    Label11: TLabel;
    lcbWMes: TRxDBLookupCombo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function ShowSelectMes(bSelMes, bFormal, bFunc, bCur : boolean;
                          id_Bsn : integer;
                          var AID : integer;
                          var AName : String) : boolean;
var
  SelectMes: TSelectMes;

implementation

//uses uArc, uArcLc;

function ShowSelectMes(bSelMes, bFormal, bFunc, bCur : boolean;
                        id_Bsn : integer;
                        var AID : integer;
                        var AName : String) : boolean;
var F : TSelectMes;
begin
  Result := false;
  F := TSelectMes.Create(nil);
  try
    if bSelMes then
      F.PageControl1.ActivePage := F.tsMes;
    if bFormal then
      F.PageControl1.ActivePage := F.tsFormal;
    if bFunc then
      F.PageControl1.ActivePage := F.tsFunc;
    if bCur then
      F.PageControl1.ActivePage := F.tsCur;
    F.Caption := F.PageControl1.ActivePage.Caption;

    if F.PageControl1.ActivePage = F.tsMes then
    begin

    end
    else
      if F.PageControl1.ActivePage = F.tsFormal then
      begin
        F.cdsFormal.Close;
        F.cdsFormal.Params.ParamByName('@id_Bsn').Value := id_Bsn;
        F.cdsFormal.Open;
        F.lcFormalDistrib.KeyValue := AID;
      end
      else
        if F.PageControl1.ActivePage = F.tsFunc then
        begin
          F.cdsFunc.Close;
          F.cdsFunc.Params.ParamByName('@id_Bsn').Value := id_Bsn;
          F.cdsFunc.Open;
          F.lcFuncDistrib.KeyValue := AID;
        end
        else
          if F.PageControl1.ActivePage = F.tsCur then
          begin
            F.fCurSelector.Initialize(id_Bsn);
            F.fCurSelector.ID_Curr := AID;
          end;

    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := true;
      if F.PageControl1.ActivePage = F.tsMes then
      begin

      end
      else
        if F.PageControl1.ActivePage = F.tsFormal then
        begin
          AID := F.lcFormalDistrib.KeyValue;
          AName := F.lcFormalDistrib.DisplayValue;
        end
        else
          if F.PageControl1.ActivePage = F.tsFunc then
          begin
            AID := F.lcFuncDistrib.KeyValue;
            AName := F.lcFuncDistrib.DisplayValue;
          end
          else
            if F.PageControl1.ActivePage = F.tsCur then
            begin
              AID := F.fCurSelector.ID_Curr;
              AName := F.fCurSelector.CurName;
            end;
    end;
  finally
    F.Free;
  end;
end;

{$R *.DFM}

procedure TSelectMes.FormCreate(Sender: TObject);
var i : integer;
begin
  for i := 0 to PageControl1.PageCount - 1 do
  begin
    PageControl1.Pages[i].TabVisible := false;
  end;   
end;

end.
