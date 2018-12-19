object CAWHProp: TCAWHProp
  Left = 294
  Top = 227
  BorderStyle = bsDialog
  Caption = 'CAWHProp'
  ClientHeight = 267
  ClientWidth = 453
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 234
    Width = 453
    Height = 33
    Align = alBottom
    TabOrder = 0
    object OkButton: TButton
      Left = 280
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 368
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 453
    Height = 234
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 79
      Height = 13
      Caption = 'Наименование:'
    end
    object Label2: TLabel
      Left = 8
      Top = 32
      Width = 34
      Height = 13
      Caption = 'Адрес:'
    end
    object Label3: TLabel
      Left = 8
      Top = 128
      Width = 53
      Height = 13
      Caption = 'Описание:'
    end
    object DBEdit1: TDBEdit
      Left = 112
      Top = 6
      Width = 329
      Height = 21
      DataField = 'Name'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBMemo1: TDBMemo
      Left = 112
      Top = 32
      Width = 329
      Height = 92
      DataField = 'Addr'
      DataSource = DataSource1
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object DBMemo2: TDBMemo
      Left = 112
      Top = 131
      Width = 329
      Height = 97
      DataField = 'Descr'
      DataSource = DataSource1
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
  object cdsCAWHProp: TClientDataSet
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
        Name = '@id_CAWhouse'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsCAWHProp'
    RemoteServer = DM.rsCA
    Left = 56
    Top = 88
    object cdsCAWHPropid_CAWhouse: TAutoIncField
      FieldName = 'id_CAWhouse'
      ReadOnly = True
    end
    object cdsCAWHPropid_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsCAWHPropName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object cdsCAWHPropAddr: TStringField
      FieldName = 'Addr'
      Size = 2000
    end
    object cdsCAWHPropDescr: TStringField
      FieldName = 'Descr'
      Size = 2000
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsCAWHProp
    Left = 24
    Top = 88
  end
end
