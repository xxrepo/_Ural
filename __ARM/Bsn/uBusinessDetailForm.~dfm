object BusinessDetailForm: TBusinessDetailForm
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'BusinessDetailForm'
  ClientHeight = 269
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Scaled = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 233
    Width = 419
    Height = 36
    Align = alBottom
    TabOrder = 1
    object OkButton: TButton
      Left = 247
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = OkButtonClick
    end
    object Button1: TButton
      Left = 335
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 419
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 12
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object Label2: TLabel
      Left = 10
      Top = 35
      Width = 99
      Height = 13
      Caption = 'Короткое название'
    end
    object Label3: TLabel
      Left = 10
      Top = 60
      Width = 19
      Height = 13
      Caption = 'Код'
    end
    object Label4: TLabel
      Left = 9
      Top = 84
      Width = 82
      Height = 13
      Caption = 'Учетная валюта'
    end
    object NameEdit: TEdit
      Left = 112
      Top = 8
      Width = 249
      Height = 21
      MaxLength = 50
      TabOrder = 0
    end
    object ShortNameEdit: TEdit
      Left = 112
      Top = 32
      Width = 121
      Height = 21
      MaxLength = 5
      TabOrder = 1
    end
    object NumEdit: TEdit
      Left = 112
      Top = 56
      Width = 121
      Height = 21
      MaxLength = 5
      TabOrder = 2
      OnKeyPress = NumEditKeyPress
    end
    object cbCrn: TComboBox
      Left = 112
      Top = 80
      Width = 249
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnChange = cbCrnChange
      Items.Strings = (
        'Рубли РФ'
        'Доллары США'
        'Евро'
        'Указать валюту')
    end
  end
  inline fCurProp1: TfCurProp
    Top = 105
    Width = 419
    Height = 128
    Align = alClient
    TabOrder = 2
    inherited Label7: TLabel
      Visible = False
    end
    inherited RxDBLookupCombo1: TRxDBLookupCombo
      Visible = False
    end
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptUnknown
      end>
    ProviderName = 'dsGetBusiness'
    RemoteServer = DM.rsCA
    Left = 336
    Top = 48
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
    Left = 264
    Top = 48
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
