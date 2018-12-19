object DAcc: TDAcc
  Left = 187
  Top = 108
  Width = 777
  Height = 478
  Caption = 'Счет'
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
    Top = 410
    Width = 769
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object RxSpeedButton1: TRxSpeedButton
      Left = 8
      Top = 9
      Width = 121
      Height = 25
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
      Left = 683
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
      Left = 592
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 28
    Width = 769
    Height = 165
    Align = alTop
    TabOrder = 2
    object Label11: TLabel
      Left = 7
      Top = 20
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object Label12: TLabel
      Left = 415
      Top = 20
      Width = 31
      Height = 13
      Caption = 'Адрес'
    end
    object Label3: TLabel
      Left = 7
      Top = 44
      Width = 24
      Height = 13
      Caption = 'ИНН'
    end
    object Label5: TLabel
      Left = 255
      Top = 44
      Width = 23
      Height = 13
      Caption = 'КПП'
    end
    object Label13: TLabel
      Left = 7
      Top = 68
      Width = 85
      Height = 13
      Caption = 'Банк получателя'
    end
    object Label14: TLabel
      Left = 7
      Top = 92
      Width = 37
      Height = 13
      Caption = 'Счет №'
    end
    object Label15: TLabel
      Left = 415
      Top = 44
      Width = 22
      Height = 13
      Caption = 'БИК'
    end
    object Label16: TLabel
      Left = 415
      Top = 92
      Width = 37
      Height = 13
      Caption = 'Счет №'
    end
    object Label18: TLabel
      Left = 8
      Top = 117
      Width = 48
      Height = 13
      Caption = 'Заказчик'
    end
    object Label19: TLabel
      Left = 416
      Top = 117
      Width = 64
      Height = 13
      Caption = 'Плательщик'
    end
    object Label20: TLabel
      Left = 7
      Top = 132
      Width = 74
      Height = 26
      Caption = 'Руководитель предприятия'
      WordWrap = True
    end
    object Label21: TLabel
      Left = 415
      Top = 136
      Width = 50
      Height = 26
      Caption = 'Главный бухгалтер'
      WordWrap = True
    end
    object cbOrgName: TRxDBComboBox
      Left = 123
      Top = 17
      Width = 280
      Height = 21
      DataField = 'OrgName'
      DataSource = DataSource1
      EnableValues = False
      ItemHeight = 13
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
      TabOrder = 0
    end
    object cbAddress: TRxDBComboBox
      Left = 483
      Top = 17
      Width = 280
      Height = 21
      DataField = 'Address'
      DataSource = DataSource1
      EnableValues = False
      ItemHeight = 13
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
      TabOrder = 1
    end
    object cbINN: TRxDBComboBox
      Left = 123
      Top = 41
      Width = 110
      Height = 21
      DataField = 'INN'
      DataSource = DataSource1
      EnableValues = False
      ItemHeight = 13
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
      TabOrder = 2
    end
    object cbKPP: TRxDBComboBox
      Left = 291
      Top = 41
      Width = 110
      Height = 21
      DataField = 'KPP'
      DataSource = DataSource1
      EnableValues = False
      ItemHeight = 13
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
      TabOrder = 3
    end
    object cbBank: TRxDBComboBox
      Left = 123
      Top = 65
      Width = 280
      Height = 21
      DataField = 'Bank'
      DataSource = DataSource1
      EnableValues = False
      ItemHeight = 13
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
      TabOrder = 5
    end
    object cbAcc1: TRxDBComboBox
      Left = 123
      Top = 89
      Width = 280
      Height = 21
      DataField = 'Acc1'
      DataSource = DataSource1
      EnableValues = False
      ItemHeight = 13
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
      TabOrder = 6
    end
    object cbBIK: TRxDBComboBox
      Left = 483
      Top = 41
      Width = 110
      Height = 21
      DataField = 'BIK'
      DataSource = DataSource1
      EnableValues = False
      ItemHeight = 13
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
      TabOrder = 4
    end
    object cbAcc2: TRxDBComboBox
      Left = 483
      Top = 89
      Width = 280
      Height = 21
      DataField = 'Acc2'
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
    object edcustomer: TDBEdit
      Left = 123
      Top = 113
      Width = 278
      Height = 21
      DataField = 'customer'
      DataSource = DataSource1
      TabOrder = 8
    end
    object edPayer: TDBEdit
      Left = 483
      Top = 113
      Width = 278
      Height = 21
      DataField = 'Payer'
      DataSource = DataSource1
      TabOrder = 9
    end
    object cbChif: TRxDBComboBox
      Left = 123
      Top = 137
      Width = 280
      Height = 21
      DataField = 'Chif'
      DataSource = DataSource1
      EnableValues = False
      ItemHeight = 13
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
      TabOrder = 10
    end
    object cbBuh: TRxDBComboBox
      Left = 483
      Top = 137
      Width = 280
      Height = 21
      DataField = 'Buh'
      DataSource = DataSource1
      EnableValues = False
      ItemHeight = 13
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
      TabOrder = 11
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 769
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
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 193
    Width = 769
    Height = 217
    Align = alClient
    Caption = 'Товары'
    TabOrder = 3
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 765
      Height = 200
      Align = alClient
      AllowedOperations = [alopUpdateEh, alopAppendEh]
      DataSource = dsOperWare
      FooterColor = clSilver
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          ButtonStyle = cbsNone
          EndEllipsis = True
          FieldName = 'Numb'
          Footer.EndEllipsis = True
          Footers = <>
          ReadOnly = True
          Title.Caption = '№№'
          Width = 32
        end
        item
          AlwaysShowEditButton = True
          ButtonStyle = cbsNone
          EndEllipsis = True
          FieldName = 'WareName'
          Footer.EndEllipsis = True
          Footers = <>
          Title.Caption = 'Наименование'
          Width = 185
        end
        item
          AlwaysShowEditButton = True
          ButtonStyle = cbsNone
          EndEllipsis = True
          FieldName = 'MesName'
          Footer.EndEllipsis = True
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Title.Caption = 'Ед. изм'
          Width = 56
        end
        item
          AlwaysShowEditButton = True
          ButtonStyle = cbsNone
          EndEllipsis = True
          FieldName = 'Amount'
          Footer.EndEllipsis = True
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Increment = 0.01
          Title.Caption = 'Кол-во'
          Width = 51
        end
        item
          ButtonStyle = cbsNone
          EndEllipsis = True
          FieldName = 'Price'
          Footer.EndEllipsis = True
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Increment = 0.01
          Title.Caption = 'Цена'
          Width = 51
        end
        item
          ButtonStyle = cbsNone
          EndEllipsis = True
          FieldName = 'SummOper2'
          Footer.EndEllipsis = True
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtSum
          Footers = <>
          Increment = 0.01
          ReadOnly = True
          Title.Caption = 'Сумма'
          Width = 72
        end
        item
          ButtonStyle = cbsNone
          EndEllipsis = True
          FieldName = 'VAT'
          Footer.EndEllipsis = True
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Increment = 0.01
          Title.Caption = 'НДС (%)'
          Width = 59
        end
        item
          FieldName = 'VatVal'
          Footer.EndEllipsis = True
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Caption = 'НДС (сумма)'
          Width = 80
        end
        item
          ButtonStyle = cbsNone
          EndEllipsis = True
          FieldName = 'woVAT'
          Footer.EndEllipsis = True
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Caption = 'Без НДС'
        end>
    end
  end
  object cdsDoc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Account'
        ParamType = ptInput
      end>
    ProviderName = 'dsDAccProp'
    RemoteServer = DM.rsCA
    OnCalcFields = cdsDocCalcFields
    Left = 632
    Top = 189
    object cdsDocid_Account: TAutoIncField
      FieldName = 'id_Account'
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
    object cdsDocAddress: TStringField
      FieldName = 'Address'
      Size = 255
    end
    object cdsDocINN: TIntegerField
      FieldName = 'INN'
    end
    object cdsDocKPP: TIntegerField
      FieldName = 'KPP'
    end
    object cdsDocBank: TStringField
      FieldName = 'Bank'
      Size = 255
    end
    object cdsDocAcc1: TStringField
      FieldName = 'Acc1'
      Size = 255
    end
    object cdsDocBIK: TIntegerField
      FieldName = 'BIK'
    end
    object cdsDocAcc2: TStringField
      FieldName = 'Acc2'
      Size = 255
    end
    object cdsDocChif: TStringField
      FieldName = 'Chif'
      Size = 255
    end
    object cdsDocBuh: TStringField
      FieldName = 'Buh'
      Size = 255
    end
    object cdsDoccustomer: TStringField
      FieldName = 'customer'
      Size = 255
    end
    object cdsDocPayer: TStringField
      FieldName = 'Payer'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsDoc
    Left = 592
    Top = 192
  end
  object cdsDocWare: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Account'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'dsDAccWare'
    RemoteServer = DM.rsCA
    OnCalcFields = cdsDocWareCalcFields
    Left = 512
    Top = 178
    object cdsDocWareSummOper2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SummOper2'
      DisplayFormat = '#,##0.00'
      EditFormat = '#.00'
    end
    object cdsDocWareNumb: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'Numb'
    end
    object cdsDocWarewoVAT: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'woVAT'
      DisplayFormat = '#,##0.00'
    end
    object cdsDocWareid_AccountWare: TAutoIncField
      FieldName = 'id_AccountWare'
      ReadOnly = True
    end
    object cdsDocWareid_Account: TIntegerField
      FieldName = 'id_Account'
    end
    object cdsDocWareWareName: TStringField
      FieldName = 'WareName'
      FixedChar = True
      Size = 10
    end
    object cdsDocWareMesName: TStringField
      FieldName = 'MesName'
      FixedChar = True
      Size = 10
    end
    object cdsDocWareAmount: TFloatField
      FieldName = 'Amount'
    end
    object cdsDocWarePrice: TBCDField
      FieldName = 'Price'
      Precision = 18
      Size = 2
    end
    object cdsDocWareVAT: TBCDField
      FieldName = 'VAT'
      Precision = 18
      Size = 2
    end
    object cdsDocWareVatVal: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VatVal'
    end
    object cdsDocWareSS: TAggregateField
      FieldName = 'SS'
      Active = True
      Expression = 'Sum(SummOper2)'
    end
  end
  object dsOperWare: TDataSource
    DataSet = cdsDocWare
    Left = 540
    Top = 175
  end
end
