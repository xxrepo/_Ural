object CRepCat_v2: TCRepCat_v2
  Left = 210
  Top = 107
  ActiveControl = DBEdit1
  BorderStyle = bsDialog
  Caption = 'Раздел'
  ClientHeight = 261
  ClientWidth = 404
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
    Top = 37
    Width = 50
    Height = 13
    Caption = 'Название'
    FocusControl = DBEdit1
  end
  object Label3: TLabel
    Left = 8
    Top = 68
    Width = 103
    Height = 13
    Caption = 'Среднемес. затрата'
    FocusControl = DBEdit2
  end
  object Label2: TLabel
    Left = 8
    Top = 95
    Width = 64
    Height = 13
    Caption = 'Свой объект'
    FocusControl = DBEdit2
  end
  object Label4: TLabel
    Left = 8
    Top = 119
    Width = 58
    Height = 13
    Caption = 'Контрагент'
    FocusControl = DBEdit2
  end
  object Panel2: TPanel
    Left = 0
    Top = 220
    Width = 404
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 318
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 227
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
    Left = 128
    Top = 34
    Width = 217
    Height = 21
    DataField = 'Name'
    DataSource = dsCCP
    TabOrder = 1
  end
  object pBase: TPanel
    Left = 0
    Top = 0
    Width = 404
    Height = 30
    Align = alTop
    Caption = ' '
    TabOrder = 2
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 111
      Height = 13
      Caption = 'Родительский раздел'
    end
    object BitBtn1: TBitBtn
      Left = 343
      Top = 5
      Width = 23
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object edPName: TEdit
      Left = 128
      Top = 4
      Width = 217
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
  end
  object DBEdit2: TDBEdit
    Left = 128
    Top = 64
    Width = 217
    Height = 21
    DataField = 'ExtStr'
    DataSource = dsCCP
    TabOrder = 3
  end
  object P_FF: TPanel
    Left = 0
    Top = 142
    Width = 404
    Height = 55
    Align = alBottom
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 4
    object Label9: TLabel
      Left = 8
      Top = 7
      Width = 70
      Height = 13
      Caption = 'Форм. распр.'
      FocusControl = lcFormalDistrib
    end
    object Label10: TLabel
      Left = 8
      Top = 32
      Width = 73
      Height = 13
      Caption = 'Функц. распр.'
      FocusControl = lcFuncDistrib
    end
    object lcFormalDistrib: TRxDBLookupCombo
      Left = 129
      Top = 4
      Width = 240
      Height = 21
      DropDownCount = 8
      DropDownWidth = 250
      DataField = 'id_FormalDistrib'
      DataSource = dsCCP
      LookupField = 'id_FormalDistrib'
      LookupDisplay = 'Name'
      LookupSource = dsFormal
      TabOrder = 0
    end
    object lcFuncDistrib: TRxDBLookupCombo
      Left = 129
      Top = 29
      Width = 240
      Height = 21
      DropDownCount = 8
      DropDownWidth = 250
      DataField = 'id_FuncDistrib'
      DataSource = dsCCP
      LookupField = 'id_FuncDistrib'
      LookupDisplay = 'Name'
      LookupSource = dsFunc
      TabOrder = 1
    end
    object cbFormal: TComboBox
      Left = 85
      Top = 5
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        '='
        '<>')
    end
    object cbFunc: TComboBox
      Left = 85
      Top = 29
      Width = 41
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        '='
        '<>')
    end
  end
  object edSrcName: TEdit
    Left = 128
    Top = 92
    Width = 217
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object BitBtn2: TBitBtn
    Left = 343
    Top = 93
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
    OnClick = BitBtn2Click
  end
  object edCA: TEdit
    Left = 128
    Top = 116
    Width = 217
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
  object BitBtn3: TBitBtn
    Left = 343
    Top = 117
    Width = 23
    Height = 21
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = BitBtn3Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 197
    Width = 404
    Height = 23
    Align = alBottom
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 9
    object Label6: TLabel
      Left = 11
      Top = 5
      Width = 26
      Height = 13
      Caption = 'План'
      FocusControl = DBEdit3
    end
    object DBEdit3: TDBEdit
      Left = 130
      Top = 0
      Width = 64
      Height = 21
      DataField = 'APlan'
      DataSource = dsCCP
      TabOrder = 0
    end
  end
  object cdsCCP: TClientDataSet
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
        Name = '@id_Cat'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsCCP'
    RemoteServer = DM.rsCA
    Left = 160
    Top = 32
    object cdsCCPid_Cat: TAutoIncField
      FieldName = 'id_Cat'
      ReadOnly = True
    end
    object cdsCCPid_Rep: TIntegerField
      FieldName = 'id_Rep'
    end
    object cdsCCPName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsCCPPID: TIntegerField
      FieldName = 'PID'
    end
    object cdsCCPF_OperVid: TStringField
      FieldName = 'F_OperVid'
      Size = 255
    end
    object cdsCCPF_id_ContrAgent: TStringField
      FieldName = 'F_id_ContrAgent'
      Size = 255
    end
    object cdsCCPOrdNum: TIntegerField
      FieldName = 'OrdNum'
    end
    object cdsCCPGrpOper: TBooleanField
      FieldName = 'GrpOper'
    end
    object cdsCCPExtStr: TStringField
      FieldName = 'ExtStr'
      Size = 255
    end
    object cdsCCPid_FormalDistrib: TIntegerField
      FieldName = 'id_FormalDistrib'
    end
    object cdsCCPid_FuncDistrib: TIntegerField
      FieldName = 'id_FuncDistrib'
    end
    object cdsCCPid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsCCPisCat: TBooleanField
      FieldName = 'isCat'
    end
    object cdsCCPAPlan: TFloatField
      FieldName = 'APlan'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
  end
  object dsCCP: TDataSource
    DataSet = cdsCCP
    Left = 200
    Top = 32
  end
  object cdsFormal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
      end>
    ProviderName = 'dsFormal'
    RemoteServer = DM.rsCA
    Left = 200
    Top = 80
    object cdsFormalid_FormalDistrib: TAutoIncField
      FieldName = 'id_FormalDistrib'
      ReadOnly = True
    end
    object cdsFormalName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object cdsFunc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
      end>
    ProviderName = 'dsFunc'
    RemoteServer = DM.rsCA
    Left = 200
    Top = 112
    object cdsFuncid_FuncDistrib: TAutoIncField
      FieldName = 'id_FuncDistrib'
      ReadOnly = True
    end
    object cdsFuncName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object dsFunc: TDataSource
    DataSet = cdsFunc
    Left = 236
    Top = 112
  end
  object dsFormal: TDataSource
    DataSet = cdsFormal
    Left = 236
    Top = 80
  end
  object ClientDataSet1: TClientDataSet
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
        Name = '@id_Cat'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsCCP'
    RemoteServer = DM.rsCA
    Left = 80
    Top = 48
    object AutoIncField1: TAutoIncField
      FieldName = 'id_Cat'
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'id_Rep'
    end
    object StringField1: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object IntegerField2: TIntegerField
      FieldName = 'PID'
    end
    object IntegerField3: TIntegerField
      FieldName = 'OrdNum'
    end
    object BooleanField1: TBooleanField
      FieldName = 'GrpOper'
    end
    object StringField4: TStringField
      FieldName = 'ExtStr'
      Size = 255
    end
    object IntegerField4: TIntegerField
      FieldName = 'id_FormalDistrib'
    end
    object IntegerField5: TIntegerField
      FieldName = 'id_FuncDistrib'
    end
    object IntegerField6: TIntegerField
      FieldName = 'id_Acc'
    end
    object BooleanField2: TBooleanField
      FieldName = 'isCat'
    end
    object FloatField1: TFloatField
      FieldName = 'APlan'
    end
    object ClientDataSet1F_OperVid: TStringField
      FieldName = 'F_OperVid'
      Size = 255
    end
    object ClientDataSet1F_id_ContrAgent: TStringField
      FieldName = 'F_id_ContrAgent'
      Size = 255
    end
  end
end
