unit uBalanceBsn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBClient, Grids, DBGrids, RXDBCtrl,
  frBsnSelector, ComCtrls, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL,
  dxPSCore, dxPSdxTLLnk, dxPSdxDBCtrlLnk, dxPSdxDBTLLnk, dxPrnDlg,
  ActnList, ImgList, Buttons,
  dxPSGlbl, Menus, Mask, ToolEdit, CurrEdit, AdvEdit, advlued
  ;

type
  TBalanceBsn = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    DataSource1: TDataSource;
    cdsBal: TClientDataSet;
    cdsBalID: TAutoIncField;
    cdsBalid_Rr: TIntegerField;
    cdsBalRowLevel: TIntegerField;
    cdsBalRowName: TStringField;
    cdsBalIsDeb: TBooleanField;
    cdsBalOrdNum: TIntegerField;
    cdsBalisTotal: TBooleanField;
    cdsBalOperSummSysCur: TFloatField;
    cdsBalid_Acc: TIntegerField;
    cdsBalid_Manufact: TIntegerField;
    cdsBalid_Goods: TIntegerField;
    cdsBalid_CAGroup: TIntegerField;
    Panel1: TPanel;
    fBsnSelector1: TfBsnSelector;
    dtTo: TDateTimePicker;
    Label2: TLabel;
    Button1: TButton;
    dxPrintDialog1: TdxPrintDialog;
    ActionList1: TActionList;
    ilButtons: TImageList;
    aPrint: TAction;
    BitBtn1: TBitBtn;
    dxComponentPrinter2: TdxComponentPrinter;
    dxComponentPrinter1Link2: TdxDBTreeListReportLink;
    aPreview: TAction;
    aClosePeriod: TAction;
    ClientDataSet1: TClientDataSet;
    BitBtn3: TBitBtn;
    aSave: TAction;
    BitBtn2: TBitBtn;
    cdsBsnData: TClientDataSet;
    cdsBsnDataCnt: TIntegerField;
    cdsBsnDataNAMEMain: TStringField;
    Panel3: TPanel;
    lbInfo: TLabel;
    PopupMenu1: TPopupMenu;
    aShowAccCard: TAction;
    aShowBalance: TAction;
    aShowGoodsSum: TAction;
    cdsBalID_Oper: TIntegerField;
    cdsBalid_Warehouse: TIntegerField;
    cdsBalid_repr: TIntegerField;
    cdsBalid_ContrAgent: TIntegerField;
    dxDBTreeList1: TdxDBTreeList;
    aShowRawSum: TAction;
    aShowExtRawSum: TAction;
    aShowServiceSum: TAction;
    N2: TMenuItem;
    aExpandNode: TAction;
    aExpandAll: TAction;
    aCollapseNode: TAction;
    aCollapseAll: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    aExport: TAction;
    BitBtn5: TBitBtn;
    aNodeExp: TAction;
    N12: TMenuItem;
    N13: TMenuItem;
    aBlnDetail: TAction;
    Label1: TLabel;
    dtTimeTo: TDateTimePicker;
    aShowInRoot: TAction;
    N15: TMenuItem;
    N16: TMenuItem;
    cdsBalid_Acc_Group: TIntegerField;
    cdsBalid_Manufact_Group: TIntegerField;
    cdsBalid_Warehouse_Group: TIntegerField;
    cdsBalHasChld: TBooleanField;
    aUnShowInRoot: TAction;
    N17: TMenuItem;
    dxDBTreeList1ID: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Rr: TdxDBTreeListMaskColumn;
    dxDBTreeList1RowLevel: TdxDBTreeListMaskColumn;
    dxDBTreeList1RowName: TdxDBTreeListMaskColumn;
    dxDBTreeList1IsDeb: TdxDBTreeListCheckColumn;
    dxDBTreeList1OrdNum: TdxDBTreeListMaskColumn;
    dxDBTreeList1isTotal: TdxDBTreeListCheckColumn;
    dxDBTreeList1OperSummSysCur: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Acc: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Manufact: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Raw: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_ExtRaw: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Service: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Goods: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_CAGroup: TdxDBTreeListMaskColumn;
    dxDBTreeList1ID_Oper: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Warehouse: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_repr: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_ContrAgent: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Acc_Group: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Manufact_Group: TdxDBTreeListMaskColumn;
    dxDBTreeList1id_Warehouse_Group: TdxDBTreeListMaskColumn;
    dxDBTreeList1HasChld: TdxDBTreeListCheckColumn;
    ilEM: TImageList;
    aShowAccCard_Adv: TAction;
    N18: TMenuItem;
    aBlnDetail_2: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    cdsBalOnTop: TBooleanField;
    cdsBalDelta: TFloatField;
    cdsBalOperSummSysCurOLD: TFloatField;
    dtTFrom: TDateTimePicker;
    Label3: TLabel;
    dtDFrom: TDateTimePicker;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    aBlnDetail_3: TAction;
    N5: TMenuItem;
    Label6: TLabel;
    RxCalcEdit1: TRxCalcEdit;
    aShowB2: TAction;
    N6: TMenuItem;
    aA2: TAction;
    N14: TMenuItem;
    cdsBalRowOrd: TIntegerField;
    cdsBalTek: TIntegerField;
    cdsBalVal1: TFloatField;
    cdsBalDelta1: TFloatField;
    cdsBalVal2: TFloatField;
    cdsBalDelta2: TFloatField;
    cdsBalVal3: TFloatField;
    cdsBalDelta3: TFloatField;
    cdsBalVal4: TFloatField;
    cdsBalDelta4: TFloatField;
    cdsBalVal5: TFloatField;
    cdsBalDelta5: TFloatField;
    dxDBTreeList1Val1: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta1: TdxDBTreeListMaskColumn;
    dxDBTreeList1Val2: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta2: TdxDBTreeListMaskColumn;
    dxDBTreeList1Val3: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta3: TdxDBTreeListMaskColumn;
    dxDBTreeList1Val4: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta4: TdxDBTreeListMaskColumn;
    dxDBTreeList1Val5: TdxDBTreeListMaskColumn;
    dxDBTreeList1Delta5: TdxDBTreeListMaskColumn;
    cbDeltaz: TCheckBox;
    cbCurRez: TCheckBox;
    Action1: TAction;
    Button2: TButton;
    aNoDeptCA: TAction;
    aOffPM: TAction;
    Edit1: TAdvLUEdit;
    dxDBTreeList1Column25: TdxDBTreeListMaskColumn;
    dxDBTreeList1Column24: TdxDBTreeListMaskColumn;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure dxDBTreeList1CustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure aPrintExecute(Sender: TObject);
    procedure aPreviewExecute(Sender: TObject);
    procedure aClosePeriodExecute(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure aSaveExecute(Sender: TObject);
    procedure cdsBalBeforeClose(DataSet: TDataSet);
    procedure dxComponentPrinter1Link2CustomDrawCell(
      Sender: TBasedxReportLink; ACanvas: TCanvas; ABoundsRect,
      AClientRect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; var AText: String; var AColor: TColor;
      AFont: TFont; var ATextAlignX: TdxTextAlignX;
      var ATextAlignY: TdxTextAlignY; var ADone: Boolean);
    procedure dtToChange(Sender: TObject);
    procedure aShowAccCardExecute(Sender: TObject);
    procedure aShowBalanceExecute(Sender: TObject);
    procedure aShowGoodsSumExecute(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure aExpandNodeExecute(Sender: TObject);
    procedure aExpandAllExecute(Sender: TObject);
    procedure aCollapseNodeExecute(Sender: TObject);
    procedure aCollapseAllExecute(Sender: TObject);
    procedure dxDBTreeList1ChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure aExportExecute(Sender: TObject);
    procedure aNodeExpExecute(Sender: TObject);
    procedure aBlnDetailExecute(Sender: TObject);
    procedure aShowInRootExecute(Sender: TObject);
    procedure aUnShowInRootExecute(Sender: TObject);
    procedure dxDBTreeList1GetSelectedIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure dxDBTreeList1GetImageIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cdsBalOperSummSysCurGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure aShowAccCard_AdvExecute(Sender: TObject);
    procedure dxDBTreeList1Deletion(Sender: TObject;
      Node: TdxTreeListNode);
    procedure aBlnDetail_2Execute(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure dtDFromChange(Sender: TObject);
    procedure aBlnDetail_3Execute(Sender: TObject);
    procedure cdsBalDeltaGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure RxCalcEdit1Change(Sender: TObject);
    procedure aShowB2Execute(Sender: TObject);
    procedure aA2Execute(Sender: TObject);
    procedure cbDeltazClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure aNoDeptCAExecute(Sender: TObject);
    procedure aOffPMExecute(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FFFNode : TdxTreeListNode;
    Val : Variant;
    FMode : integer;
    procedure GetAGPrinterInfo;
    procedure InitializeClick;
    function GetBlnDateTime_int(ATo : boolean): Variant;
    procedure SetBlnDateTime_int(const Value: Variant; ATo : boolean);
    procedure SetShowInRoot(AShowInRoot: WordBool);
    function GetBlnDateTime: Variant;
    procedure SetBlnDateTime(const Value: Variant);
    function GetBlnDateTimeFrom: Variant;
    procedure SetBlnDateTimeFrom(const Value: Variant);
    procedure cbDeltazCH;
    procedure SelectText(AText: String);
    function SelectEvent(OrdNum : integer; AText : String) : boolean;
  public
    constructor Create(AOwner : TCOmponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    destructor Destroy; override;
    procedure Initialize(id_business : Variant; ADate : Variant;
                         AClosePeriod : boolean = false;
                         ASave : boolean = false;
                         CDS: TClientDataSet = nil; AMode : integer = 0);

    property BlnDateTime : Variant read GetBlnDateTime write SetBlnDateTime;
    property BlnDateTimeFrom : Variant read GetBlnDateTimeFrom write SetBlnDateTimeFrom;
  end;

procedure ShowBlnBsn(id_business : Variant; ADate : Variant; AMode : integer = -1);

var
  BalanceBsn: TBalanceBsn;

implementation

uses uDM, foMyFunc, uAccCard, uBalance, uMovWH,
  foMyFuncDXTreeExcel, uBlnDetail, uAccCard_Adv, uBlnDetail_2, uBlnDetail_3,
  uBalance_v2, uAccCard_v2, uFormApi_Oper;

{$R *.DFM}

procedure ShowBlnBsn(id_business : Variant; ADate : Variant; AMode : integer);
var F : TBalanceBsn;
begin
  if AMode = -1 then
    DM.Rights_GetUserRights(6, Null)
  else
    DM.Rights_GetUserRights(15, Null);

  F := TBalanceBsn.Create(nil);
  try
    F.Show;
    F.Repaint;
    if DM.DefB > 0 then
      id_business := DM.DefB;
    F.Initialize(id_business, ADate, false, false, nil, AMode);
  except
    on E : Exception do
    begin
      F.Free;
      raise Exception.Create(E.Message);
    end;
  end;
end;

{ TBalanceBsn }

procedure TBalanceBsn.Initialize(id_business: Variant; ADate: Variant;
                                 AClosePeriod : boolean; ASave : boolean;
                                 CDS: TClientDataSet; AMode : integer);
var ADateFrom : Variant;
begin
  if id_business = Null then
    Exit;
  if AMode <> 0 then
    FMode := AMode;
  ComboBox1.Visible := FMode = 0;
  if not ComboBox1.Visible then
    ComboBox1.ItemIndex := 0;
  Label4.Visible := FMode = 0;
  Label5.Visible := FMode = 0;
  dtDFrom.Visible := FMode = 0;
  dtTFrom.Visible := FMode = 0;
  Label3.Visible := FMode = 0;
  BitBtn3.Visible := FMode = 0;
  cbDeltaz.Visible := FMode = 0;

  if FMode <> 0 then
  begin
    Caption := 'Состояния контрагентов';
    dtTo.Top := ComboBox1.Top;
    dtTimeTo.Top := ComboBox1.Top;

    Label2.Top := Label5.Top;
    Label1.Top := Label5.Top;
  end;
  
  if (id_business = Null) and (DM.FBsnList.Count = 1) then
    id_business := TBsnObj(DM.FBsnList[0]).ID;
  if (fBsnSelector1.ID <> id_business) and (id_business <> Null) then
    fBsnSelector1.ID := id_business;

  id_business := fBsnSelector1.ID;

  BlnDateTime := ADate;
  Self.ASave.Visible := DM.CheckUserRights(11, Null);// and (id_business <> Null);
  Self.aClosePeriod.Visible := DM.CheckUserRights(12, Null);// and (id_business <> Null);

  Screen.Cursor := crSQLWait;
  Button1.Enabled := false;
  try
    if CDS = nil then
    begin
      CDS := cdsBal;
      with cdsBsnData do
      begin
        Close;
        Params.ParamByName('@id_business').Value := id_business;



        if ADate = Null then
          Params.ParamByName('@Date').Value := ADate
         else
           Params.ParamByName('@Date').AsDateTime := ADate {- 2};
 //        ADateFrom := BlnDateTimeFrom;
   //      Params.ParamByName('@DateFrom').AsDateTime := ADateFrom {- 2};

        try
          if id_business > 0 then
            Open;
          if id_business > -1 then
            lbInfo.Caption := 'Валюта: ' + cdsBsnDataNAMEMain.AsString + ', не завизированных операций ' + cdsBsnDataCnt.AsString
          else
            lbInfo.Caption := '';
        finally
          Close;
        end;
      end;
    end;
      
    with CDS do
    begin
 //     DisableControls;
      Close;
      if Params.FindParam('@id_User') <> nil then
      begin
        if FMode = 0 then
          Params.ParamByName('@id_User').Value := DM.IDUser
        else
          if FMode = -1 then
            Params.ParamByName('@id_User').Value := -DM.IDUser
          else
            Params.ParamByName('@id_User').Value := Null;
      end;

      Params.ParamByName('@CurRez').Value := cbCurRez.Checked or cbDeltaz.Checked;
      Params.ParamByName('@Deltaz').Value := cbDeltaz.Checked;
      Params.ParamByName('@TechMode').Value := 0;
      Params.ParamByName('@id_business').Value := id_business;
      if ADate = Null then
        Params.ParamByName('@Date').Value := ADate
       else
         Params.ParamByName('@Date').AsDateTime := ADate {- 2};
      Params.ParamByName('@isDeBug').Value := false;
      Params.ParamByName('@ClosePeriod').Value := AClosePeriod;
      Params.ParamByName('@Save').Value := ASave;
      Params.ParamByName('@CalcAll').Value := false;
      if ComboBox1.ItemIndex = 1 then
      begin
        ADateFrom := BlnDateTimeFrom;
        Params.ParamByName('@DateFrom').AsDateTime := ADateFrom {- 2};
      end
      else
        Params.ParamByName('@DateFrom').Value := Null;
      
      if not AClosePeriod then
        Params.ParamByName('@MinCA').Value := RxCalcEdit1.Value;
      if not (id_business > 0) then
        Exit;
      if CDS = cdsBal then
      begin
        dxDBTreeList1Val1.Visible := false;
        dxDBTreeList1Delta1.Visible := false;
        dxDBTreeList1Val2.Visible := false;
        dxDBTreeList1Delta2.Visible := false;
        dxDBTreeList1Val3.Visible := false;
        dxDBTreeList1Delta3.Visible := false;
        dxDBTreeList1Val4.Visible := false;
        dxDBTreeList1Delta4.Visible := false;
        dxDBTreeList1Val5.Visible := false;
        dxDBTreeList1Delta5.Visible := false;
        
        Open;
        Filter := 'RowLevel=-13';
        Filtered := true;
        First;
        while not Eof do
        begin
          if cdsBalOrdNum.AsInteger = 1 then
          begin
            dxDBTreeList1Val1.Visible := cbCurRez.Checked;
            dxDBTreeList1Val1.Caption := cdsBalRowName.AsString;
            dxDBTreeList1Delta1.Visible := cbDeltaz.Checked;
            dxDBTreeList1Delta1.Caption := 'Изменение ' + cdsBalRowName.AsString;
          end;
          if cdsBalOrdNum.AsInteger = 2 then
          begin
            dxDBTreeList1Val2.Visible := cbCurRez.Checked;
            dxDBTreeList1Val2.Caption := cdsBalRowName.AsString;
            dxDBTreeList1Delta2.Visible := cbDeltaz.Checked;
            dxDBTreeList1Delta2.Caption := 'Изменение ' + cdsBalRowName.AsString;
          end;
          if cdsBalOrdNum.AsInteger = 3 then
          begin
            dxDBTreeList1Val3.Visible := cbCurRez.Checked;
            dxDBTreeList1Val3.Caption := cdsBalRowName.AsString;
            dxDBTreeList1Delta3.Visible := cbDeltaz.Checked;
            dxDBTreeList1Delta3.Caption := 'Изменение ' + cdsBalRowName.AsString;
          end;
          if cdsBalOrdNum.AsInteger = 4 then
          begin
            dxDBTreeList1Val4.Visible := cbCurRez.Checked;
            dxDBTreeList1Val4.Caption := cdsBalRowName.AsString;
            dxDBTreeList1Delta4.Visible := cbDeltaz.Checked;
            dxDBTreeList1Delta4.Caption := 'Изменение ' + cdsBalRowName.AsString;
          end;
          if cdsBalOrdNum.AsInteger = 5 then
          begin
            dxDBTreeList1Val5.Visible := cbCurRez.Checked;
            dxDBTreeList1Val5.Caption := cdsBalRowName.AsString;
            dxDBTreeList1Delta5.Visible := cbDeltaz.Checked;
            dxDBTreeList1Delta5.Caption := 'Изменение ' + cdsBalRowName.AsString;
          end;
          Next;
        end;
        Filter := 'RowLevel<>-13';
       { CDS.IndexDefs.Clear;
        CDS.IndexDefs.Add('ixOrdNum', 'OrdNum', [ixCaseInsensitive]);
        CDS.IndexName := 'ixOrdNum'; }
      end
      else
        Execute;
    end;
    if dxDBTreeList1.Count > 0 then
    begin
      dxDBTreeList1.Items[0].Focused := true;
      dxDBTreeList1.FullCollapse;
      dxDBTreeList1ChangeNode(dxDBTreeList1, nil, dxDBTreeList1.Items[0]);
    end;
  finally
    Screen.Cursor := crDefault;
    Button1.Enabled := id_business > -1;
  end;
end;

procedure TBalanceBsn.InitializeClick;
var id_business : Variant;
    ADate, ADate2 : Variant;
begin
  id_business := fBsnSelector1.ID;
  ADate := BlnDateTime;
  Initialize(id_business, ADate);
end;

procedure TBalanceBsn.Button1Click(Sender: TObject);
var
  OrdNum : integer;
  AText, AText2 : String;
begin
  AText := '';
  OrdNum := -1;
  if FFFNode <> nil then
  begin
    AText := FFFNode.Values[dxDBTreeList1RowName.Index];
    OrdNum := FFFNode.Values[dxDBTreeList1OrdNum.Index];
    if FFFNode.Parent <> nil then
      AText2 := FFFNode.Parent.Values[dxDBTreeList1RowName.Index];
  end;
{  if ComboBox1.ItemIndex = 1 then
  begin
    if not dtDFrom.Checked then
    begin
      MessageBox(Handle, 'Не введена дата', '', MB_ICONERROR + mb_OK);
      dtDFrom.Checked := true;
      Windows.SetFocus(dtDFrom.Handle);
      Exit;
    end;
  end; }
  InitializeClick;
  if not SelectEvent(OrdNum, AText) then
    if SelectEvent(OrdNum, AText2) then
      if FFFNode <> nil then FFFNode.Expand(false);
end;

constructor TBalanceBsn.Create(AOwner: TCOmponent);
begin
  inherited;
  Button1.Enabled := (fBsnSelector1.ID > -1);
  aNoDeptCA.Visible := DM.CheckUserRights(-13, -1);


  {dxDBTreeList1Val1.Visible := true;
  dxDBTreeList1Delta1.Visible := true;
  dxDBTreeList1Val2.Visible := true;
  dxDBTreeList1Delta2.Visible := true;
  dxDBTreeList1Val3.Visible := true;
  dxDBTreeList1Delta3.Visible := true;  }

  dxDBTreeList1.RegistryPath := SRegPath + '\' + ClassName + '\wwq' + dxDBTreeList1.Name;
  dxDBTreeList1.LoadFromRegistry(dxDBTreeList1.RegistryPath);
  dxDBTreeList1Val1.Visible := false;
  dxDBTreeList1Delta1.Visible := false;
  dxDBTreeList1Val2.Visible := false;
  dxDBTreeList1Delta2.Visible := false;
  dxDBTreeList1Val3.Visible := false;
  dxDBTreeList1Delta3.Visible := false; 
 // dxDBTreeList1.OptionsBehavior := dxDBTreeList1.OptionsBehavior + [etoStoreToRegistry];

  LoadValFromRegistry(Val, SRegPath + '\' + ClassName, 'cbDeltaz');
  if Val <> Null then
    cbDeltaz.Checked := Val;
  LoadValFromRegistry(Val, SRegPath + '\' + ClassName, 'cbCurRez');
  if Val <> Null then
    cbCurRez.Checked := Val;

  ComboBox1.ItemIndex := 1;
  ComboBox1Change(nil);
  LoadValFromRegistry(Val, SRegPath + '\' + ClassName, 'id_Bsn');
  lbInfo.Caption := '';
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  dtTo.Date := Now;
  dtTimeTo.Time := Time;
  dtTo.Checked := false;
  dtTimeTo.Enabled := dtTo.Checked;
  dtTimeTo.Checked := false;
  Label1.Enabled := dtTo.Checked;

  fBsnSelector1.UID := 15;

  dtDFrom.Date := Now - 0;
  dtTFrom.Time := Time;
//  dtDFrom.Checked := true;
//  dtTFrom.Enabled := dtDFrom.Checked;
  dtTFrom.Checked := false;
  Label3.Enabled := dtTFrom.Checked;
end;

procedure TBalanceBsn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

end;

procedure TBalanceBsn.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TBalanceBsn.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TBalanceBsn.dxDBTreeList1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  ColInd: Integer;
begin
  ColInd := dxDBTreeList1OrdNum.Index;
  if (ANode.Values[dxDBTreeList1id_Acc_Group.Index] <> Null) or
     (ANode.Values[dxDBTreeList1id_Warehouse_Group.Index] <> Null) or
     (ANode.Values[dxDBTreeList1id_Manufact_Group.Index] <> Null) or
     ((ANode.Values[dxDBTreeList1id_CAGroup.Index] <> Null) and (ANode.Values[dxDBTreeList1id_ContrAgent.Index] = Null)) then
       AFont.Style := AFont.Style + [fsBold];
    if (ANode.Parent = nil) then   // Верхний уровень
    begin
      AFont.Style := AFont.Style + [fsBold];
      if (ANode.Values[ColInd] = 200) then
      begin
        if ACanvas <> nil then
        begin
          ACanvas.Brush.Color := clWindow;
          ARect.Left := 0;
      //  ARect.Right := 0;
          ACanvas.FillRect(ARect);
        end;
        ADone := true;
      end
      else
      if (ANode.Values[ColInd] = 100) or (ANode.Values[ColInd] = 180) then
      begin
        AColor := clInfoBk;
        if ASelected then
          AFont.Color := clBlack;
      end
      else
        if (ANode.Values[ColInd] = 110) then
        begin
          if (ABS(ANode.Values[dxDBTreeList1OperSummSysCur.Index]) >= 0.005) then
          begin
            AColor := clRed;
          end
          else
          begin
            AColor := $00D7D700;
            AText := '0,00';
          end;
        end
        else
          if not ASelected then
            AColor := $00E0E2E4;
    end;
  if AFont.Style = [fsBold] then
    ANode.Data := Pointer(1013);
end;

procedure TBalanceBsn.aPrintExecute(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Print(True, nil, nil);
end;

procedure TBalanceBsn.GetAGPrinterInfo;
begin
  dxComponentPrinter1Link2.ReportTitleText := fBsnSelector1.BsnName + ' (' + FormatDateTime('dd-mm-yyyy', dtTo.DateTime) + ')'; //'Баланс';
//  dxComponentPrinter1Link2.ReportTitleText := dxComponentPrinter1Link2.ReportTitleText + #13 + #10 + lbInfo.Caption;
  dxComponentPrinter1Link2.ReportTitleMode := tmOnEveryTopPage;
end;


procedure TBalanceBsn.aPreviewExecute(Sender: TObject);
begin
  GetAGPrinterInfo;
  dxComponentPrinter2.Preview(True, nil);
end;

procedure TBalanceBsn.aClosePeriodExecute(Sender: TObject);
var id_business : Variant;
    ADate : Variant;
begin
  if MessageBox(Handle, 'Закрыть период?', Pchar('Закрыть период?'), MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = idYes then
  begin
    id_business := fBsnSelector1.ID;
    ADate := BlnDateTime;
    Initialize(id_business, ADate, true, false, ClientDataSet1);
    Initialize(id_business, ADate);
  end;
end;

procedure TBalanceBsn.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  aCollapseAll.Enabled := not cdsBal.IsEmpty;
  aExpandAll.Enabled := not cdsBal.IsEmpty;

  aClosePeriod.Enabled := not cdsBal.IsEmpty and not dtTo.Checked and (fBsnSelector1.ID > -1);
  aSave.Enabled := not cdsBal.IsEmpty and not dtTo.Checked and (fBsnSelector1.ID > -1);
  Button1.Enabled := (fBsnSelector1.ID > -1);

  aA2.Visible := not cdsBal.FieldByName('id_Acc').IsNull;
  aShowAccCard.Visible := not cdsBal.FieldByName('id_Acc').IsNull;
  aShowAccCard_adv.Visible := not cdsBal.FieldByName('id_Acc_Group').IsNull;

  aShowBalance.Visible := not cdsBal.FieldByName('id_ContrAgent').IsNull;
  aShowB2.Visible := not cdsBal.FieldByName('id_ContrAgent').IsNull;
  aNoDeptCA.Enabled := aShowB2.Visible;

  aShowGoodsSum.Visible := not cdsBal.FieldByName('id_Goods').IsNull and not cdsBal.FieldByName('id_Warehouse').IsNull;

  aBlnDetail.Visible := cdsBal.FieldByName('OrdNum').AsInteger in [60, 91, 80, 95, 98, 115, 90, 140, 150, 160, 163];
  aBlnDetail.Enabled := aBlnDetail.Visible;
  aBlnDetail_2.Visible := (ComboBox1.ItemIndex = 0) and (cdsBal.FieldByName('OrdNum').AsInteger in [60, 91, 80, 95, 98, 115, 90, 140, 150, 160, 163]);
  aBlnDetail_2.Enabled := aBlnDetail_2.Visible;

  aBlnDetail_3.Visible := (ComboBox1.ItemIndex = 1) and
                          ((cdsBal.FieldByName('OrdNum').AsInteger in [60, {90, 91,} 95, 98, 115{, 140, 163}]) OR
                           ((cdsBal.FieldByName('OrdNum').AsInteger in [90, 163]) and cdsBal.FieldByName('id_CAGroup').IsNull) OR
                           ((cdsBal.FieldByName('OrdNum').AsInteger in [91, 140]) and cdsBal.FieldByName('id_Manufact_Group').IsNull)
                           );
  aBlnDetail_3.Enabled := aBlnDetail_3.Visible;

  aShowInRoot.Enabled := (cdsBal.FieldByName('OrdNum').AsInteger in [70, 120, 20, 30, 40, 45, 50, 60, 140, 91])
                           and (not cdsBal.FieldByName('id_Rr').IsNull)
                           and (not cdsBal.FieldByName('id_Acc').IsNull or
                                not cdsBal.FieldByName('id_Manufact').IsNull or
                                not cdsBal.FieldByName('id_Warehouse').IsNull or
                                (not cdsBal.FieldByName('id_Acc_Group').IsNull and (cdsBal.FieldByName('id_Acc_Group').AsInteger > -1)) or
                                (not cdsBal.FieldByName('id_Manufact_Group').IsNull and (cdsBal.FieldByName('id_Manufact_Group').AsInteger > -1)) or
                                (not cdsBal.FieldByName('id_Warehouse_Group').IsNull and (cdsBal.FieldByName('id_Warehouse_Group').AsInteger > -1)) or
                                (not cdsBal.FieldByName('id_CAGroup').IsNull and (cdsBal.FieldByName('id_CAGroup').AsInteger > -1)) or
                                not cdsBal.FieldByName('id_ContrAgent').IsNull);
  aUnShowInRoot.Enabled := (cdsBal.FieldByName('OrdNum').AsInteger in [70, 120, 20, 30, 40, 45, 50, 60, 140, 91])
                           and (cdsBal.FieldByName('id_Rr').IsNull)
                           and (not cdsBal.FieldByName('id_Acc').IsNull or
                                not cdsBal.FieldByName('id_Manufact').IsNull or
                                not cdsBal.FieldByName('id_Warehouse').IsNull or
                                (not cdsBal.FieldByName('id_Acc_Group').IsNull and (cdsBal.FieldByName('id_Acc_Group').AsInteger > -1)) or
                                (not cdsBal.FieldByName('id_Manufact_Group').IsNull and (cdsBal.FieldByName('id_Manufact_Group').AsInteger > -1)) or
                                (not cdsBal.FieldByName('id_Warehouse_Group').IsNull and (cdsBal.FieldByName('id_Warehouse_Group').AsInteger > -1)) or
                                (not cdsBal.FieldByName('id_CAGroup').IsNull and (cdsBal.FieldByName('id_CAGroup').AsInteger > -1)) or
                                not cdsBal.FieldByName('id_ContrAgent').IsNull);
end;

procedure TBalanceBsn.aSaveExecute(Sender: TObject);
var id_business : Variant;
    ADate : Variant;
begin
  if MessageBox(Handle, Pchar({'Если в балансе все правильно, вы можете принять его. После принятия ' + #13 + #10 + }
  'Завизировать баланс?'), Pchar('Завизировать баланс?'), MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = idYes then
  begin
    id_business := fBsnSelector1.ID;
    ADate := BlnDateTime;
    Initialize(id_business, ADate, false, true, ClientDataSet1);
    Initialize(id_business, ADate);
  end;
end;

procedure TBalanceBsn.cdsBalBeforeClose(DataSet: TDataSet);
begin
  aClosePeriod.Enabled := false;
  aSave.Enabled := false;
end;

procedure TBalanceBsn.dxComponentPrinter1Link2CustomDrawCell(
  Sender: TBasedxReportLink; ACanvas: TCanvas; ABoundsRect,
  AClientRect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
  var AText: String; var AColor: TColor; AFont: TFont;
  var ATextAlignX: TdxTextAlignX; var ATextAlignY: TdxTextAlignY;
  var ADone: Boolean);
var
  ColInd: Integer;
begin
  ColInd := dxDBTreeList1OrdNum.Index;
  if (ANode.Values[dxDBTreeList1id_Acc_Group.Index] <> Null) or
     (ANode.Values[dxDBTreeList1id_Warehouse_Group.Index] <> Null) or
     (ANode.Values[dxDBTreeList1id_Manufact_Group.Index] <> Null) or
     ((ANode.Values[dxDBTreeList1id_CAGroup.Index] <> Null) and (ANode.Values[dxDBTreeList1id_ContrAgent.Index] = Null)) then
       AFont.Style := AFont.Style + [fsBold];

    if (ANode.Parent = nil) then   // Верхний уровень
    begin
      AFont.Style := AFont.Style + [fsBold];
      if (ANode.Values[ColInd] = 100) or (ANode.Values[ColInd] = 180) then
      begin
        AColor := clInfoBk;
    //    if ASelected then
    //      AFont.Color := clBlack;
      end
      else
        if (ANode.Values[ColInd] = 110) then
        begin
          if (ABS(ANode.Values[dxDBTreeList1OperSummSysCur.Index]) > 0.01) then
          begin
            AColor := clRed;
          end
          else
          begin
            AColor := $00D7D700;
          end;
        end
        else
   //       if not ASelected then
     //       AColor := $00E0E2E4;
    end;
end;

procedure TBalanceBsn.dtToChange(Sender: TObject);
var B : boolean;
begin
  B := dtTimeTo.Checked and dtTimeTo.Enabled;
  aSave.Enabled := false;
  aClosePeriod.Enabled := false;
  dtTimeTo.Enabled := dtTo.Checked;
  dtTimeTo.Checked := B;
  Label1.Enabled := dtTo.Checked;
end;

procedure TBalanceBsn.aShowAccCardExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_Acc := cdsBalid_Acc.AsInteger;
  if dtTo.Checked then
  begin
    AParamBlnc.DateFrom := dtTo.Date;
    AParamBlnc.DateTo := dtTo.Date;
  end;
  ShowAccCard(AParamBlnc);
end;

procedure TBalanceBsn.aShowBalanceExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_ContrAgent := cdsBalid_ContrAgent.AsInteger;
  if dtTo.Checked then
  begin
    AParamBlnc.DateFrom := dtTo.Date;
    AParamBlnc.DateTo := dtTo.Date;
  end;
  ShowBalance(AParamBlnc);
end;

procedure TBalanceBsn.aShowGoodsSumExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_Warehouse := cdsBal.FieldByName('id_Warehouse').AsInteger;
  if dtTo.Checked then
  begin
    AParamBlnc.DateFrom := dtTo.Date;
    AParamBlnc.DateTo := dtTo.Date;
  end;
  ShowMovWH(AParamBlnc, true);
end;

destructor TBalanceBsn.Destroy;
begin
{  dxDBTreeList1Val1.Visible := true;
  dxDBTreeList1Delta1.Visible := true;
  dxDBTreeList1Val2.Visible := true;
  dxDBTreeList1Delta2.Visible := true;
  dxDBTreeList1Val3.Visible := true;
  dxDBTreeList1Delta3.Visible := true;    }

  SaveValToRegistry(fBsnSelector1.ID, SRegPath + '\' + ClassName, 'id_Bsn');

  SaveValToRegistry(cbDeltaz.Checked, SRegPath + '\' + ClassName, 'cbDeltaz');
  SaveValToRegistry(cbCurRez.Checked, SRegPath + '\' + ClassName, 'cbCurRez');
  inherited;
end;

procedure TBalanceBsn.fBsnSelector1Button1Click(Sender: TObject);
var Old : Variant;
begin
  Old := fBsnSelector1.ID;
  fBsnSelector1.Button1Click(Sender);
  if fBsnSelector1.ID <> Old then
    InitializeClick;
end;

procedure TBalanceBsn.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TBalanceBsn.aExpandAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TBalanceBsn.aCollapseNodeExecute(Sender: TObject);
begin    
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TBalanceBsn.aCollapseAllExecute(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

procedure TBalanceBsn.dxDBTreeList1ChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin
  FFFNode := Node;
end;

procedure TBalanceBsn.PopupMenu1Popup(Sender: TObject);
begin
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);
end;

procedure TBalanceBsn.aExportExecute(Sender: TObject);
var S : String;
begin
  S := fBsnSelector1.BsnName; //'Баланс';
//  S := S + #13 + #10 + lbInfo.Caption;
  DBTreeListToExcel(dxDBTreeList1, S);
end;

procedure TBalanceBsn.aNodeExpExecute(Sender: TObject);
var S : String;
begin
  S := fBsnSelector1.BsnName; //'Баланс';
  DBTreeListToExcel(dxDBTreeList1, S, FFFNode);
end;

procedure TBalanceBsn.aBlnDetailExecute(Sender: TObject);
var ABlnDetail : TBlnDetailData;
begin
  ABlnDetail := GetEmptyBlnDetail;
  ABlnDetail.id_business := fBsnSelector1.ID;
  ABlnDetail.DateTo := dtTo.DateTime;

  ABlnDetail.id_Manufact := cdsBal.FieldByName('id_Manufact').Value;
  
  case cdsBal.FieldByName('OrdNum').AsInteger of
    60, 91 : ABlnDetail.isRawZ := true;
    80, 95, 115 : ABlnDetail.isCRN := true;
    90 : ABlnDetail.isNotRawZ := true;
    98 : ABlnDetail.isDown := true;
    140 : ABlnDetail.isInFromManuf := true;
    150 : ABlnDetail.isUp := true;
    160, 163 : ABlnDetail.isUp := true;
  end;
  ShowBlnDetail(ABlnDetail);
end;

function TBalanceBsn.GetBlnDateTime_int(ATo : boolean): Variant;
var ctrlDate, ctrlTime : TDateTimePicker;
begin
  if ATo then
  begin
    ctrlDate := dtTo;
    ctrlTime := dtTimeTo;
  end
  else
  begin
    ctrlDate := dtDFrom;
    ctrlTime := dtTFrom;
  end;
  if ctrlDate.Checked or not ctrlDate.ShowCheckbox then
  begin
    Result := Int(ctrlDate.Date);
    if ctrlTime.Enabled and ctrlTime.Checked then
      Result := Result + Frac(ctrlTime.Time)
    else
      Result := GetDateAdv(ctrlDate.Date, ATo);
  end
  else
    Result := Null;
end;

procedure TBalanceBsn.SetBlnDateTime_int(const Value: Variant; ATo : boolean);
var ctrlDate, ctrlTime : TDateTimePicker;
begin
  if GetBlnDateTime_int(ATo) = Value then
    Exit;
  if ATo then
  begin
    ctrlDate := dtTo;
    ctrlTime := dtTimeTo;
  end
  else
  begin
    ctrlDate := dtDFrom;
    ctrlTime := dtTFrom;
  end;
  if Value = Null then
  begin
    ctrlDate.Checked := false;
  end
  else
  begin
    ctrlDate.Date := Value;
    ctrlTime.Time := Frac(Value);
    ctrlDate.Checked := true;
    ctrlTime.Checked := Frac(Value) > 0;
  end;
  ctrlTime.Enabled := ctrlDate.Checked;
  if ATo then
    Label1.Enabled := ctrlDate.Checked
  else
    Label3.Enabled := ctrlDate.Checked;
end;

procedure TBalanceBsn.SetShowInRoot(AShowInRoot: WordBool);
var id_Acc, id_acc_Group, id_Warehouse,
  id_Warehouse_Group, id_ContrAgent, id_CAGroup, id_Manufact,
  id_Manufact_Group: OleVariant;
begin
  id_Acc := Null;
  id_acc_Group := Null;
  id_Warehouse := Null;
  id_Warehouse_Group := Null;
  id_ContrAgent := Null;
  id_CAGroup := Null;
  id_Manufact := Null;
  id_Manufact_Group := Null;

  if not cdsBalid_Acc.IsNull then
    id_Acc := cdsBalid_Acc.AsInteger
  else
  if not cdsBalid_acc_Group.IsNull then
    id_acc_Group := cdsBalid_acc_Group.AsInteger
  else
  if not cdsBalid_Warehouse.IsNull then
    id_Warehouse := cdsBalid_Warehouse.AsInteger
  else
  if not cdsBalid_Warehouse_Group.IsNull then
    id_Warehouse_Group := cdsBalid_Warehouse_Group.AsInteger
  else
  if not cdsBalid_ContrAgent.IsNull then
    id_ContrAgent := cdsBalid_ContrAgent.AsInteger
  else
  if not cdsBalid_CAGroup.IsNull then
    id_CAGroup := cdsBalid_CAGroup.AsInteger
  else
  if not cdsBalid_Manufact.IsNull then
    id_Manufact := cdsBalid_Manufact.AsInteger
  else
  if not cdsBalid_Manufact_Group.IsNull then
    id_Manufact_Group := cdsBalid_Manufact_Group.AsInteger;

  if DM.rsCA.AppServer.UN_ShowInRoot(id_Acc, id_acc_Group,
                                     id_Warehouse, id_Warehouse_Group,
                                     id_ContrAgent, id_CAGroup,
                                     id_Manufact, id_Manufact_Group,
                                     AShowInRoot) = -1 then
    MessageBox(Handle, 'Ошибка!', '', MB_ICONERROR + mb_Ok);
end;

procedure TBalanceBsn.aShowInRootExecute(Sender: TObject);
begin
  SetShowInRoot(true);
end;

procedure TBalanceBsn.aUnShowInRootExecute(Sender: TObject);
begin
  SetShowInRoot(false);
end;

procedure TBalanceBsn.dxDBTreeList1GetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  index := Node.ImageIndex;
end;

procedure TBalanceBsn.dxDBTreeList1GetImageIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
var
  ColInd: Integer;
begin
  ColInd := dxDBTreeList1OrdNum.Index;
  if (Node <> nil) then
  begin
    case Node.Values[ColInd] of
      100, 180 : Index := 22;
      90 :
        if (Node.Values[dxDBTreeList1id_ContrAgent.Index] = Null) and (Node.Values[dxDBTreeList1id_CAGroup.Index] = Null) then Index := 21
        else
        begin
          if Node.Values[dxDBTreeList1id_ContrAgent.Index] <> Null then
            Index := 3
          else
            if Node.Values[dxDBTreeList1id_CAGroup.Index] <> Null then
              Index := 11
            else
              Index := 1;
        end;

      400 : Index := 20;
      150, 160, 163 :
        if (Node.Values[dxDBTreeList1id_ContrAgent.Index] = Null) and (Node.Values[dxDBTreeList1id_CAGroup.Index] = Null) then Index := 20
        else
        begin
          if Node.Values[dxDBTreeList1id_ContrAgent.Index] <> Null then
            Index := 3
          else
            if Node.Values[dxDBTreeList1id_CAGroup.Index] <> Null then
              Index := 11
            else
              Index := 1;
        end;
      500 : Index := 21;
      20 : Index := 16;
      30 : Index := 18;
      40 : Index := 5;
      45 : Index := 6;
      50 : Index := 4;
      200 : Index := -1;
      60, 140, 91 : Index := 9;
      95, 115 : Index := 19;
     { 90,} 70, 120 :
        begin
          if Node.Values[dxDBTreeList1id_ContrAgent.Index] <> Null then
            Index := 3
          else
            if Node.Values[dxDBTreeList1id_CAGroup.Index] <> Null then
              Index := 11
            else
              Index := 1;
        end;
      110 : Index := -1;
      else
      begin
        if Node.Expanded then
          index := 1
        else
          Index := 0;
      end;
    end;
  end;
end;

procedure TBalanceBsn.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\qz26' + ClassName);
end;

procedure TBalanceBsn.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\qz26' + ClassName);
end;

procedure TBalanceBsn.cdsBalOperSummSysCurGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if cdsBalOrdNum.AsInteger <> 200 then
  begin
    Text := Trim(FormatFloat(cdsBalOperSummSysCur.DisplayFormat {'### ### ### ##0.00'}, ABS(Sender.AsFloat)));

    if Sender.AsFloat < 0 then Text := '-' + Text;
  end;
end;

procedure TBalanceBsn.aShowAccCard_AdvExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_business := fBsnSelector1.ID;
  AParamBlnc.id_AccGroup := cdsBalid_Acc_Group.AsInteger;
  if dtTo.Checked then
  begin
    AParamBlnc.DateFrom := dtTo.Date;
    AParamBlnc.DateTo := dtTo.Date;
  end;
  ShowAccCard_Adv(AParamBlnc);
end;

procedure TBalanceBsn.dxDBTreeList1Deletion(Sender: TObject;
  Node: TdxTreeListNode);
begin
  if FFFNode = Node then
    FFFNode := nil;
end;

procedure TBalanceBsn.aBlnDetail_2Execute(Sender: TObject);
var ABlnDetail : TBlnDetailData;
begin
  ABlnDetail := GetEmptyBlnDetail;
  ABlnDetail.id_business := fBsnSelector1.ID;
  ABlnDetail.DateTo := BlnDateTime;

  ABlnDetail.id_Manufact := cdsBal.FieldByName('id_Manufact').Value;

  case cdsBal.FieldByName('OrdNum').AsInteger of
    60, 91 : ABlnDetail.isRawZ := true;
    80, 95, 115 : ABlnDetail.isCRN := true;
    90 : ABlnDetail.isNotRawZ := true;
    98 : ABlnDetail.isDown := true;
    140 : ABlnDetail.isInFromManuf := true;
    150 : ABlnDetail.isUp := true;
    160, 163 : ABlnDetail.isUp := true;
  end;
  ShowBlnDetail_2(ABlnDetail);
end;

procedure TBalanceBsn.cbDeltazCH;
begin
  dxDBTreeList1Column24.Visible := (ComboBox1.ItemIndex = 1) or cbDeltaz.Checked;
  dxDBTreeList1Column25.Visible := (ComboBox1.ItemIndex = 1) or cbDeltaz.Checked;
end;



procedure TBalanceBsn.ComboBox1Change(Sender: TObject);
begin
  dtDFrom.Enabled := ComboBox1.ItemIndex = 1;
  Label4.Enabled := ComboBox1.ItemIndex = 1;
  Label3.Enabled := ComboBox1.ItemIndex = 1;
  cbDeltazCH;
  dtDFromChange(nil);
end;

procedure TBalanceBsn.dtDFromChange(Sender: TObject);
var B : boolean;
begin
  B := dtTFrom.Checked and dtTFrom.Enabled;
  dtTFrom.Enabled := true;//dtDFrom.Checked;
  dtTFrom.Checked := B;
  Label3.Enabled := true;//dtDFrom.Checked;

end;

function TBalanceBsn.GetBlnDateTime: Variant;
begin
  Result := GetBlnDateTime_int(true);
end;

procedure TBalanceBsn.SetBlnDateTime(const Value: Variant);
begin
  SetBlnDateTime_int(Value, true);
end;

function TBalanceBsn.GetBlnDateTimeFrom: Variant;
begin
  Result := GetBlnDateTime_int(false);
end;

procedure TBalanceBsn.SetBlnDateTimeFrom(const Value: Variant);
begin
  SetBlnDateTime_int(Value, false);
end;

procedure TBalanceBsn.aBlnDetail_3Execute(Sender: TObject);
var ABlnDetail : TBlnDetailData;
    ACaption : String;
begin
  if FFFNode = nil then Exit;
  ABlnDetail := GetEmptyBlnDetail;
  ABlnDetail.id_business := fBsnSelector1.ID;
  ABlnDetail.OrdNum := FFFNode.Values[dxDBTreeList1OrdNum.Index];// cdsBalOrdNum.AsInteger;
  ABlnDetail.DateTo := BlnDateTime;
  ABlnDetail.DateFrom := BlnDateTimeFrom;

  ABlnDetail.id_Acc := FFFNode.Values[dxDBTreeList1id_Acc.Index];//cdsBal.FieldByName('id_Acc').Value;
  ABlnDetail.id_Manufact := FFFNode.Values[dxDBTreeList1id_Manufact.Index];//cdsBal.FieldByName('id_Manufact').Value;
  ABlnDetail.id_CA := FFFNode.Values[dxDBTreeList1id_ContrAgent.Index];//cdsBal.FieldByName('id_ContrAgent').Value;

  case cdsBal.FieldByName('OrdNum').AsInteger of
    163 : ACaption := 'Прибыль';
    140 : ACaption := 'Приход с производства';
    115, 95 : ACaption := 'Курсовая разница';
    90 : ACaption := 'Несырьевые затраты';
    91 : ACaption := 'Сырьевые затраты';
  end;
//  if cdsBal.FieldByName('RowLevel').AsInteger = 2 then
  if not FFFNode.HasChildren then
    ACaption := ACaption + ' - ' + FFFNode.Values[dxDBTreeList1RowName.Index]; //cdsBal.FieldByName('RowName').AsString;
 { if FBlnDetail.isRawZ then
    ACaption := 'Сырьевые затраты'
  else
    if FBlnDetail.isNotRawZ then
      ACaption := 'Несырьевые затраты'
    else
      if FBlnDetail.isCRN then
        ACaption := 'Курсовые изменения'
      else
        if FBlnDetail.isUp then
          ACaption := 'Прибыль'
        else
          if FBlnDetail.isInFromManuf then
            ACaption := 'Приход с производства'
          else
            if FBlnDetail.isUp then
              ACaption := 'Прибыль'
            else
              if FBlnDetail.isDown then
                ACaption := 'Убыток';  }
  ShowBlnDetail_3(ACaption, ABlnDetail);
end;

procedure TBalanceBsn.cdsBalDeltaGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    Text := Trim(FormatFloat('### ### ### ##0.00', ABS(Sender.AsFloat)));

    if Sender.AsFloat < 0 then Text := '-' + Text;
  end;
end;

procedure TBalanceBsn.RxCalcEdit1Change(Sender: TObject);
begin
  if RxCalcEdit1.Value < 0 then
    RxCalcEdit1.Value := 0;
end;

procedure TBalanceBsn.aShowB2Execute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_ContrAgent := cdsBalid_ContrAgent.AsInteger;
  if dtTo.Checked then
  begin
    AParamBlnc.DateFrom := dtTo.Date;
    AParamBlnc.DateTo := dtTo.Date;
  end;
  ShowBalance_v2(AParamBlnc);
end;

procedure TBalanceBsn.aA2Execute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_Acc := cdsBalid_Acc.AsInteger;
  if dtTo.Checked then
  begin
    AParamBlnc.DateFrom := dtTo.Date;
    AParamBlnc.DateTo := dtTo.Date;
  end;
  ShowAccCard_v2(AParamBlnc);
end;

procedure TBalanceBsn.cbDeltazClick(Sender: TObject);
begin
  cbDeltazCH;
end;

procedure TBalanceBsn.Action1Execute(Sender: TObject);
begin
  cdsBalOperSummSysCur.DisplayFormat := '### ### ### ##0.000000';
end;

procedure TBalanceBsn.aNoDeptCAExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_business := fBsnSelector1.ID;
  AParamBlnc.id_ContrAgent := cdsBalid_ContrAgent.AsInteger;
  ShowWizNoDeptCA(AParamBlnc);
end;

procedure TBalanceBsn.aOffPMExecute(Sender: TObject);
var AParamBlnc : TParamBlnc;
begin
  AParamBlnc := GetEmptyParamBlnc;
  AParamBlnc.id_business := fBsnSelector1.ID;
  AParamBlnc.id_ContrAgent := cdsBalid_ContrAgent.AsInteger;
  ShowWizNoDeptCA(AParamBlnc, true);
end;

procedure TBalanceBsn.SelectText(AText : String);
var i : integer;
    Node : TdxTreeListNode;
    B : boolean;
begin
 // FFFNode := nil;

  
 // for i := dxDBTreeList1.SelectedCount - 1 downto 0 do
   // dxDBTreeList1.SelectedNodes[i].Selected := false;
 // Node := dxDBTreeList1.TopNode;
  if dxDBTreeList1.SelectedCount > 0 then
  begin
    b := true;
    Node := dxDBTreeList1.SelectedNodes[0];
  end
  else
  begin
    b := false;
    Node := dxDBTreeList1.TopNode;
  end;
  
  while Node <> nil do
  begin
    if POS(AnsiUpperCase(AText), AnsiUpperCase(Node.Values[dxDBTreeList1RowName.Index])) > 0 then
    begin
      dxDBTreeList1.MakeNodeVisible(Node);
      Node.Selected := true;
      Node.Focused := true;
      FFFNode := Node;
      b := false;
      Exit;
    end;

    Node := Node.GetNext;
  end;
  if b then
    SelectText(AText)
  else
    MessageBox(Handle, PChar('Название "' + AText + '" не найдено!'), 'Не найдено', MB_OK + MB_ICONSTOP);;
end;

function TBalanceBsn.SelectEvent(OrdNum : integer; AText : String) : boolean;
var i : integer;
    Node : TdxTreeListNode;
begin
  Result := false;
  if AText = '' then Exit;
  
  FFFNode := nil;
  for i := dxDBTreeList1.SelectedCount - 1 downto 0 do
    dxDBTreeList1.SelectedNodes[i].Selected := false;
  Node := dxDBTreeList1.TopNode;
  while Node <> nil do
  begin
    if (AnsiUpperCase(AText) = AnsiUpperCase(Node.Values[dxDBTreeList1RowName.Index]))   and
    (Node.Values[dxDBTreeList1OrdNum.Index] = OrdNum) then
    begin
      dxDBTreeList1.MakeNodeVisible(Node);
      Node.Selected := true;
      Node.Focused := true;
      FFFNode := Node;
      Result := true;
      Break;
    end;

    Node := Node.GetNext;
  end;
end;


procedure TBalanceBsn.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    SelectText(Edit1.Text);
end;

end.
