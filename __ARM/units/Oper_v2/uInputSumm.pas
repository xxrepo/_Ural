unit uInputSumm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, ComCtrls;

type
  TSummData = record
    FormType, id_Business : integer;
    Formulas,
    Koeff, Val, Znak, Koeff2, Znak2, Koeff3, Znak3 : Variant;
    inPercent, Summ_UseSys : boolean;
    id_CnstItem, ZnakCnstItem, K_CnstItem : Variant;
  end;

  TInputSumm = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    cbFormType: TComboBox;
    PCFrm: TPageControl;
    tsConst: TTabSheet;
    tsPrc: TTabSheet;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    tsPrcBack: TTabSheet;
    tsLinear: TTabSheet;
    Image3: TImage;
    ImageB1: TImage;
    Image2: TImage;
    ceConst: TRxCalcEdit;
    Label4: TLabel;
    lb: TLabel;
    cbZnak: TComboBox;
    edK: TRxCalcEdit;
    edB: TRxCalcEdit;
    Label2: TLabel;
    edK2: TRxCalcEdit;
    cbZnak2: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cbZnak3: TComboBox;
    edK3: TRxCalcEdit;
    cbinPercent: TCheckBox;
    cbSumm3: TComboBox;
    Label1: TLabel;
    Label10: TLabel;
    cbSumm2: TComboBox;
    Label11: TLabel;
    cbSumm1: TComboBox;
    tsAmount: TTabSheet;
    Image4: TImage;
    edKAM: TRxCalcEdit;
    CheckBox1: TCheckBox;
    Label12: TLabel;
    tsOnSysRate: TTabSheet;
    Label13: TLabel;
    tsNone: TTabSheet;
    cbPrc: TComboBox;
    cbPrcBack: TComboBox;
    pcPrc_Back: TPageControl;
    tsK_Back: TTabSheet;
    tsParam_Back: TTabSheet;
    pcPrc: TPageControl;
    tsK: TTabSheet;
    tsParam: TTabSheet;
    Label5: TLabel;
    cePrc: TRxCalcEdit;
    cePrcBack: TRxCalcEdit;
    Label6: TLabel;
    cbZnakCnstItem: TComboBox;
    cbZnakCnstItemBack: TComboBox;
    ceK_CnstItemBack: TRxCalcEdit;
    ceK_CnstItem: TRxCalcEdit;
    Label14: TLabel;
    edP: TEdit;
    Label15: TLabel;
    edP_Back: TEdit;
    btnSelBack: TButton;
    btnSel: TButton;
    ImageBack2: TImage;
    edZ: TRxCalcEdit;
    Label16: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbZnakChange(Sender: TObject);
    procedure cbZnak2Change(Sender: TObject);
    procedure cbZnak3Change(Sender: TObject);
    procedure cbFormTypeChange(Sender: TObject);
    procedure PCFrmChange(Sender: TObject);
    procedure cbPrcChange(Sender: TObject);
    procedure cbPrcBackChange(Sender: TObject);
    procedure btnSelClick(Sender: TObject);
    procedure btnSelBackClick(Sender: TObject);
  private
    FisSys: boolean;
    function GetFormType: integer;
    procedure SetFormType(const Value: integer);
    procedure SetisSys(Value : boolean);
  private
    Cnt : TCustomEdit;
    id_Business : integer;
    id_CnstItem : Variant;
    property isSys : boolean read FisSys write SetisSys;
    property FormType : integer read GetFormType write SetFormType;
  public

  end;
                   
var
  InputSumm: TInputSumm;
  
function ShowInputSumm(const ACaption: string; var ASummData : TSummData; isSys : boolean = false): boolean;

implementation

uses foMyFunc, uCnstItemSelector, uDM;

{$R *.DFM}
function ShowInputSumm(const ACaption: string; var ASummData : TSummData; isSys : boolean): boolean;
var F : TInputSumm;
    ANAme, Val: OleVariant;
begin
  Result := false;
  F := TInputSumm.Create(nil);
  try
    F.isSys := isSys;
    F.tsOnSysRate.Visible := isSys;
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    F.Caption := ACaption;
    F.FormType := ASummData.FormType;

    F.id_CnstItem := ASummData.id_CnstItem;
    F.id_Business := ASummData.id_Business;

    if F.id_CnstItem > 0 then
    begin
      DM.rsCA.AppServer.AP_CnstGetProp(F.id_CnstItem, ANAme, Val);
      F.edP.Text := ANAme;
      F.edP_Back.Text := ANAme;
    end;

    if ASummData.id_CnstItem > 0 then
    begin
      F.cbPrc.ItemIndex := 1;
      F.cbPrcBack.ItemIndex := 1;

      F.cbPrcChange(F.cbPrc);
      F.cbPrcBackChange(F.cbPrcBack);
    end
    else
    begin
      F.cbPrc.ItemIndex := 0;
      F.cbPrcBack.ItemIndex := 0;

      F.cbPrcChange(F.cbPrc);
      F.cbPrcBackChange(F.cbPrcBack);
    end;

    if ASummData.Summ_UseSys then
    begin
      F.cbSumm1.ItemIndex := 1;
      F.cbSumm2.ItemIndex := 1;
      F.cbSumm3.ItemIndex := 1;
    end
    else
    begin
      F.cbSumm1.ItemIndex := 0;
      F.cbSumm2.ItemIndex := 0;
      F.cbSumm3.ItemIndex := 0;
    end;

    case ASummData.FormType of
      10 :
      begin
        F.edKAM.Value := StrToFloatAdv(VarToStr(ASummData.Koeff));
      end;
      1 :
      begin
        F.ceConst.Value := StrToFloatAdv(VarToStr(ASummData.Val));
      end;
      2 :
      begin
        F.cePrc.Value := StrToFloatAdv(VarToStr(ASummData.Koeff));
        F.ceK_CnstItem.Value := StrToFloatAdv(VarToStr(ASummData.K_CnstItem));
        F.ceK_CnstItemBack.Value := StrToFloatAdv(VarToStr(ASummData.K_CnstItem));
        with F.cbZnakCnstItem do
          if ASummData.ZnakCnstItem <> Null then
            ItemIndex := Items.IndexOf(VarToStr(ASummData.ZnakCnstItem))
          else
            ItemIndex := 0;

        with F.cbZnakCnstItemBack do
          if ASummData.ZnakCnstItem <> Null then
            ItemIndex := Items.IndexOf(VarToStr(ASummData.ZnakCnstItem))
          else
            ItemIndex := 0;

      end;
      3, 30 :
      begin
        F.edZ.Value := StrToFloatAdv(VarToStr(ASummData.Koeff2));
        if F.edZ.Value = 100 then F.edZ.Value := 0;
      //  if F.edZ.Value = 0 then F.edZ.Value := 100;
        
        F.cePrcBack.Value := StrToFloatAdv(VarToStr(ASummData.Koeff));
        F.ceK_CnstItem.Value := StrToFloatAdv(VarToStr(ASummData.K_CnstItem));
        F.ceK_CnstItemBack.Value := StrToFloatAdv(VarToStr(ASummData.K_CnstItem));
        with F.cbZnakCnstItemBack do
          if ASummData.ZnakCnstItem <> Null then
            ItemIndex := Items.IndexOf(VarToStr(ASummData.ZnakCnstItem))
          else
            ItemIndex := 0;

        with F.cbZnakCnstItem do
          if ASummData.ZnakCnstItem <> Null then
            ItemIndex := Items.IndexOf(VarToStr(ASummData.ZnakCnstItem))
          else
            ItemIndex := 0;
      end;

      4 :
      begin
        F.cbinPercent.Checked := ASummData.inPercent;
        with F.cbZnak do
          if ASummData.Znak <> Null then
            ItemIndex := Items.IndexOf(VarToStr(ASummData.Znak))
          else
            ItemIndex := 0;

        with F.cbZnak2 do
          if ASummData.Znak2 <> Null then
            ItemIndex := Items.IndexOf(VarToStr(ASummData.Znak2))
          else
            ItemIndex := 0;

        with F.cbZnak3 do
          if ASummData.Znak3 <> Null then
            ItemIndex := Items.IndexOf(VarToStr(ASummData.Znak3))
          else
            ItemIndex := 0;

        F.edK.Value := StrToFloatAdv(VarToStr(ASummData.Koeff));
        F.edK2.Value := StrToFloatAdv(VarToStr(ASummData.Koeff2));
        F.edK3.Value := StrToFloatAdv(VarToStr(ASummData.Koeff3));
        F.edB.Value := StrToFloatAdv(VarToStr(ASummData.Val));
      end;
    end;
  //  F.tsOnSysRate.TabVisible := isSys;
    F.cbZnakChange(nil);
    F.cbZnak2Change(nil);
    F.cbZnak3Change(nil);


    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      ASummData.FormType := F.FormType;

      ASummData.Formulas := Null;
      ASummData.Koeff := Null;
      ASummData.Val := Null;
      ASummData.Znak := Null;
      ASummData.Koeff2 := Null;
      ASummData.Znak2 := Null;
      ASummData.Koeff3 := Null;
      ASummData.Znak3 := Null;
      ASummData.inPercent := false;
      ASummData.Summ_UseSys := false;


      case ASummData.FormType of
        10 :
        begin
          ASummData.Koeff := F.edKAM.Value;
        end;
        1 :
        begin
          ASummData.Val := F.ceConst.Value;
        end;
        2 :
        begin
          if F.cbPrc.ItemIndex = 0 then
          begin
            ASummData.Koeff := F.cePrc.Value;
            ASummData.id_CnstItem := Null;
       //     ASummData.ZnakCnstItem := Null;
          end
          else
          begin
            ASummData.Koeff := Null;
            ASummData.id_CnstItem := F.id_CnstItem;
            ASummData.ZnakCnstItem := F.cbZnakCnstItem.Text;
            ASummData.K_CnstItem := F.ceK_CnstItem.Value;
          end;

          ASummData.Summ_UseSys := F.cbSumm1.ItemIndex = 1;
        end;
        3, 30 :
        begin
          ASummData.Koeff2 := F.edZ.Value;
          if ASummData.Koeff2 = 0 then ASummData.Koeff2 := 100;
          if F.cbPrcBack.ItemIndex = 0 then
          begin
            ASummData.Koeff := F.cePrcBack.Value;
            ASummData.id_CnstItem := Null;
          end
          else
          begin
            ASummData.Koeff := Null;
            ASummData.id_CnstItem := F.id_CnstItem;
            ASummData.ZnakCnstItem := F.cbZnakCnstItemBack.Text;
            ASummData.K_CnstItem := F.ceK_CnstItemBack.Value;
          end;

          ASummData.Summ_UseSys := F.cbSumm2.ItemIndex = 1;
        end;
        4 :
        begin
          ASummData.inPercent := F.cbinPercent.Checked;
          ASummData.Summ_UseSys := F.cbSumm3.ItemIndex = 1;
          if F.cbZnak.ItemIndex > 0 then
          begin
            ASummData.Znak := F.cbZnak.Text;
            ASummData.Koeff := F.edK.Value;
          end
          else
          begin
            ASummData.Znak := Null;
            ASummData.Koeff := Null;
          end;

          if F.cbZnak2.ItemIndex > 0 then
          begin
            ASummData.Znak2 := F.cbZnak2.Text;
            ASummData.Koeff2 := F.edK2.Value;
          end
          else
          begin
            ASummData.Znak2 := Null;
            ASummData.Koeff2 := Null;
          end;

          if F.cbZnak3.ItemIndex > 0 then
          begin
            ASummData.Znak3 := F.cbZnak3.Text;
            ASummData.Koeff3 := F.edK3.Value;
          end
          else
          begin
            ASummData.Znak3 := Null;
            ASummData.Koeff3 := Null;
          end;

          ASummData.Val := F.edB.Value;
        end;
      end;
      if VarToStr(ASummData.ZnakCnstItem) = '' then
        ASummData.K_CnstItem := Null;

      if (VarToStr(ASummData.K_CnstItem) = '') or
         (VarToStr(ASummData.K_CnstItem) = '0') then
        ASummData.ZnakCnstItem := '';
      Result := true;
    end;
  finally
    F.Free;
  end;
end;

procedure TInputSumm.btnOkClick(Sender: TObject);
begin
  if cbFormType.ItemIndex = -1 then
  begin
    MessageBox(Handle, 'Не выбран вид расчета', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(cbFormType.Handle);
    ModalResult := mrNone;
  end;
  if edK.Enabled and (edK.Value = 0) then
  begin
    MessageBox(Handle, 'Не введено значение', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(edK.Handle);
    ModalResult := mrNone;
  end;
  if edK2.Enabled and (edK2.Value = 0) then
  begin
    MessageBox(Handle, 'Не введено значение', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(edK2.Handle);                    
    ModalResult := mrNone;
  end;
  if edK3.Enabled and (edK3.Value = 0) then
  begin
    MessageBox(Handle, 'Не введено значение', '', MB_OK + MB_ICONERROR);
    Windows.SetFocus(edK2.Handle);
    ModalResult := mrNone;
  end;
end;

procedure TInputSumm.SetisSys(Value : boolean);
begin
  FisSys := Value;
  cbFormType.Items.Clear;
  cbFormType.Items.AddObject('Прямые проценты', Pointer(2));
  cbFormType.Items.AddObject('Обратные проценты', Pointer(3));
  cbFormType.Items.AddObject('Константа', Pointer(1));
  cbFormType.Items.AddObject('Линейная формула', Pointer(4));
  cbFormType.Items.AddObject('Зависимость от количества', Pointer(10));
  cbFormType.Items.AddObject('Обратный расчет-2', Pointer(30));

  if isSys then
    cbFormType.Items.AddObject('Зачесть по курсу', Pointer(20));
end;

procedure TInputSumm.FormCreate(Sender: TObject);
var i : integer;
begin
  cbZnak.ItemIndex := 0;
  cbZnakChange(nil);
  for i := 0 to PCFrm.PageCount - 1 do
    PCFrm.Pages[i].TabVisible := false;    

  for i := 0 to pcPrc_Back.PageCount - 1 do
    pcPrc_Back.Pages[i].TabVisible := false;
  for i := 0 to pcPrc.PageCount - 1 do
    pcPrc.Pages[i].TabVisible := false;
  pcPrc.ActivePage := tsK;
  pcPrc_Back.ActivePage := tsK;

  cbPrc.ItemIndex := 0;
  cbPrcBack.ItemIndex := 0;
end;

procedure TInputSumm.cbZnakChange(Sender: TObject);
begin
  edK.Enabled := cbZnak.ItemIndex > 0;
end;

function TInputSumm.GetFormType: integer;
begin
  Result := -1;
  if cbFormType.ItemIndex >= 0 then
    Result := integer(cbFormType.Items.Objects[cbFormType.ItemIndex]);
end;

procedure TInputSumm.SetFormType(const Value: integer);
var i : integer;
begin
  if Value > 0 then
  begin
    for i := 0 to cbFormType.Items.Count - 1 do
      if integer(cbFormType.Items.Objects[i]) = Value then
      begin
        cbFormType.ItemIndex := i;
        Break;
      end;
  end;
  cbFormTypeChange(nil);
end;

procedure TInputSumm.cbZnak2Change(Sender: TObject);
begin
  edK2.Enabled := cbZnak2.ItemIndex > 0;
end;

procedure TInputSumm.cbZnak3Change(Sender: TObject);
begin
  edK3.Enabled := cbZnak3.ItemIndex > 0;

end;

procedure TInputSumm.cbFormTypeChange(Sender: TObject);
begin
  case FormType of
    1 : PCFrm.ActivePage := tsConst;
    2 : PCFrm.ActivePage := tsPrc;
    3 :
    begin
      PCFrm.ActivePage := tsPrcBack;
      ImageB1.Visible := true;
      ImageBack2.Visible := false;
    end;
    4 : PCFrm.ActivePage := tsLinear;
    10 : PCFrm.ActivePage := tsAmount;
    20 : PCFrm.ActivePage := tsOnSysRate;
    30 :
    begin
      PCFrm.ActivePage := tsPrcBack;
      ImageBack2.Left := ImageB1.Left;
      ImageBack2.Top := ImageB1.Top;
      ImageB1.Visible := false;
      ImageBack2.Visible := true;
    end;

    else
        PCFrm.ActivePage := tsNone;
  end;
end;

procedure TInputSumm.PCFrmChange(Sender: TObject);
begin
  tag := 0;
end;

procedure TInputSumm.cbPrcChange(Sender: TObject);
begin
  case cbPrc.ItemIndex of
    0 : pcPrc.ActivePage := tsK;
    1 : pcPrc.ActivePage := tsParam;
  end;
end;

procedure TInputSumm.cbPrcBackChange(Sender: TObject);
begin
  case cbPrcBack.ItemIndex of
    0 : pcPrc_Back.ActivePage := tsK_Back;
    1 : pcPrc_Back.ActivePage := tsParam_Back;
  end;
end;

procedure TInputSumm.btnSelClick(Sender: TObject);
var Aid_CnstItem : integer;
    AName: string;
    Value: Extended;
begin
  if id_CnstItem > 0 then
    Aid_CnstItem := id_CnstItem
  else
    Aid_CnstItem := -1;
  if ShowCnstItemSelector(id_Business, Aid_CnstItem, AName, Value) then
  begin
    id_CnstItem := Aid_CnstItem;
    edP.Text := AName;
  end;
end;

procedure TInputSumm.btnSelBackClick(Sender: TObject);
var Aid_CnstItem : integer;
    AName: string;
    Value: Extended;
begin
  if id_CnstItem > 0 then
    Aid_CnstItem := id_CnstItem
  else
    Aid_CnstItem := -1;
  if ShowCnstItemSelector(id_Business, Aid_CnstItem, AName, Value) then
  begin
    id_CnstItem := Aid_CnstItem;
    edP_Back.Text := AName;
  end;
end;

end.
