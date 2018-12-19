object RepRez: TRepRez
  Left = 186
  Top = 107
  Width = 783
  Height = 540
  Caption = 'Резервы товара'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 31
    Align = alTop
    Caption = ' '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Товар'
      FocusControl = DBEdit2
    end
    object Label2: TLabel
      Left = 280
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Склад'
      FocusControl = DBEdit1
    end
    object DBEdit2: TDBEdit
      Left = 48
      Top = 5
      Width = 200
      Height = 21
      Color = clMenu
      DataField = 'Name'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 320
      Top = 5
      Width = 200
      Height = 21
      Color = clMenu
      DataField = 'SrcName'
      ReadOnly = True
      TabOrder = 1
    end
  end
  inline fRepRez1: TfRepRez
    Top = 31
    Width = 775
    Height = 482
    Align = alClient
    TabOrder = 1
    inherited RxDBGrid1: TDBGridEh
      Width = 775
      Height = 412
    end
    inherited ToolBar1: TToolBar
      Width = 775
    end
    inherited ToolBar2: TToolBar
      Width = 775
    end
  end
  object cdsGoodsProp: TClientDataSet
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
      end>
    ProviderName = 'dsGoodsProp'
    RemoteServer = DM.rsCA
    Left = 368
    Top = 32
    object cdsGoodsPropid_Goods: TAutoIncField
      FieldName = 'id_Goods'
      ReadOnly = True
    end
    object cdsGoodsPropid_Ctg_Goods: TIntegerField
      FieldName = 'id_Ctg_Goods'
    end
    object cdsGoodsPropName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsGoodsPropShortName: TStringField
      FieldName = 'ShortName'
      Size = 100
    end
    object cdsGoodsPropBarCode: TStringField
      FieldName = 'BarCode'
    end
    object cdsGoodsPropDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsGoodsPropLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object cdsGoodsPropid_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsGoodsPropMeasureName: TStringField
      FieldName = 'MeasureName'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsGoodsProp
    Left = 408
    Top = 32
  end
end
