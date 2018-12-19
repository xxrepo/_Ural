object Form1: TForm1
  Left = 231
  Top = 107
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button2: TButton
    Left = 576
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 0
    OnClick = Button2Click
  end
  object cdsNS: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_User'
        ParamType = ptInput
      end>
    ProviderName = 'dsNS'
    RemoteServer = DM.rsCA
    Left = 520
    Top = 72
    object cdsNSid_NS: TAutoIncField
      FieldName = 'id_NS'
      ReadOnly = True
    end
    object cdsNSNSName: TStringField
      FieldName = 'NSName'
      Size = 255
    end
    object cdsNSdeleted: TBooleanField
      FieldName = 'deleted'
    end
    object cdsNSSortID: TIntegerField
      FieldName = 'SortID'
    end
    object cdsNSFileNameRules: TStringField
      FieldName = 'FileNameRules'
      Size = 200
    end
  end
end
