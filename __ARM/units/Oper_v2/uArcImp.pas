unit uArcImp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ToolWin, ComCtrls, ActnList, ImgList, Db, DBClient;

type
  TArcImp = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    OpenDialog1: TOpenDialog;
    ListBox1: TListBox;
    ActionList1: TActionList;
    ToolBar1: TToolBar;
    ImageList: TImageList;
    aOpen: TAction;
    aDel: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    cdsImp: TClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aOpenExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    procedure ArcImp(iii, PPP: integer; CDS: TClientDataset);
    procedure ImpData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ArcImp: TArcImp;

procedure ShowArcImp;
implementation

uses uMeCrpt, uDM, uPrgForm;

{$R *.DFM}

procedure ShowArcImp;
var F : TArcImp;
    i : integer;
begin
//  DM.Rights_GetUserRights(10, Null);
  F := TArcImp.Create(nil);
  try
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      F.ImpData;
    end;
  finally
    F.Free;
  end;
end;

procedure TArcImp.ArcImp(iii, PPP: integer; CDS : TClientDataset);
{var    AID, id_oper : integer;
  function AddOper : integer;
  var P : V_Arc_OP_Oper;
      V, Imp_PayBasic, AccInv_PayAssignment, Contract, OpComment: OleVariant;
  begin
    Result := -1;
    Imp_PayBasic := CDS.FieldByName('Imp_PayBasic').Value;
    AccInv_PayAssignment := CDS.FieldByName('AccInv_PayAssignment').Value;
    Contract := CDS.FieldByName('Contract').Value;
    OpComment := CDS.FieldByName('OpComment').Value;

    if CDS.FieldByName('id_Goods').IsNull then
    begin
      P.PriceFinOper := CDS.FieldByName('PriceOper').Value;
      P.SummSysFin := CDS.FieldByName('SummSys').Value;
    end
    else
    begin
      P.PriceFinOper := Null;
      P.SummSysFin := Null;
    end;

    P.id_OperParent := CDS.FieldByName('id_OperParent').Value;
    P.id_Arc := CDS.FieldByName('id_Arc').Value;
    P.id_Oper := CDS.FieldByName('id_Oper').Value;
    P.DateCreate := CDS.FieldByName('DateCreate').Value;
    P.RealDataCreate := CDS.FieldByName('RealDataCreate').Value;
    P.id_LC_Oper := CDS.FieldByName('id_LC_Oper').Value;
    P.OperVid := CDS.FieldByName('OperVid').Value;
    P.id_Replicator := CDS.FieldByName('id_Replicator').Value;
    P.id_UserCreator := CDS.FieldByName('id_UserCreator').Value;
    P.id_business := CDS.FieldByName('id_business').Value;
    P.DateLocal := CDS.FieldByName('DateLocal').Value;
    P.Correct := CDS.FieldByName('Correct').Value;
    P.OperTypeIn := CDS.FieldByName('OperTypeIn').Value;
    P.Id_CurrencyOper := CDS.FieldByName('Id_CurrencyOper').Value;
    P.RateOper := CDS.FieldByName('RateOper').Value;
    P.Id_CurrencySys := CDS.FieldByName('Id_CurrencySys').Value;
    P.RateSys := CDS.FieldByName('RateSys').Value;
    P.id_Acc := CDS.FieldByName('id_Acc').Value;
    P.id_Warehouse := CDS.FieldByName('id_Warehouse').Value;
    P.id_Manufact := CDS.FieldByName('id_Manufact').Value;
    P.id_Repr := CDS.FieldByName('id_Repr').Value;
    P.id_ContrAgent_ex := CDS.FieldByName('id_ContrAgent_ex').Value;
    P.id_Acc_Ext := CDS.FieldByName('id_Acc_Ext').Value;
    P.id_Warehouse_Ext := CDS.FieldByName('id_Warehouse_Ext').Value;
    P.id_Manufact_Ext := CDS.FieldByName('id_Manufact_Ext').Value;
    P.id_FormalDistrib := CDS.FieldByName('id_FormalDistrib').Value;
    P.id_FuncDistrib := CDS.FieldByName('id_FuncDistrib').Value;
    P.id_UserChecker := CDS.FieldByName('id_UserChecker').Value;
    P.CheckDate := CDS.FieldByName('CheckDate').Value;
    P.Koeff := CDS.FieldByName('Koeff').Value;
    P.Id_CurrencyInv := CDS.FieldByName('Id_CurrencyInv').Value;
    P.RateInv := CDS.FieldByName('RateInv').Value;
    P.OrdNum := CDS.FieldByName('OrdNum').Value;
    P.RateMain := CDS.FieldByName('RateMain').Value;

    P.Dig1 := CDS.FieldByName('Dig1').Value;
    P.Dig2 := CDS.FieldByName('Dig2').Value;
    P.Dig3 := CDS.FieldByName('Dig3').Value;
    P.Dig4 := CDS.FieldByName('Dig4').Value;
    P.Dig5 := CDS.FieldByName('Dig5').Value;
    P.Dig6 := CDS.FieldByName('Dig6').Value;
    P.Dig7 := CDS.FieldByName('Dig7').Value;
    P.Dig8 := CDS.FieldByName('Dig8').Value;
    P.Dig9 := CDS.FieldByName('Dig9').Value;
    P.Dig10 := CDS.FieldByName('Dig10').Value;
    P.Dig11 := CDS.FieldByName('Dig11').Value;
    P.Dig12 := CDS.FieldByName('Dig12').Value;
    P.Dig13 := CDS.FieldByName('Dig13').Value;
    P.Dig14 := CDS.FieldByName('Dig14').Value;
    P.Dig15 := CDS.FieldByName('Dig15').Value;

    P.Str1 := CDS.FieldByName('Str1').AsString;
    P.Str2 := CDS.FieldByName('Str2').AsString;
    P.Str3 := CDS.FieldByName('Str3').AsString;
    P.Str4 := CDS.FieldByName('Str4').AsString;
    P.Str5 := CDS.FieldByName('Str5').AsString;
    P.Str6 := CDS.FieldByName('Str6').AsString;
    P.Str7 := CDS.FieldByName('Str7').AsString;
    P.Str8 := CDS.FieldByName('Str8').AsString;
    P.Str9 := CDS.FieldByName('Str9').AsString;
    P.Str10 := CDS.FieldByName('Str10').AsString;
    P.Str11 := CDS.FieldByName('Str11').AsString;
    P.Str12 := CDS.FieldByName('Str12').AsString;
    P.Str13 := CDS.FieldByName('Str13').AsString;
    P.Str14 := CDS.FieldByName('Str14').AsString;
    P.Str15 := CDS.FieldByName('Str15').AsString;



    P.VatIn := CDS.FieldByName('VatIn').Value;
    P.AutoGen := CDS.FieldByName('AutoGen').Value;

    V := PackRec_Arc_OP_Oper(P);
    Result := DM.rsCA.AppServer.Arc_OP_OperAdd(V, Imp_PayBasic, AccInv_PayAssignment,
                                        Contract, OpComment);
    if Result <= 0 then
      raise Exception.Create('������ ��� ������� ��������');
      
  end;  }
 {  function AddWare : integer;
  var PW : V_Arc_OP_Oper_Ware;
      V : OleVariant;
  begin
   PW.id_OperWare := CDS.FieldByName('id_OperWare').Value;
    PW.id_Oper := CDS.FieldByName('id_Oper').Value;
    PW.id_Measure := CDS.FieldByName('id_Measure').Value;
    PW.id_Goods := CDS.FieldByName('id_Goods').Value;
    PW.AmountOper := CDS.FieldByName('AmountOper').Value;
    PW.PriceOper := CDS.FieldByName('PriceOper').Value;
    PW.PriceInv := CDS.FieldByName('PriceInv').Value;
    PW.SummSys := CDS.FieldByName('SummSys').Value;
    V := PackRec_Arc_OP_Oper_Ware(PW);
    if DM.rsCA.AppServer.Arc_OP_OperWareAdd(V) <= 0 then
      raise Exception.Create('������ ��� ������� ��������');
  end; }
begin
{
  try
    id_oper := -1;
    with CDS do
    begin
      while not Eof do
      begin
        ShowProgressForm(Handle, RecNo, RecordCount, '������ ������', iii, PPP);
        if id_oper <> FieldByName('id_oper').AsInteger then
          AID := AddOper;
        id_oper := FieldByName('id_oper').AsInteger;
        
        if AID = -13 then
          raise Exception.Create('������� �������� ������������� ��������');
        if AID = -1 then
          raise Exception.Create('������ ��� ������� ��������');

        if (AID > 0) and not FieldByName('id_Goods').IsNull then
        begin
          AddWare;
        end;
        Next;
      end;
    end;
//    DM.rsCA.AppServer.CommitTrans;
   // CloseProgressForm;
  except
    on E : Exception do
    begin
      CloseProgressForm;
      raise Exception.Create('��� ������� ������ �������� ��������� ������ ' + E.Message);
 //   MessageBox(Self.Handle, PChar('�������� ������� �������������. ����� ' + IntToStr(Memo2.Lines.Count) + ' ��������. �� ������ ��������� � ������'), '������ ��������', MB_OK + MB_ICONINFORMATION);
  //  DM.rsCA.AppServer.RollbackTrans;
    end;  
  end    }
end;

procedure TArcImp.ImpData;
var i : integer; 
begin
 // DM.rsCA.AppServer.BeginTruns;
  try
      for i := 0 to ListBox1.Items.Count - 1 do
      begin
        cdsImp.LoadFromFile(ListBox1.Items[i]);
        ArcImp(i , ListBox1.Items.Count - 1, cdsImp);
      end;

  //  DM.rsCA.AppServer.CommitTrans;
    CloseProgressForm;
    MessageBox(Handle, '������ ��������', '', MB_Ok + MB_ICONINFORMATION);
  except
    CloseProgressForm;
 //   MessageBox(Self.Handle, PChar('�������� ������� �������������. ����� ' + IntToStr(Memo2.Lines.Count) + ' ��������. �� ������ ��������� � ������'), '������ ��������', MB_OK + MB_ICONINFORMATION);
//    DM.rsCA.AppServer.RollbackTrans;
    Exit;
  end
end;


procedure TArcImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := caFree;
end;

procedure TArcImp.aOpenExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    ListBox1.Items.AddStrings(OpenDialog1.Files);
  end;
end;

procedure TArcImp.aDelExecute(Sender: TObject);
var i : integer;
begin
  i := ListBox1.ItemIndex;
  ListBox1.Items.Delete(i);
//  i := i - 1;
  if i = -1 then i := 0;
  if i > ListBox1.Items.Count - 1 then
    i := ListBox1.Items.Count - 1;
  ListBox1.ItemIndex := i;
  aDel.Enabled := ListBox1.ItemIndex > -1;
end;

procedure TArcImp.ListBox1Click(Sender: TObject);
begin
  aDel.Enabled := ListBox1.ItemIndex > -1;
end;

end.