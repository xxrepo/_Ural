object APNProp: TAPNProp
  Left = 210
  Top = 107
  ActiveControl = DBEdit1
  BorderStyle = bsDialog
  Caption = 'Начисление'
  ClientHeight = 114
  ClientWidth = 433
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
    Top = 11
    Width = 50
    Height = 13
    Caption = 'Название'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 35
    Width = 122
    Height = 13
    Caption = 'Число, когда начислять'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 51
    Width = 72
    Height = 13
    Caption = 'Чужой объект'
    FocusControl = DBEdit3
    Visible = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 433
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 4
    object btnCancel: TButton
      Left = 347
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 256
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object DBEdit1: TDBEdit
    Left = 104
    Top = 8
    Width = 323
    Height = 21
    DataField = 'Name'
    DataSource = dsAPNProp
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 144
    Top = 32
    Width = 64
    Height = 21
    DataField = 'DayNum'
    DataSource = dsAPNProp
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 104
    Top = 48
    Width = 300
    Height = 21
    DataField = 'DestName'
    DataSource = dsAPNProp
    TabOrder = 1
    Visible = False
  end
  object BitBtn3: TBitBtn
    Left = 403
    Top = 48
    Width = 24
    Height = 21
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
    OnClick = BitBtn3Click
  end
  object cdsAPNProp: TClientDataSet
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
        Name = '@id_APN_Obj'
        ParamType = ptInput
        Value = 1
      end>
    ProviderName = 'dsAPNProp'
    RemoteServer = DM.rsCA
    Left = 208
    Top = 48
    object cdsAPNPropid_APN_Obj: TAutoIncField
      FieldName = 'id_APN_Obj'
      ReadOnly = True
    end
    object cdsAPNPropid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsAPNPropid_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsAPNPropOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsAPNPropDayNum: TIntegerField
      FieldName = 'DayNum'
    end
    object cdsAPNPropDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsAPNPropNAme: TStringField
      FieldName = 'NAme'
      Size = 255
    end
    object cdsAPNPropid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsAPNPropDestName: TStringField
      FieldName = 'DestName'
      Size = 255
    end
  end
  object dsAPNProp: TDataSource
    DataSet = cdsAPNProp
    Left = 240
    Top = 48
  end
end
