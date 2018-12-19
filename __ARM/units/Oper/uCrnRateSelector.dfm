object CrnRateSelector: TCrnRateSelector
  Left = 266
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Курсы валют'
  ClientHeight = 123
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 89
    Height = 13
    Caption = 'Валюта операции'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 75
    Height = 13
    Caption = 'Валюта зачета'
  end
  object Label3: TLabel
    Left = 240
    Top = 20
    Width = 23
    Height = 13
    Caption = 'курс'
  end
  object Label4: TLabel
    Left = 240
    Top = 48
    Width = 23
    Height = 13
    Caption = 'курс'
  end
  object RxSpeedButton1: TRxSpeedButton
    Left = 356
    Top = 16
    Width = 25
    Height = 21
    Caption = '<<--'
    OnClick = RxSpeedButton1Click
  end
  object RxSpeedButton2: TRxSpeedButton
    Left = 356
    Top = 45
    Width = 25
    Height = 21
    Caption = '<<--'
    OnClick = RxSpeedButton2Click
  end
  object Panel2: TPanel
    Left = 0
    Top = 82
    Width = 387
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 301
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 210
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
  end
  object Edit1: TEdit
    Left = 104
    Top = 16
    Width = 121
    Height = 21
    Color = clActiveBorder
    ReadOnly = True
    TabOrder = 1
    Text = ' '
  end
  object Edit2: TEdit
    Left = 104
    Top = 45
    Width = 121
    Height = 21
    Color = clActiveBorder
    ReadOnly = True
    TabOrder = 2
    Text = ' '
  end
  object RxCalcEdit1: TRxCalcEdit
    Left = 280
    Top = 16
    Width = 71
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = ',0.0000'
    NumGlyphs = 2
    TabOrder = 3
  end
  object RxCalcEdit2: TRxCalcEdit
    Left = 280
    Top = 45
    Width = 71
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = ',0.0000'
    NumGlyphs = 2
    TabOrder = 4
  end
  object cdsCur: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftBoolean
        Name = '@FastAccess'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@AvForPay'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
      end>
    ProviderName = 'dsCur2'
    RemoteServer = DM.rsCA
    Left = 152
    object cdsCurId_Currency: TAutoIncField
      FieldName = 'Id_Currency'
      ReadOnly = True
    end
    object cdsCurName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object cdsCurShortName: TStringField
      FieldName = 'ShortName'
      Size = 10
    end
    object cdsCurISOCode: TStringField
      FieldName = 'ISOCode'
      FixedChar = True
      Size = 3
    end
    object cdsCurNumberCode: TStringField
      FieldName = 'NumberCode'
      FixedChar = True
      Size = 3
    end
    object cdsCurFastAccess: TBooleanField
      FieldName = 'FastAccess'
    end
    object cdsCurValue: TIntegerField
      FieldName = 'Value'
    end
    object cdsCurRate: TFloatField
      FieldName = 'Rate'
    end
    object cdsCurAvForPay: TBooleanField
      FieldName = 'AvForPay'
    end
    object cdsCurBase: TBooleanField
      FieldName = 'Base'
    end
    object cdsCurLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object cdsCurId_URL: TIntegerField
      FieldName = 'Id_URL'
    end
  end
end
