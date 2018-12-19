object Inv: TInv
  Left = 102
  Top = 37
  Width = 824
  Height = 701
  Caption = 'Накладная'
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
  object Label29: TLabel
    Left = 4
    Top = 8
    Width = 94
    Height = 13
    Caption = 'Дата составления'
  end
  object Label30: TLabel
    Left = 245
    Top = 7
    Width = 34
    Height = 13
    Caption = 'Номер'
  end
  object Panel2: TPanel
    Left = 0
    Top = 621
    Width = 808
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
      Left = 730
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
      Left = 639
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
    Top = 251
    Width = 808
    Height = 86
    Align = alTop
    TabOrder = 2
    object Label10: TLabel
      Left = 7
      Top = 14
      Width = 56
      Height = 13
      Caption = 'Основание'
    end
    object Label27: TLabel
      Left = 453
      Top = 14
      Width = 26
      Height = 13
      Caption = 'Дата'
    end
    object Label28: TLabel
      Left = 587
      Top = 13
      Width = 34
      Height = 13
      Caption = 'Номер'
      FocusControl = edBase_Num
    end
    object Label31: TLabel
      Left = 7
      Top = 31
      Width = 50
      Height = 26
      Caption = 'Отпуск разрешил'
      WordWrap = True
    end
    object Label32: TLabel
      Left = 587
      Top = 31
      Width = 50
      Height = 26
      Caption = 'Главный бухгалтер'
      WordWrap = True
    end
    object Label33: TLabel
      Left = 300
      Top = 38
      Width = 58
      Height = 13
      Caption = 'Должность'
    end
    object Label34: TLabel
      Left = 7
      Top = 62
      Width = 47
      Height = 13
      Caption = 'Отпустил'
    end
    object Label35: TLabel
      Left = 300
      Top = 62
      Width = 58
      Height = 13
      Caption = 'Должность'
    end
    object Label36: TLabel
      Left = 590
      Top = 61
      Width = 26
      Height = 13
      Caption = 'Дата'
    end
    object edBase: TDBEdit
      Left = 91
      Top = 10
      Width = 340
      Height = 21
      DataField = 'Base'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edBase_Date: TDBDateEdit
      Left = 485
      Top = 10
      Width = 97
      Height = 21
      DataField = 'Base_Date'
      DataSource = DataSource1
      NumGlyphs = 2
      TabOrder = 1
    end
    object edBase_Num: TDBEdit
      Left = 644
      Top = 9
      Width = 158
      Height = 21
      DataField = 'Base_Num'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 91
      Top = 34
      Width = 198
      Height = 21
      DataField = 'Chif_FIO'
      DataSource = DataSource1
      TabOrder = 3
    end
    object edChif_Post: TDBEdit
      Left = 368
      Top = 34
      Width = 214
      Height = 21
      DataField = 'Chif_Post'
      DataSource = DataSource1
      TabOrder = 4
    end
    object edPuter_Name: TDBEdit
      Left = 91
      Top = 58
      Width = 198
      Height = 21
      DataField = 'Puter_Name'
      DataSource = DataSource1
      TabOrder = 6
    end
    object edPuter_post: TDBEdit
      Left = 368
      Top = 58
      Width = 214
      Height = 21
      DataField = 'Puter_post'
      DataSource = DataSource1
      TabOrder = 7
    end
    object DBDateEdit2: TDBDateEdit
      Left = 644
      Top = 57
      Width = 121
      Height = 21
      DataField = 'Puter_Date'
      DataSource = DataSource1
      NumGlyphs = 2
      TabOrder = 8
    end
    object cbBuh: TDBEdit
      Left = 643
      Top = 33
      Width = 158
      Height = 21
      DataField = 'Buh'
      DataSource = DataSource1
      TabOrder = 5
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 808
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
    object Label21: TLabel
      Left = 629
      Top = 7
      Width = 41
      Height = 13
      Caption = 'НДС (%)'
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
    object RxDBCalcEdit1: TRxDBComboBox
      Left = 677
      Top = 4
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
      TabOrder = 3
    end
    object RxDBCalcEdit2: TRxDBCalcEdit
      Left = 792
      Top = 3
      Width = 84
      Height = 21
      DataField = 'VAT'
      DataSource = DataSource1
      NumGlyphs = 2
      TabOrder = 4
      Visible = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 337
    Width = 808
    Height = 284
    Align = alClient
    Caption = 'Товары'
    TabOrder = 3
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 39
      Width = 804
      Height = 243
      Align = alClient
      AllowedOperations = [alopUpdateEh, alopAppendEh]
      DataGrouping.GroupLevels = <>
      DataSource = dsOperWare
      Flat = False
      FooterColor = clSilver
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      PopupMenu = mpWare
      RowDetailPanel.Color = clBtnFace
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      OnColEnter = DBGridEh1ColEnter
      OnGetFooterParams = DBGridEh1GetFooterParams
      OnKeyPress = DBGridEh1KeyPress
      Columns = <
        item
          ButtonStyle = cbsNone
          EditButtons = <>
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
          EditButtons = <>
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
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'MesName'
          Footer.EndEllipsis = True
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footers = <>
          Title.Caption = 'Ед. изм|Наименование'
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = 'MesCode'
          Footers = <>
          Title.Caption = 'Ед. изм|Код по ОКЕИ'
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'PackType'
          Footers = <>
          Title.Caption = 'Вид упаковки'
          Width = 98
        end
        item
          EditButtons = <>
          FieldName = 'AmountInPalace'
          Footers = <>
          Title.Caption = 'Количество|в одном месте'
        end
        item
          EditButtons = <>
          FieldName = 'PalaceCount'
          Footers = <>
          Title.Caption = 'Количество|мест. штук'
        end
        item
          EditButtons = <>
          FieldName = 'Brutto'
          Footers = <>
          Title.Caption = 'Масса брутто'
        end
        item
          AlwaysShowEditButton = True
          ButtonStyle = cbsNone
          EditButtons = <>
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
          EditButtons = <>
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
          EditButtons = <>
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
          ReadOnly = True
          Title.Caption = 'НДС|ставка (%)'
          Width = 59
        end
        item
          EditButtons = <>
          FieldName = 'VATVal'
          Footer.EndEllipsis = True
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Caption = 'НДС|сумма'
          Width = 80
        end
        item
          ButtonStyle = cbsNone
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'woVAT'
          Footer.EndEllipsis = True
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Caption = 'Без НДС'
        end
        item
          ButtonStyle = cbsNone
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'SummWare'
          Footer.EndEllipsis = True
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtSum
          Footers = <>
          Increment = 0.01
          Title.Caption = 'Сумма'
          Width = 72
        end
        item
          EditButtons = <>
          FieldName = 'id_Invoice'
          Footers = <>
          Title.Caption = 'id_Invoice2'
          Visible = False
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object ToolBar3: TToolBar
      Left = 2
      Top = 15
      Width = 804
      Height = 24
      Caption = 'ToolBar3'
      Images = ilImage
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object ToolButton11: TToolButton
        Left = 0
        Top = 2
        Action = aAddWare
      end
      object ToolButton12: TToolButton
        Left = 23
        Top = 2
        Action = aDelWare
      end
      object ToolButton13: TToolButton
        Left = 46
        Top = 2
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 54
        Top = 2
        Action = aCalcAmount
      end
      object ToolButton2: TToolButton
        Left = 77
        Top = 2
        Action = aClearWare
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 28
    Width = 808
    Height = 93
    Align = alTop
    Caption = 'Грузоотправитель'
    TabOrder = 4
    object Label3: TLabel
      Left = 581
      Top = 20
      Width = 31
      Height = 13
      Caption = 'ОКПО'
    end
    object Label16: TLabel
      Left = 581
      Top = 44
      Width = 30
      Height = 13
      Caption = 'Кор/с'
    end
    object Label14: TLabel
      Left = 383
      Top = 44
      Width = 34
      Height = 13
      Caption = 'Р/счет'
    end
    object Label12: TLabel
      Left = 255
      Top = 20
      Width = 31
      Height = 13
      Caption = 'Адрес'
    end
    object Label15: TLabel
      Left = 255
      Top = 44
      Width = 22
      Height = 13
      Caption = 'БИК'
    end
    object Label11: TLabel
      Left = 7
      Top = 20
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object Label13: TLabel
      Left = 7
      Top = 44
      Width = 25
      Height = 13
      Caption = 'Банк'
    end
    object Label4: TLabel
      Left = 7
      Top = 69
      Width = 80
      Height = 13
      Caption = 'Подразделение'
    end
    object Label9: TLabel
      Left = 699
      Top = 21
      Width = 32
      Height = 13
      Caption = 'ОКПД'
    end
    object edDept: TDBEdit
      Left = 91
      Top = 65
      Width = 710
      Height = 21
      DataField = 'Dept'
      DataSource = DataSource1
      TabOrder = 10
    end
    object cbOrgName: TDBEdit
      Left = 92
      Top = 17
      Width = 137
      Height = 21
      DataField = 'OrgName'
      DataSource = DataSource1
      TabOrder = 0
    end
    object BitBtn3: TBitBtn
      Left = 227
      Top = 17
      Width = 23
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn3Click
    end
    object cbAddress: TDBEdit
      Left = 290
      Top = 17
      Width = 280
      Height = 21
      DataField = 'Address'
      DataSource = DataSource1
      TabOrder = 2
    end
    object cbBank: TDBEdit
      Left = 91
      Top = 40
      Width = 137
      Height = 21
      DataField = 'Bank'
      DataSource = DataSource1
      TabOrder = 5
    end
    object BitBtn1: TBitBtn
      Left = 227
      Top = 40
      Width = 23
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = BitBtn1Click
    end
    object cbBIK: TDBEdit
      Left = 291
      Top = 40
      Width = 88
      Height = 21
      DataField = 'BIK'
      DataSource = DataSource1
      TabOrder = 7
    end
    object cbAcc1: TDBEdit
      Left = 419
      Top = 40
      Width = 150
      Height = 21
      DataField = 'Acc'
      DataSource = DataSource1
      TabOrder = 8
    end
    object cbAcc2: TDBEdit
      Left = 617
      Top = 40
      Width = 184
      Height = 21
      DataField = 'CorAcc'
      DataSource = DataSource1
      TabOrder = 9
    end
    object cbOKPO: TDBEdit
      Left = 616
      Top = 17
      Width = 80
      Height = 21
      DataField = 'OKPO'
      DataSource = DataSource1
      TabOrder = 3
    end
    object cbOKPD: TDBEdit
      Left = 739
      Top = 17
      Width = 62
      Height = 21
      DataField = 'OKPD'
      DataSource = DataSource1
      TabOrder = 4
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 121
    Width = 808
    Height = 65
    Align = alTop
    Caption = 'Грузополучатель'
    TabOrder = 5
    object Label18: TLabel
      Left = 8
      Top = 18
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object Label19: TLabel
      Left = 255
      Top = 18
      Width = 31
      Height = 13
      Caption = 'Адрес'
    end
    object Label5: TLabel
      Left = 7
      Top = 41
      Width = 25
      Height = 13
      Caption = 'Банк'
    end
    object Label6: TLabel
      Left = 383
      Top = 41
      Width = 34
      Height = 13
      Caption = 'Р/счет'
    end
    object Label7: TLabel
      Left = 590
      Top = 41
      Width = 30
      Height = 13
      Caption = 'Кор/с'
    end
    object Label8: TLabel
      Left = 255
      Top = 41
      Width = 22
      Height = 13
      Caption = 'БИК'
    end
    object edRC_Name: TDBEdit
      Left = 91
      Top = 14
      Width = 156
      Height = 21
      DataField = 'RC_Name'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edRC_Address: TDBEdit
      Left = 291
      Top = 14
      Width = 292
      Height = 21
      DataField = 'RC_Address'
      DataSource = DataSource1
      TabOrder = 1
    end
    object edRC_Bank: TDBEdit
      Left = 91
      Top = 38
      Width = 156
      Height = 21
      DataField = 'RC_Bank'
      DataSource = DataSource1
      TabOrder = 2
    end
    object edRC_Acc: TDBEdit
      Left = 424
      Top = 38
      Width = 159
      Height = 21
      DataField = 'RC_Acc'
      DataSource = DataSource1
      TabOrder = 3
    end
    object edRC_BIK: TDBEdit
      Left = 291
      Top = 38
      Width = 86
      Height = 21
      DataField = 'RC_BIK'
      DataSource = DataSource1
      TabOrder = 4
    end
    object edRC_CorAcc: TDBEdit
      Left = 624
      Top = 38
      Width = 177
      Height = 21
      DataField = 'RC_CorAcc'
      DataSource = DataSource1
      TabOrder = 5
    end
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 186
    Width = 808
    Height = 65
    Align = alTop
    Caption = 'Плательщик'
    TabOrder = 6
    object Label17: TLabel
      Left = 8
      Top = 18
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object Label22: TLabel
      Left = 255
      Top = 18
      Width = 31
      Height = 13
      Caption = 'Адрес'
    end
    object Label23: TLabel
      Left = 7
      Top = 41
      Width = 25
      Height = 13
      Caption = 'Банк'
    end
    object Label24: TLabel
      Left = 383
      Top = 41
      Width = 34
      Height = 13
      Caption = 'Р/счет'
    end
    object Label25: TLabel
      Left = 591
      Top = 41
      Width = 30
      Height = 13
      Caption = 'Кор/с'
    end
    object Label26: TLabel
      Left = 255
      Top = 41
      Width = 22
      Height = 13
      Caption = 'БИК'
    end
    object edPayer_Name: TDBEdit
      Left = 91
      Top = 14
      Width = 156
      Height = 21
      DataField = 'Payer_Name'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edPayer_Address: TDBEdit
      Left = 291
      Top = 14
      Width = 292
      Height = 21
      DataField = 'Payer_Address'
      DataSource = DataSource1
      TabOrder = 1
    end
    object edPayer_Bank: TDBEdit
      Left = 91
      Top = 38
      Width = 156
      Height = 21
      DataField = 'Payer_Bank'
      DataSource = DataSource1
      TabOrder = 2
    end
    object edPayer_Acc: TDBEdit
      Left = 424
      Top = 38
      Width = 159
      Height = 21
      DataField = 'Payer_Acc'
      DataSource = DataSource1
      TabOrder = 3
    end
    object edPayer_BIK: TDBEdit
      Left = 291
      Top = 38
      Width = 86
      Height = 21
      DataField = 'Payer_BIK'
      DataSource = DataSource1
      TabOrder = 4
    end
    object edPayer_CorAcc: TDBEdit
      Left = 624
      Top = 38
      Width = 177
      Height = 21
      DataField = 'Payer_CorAcc'
      DataSource = DataSource1
      TabOrder = 5
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
        Name = '@id_Invoice'
        ParamType = ptInput
      end>
    ProviderName = 'dsDoc_Inv'
    RemoteServer = DM.rsCA
    Left = 632
    Top = 189
    object cdsDocid_invoice: TAutoIncField
      FieldName = 'id_invoice'
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
      OnGetText = cdsDocAddressGetText
      Size = 255
    end
    object cdsDocBank: TStringField
      FieldName = 'Bank'
      Size = 255
    end
    object cdsDocBIK: TBCDField
      FieldName = 'BIK'
      DisplayFormat = '000000000'
      Precision = 10
      Size = 0
    end
    object cdsDocAcc: TStringField
      FieldName = 'Acc'
      Size = 255
    end
    object cdsDocCorAcc: TStringField
      FieldName = 'CorAcc'
      Size = 255
    end
    object cdsDocDept: TStringField
      FieldName = 'Dept'
      Size = 255
    end
    object cdsDocOKPO: TStringField
      FieldName = 'OKPO'
    end
    object cdsDocOKPO2: TStringField
      FieldName = 'OKPO2'
    end
    object cdsDocOKPO3: TStringField
      FieldName = 'OKPO3'
    end
    object cdsDocOKPO4: TStringField
      FieldName = 'OKPO4'
    end
    object cdsDocOKPD: TStringField
      FieldName = 'OKPD'
    end
    object cdsDocCBL_Num: TStringField
      FieldName = 'CBL_Num'
    end
    object cdsDocCBL_Date: TDateTimeField
      FieldName = 'CBL_Date'
    end
    object cdsDocRC_Name: TStringField
      FieldName = 'RC_Name'
      Size = 255
    end
    object cdsDocRC_Address: TStringField
      FieldName = 'RC_Address'
      OnGetText = cdsDocAddressGetText
      Size = 255
    end
    object cdsDocRC_Bank: TStringField
      FieldName = 'RC_Bank'
      Size = 255
    end
    object cdsDocRC_BIK: TBCDField
      FieldName = 'RC_BIK'
      DisplayFormat = '000000000'
      Precision = 12
      Size = 0
    end
    object cdsDocRC_Acc: TStringField
      FieldName = 'RC_Acc'
      Size = 255
    end
    object cdsDocRC_CorAcc: TStringField
      FieldName = 'RC_CorAcc'
      Size = 255
    end
    object cdsDocPayer_Name: TStringField
      FieldName = 'Payer_Name'
      Size = 255
    end
    object cdsDocPayer_Address: TStringField
      FieldName = 'Payer_Address'
      OnGetText = cdsDocAddressGetText
      Size = 255
    end
    object cdsDocPayer_Bank: TStringField
      FieldName = 'Payer_Bank'
      Size = 255
    end
    object cdsDocPayer_BIK: TBCDField
      FieldName = 'Payer_BIK'
      DisplayFormat = '000000000'
      Precision = 10
      Size = 0
    end
    object cdsDocPayer_Acc: TStringField
      FieldName = 'Payer_Acc'
      Size = 255
    end
    object cdsDocPayer_CorAcc: TStringField
      FieldName = 'Payer_CorAcc'
      Size = 255
    end
    object cdsDocBase: TStringField
      FieldName = 'Base'
      Size = 255
    end
    object cdsDocBase_Num: TStringField
      FieldName = 'Base_Num'
    end
    object cdsDocBase_Date: TDateTimeField
      FieldName = 'Base_Date'
    end
    object cdsDocExtDoc_Count: TIntegerField
      FieldName = 'ExtDoc_Count'
    end
    object cdsDocChif_Post: TStringField
      FieldName = 'Chif_Post'
      Size = 255
    end
    object cdsDocChif_FIO: TStringField
      FieldName = 'Chif_FIO'
      Size = 255
    end
    object cdsDocBuh: TStringField
      FieldName = 'Buh'
      Size = 255
    end
    object cdsDocPuter_post: TStringField
      FieldName = 'Puter_post'
      Size = 255
    end
    object cdsDocPuter_Name: TStringField
      FieldName = 'Puter_Name'
      Size = 255
    end
    object cdsDocPuter_Date: TDateTimeField
      FieldName = 'Puter_Date'
    end
    object cdsDocWar_Num: TStringField
      FieldName = 'War_Num'
    end
    object cdsDocWar_Date: TDateTimeField
      FieldName = 'War_Date'
    end
    object cdsDocWar_Owner: TStringField
      FieldName = 'War_Owner'
      Size = 255
    end
    object cdsDocWar_Name: TStringField
      FieldName = 'War_Name'
      Size = 255
    end
    object cdsDocGeter_Post: TStringField
      FieldName = 'Geter_Post'
      Size = 255
    end
    object cdsDocGeter_FIO: TStringField
      FieldName = 'Geter_FIO'
      Size = 255
    end
    object cdsDocRC_Post: TStringField
      FieldName = 'RC_Post'
      Size = 255
    end
    object cdsDocRC_FIO: TStringField
      FieldName = 'RC_FIO'
      Size = 255
    end
    object cdsDocRC_Date: TDateTimeField
      FieldName = 'RC_Date'
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
    object cdsDocVAT: TBCDField
      FieldName = 'VAT'
      OnChange = cdsDocVATChange
      Precision = 18
      Size = 2
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
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_Invoice'
        ParamType = ptInput
      end>
    ProviderName = 'dsDoc_InvWare'
    RemoteServer = DM.rsCA
    OnCalcFields = cdsDocWareCalcFields
    Left = 512
    Top = 178
    object cdsDocWareNumb: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'Numb'
    end
    object cdsDocWareid_InvoiceWare: TAutoIncField
      FieldName = 'id_InvoiceWare'
      ReadOnly = True
    end
    object cdsDocWareid_Invoice: TIntegerField
      FieldName = 'id_Invoice'
    end
    object cdsDocWareWareName: TStringField
      FieldName = 'WareName'
      Size = 255
    end
    object cdsDocWareCode: TStringField
      FieldName = 'Code'
    end
    object cdsDocWareMesName: TStringField
      FieldName = 'MesName'
      Size = 255
    end
    object cdsDocWareMesCode: TStringField
      FieldName = 'MesCode'
    end
    object cdsDocWarePackType: TStringField
      FieldName = 'PackType'
      Size = 50
    end
    object cdsDocWareAmountInPalace: TFloatField
      FieldName = 'AmountInPalace'
    end
    object cdsDocWareAmount: TFloatField
      FieldName = 'Amount'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsDocWarePalaceCount: TFloatField
      FieldName = 'PalaceCount'
    end
    object cdsDocWareBrutto: TFloatField
      FieldName = 'Brutto'
    end
    object cdsDocWarewoVAT: TBCDField
      FieldKind = fkInternalCalc
      FieldName = 'woVAT'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 10
    end
    object cdsDocWareVATVal: TBCDField
      FieldKind = fkInternalCalc
      FieldName = 'VATVal'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 10
    end
    object cdsDocWareSummWare: TBCDField
      FieldName = 'SummWare'
      Precision = 18
      Size = 2
    end
    object cdsDocWarePrice: TBCDField
      FieldKind = fkInternalCalc
      FieldName = 'Price'
      Precision = 18
      Size = 2
    end
    object cdsDocWarePrice0: TBCDField
      FieldKind = fkInternalCalc
      FieldName = 'Price0'
      Precision = 18
      Size = 2
    end
    object cdsDocWareAmount0: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'Amount0'
    end
    object cdsDocWareVAT: TBCDField
      FieldKind = fkInternalCalc
      FieldName = 'VAT'
      Precision = 18
      Size = 2
    end
    object cdsDocWareSS: TAggregateField
      FieldName = 'SS'
      Active = True
      Expression = 'Sum(SummWare)'
    end
    object cdsDocWaressAmount: TAggregateField
      FieldName = 'ssAmount'
      Active = True
      Expression = 'Sum(Amount)'
    end
    object cdsDocWareVATValTT: TAggregateField
      FieldName = 'VATValTT'
      Active = True
      Expression = 'sum(VatVal)'
    end
  end
  object dsOperWare: TDataSource
    DataSet = cdsDocWare
    OnDataChange = dsOperWareDataChange
    Left = 540
    Top = 175
  end
  object PopupMenu1: TPopupMenu
    Left = 88
    Top = 474
    object N1: TMenuItem
      Caption = 'Открыть...'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = 'Распечатать...'
      OnClick = N2Click
    end
  end
  object ActionList1: TActionList
    Images = ilImage
    Left = 452
    Top = 267
    object aAddWare: TAction
      Caption = 'Добавить товар'
      Hint = 'Добавить товар'
      ImageIndex = 22
      OnExecute = aAddWareExecute
    end
    object aDelWare: TAction
      Caption = 'Убрать товар'
      Enabled = False
      Hint = 'Убрать товар'
      ImageIndex = 16
      OnExecute = aDelWareExecute
    end
    object aCalcAmount: TAction
      Caption = 'Рассчитать...'
      Enabled = False
      Hint = 'Рассчитать...'
      ImageIndex = 29
      OnExecute = aCalcAmountExecute
    end
    object aClearWare: TAction
      Caption = 'Очистить'
      Enabled = False
      ImageIndex = 31
      OnExecute = aClearWareExecute
    end
  end
  object ilImage: TImageList
    Left = 416
    Top = 264
    Bitmap = {
      494C010120002200040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001002000000000000090
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF000000FF000000FF000000FF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000080800000808000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF00000000000000000000000000000000000000000080800000F8F8F8008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000080800000F8F800008080
      000000000000F8F8F80000000000F8F8F80000000000F8F8F80000000000F8F8
      F800000000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF00000000000000000000000000000000000000000080800000F8F8F8008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000080000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000080800000F8F800008080
      000000000000F8F8F80000000000F8F8F80000000000F8F8F80000000000F8F8
      F800000000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      800000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF00000000000000000000000000000000000000000080800000F8F8F8008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      000000808000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000080800000F8F800000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000000000FF
      FF0000000000008080000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000080800000F8F8F8000000
      0000F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800C0C0C0008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF00000000000080800000000000000000000000000000000000BFBF
      BF00000000000000000000000000FFFF000000000000FFFF000000000000BFBF
      BF00000000000000000000000000000000000000000080800000F8F800000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF000080800000808000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000080800000F8F8F800F8F8
      0000F8F8F800F8F80000F8F8F800F8F80000F8F8F800F8F80000F8F8F800F8F8
      0000F8F8F8008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000808000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000808000008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000808000008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF00000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000080000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      00008080000080800000808000000000000000000000000000000000FF000000
      FF0000000000000000007F7F7F00000000007F7F7F00000000000000FF000000
      FF000000FF0000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000080000000FF000000FF0000008000000080000000
      0000000000000000000000000000000000000000000080808000808080008080
      800080808000808080008080800080808000808080000000000080800000FFFF
      0000FFFF0000FFFFFF000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000FF00FFFFFF000000FF0000008000000080000000
      0000000000000000000000000000000000000000000000000000FFFF00008080
      0000808000008080000080800000808000000000000080800000FFFF0000FFFF
      0000FFFFFF00000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF007F7F7F00000000007F7F7F0000000000000000000000
      00000000FF000000FF000000000000000000000000000080800000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000808000000000000000000000000000000000000000
      00000000000000000000000080000000FF000000800000008000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      00008080000080800000808000000000000080800000FFFF0000FFFF0000FFFF
      FF00000000008080000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000080800000000000000000000080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000808000000000000080800000FFFF0000FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080800000FFFF0000FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000007F7F7F00000000007F7F7F0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080800000FFFF0000FFFF0000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000800000000000000080000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080800000FFFF0000FFFF0000FFFFFF000000000080800000808080000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000008000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000FFFF0000FFFF0000FFFFFF0000000000FFFF000080800000808000008080
      800000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      000000000000000000000080800000FFFF0000FFFF0000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000008000000080000000
      000000000000000000000000000000000000000000000000000080800000FFFF
      0000FFFF0000FFFFFF00000000000000000000000000FFFF0000808000008080
      000080808000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00808080000000FF000000FF00000080000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000000000000000FF000000
      FF000000FF00000000007F7F7F00000000007F7F7F0000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808080000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000FFFF0000FFFF0000FFFF0000FFFF00008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000808080008080800000000000808080008080800080808000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000C0C0C0008080
      00008080000080800000808080008080800080808000C0C0C000808080008080
      0000808000008080800000000000000000000000000000000000000000000000
      0000000000000084000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000808080008080
      0000808000008080000080800000C0C0C00080808000C0C0C000808080008080
      8000808000008080000080808000000000000000000000000000000000000000
      0000008400000084000000840000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000848400000000000000000000000000FFFFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000848400000000000000000000000000C0C0C000808000000080
      00008080000080800000808000000000000080808000C0C0C000C0C0C0008080
      8000808000008080000080800000C0C0C0000000000000000000000000000000
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000000FFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000080808000808000008080
      0000808000008080800080808000000000000000000080808000808080008080
      8000808080008080000000800000808080000000000000000000000000000084
      0000008400000084000000840000008400000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000084840000848400008484000084
      84000084840000848400008484000000000000000000FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000084840000848400008484000084
      840000848400008484000084840000000000C0C0C00080800000808080008080
      00008080800000000000000000000000000000000000C0C0C000808080000000
      0000808000008080800080808000808080000000000000000000008400000084
      0000008400000084000000840000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808000008080800080808000000000000000000000000000000000008080
      8000808080008080800080808000808080000000000084848400008400000084
      0000000000000000000000840000008400000084000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C6000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C60000000000000000000000000000000000C0C0C00080808000808080008080
      80008080800080800000C0C0C000000000000000000000000000000000000080
      0000808000008080800080808000808080008484840000840000000000000000
      0000000000000000000000000000008400000084000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000080808000C0C0C000C0C0
      C000808080008080800000000000000000000000000000000000000000008080
      8000808000008080000080800000C0C0C0000000000000000000000000000000
      0000000000000000000000000000008400000084000000840000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF008484840000FF
      000000FF0000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000080808000808080008080
      80008080800080808000C0C0C000000000008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484840000FF
      000000FF0000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400848484008484
      840000000000000000000000000000000000000000000000000000000000C0C0
      C000808080008080000080800000000000008080800080800000808000008080
      8000808000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000008400000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808080008080000080800000808080000000000080808000808000008080
      0000808000008080000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000084
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000008400000084000000
      8400000084000000840000008400000000000000000000000000000000008080
      8000C0C0C0008080800080808000808000008080800080800000808000008080
      0000808000000080000080800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000000000000000000000000000000000000000000848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      000000FF00000000000000000000000000000000000000000000848484008484
      840084848400848484008484840084848400848484000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000000000000000000000000000C0C0
      C00080808000C0C0C000C0C0C000808080000080000080800000808000008080
      0000808080000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000840000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000C0C0C0008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000000000000000CED6D60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00009C31009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000000000000000CED6D60084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00009C3100009C3100FFFFFF009CFFFF00FFFFFF009CFF
      FF000000000000000000CED6D600000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF009CFFFF00009C3100009C3100009C3100009C3100009C31009CFFFF00FFFF
      FF000000000000000000CED6D600000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00009C3100009C3100FFFFFF00639C0000636300009CFF
      FF000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00009C31009CFFFF00FFFFFF0063630000FFFF
      FF000000000000000000CED6D60000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00636300009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00636300009CFF
      FF000000000000000000CED6D60000000000000000000000000000000000FFFF
      FF00000000000000000000000000C6DEC6000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF0063630000FFFFFF009CFFFF00009C31009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000000000000000CED6D60000000000000000000000000000000000FFFF
      FF00000000000000000000000000C6DEC6000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF0063630000639C0000FFFFFF00009C3100009C31009CFFFF00FFFFFF009CFF
      FF000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF009CFFFF00009C3100009C3100009C3100009C3100009C31009CFFFF00FFFF
      FF000000000000000000CED6D600000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00009C3100009C31009CFFFF00FFFFFF000000
      00000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00009C31009CFFFF00FFFFFF00000000000000
      00000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF0084848400FFFF
      FF0000000000CED6D600CED6D600000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00CED6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      000000000000CED6D60000000000CED6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      840084848400848484008484840084848400848484008484840084848400CED6
      D600CED6D60000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000848484000000000000000000C6C6C6000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF008484840000000000848484000000000000FFFF0000000000848484000000
      000084848400FFFFFF00FFFFFF00000000000000000000000000848484000000
      000000000000FFFF0000FFFF000000000000FFFF0000FF000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C6000000000000FFFF00848484000000000000FFFF00000000008484840000FF
      FF0000000000C6C6C600FFFFFF0000000000000000000000000000000000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000000000000000000084848400000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000848484008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      84008484840000000000FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF000000000000FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400000000000000000000FFFF0084848400000000008484840000FFFF000000
      00000000000084848400FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000000000FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000000000FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF000000000000FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400000000000000000000FFFF0084848400000000008484840000FFFF000000
      00000000000084848400FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00848484008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      840084848400FFFFFF00FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF008484840084848400000000008484840084848400000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF000000000000FFFF00848484000000000000FFFF00000000008484840000FF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFF0000FFFF00008484
      84000000FF00FFFF000000000000FFFF000000000000848484000000FF000000
      FF0000000000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF00FFFF
      FF008484840000000000848484000000000000FFFF0000000000848484000000
      000084848400FFFFFF00FFFFFF00000000000000000084848400848484000000
      0000FFFF00000000FF00FFFF00000000000084848400848484000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF000000000000FFFF
      000000000000FFFF00000000FF00848484000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFF00000000FF0000000000848484000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000848484000000
      00000000000000000000FFFF00008484840084848400848484000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000FFFF000000000000848484000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000C6C6C6000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000FFFF0000FFFF0000FFFFFF00FFFF0000FF000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000FF00000000000000FFFFFF0000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000000000000000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      000000000000000000008484840000000000000000000000000000000000FF00
      000000000000FFFFFF00FFFFFF00FFFFFF0000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000084840000FFFF0000000000000000000084840000FFFF00008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000FF000000FF00
      0000FF00000000000000FFFFFF00FFFFFF00FFFFFF0000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      84000000000000000000000000000000000084848400FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF0000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF00000000000000FFFFFF00FFFFFF00FFFFFF0000000000FF00
      0000000000000000000000000000000000000000000000000000000000008484
      84000084840000FFFF0000000000000000000084840000FFFF00008484000084
      84000000000000000000000000000000000084848400FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF000000000000000000000084000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FF0000000000000000000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      84000000000000000000000000000000000084848400FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF00000000000000000000FF00000084000000FF000000FF00
      0000FF000000FF000000FF000000FF00000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FF00000000000000000000000000000000000000000000008484
      84000084840000FFFF0000000000000000000084840000FFFF00008484000084
      84000000000000000000000000000000000084848400FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF008484840084848400FFFFFF0084848400848484000000FF00FF00
      0000FFFF0000FF000000000000000000000000000000FF00000084000000FF00
      0000FF00000000000000FF000000FF000000FF00000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FF000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      84000000000000000000000000000000000084848400FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF000000000000FFFF00000000000000000000000000FFFF0000FFFF00008484
      84000000FF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF00000000FF008484
      8400FF000000FFFF000000000000000000000000000000000000FF0000008400
      0000FF000000FF000000FF00000000000000FF000000FF00000000000000FFFF
      FF0000000000FF00000000000000000000000000000000000000000000008484
      84000084840000FFFF0000000000000000000084840000FFFF00008484000084
      84000000000000000000000000000000000084848400FFFFFF00848484000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000008484840084848400FFFF
      FF00FFFF00000000FF00FFFF0000FFFFFF00FFFF00000000FF00FFFF0000FFFF
      FF0084848400848484000000000000000000000000000000000000000000FF00
      000084000000FF0000000000000000000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000084840000000000008484000000000000848400000000000084
      84000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF00000000FF000000FF000000FF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF000000000000000000000000000000000000000000000000
      0000FF00000084000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000000000000FFFF000000000000FFFF000000000000FFFF000000
      00000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF008484840000000000FFFFFF008484840084848400FFFF
      FF0000000000000000000000000000000000848484000000000000000000FFFF
      FF00FFFF00000000FF00FFFFFF00FFFF0000FFFFFF000000FF00FFFF0000FFFF
      FF00000000000000000084848400000000000000000000000000000000000000
      000000000000FF00000084000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF008484840084848400FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000848484000000
      000000000000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00000084000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000FFFF000000000000FFFF000000000000FFFF008484
      840000000000000000000000000000000000848484008484840084848400FFFF
      FF00FFFFFF00FFFFFF00000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000FFFF00000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840000000000000000000000000084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000424242004242420042424200000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600848484008484840084848400848484008484840000000000000000008484
      840084848400C6C6C60000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF000084840000FFFF000084
      84000000000000000000000000000000000000000000BDBDBD00000000007B7B
      7B0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200000000000000
      00000000000000000000000000000000000000000000C6C6C6000063630000A5
      A50000C6C60000C6C60000A5A5000084840000848400002121000042420000E7
      E7000084840000636300C6C6C600000000000000000000000000000000000000
      0000008484000000000000FFFF0000FFFF000084840000848400000000000084
      84000084840000000000000000000000000000000000BDBDBD00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002121
      2100212121002121210000000000848484004242420042424200000000000000
      0000212121000000000000000000000000000000000000424200008484000084
      840031737300315252003152520000424200002121000063630000FFFF0000C6
      C60000A5A5000084840000424200000000000000000000000000000000000084
      84000000000000FFFF0000FFFF000000000000FFFF000084840000FFFF000084
      84000084840000848400000000000000000000000000BDBDBD00BDBDBD000000
      0000000000000000000000000000FFFFFF00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000212121006363
      6300313131002121210021212100A5A5A5006363630000000000000000002121
      21002121210021212100000000000000000000000000000000000084840000A5
      A50000A5A5000084840000848400008484000084840000C6C60000A5A50000C6
      C60000E7E70000C6C60000A5A500848484000000000000000000000000000084
      84000084840000FFFF0000FFFF0000FFFF0000FFFF0000848400008484000084
      8400008484000084840000000000000000000000000000000000000000007B7B
      7B00FFFFFF00FFFFFF00FFFFFF0000000000BDBDBD00BDBDBD00000000000000
      000000000000000000000000000000000000000000000000000021212100A5A5
      A500C6C6C60073737300A5A5A500C6C6C600C6C6C60063636300737373009494
      9400212121004242420000000000000000004263630000A5A500008484000063
      6300006363000063630000424200004242000084840000C6C6000084840000E7
      E70000FFFF0000A5A50000C6C60084848400000000000000000000FFFF000084
      840000FFFF000084840000FFFF0000FFFF000084840000FFFF0000FFFF000084
      840000FFFF000084840000848400000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00BDBDBD00000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000003131
      3100C6C6C60094949400D6D6D600B5B5B500A5A5A500D6D6D600737373007373
      73000000000042424200000000000000000000212100002121000063630000A5
      A50000C6C60000C6C60000A5A500008484000084840000C6C6000084840000C6
      C60000C6C60000C6C60000C6C60084848400000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00008484000084840000848400000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000042424200424242006363
      6300A5A5A500C6C6C60063636300424242006363630063636300D6D6D6006363
      6300000000004242420042424200424242004263630000424200004242000084
      840063A5A5003194940031949400319494000084840000A5A5000084840000A5
      A50000C6C60000C6C60000A5A500C6C6C600000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000084840000FFFF0000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00BDBDBD00424242003131310063636300E7E7
      E700636363009494940073737300737373005252520063636300A5A5A500C6C6
      C600636363004242420000000000424242000000000000212100006363000042
      4200006363000063630000636300006363000042420000E7E70000A5A5000084
      84000084840000FFFF004263630000000000000000000000000000FFFF000084
      840000FFFF0000848400008484000084840000FFFF0000FFFF000000000000FF
      FF00008484000084840000FFFF00000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000004242420063636300D6D6D600E7E7
      E700424242006363630084848400636363007373730042424200B5B5B500C6C6
      C600A5A5A50084848400000000004242420000000000848484000084840000A5
      A50000A5A50000A5A50000A5A50000A5A50000A5A5000063630000A5A50000A5
      A50000A5A500428484000000000000000000000000000000000000FFFF000084
      84000084840000848400008484000084840000FFFF0000FFFF0000FFFF000084
      840000FFFF000084840000FFFF000000000000000000000000000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000FFFFFF00212121000000000000000000A5A5
      A50063636300B5B5B500C6C6C600848484007373730063636300D6D6D600A5A5
      A500212121002121210000000000212121000000000084848400004242000042
      420000C6C60063A5A50031525200315252003152520000212100000000000021
      210000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00008484000084840000848400008484000084840000848400008484000084
      840000FFFF0000FFFF000000000000000000000000000000000000FFFF000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF000000000000FFFF0000000000000000000000000000000000000000003131
      3100B5B5B50063636300B5B5B5006363630094949400C6C6C600949494006363
      63000000000042424200000000000000000000000000C6C6C600006363003173
      73000063630000A5A50000C6C60000C6C60000C6C60000C6C60000C6C6000063
      63004263630000000000000000000000000000000000000000000000000000FF
      FF00008484000084840000FFFF000084840000848400008484000084840000FF
      FF0000FFFF0000848400000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF000000000000FFFF000000000000000000000000000000000000000000A5A5
      A500D6D6D600B5B5B500636363004242420063636300A5A5A500B5B5B500A5A5
      A500212121004242420000000000000000000000000000000000C6C6C6000042
      42003173730073D6D60084FFFF0084E7E70042C6C60000A5A50000A5A5000042
      42000063630084848400000000000000000000000000000000000000000000FF
      FF0000FFFF00008484000084840000848400008484000000000000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF000000
      000000FFFF000000000000000000000000000000000000000000424242005252
      5200A5A5A50031313100A5A5A500E7E7E700E7E7E70063636300212121007373
      7300212121002121210000000000000000000000000000000000000000000021
      21000084840000A5A50000C6C60000FFFF0000FFFF0000C6C60000C6C60000A5
      A500006363008484840000000000000000000000000000000000000000000000
      000000FFFF0000FFFF00008484000084840000FFFF000084840000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000006363
      6300424242002121210000000000D6D6D6006363630042424200000000002121
      210021212100000000000000000000000000000000000000000000000000C6C6
      C600004242000084840000C6C60000E7E70042FFFF0084FFFF0042C6C6000042
      4200426363000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363003131310042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000021212100424242004242420042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00B5D6
      B5005AAD5A00218C2100007B0000007B0000007B000008840800218C21005AAD
      5A00B5D6B500FFFFFF0000000000000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000FFFF000000000000DEEFDE00399C39000084
      000000840000008400000084000000C6000000C6000000840000008400000084
      00000084000031943100DEEFDE00000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF00848484000000000000000000000000000000000000000000000000000084
      8400000000000084840000000000008484000000000000848400000000000084
      84000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF0000E7F7E700188C1800008400000084
      0000008400000084000000D6000000FF000000FF000000BD0000008400000084
      00000084000000840000188C1800E7EFE7008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF0000FFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000848400000000000000000000848400008484000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF000063AD630000840000008400000084
      0000008400000084000000E7000000A5000000B5000000F70000008400000084
      00000084000000840000008400005AAD5A008484840084848400848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      FF0000FFFF00848484008484840000000000C6C6C60000848400008484000084
      8400008484000084840000848400008484000084840000000000008400000084
      84000084840000000000000000000000000000000000FFFFFF00FFFF00000000
      000000FFFF000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF0000188C180000840000008400000084
      000000840000008400000094000000C6000000DE000000EF0000008400000084
      0000008400000084000000840000088408008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF00848484008484
      840000FFFF008484840000FFFF0084848400FFFFFF0000848400008484000084
      840000848400008484000084840000848400008484000084840000FFFF000000
      00000084840000FFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF0000188C180000840000008400000084
      0000008400000084000000F7000000EF000000DE000000A50000008400000084
      0000008400000084000000840000007B00008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF00848484008484840000FFFF0084848400FFFFFF0000848400008484000084
      840000848400008484000084840000FFFF0000FFFF00000000000084840000FF
      FF0000FFFF0000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000000000FFFF00005AAD5A0000840000008400000084
      0000008400000084000000FF000000B5000000A5000000D60000008400000084
      00000084000000840000008400004AA54A008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF0000FFFF008484840000FFFF0084848400FFFFFF00FFFFFF00008484000084
      8400008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000848400FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF00000000000000000000FFFF00FFFF
      FF0000FFFF00000000000000000000000000DEEFDE00108C1000008400000084
      0000008400000084000000EF000000F7000000F7000000DE0000008400000084
      0000008400000084000008840800D6E7D6008484840084848400848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      FF0000FFFF0084848400848484008484840084000000FFFFFF00C6C6C60000FF
      FF0000000000000000000084840000FFFF0000FFFF0000848400000000000084
      84000084840000000000FFFFFF008400000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000000000000000000000
      00000000000000000000000000000000000000000000D6E7D600188C18000084
      00000084000000840000008C000000DE000000DE000000840000008400000084
      000000840000188C1800C6DEC600000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484
      840000FFFF008484840000FFFF008484840084000000FFFFFF00C6C6C60000FF
      FF0000FFFF0000FFFF0000000000000000000000000000848400008484000084
      840000848400FFFFFF00FFFFFF008400000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000F7FFF70094C6
      9400399C39000084000000840000008C0000008C00000084000000840000399C
      390094C69400F7FFF7000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FF
      FF00848484008484840000FFFF00848484008400000084000000FFFFFF000000
      000000FFFF0000FFFF0000848400008484000084840000FFFF0000FFFF0000FF
      FF0000848400FFFFFF0084000000840000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFF7EF0029942900008400000084000000840000008400005AAD5A00F7FF
      F700000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000FFFF00848484008400000084000000000000000000
      000000000000008484000084840000FFFF000084840000000000000000000000
      0000FFFFFF0084000000840000008400000000000000000000007B7B7B000000
      00007B7B7B00000000007B7B7B00000000007B7B7B00000000000000000000FF
      FF0000000000000000000000000000000000000000000000000000000000F7F7
      F700319C31000084000000840000008400000084000000840000008400003194
      3100E7EFE7000000000000000000000000000000000000000000000000008484
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484840000FFFF0000FF
      FF0000FFFF0000FFFF0084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084000000840000008400000000000000000000007B7B7B000000
      00007B7B7B00000000007B7B7B00000000007B7B7B0000000000000000000000
      00000000FF000000000000000000000000000000000000000000F7F7F700399C
      3900008400000084000000840000008400000084000000840000008400000084
      0000108C1000C6DEC60000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094BD940084BD
      840063AD63004AA54A008CBD8C0073B57300088408000884080018841800A5CE
      A5007BBD7B0052A55200B5D6B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000900000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C007FFFFFFFF847FC007FFFFFFFF00EF
      C007C003C00731BFC0078001E7E739FFC0078001F3F7993FC0078001F9F7CA1F
      C0078001FCFFF40FC0078001FE7F9C07C0078001FF3F9603C0078001FE7FCB01
      C0078001FCFFFF80C0078001F9F7F7C0C0078001F3F7FFE0C007C003E7E7EFF0
      C007FFFFC007FFF8C007FFFFFFFFFFFCFFFFF81FFFFFFFFFF83FE007FE1FFFE0
      E00FC003FC1F0000CC478001FC0F000184638001FC0F8003A0730000FC1FC001
      31F90000FF7FE00138F90000FE3FF01F3C790000FE3FF01F3C390000FE1FE00F
      3C190000FC1FC0079C0B8001FC0F81038C438001FC0F0381C467C003F80F07C1
      E00FE007FC0FFFFFF83FF81FFE3FFFFFFF9FFFFF000F000FF107FFFF00070007
      C003F9FF00030003C001F0FF000100018100F0FF000000008180E07F00000000
      0790C07F0000000001E0843F0007000701E01E3F0003000783E0FE1F80038007
      8101FF1FC001C007E103FF8FC000C001E081FFC7C000C000E001FFE3C001C000
      E005FFF8FFC3FF81F00FFFFFFFE7FFFFFFFF8001FFFFFFFFDFFB3FF9FFFFFFFF
      8FFF800983E0001F87F7000983E0000FC7EF800983E00007E3CF800980800003
      F19F800980000001F83F800980000000FC7F80098000001FF83F8009C001001F
      F19F8009E083001FC3CF8019E0838FF187E78001F1C7FFF98FFB8001F1C7FF75
      FFFF800AF1C7FF8FFFFF8005FFFFFFFF8000FC7FFFFFFFFF8000F01FFFFF000F
      8000C107E003000F80008001E003000F80000101E003000F80000001E003000F
      80000101E003000F80000001E003000F80000101E003008F80000281E0031144
      80001101E0030AB880002801E003057C80009201E007FAFC8001C403E00FFDF8
      8003F007E01FFE048007FC4FFFFFFFFFFFFFFFFFFFFFFC7FFDFFFC3FD8BFF01F
      F8FFF30FE07FC007F07FE287F07F0001E03FE30700010001C01FE28700010001
      800FE307000100010007E287000100010003E307000100018001E28700010001
      C003E30700010001E00FE2A700050001F00FE55700010001F81FEAA70005C007
      FC7FF54F0101F01FFFFFF81FC387FC7FFE0F81FFFE3FE063F00780FFFFBF8001
      E003007FE2378001C001001FC0638000C0018007C00300008000E001E00B0000
      8000F800800800008000F800000280018000E000000280038000C0006002800F
      80018002E00B8007C0018003E003C003C003C003C003E003E007E007E227E007
      F00FF00FFE3FF81FFC1FFC3FFC3FFFFF803FFFFFFFFFFFFF001FFFFF001FFF7F
      0004C003000FE00F000080010007C00F00000000000300070000000000010003
      0000000000000003000000000000000000000000000000000000000000000000
      0007800100000000001FC00380000000000FF00FC00008008007E007E0007FF0
      8023C003F000FFFC5577C001FFFFFFFE00000000000000000000000000000000
      000000000000}
  end
  object dsDocCurGetList: TDataSource
    DataSet = cdsDocCurGetList
    Left = 312
    Top = 280
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
  object mpWare: TPopupMenu
    Images = ilImage
    Left = 184
    Top = 417
    object N3: TMenuItem
      Action = aAddWare
    end
    object N4: TMenuItem
      Action = aDelWare
    end
  end
end
