object ActCL: TActCL
  Left = 99
  Top = 122
  Width = 661
  Height = 412
  Caption = 'Акт взимозачета'
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
  object Panel2: TPanel
    Left = 0
    Top = 332
    Width = 645
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
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
      Left = 567
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
      Left = 476
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 28
    Width = 645
    Height = 142
    Align = alTop
    Caption = 'Организация'
    TabOrder = 4
    object Label11: TLabel
      Left = 7
      Top = 20
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object Label13: TLabel
      Left = 7
      Top = 45
      Width = 80
      Height = 13
      Caption = 'Задолженность'
    end
    object Label15: TLabel
      Left = 7
      Top = 69
      Width = 56
      Height = 13
      Caption = 'Основание'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 7
      Top = 93
      Width = 58
      Height = 13
      Caption = 'Должность'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 7
      Top = 117
      Width = 53
      Height = 13
      Caption = 'Сотрудник'
      FocusControl = DBEdit3
    end
    object RxDBCalcEdit3: TRxDBCalcEdit
      Left = 123
      Top = 41
      Width = 100
      Height = 21
      DataField = 'Summ1'
      DataSource = DataSource1
      NumGlyphs = 2
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 123
      Top = 66
      Width = 300
      Height = 21
      DataField = 'Doc1'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 123
      Top = 90
      Width = 300
      Height = 21
      DataField = 'Post1'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 123
      Top = 114
      Width = 300
      Height = 21
      DataField = 'Name1'
      DataSource = DataSource1
      TabOrder = 4
    end
    object cbOrgName: TDBEdit
      Left = 123
      Top = 16
      Width = 279
      Height = 21
      DataField = 'OrgName1'
      DataSource = DataSource1
      TabOrder = 0
    end
    object BitBtn3: TBitBtn
      Left = 399
      Top = 16
      Width = 24
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn3Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 28
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = ' '
    TabOrder = 0
    object Label2: TLabel
      Left = 4
      Top = 8
      Width = 94
      Height = 13
      Caption = 'Дата составления'
    end
    object Label1: TLabel
      Left = 245
      Top = 7
      Width = 34
      Height = 13
      Caption = 'Номер'
      FocusControl = DBEdit1
    end
    object Label20: TLabel
      Left = 427
      Top = 7
      Width = 38
      Height = 13
      Caption = 'Валюта'
    end
    object DBDateEdit1: TDBDateEdit
      Left = 120
      Top = 4
      Width = 121
      Height = 21
      DataField = 'Doc_Date'
      DataSource = DataSource1
      NumGlyphs = 2
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 287
      Top = 3
      Width = 122
      Height = 21
      DataField = 'Doc_Num'
      DataSource = DataSource1
      TabOrder = 1
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 472
      Top = 4
      Width = 145
      Height = 21
      DropDownCount = 8
      DataField = 'id_DocCur'
      DataSource = DataSource1
      LookupField = 'id_DocCur'
      LookupDisplay = 'DocCurName'
      LookupSource = dsDocCurGetList
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 170
    Width = 645
    Height = 142
    Align = alTop
    Caption = 'Контрагент'
    TabOrder = 2
    object Label6: TLabel
      Left = 7
      Top = 20
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object Label7: TLabel
      Left = 7
      Top = 45
      Width = 80
      Height = 13
      Caption = 'Задолженность'
    end
    object Label8: TLabel
      Left = 7
      Top = 69
      Width = 56
      Height = 13
      Caption = 'Основание'
      FocusControl = DBEdit5
    end
    object Label9: TLabel
      Left = 7
      Top = 93
      Width = 58
      Height = 13
      Caption = 'Должность'
      FocusControl = DBEdit6
    end
    object Label10: TLabel
      Left = 7
      Top = 117
      Width = 53
      Height = 13
      Caption = 'Сотрудник'
      FocusControl = DBEdit7
    end
    object RxDBCalcEdit1: TRxDBCalcEdit
      Left = 123
      Top = 41
      Width = 100
      Height = 21
      DataField = 'Summ2'
      DataSource = DataSource1
      NumGlyphs = 2
      TabOrder = 1
    end
    object DBEdit5: TDBEdit
      Left = 123
      Top = 66
      Width = 300
      Height = 21
      DataField = 'Doc2'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit6: TDBEdit
      Left = 123
      Top = 90
      Width = 300
      Height = 21
      DataField = 'Post2'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit7: TDBEdit
      Left = 123
      Top = 114
      Width = 300
      Height = 21
      DataField = 'Name2'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit8: TDBEdit
      Left = 123
      Top = 16
      Width = 300
      Height = 21
      DataField = 'OrgName2'
      DataSource = DataSource1
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 312
    Width = 645
    Height = 20
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = ' '
    TabOrder = 3
    object Label4: TLabel
      Left = 7
      Top = 7
      Width = 109
      Height = 13
      Caption = 'Сумма взаимозачета'
    end
    object RxDBCalcEdit2: TRxDBCalcEdit
      Left = 123
      Top = 4
      Width = 100
      Height = 21
      DataField = 'Summ'
      DataSource = DataSource1
      NumGlyphs = 2
      TabOrder = 0
    end
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
        Name = '@id_ActCl'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsDoc_ActCL'
    RemoteServer = DM.rsCA
    OnCalcFields = cdsDocCalcFields
    Left = 320
    Top = 45
    object cdsDocid_ActCl: TAutoIncField
      FieldName = 'id_ActCl'
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
    object cdsDocOrgName1: TStringField
      FieldName = 'OrgName1'
      Size = 255
    end
    object cdsDocSumm1: TBCDField
      FieldName = 'Summ1'
      Precision = 18
      Size = 2
    end
    object cdsDocDoc1: TStringField
      FieldName = 'Doc1'
      Size = 1000
    end
    object cdsDocOrgName2: TStringField
      FieldName = 'OrgName2'
      Size = 255
    end
    object cdsDocSumm2: TBCDField
      FieldName = 'Summ2'
      Precision = 18
      Size = 2
    end
    object cdsDocDoc2: TStringField
      FieldName = 'Doc2'
      Size = 1000
    end
    object cdsDocSumm: TBCDField
      FieldName = 'Summ'
      Precision = 18
      Size = 2
    end
    object cdsDocName1: TStringField
      FieldName = 'Name1'
      Size = 255
    end
    object cdsDocPost1: TStringField
      FieldName = 'Post1'
      Size = 255
    end
    object cdsDocName2: TStringField
      FieldName = 'Name2'
      Size = 255
    end
    object cdsDocPost2: TStringField
      FieldName = 'Post2'
      Size = 255
    end
    object cdsDocDoc_DateCreate: TDateTimeField
      FieldName = 'Doc_DateCreate'
    end
    object cdsDocid_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsDocid_DocCur: TIntegerField
      FieldName = 'id_DocCur'
    end
    object cdsDocid_DocCur_1: TAutoIncField
      FieldName = 'id_DocCur_1'
    end
    object cdsDocDocCurName: TStringField
      FieldName = 'DocCurName'
      Size = 50
    end
    object cdsDocDocCurPartName: TStringField
      FieldName = 'DocCurPartName'
      Size = 50
    end
    object cdsDocid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsDocDef: TBooleanField
      FieldName = 'Def'
    end
    object cdsDocNumberCode: TStringField
      FieldName = 'NumberCode'
      FixedChar = True
      Size = 3
    end
    object cdsDocDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsDocid_Doc_Org: TIntegerField
      FieldName = 'id_Doc_Org'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsDoc
    Left = 352
    Top = 48
  end
  object PopupMenu1: TPopupMenu
    Left = 152
    Top = 354
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
    Top = 229
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
    Top = 280
  end
end
