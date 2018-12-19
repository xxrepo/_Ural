object SelectMes: TSelectMes
  Left = 181
  Top = 106
  BorderStyle = bsDialog
  Caption = 'Выберите значение'
  ClientHeight = 107
  ClientWidth = 565
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 66
    Width = 565
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 479
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 388
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 565
    Height = 66
    ActivePage = tsFormal
    Align = alClient
    TabOrder = 1
    object tsCur: TTabSheet
      Caption = 'Выбор валюты'
      inline fCurSelector: TfCurSelector
        Width = 557
        Height = 38
        Align = alClient
        inherited Label1: TLabel
          Left = 2
        end
        inherited cbCur: TComboBox
          Left = 50
          Width = 486
        end
      end
    end
    object tsFormal: TTabSheet
      Caption = 'Выбор формального распределения'
      ImageIndex = 1
      object Label8: TLabel
        Left = 3
        Top = 11
        Width = 103
        Height = 13
        Caption = 'Формальное распр.'
        FocusControl = lcFormalDistrib
      end
      object lcFormalDistrib: TRxDBLookupCombo
        Left = 116
        Top = 9
        Width = 431
        Height = 22
        DropDownCount = 8
        DataField = 'id_FormalDistrib'
        Anchors = [akLeft, akTop, akRight]
        LookupField = 'id_FormalDistrib'
        LookupDisplay = 'Name'
        LookupSource = dsFormal
        TabOrder = 0
      end
    end
    object tsFunc: TTabSheet
      Caption = 'Выбор функционального распределения'
      ImageIndex = 2
      object Label10: TLabel
        Left = 3
        Top = 10
        Width = 124
        Height = 13
        Caption = 'Функциональное распр.'
        FocusControl = lcFuncDistrib
      end
      object lcFuncDistrib: TRxDBLookupCombo
        Left = 132
        Top = 8
        Width = 410
        Height = 21
        DropDownCount = 8
        DataField = 'id_FuncDistrib'
        Anchors = [akLeft, akTop, akRight]
        LookupField = 'id_FuncDistrib'
        LookupDisplay = 'Name'
        LookupSource = dsFunc
        TabOrder = 0
      end
    end
    object tsMes: TTabSheet
      Caption = 'Выбор единиц измерения'
      ImageIndex = 3
      object Label11: TLabel
        Left = 5
        Top = 7
        Width = 75
        Height = 13
        Caption = 'Ед. измерения'
      end
      object lcbWMes: TRxDBLookupCombo
        Left = 87
        Top = 4
        Width = 462
        Height = 20
        DropDownCount = 8
        DataField = 'id_Measure'
        Anchors = [akLeft, akTop, akRight]
        LookupField = 'id_Measure'
        LookupDisplay = 'ShortName'
        LookupSource = dsWMes
        TabOrder = 0
      end
    end
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
    Left = 144
    Top = 16
    object cdsFormalid_FormalDistrib: TAutoIncField
      FieldName = 'id_FormalDistrib'
      ReadOnly = True
    end
    object cdsFormalName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object dsFormal: TDataSource
    DataSet = cdsFormal
    Left = 180
    Top = 16
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
    Left = 144
    Top = 48
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
    Left = 180
    Top = 48
  end
  object cdsWMes: TClientDataSet
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
        Name = '@id_Goods'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_Raw'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_ExtRaw'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsWMes'
    RemoteServer = DM.rsCA
    Left = 240
    Top = 40
    object cdsWMesid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsWMesName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object cdsWMesShortName: TStringField
      FieldName = 'ShortName'
      Size = 10
    end
    object cdsWMesid_BaseMeasure: TIntegerField
      FieldName = 'id_BaseMeasure'
    end
    object cdsWMesKoef: TFloatField
      FieldName = 'Koef'
    end
    object cdsWMesDisabled: TBooleanField
      FieldName = 'Disabled'
    end
  end
  object dsWMes: TDataSource
    DataSet = cdsWMes
    Left = 268
    Top = 37
  end
end
