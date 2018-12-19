object PayIn: TPayIn
  Left = 187
  Top = 108
  Width = 437
  Height = 366
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
  OnKeyPress = FormKeyPress
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
    Width = 82
    Height = 13
    Caption = 'Сумма без НДС'
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
  object Panel2: TPanel
    Left = 0
    Top = 298
    Width = 429
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 11
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
      OnClick = Button1Click
    end
    object btnCancel: TButton
      Left = 343
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
      Left = 252
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
    TabOrder = 7
  end
  object DBEdit8: TDBEdit
    Left = 112
    Top = 176
    Width = 300
    Height = 21
    DataField = 'Payer'
    DataSource = DataSource1
    TabOrder = 8
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
  object cbOKPO: TRxDBComboBox
    Left = 112
    Top = 55
    Width = 145
    Height = 21
    DataField = 'OKPO'
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
  object cbBuh: TRxDBComboBox
    Left = 112
    Top = 201
    Width = 303
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
    TabOrder = 9
  end
  object cbCasser: TRxDBComboBox
    Left = 112
    Top = 225
    Width = 303
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
    TabOrder = 10
  end
  object cbOrgName: TRxDBComboBox
    Left = 112
    Top = 29
    Width = 298
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
    TabOrder = 2
  end
  object RxDBCalcEdit1: TRxDBCalcEdit
    Left = 112
    Top = 104
    Width = 100
    Height = 21
    DataField = 'VAT'
    DataSource = DataSource1
    NumGlyphs = 2
    TabOrder = 5
  end
  object RxDBCalcEdit2: TRxDBCalcEdit
    Left = 112
    Top = 80
    Width = 100
    Height = 21
    DataField = 'Summ'
    DataSource = DataSource1
    NumGlyphs = 2
    TabOrder = 4
  end
  object DBEdit2: TDBEdit
    Left = 112
    Top = 128
    Width = 100
    Height = 21
    Color = clMenu
    DataField = 'WoVAT'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 6
  end
  object cdsPayIn: TClientDataSet
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
    ProviderName = 'dsPayIn'
    RemoteServer = DM.rsCA
    OnCalcFields = cdsPayInCalcFields
    Left = 320
    Top = 45
    object cdsPayInid_Pay_In: TAutoIncField
      FieldName = 'id_Pay_In'
      ReadOnly = True
    end
    object cdsPayInid_Oper: TIntegerField
      FieldName = 'id_Oper'
    end
    object cdsPayInDoc_Num: TStringField
      FieldName = 'Doc_Num'
      Size = 50
    end
    object cdsPayInDoc_Date: TDateTimeField
      FieldName = 'Doc_Date'
    end
    object cdsPayInOKPO: TStringField
      FieldName = 'OKPO'
    end
    object cdsPayInSumm: TBCDField
      FieldName = 'Summ'
      DisplayFormat = '0.##'
      EditFormat = '0.##'
      Precision = 18
      Size = 2
    end
    object cdsPayInVAT: TBCDField
      FieldName = 'VAT'
      DisplayFormat = '0.##'
      EditFormat = '0.##'
      Precision = 18
      Size = 2
    end
    object cdsPayInBasePM: TStringField
      FieldName = 'BasePM'
      Size = 255
    end
    object cdsPayInPayer: TStringField
      FieldName = 'Payer'
      Size = 255
    end
    object cdsPayInBuh: TStringField
      FieldName = 'Buh'
      Size = 255
    end
    object cdsPayInCasser: TStringField
      FieldName = 'Casser'
      Size = 255
    end
    object cdsPayInDoc_DateCreate: TDateTimeField
      FieldName = 'Doc_DateCreate'
    end
    object cdsPayInid_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsPayInOrgName: TStringField
      FieldName = 'OrgName'
      Size = 255
    end
    object cdsPayInWoVAT: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'WoVAT'
      DisplayFormat = '0.00'
    end
  end
  object cdsDList: TClientDataSet
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
        Name = '@UID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsDList'
    RemoteServer = DM.rsCA
    Left = 272
    Top = 61
    object StringField1: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object IntegerField1: TIntegerField
      FieldName = 'UID'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsPayIn
    Left = 352
    Top = 48
  end
end
