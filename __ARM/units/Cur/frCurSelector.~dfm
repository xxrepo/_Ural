object fCurSelector: TfCurSelector
  Left = 0
  Top = 0
  Width = 320
  Height = 33
  TabOrder = 0
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Валюта'
  end
  object cbCur: TComboBox
    Left = 56
    Top = 5
    Width = 121
    Height = 19
    Style = csOwnerDrawFixed
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbCurChange
    OnKeyDown = cbCurKeyDown
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
