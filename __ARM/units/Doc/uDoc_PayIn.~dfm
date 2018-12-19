object PayIn: TPayIn
  Left = 187
  Top = 108
  Width = 433
  Height = 352
  Caption = 'PayIn'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 245
    Top = 9
    Width = 34
    Height = 13
    Caption = 'Номер'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 5
    Top = 10
    Width = 94
    Height = 13
    Caption = 'Дата составления'
  end
  object Label3: TLabel
    Left = 5
    Top = 58
    Width = 31
    Height = 13
    Caption = 'ОКПО'
  end
  object Label4: TLabel
    Left = 5
    Top = 83
    Width = 34
    Height = 13
    Caption = 'Сумма'
  end
  object Label5: TLabel
    Left = 5
    Top = 107
    Width = 41
    Height = 13
    Caption = 'НДС (%)'
  end
  object Label6: TLabel
    Left = 5
    Top = 132
    Width = 61
    Height = 13
    Caption = 'Сумма НДС'
  end
  object Label7: TLabel
    Left = 5
    Top = 155
    Width = 102
    Height = 13
    Caption = 'Основание платежа'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 5
    Top = 180
    Width = 57
    Height = 13
    Caption = 'Принято от'
    FocusControl = DBEdit8
  end
  object Label9: TLabel
    Left = 5
    Top = 203
    Width = 97
    Height = 13
    Caption = 'Главный бухгалтер'
  end
  object Label10: TLabel
    Left = 5
    Top = 228
    Width = 37
    Height = 13
    Caption = 'Кассир'
  end
  object Label11: TLabel
    Left = 4
    Top = 31
    Width = 67
    Height = 13
    Caption = 'Организация'
  end
  object Label12: TLabel
    Left = 5
    Top = 251
    Width = 67
    Height = 13
    Caption = 'Приложение:'
    FocusControl = DBEdit3
  end
  object Label20: TLabel
    Left = 220
    Top = 84
    Width = 38
    Height = 13
    Caption = 'Валюта'
  end
  object Panel2: TPanel
    Left = 0
    Top = 272
    Width = 417
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 14
    object RxSpeedButton1: TRxSpeedButton
      Left = 8
      Top = 9
      Width = 121
      Height = 25
      DropDownMenu = PopupMenu1
      Caption = 'Распечатать'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object btnCancel: TButton
      Left = 339
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOk: TButton
      Left = 248
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object DBEdit1: TDBEdit
    Left = 287
    Top = 5
    Width = 122
    Height = 21
    DataField = 'Doc_Num'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit7: TDBEdit
    Left = 112
    Top = 152
    Width = 300
    Height = 21
    DataField = 'BasePM'
    DataSource = DataSource1
    TabOrder = 9
  end
  object DBEdit8: TDBEdit
    Left = 112
    Top = 176
    Width = 300
    Height = 21
    DataField = 'Payer'
    DataSource = DataSource1
    TabOrder = 10
  end
  object DBDateEdit1: TDBDateEdit
    Left = 112
    Top = 6
    Width = 121
    Height = 21
    DataField = 'Doc_Date'
    DataSource = DataSource1
    NumGlyphs = 2
    TabOrder = 0
  end
  object RxDBCalcEdit2: TRxDBCalcEdit
    Left = 112
    Top = 80
    Width = 100
    Height = 21
    DataField = 'Summ'
    DataSource = DataSource1
    NumGlyphs = 2
    TabOrder = 5
  end
  object DBEdit2: TDBEdit
    Left = 112
    Top = 128
    Width = 100
    Height = 21
    Color = clMenu
    DataField = 'VatVal'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 8
  end
  object DBEdit3: TDBEdit
    Left = 112
    Top = 248
    Width = 300
    Height = 21
    DataField = 'ExtInfo'
    DataSource = DataSource1
    TabOrder = 13
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 265
    Top = 81
    Width = 145
    Height = 21
    DropDownCount = 8
    DataField = 'id_DocCur'
    DataSource = DataSource1
    LookupField = 'id_DocCur'
    LookupDisplay = 'DocCurName'
    LookupSource = dsDocCurGetList
    TabOrder = 6
  end
  object RxDBCalcEdit1: TRxDBComboBox
    Left = 112
    Top = 103
    Width = 100
    Height = 21
    DataField = 'VAT'
    DataSource = DataSource1
    EnableValues = False
    ItemHeight = 13
    Items.Strings = (
      '1'
      '2'
      '3'
      '4')
    TabOrder = 7
  end
  object cbOrgName: TDBEdit
    Left = 112
    Top = 29
    Width = 273
    Height = 21
    DataField = 'OrgName'
    DataSource = DataSource1
    TabOrder = 2
  end
  object BitBtn3: TBitBtn
    Left = 385
    Top = 29
    Width = 23
    Height = 21
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object cbOKPO: TDBEdit
    Left = 113
    Top = 54
    Width = 80
    Height = 21
    DataField = 'OKPO'
    DataSource = DataSource1
    TabOrder = 4
  end
  object cbBuh: TDBEdit
    Left = 112
    Top = 201
    Width = 300
    Height = 21
    DataField = 'Buh'
    DataSource = DataSource1
    TabOrder = 11
  end
  object cbCasser: TRxDBComboBox
    Left = 112
    Top = 225
    Width = 300
    Height = 21
    DataField = 'Casser'
    DataSource = DataSource1
    EnableValues = False
    ItemHeight = 13
    Items.Strings = (
      '1'
      '2'
      '3'
      '4')
    TabOrder = 12
  end
  object cdsDoc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_Pay_In'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsDoc_PayIn'
    RemoteServer = DM.rsCA
    OnCalcFields = cdsDocCalcFields
    Left = 320
    Top = 45
    object cdsDocid_Pay_In: TAutoIncField
      FieldName = 'id_Pay_In'
      ReadOnly = True
    end
    object cdsDocid_Oper: TIntegerField
      FieldName = 'id_Oper'
    end
    object cdsDocDoc_Num: TStringField
      FieldName = 'Doc_Num'
      Size = 50
    end
    object cdsDocDoc_Date: TDateTimeField
      FieldName = 'Doc_Date'
    end
    object cdsDocOKPO: TStringField
      FieldName = 'OKPO'
    end
    object cdsDocSumm: TBCDField
      FieldName = 'Summ'
      Precision = 18
      Size = 2
    end
    object cdsDocVAT: TBCDField
      FieldName = 'VAT'
      Precision = 18
      Size = 2
    end
    object cdsDocBasePM: TStringField
      FieldName = 'BasePM'
      Size = 255
    end
    object cdsDocPayer: TStringField
      FieldName = 'Payer'
      Size = 255
    end
    object cdsDocBuh: TStringField
      FieldName = 'Buh'
      Size = 255
    end
    object cdsDocCasser: TStringField
      FieldName = 'Casser'
      Size = 255
    end
    object cdsDocDoc_DateCreate: TDateTimeField
      FieldName = 'Doc_DateCreate'
    end
    object cdsDocid_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsDocOrgName: TStringField
      FieldName = 'OrgName'
      Size = 255
    end
    object cdsDocExtInfo: TStringField
      FieldName = 'ExtInfo'
      Size = 255
    end
    object cdsDocid_DocCur: TIntegerField
      FieldName = 'id_DocCur'
    end
    object cdsDocid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsDocDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsDocDocCurPartName: TStringField
      FieldName = 'DocCurPartName'
      Size = 50
    end
    object cdsDocDocCurName: TStringField
      FieldName = 'DocCurName'
      Size = 10
    end
    object cdsDocid_DocCur_1: TAutoIncField
      FieldName = 'id_DocCur_1'
      ReadOnly = True
    end
    object cdsDocDef: TBooleanField
      FieldName = 'Def'
    end
    object cdsDocNumberCode: TStringField
      FieldName = 'NumberCode'
      FixedChar = True
      Size = 3
    end
    object cdsDocid_Doc_Org: TIntegerField
      FieldName = 'id_Doc_Org'
    end
    object cdsDocwoVAT: TBCDField
      FieldKind = fkInternalCalc
      FieldName = 'woVAT'
      Precision = 18
      Size = 2
    end
    object cdsDocVatVal: TBCDField
      FieldKind = fkInternalCalc
      FieldName = 'VatVal'
      Precision = 18
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsDoc
    Left = 352
    Top = 48
  end
  object PopupMenu1: TPopupMenu
    Left = 144
    Top = 290
    object N1: TMenuItem
      Caption = 'Открыть...'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = 'Распечатать...'
      OnClick = N2Click
    end
  end
  object cdsDocCurGetList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
        Value = 24
      end>
    ProviderName = 'dsDocCurGetList'
    RemoteServer = DM.rsCA
    Left = 304
    Top = 149
    object cdsDocCurGetListid_DocCur: TAutoIncField
      FieldName = 'id_DocCur'
      ReadOnly = True
    end
    object cdsDocCurGetListDocCurName: TStringField
      FieldName = 'DocCurName'
      Size = 50
    end
    object cdsDocCurGetListDocCurPartName: TStringField
      FieldName = 'DocCurPartName'
      Size = 50
    end
    object cdsDocCurGetListDef: TIntegerField
      FieldName = 'Def'
      ReadOnly = True
    end
  end
  object dsDocCurGetList: TDataSource
    DataSet = cdsDocCurGetList
    Left = 312
    Top = 200
  end
end
