object fWareProp: TfWareProp
  Left = 0
  Top = 0
  Width = 497
  Height = 303
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 30
    Width = 497
    Height = 80
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = ' '
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object Label2: TLabel
      Left = 5
      Top = 32
      Width = 99
      Height = 13
      Caption = 'Короткое название'
    end
    object Label3: TLabel
      Left = 5
      Top = 56
      Width = 19
      Height = 13
      Caption = 'Код'
    end
    object lbUsePrice: TLabel
      Left = 366
      Top = 57
      Width = 26
      Height = 13
      Caption = 'Цена'
    end
    object edName: TDBEdit
      Left = 120
      Top = 6
      Width = 369
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Name'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 120
      Top = 30
      Width = 369
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ShortName'
      DataSource = DataSource1
      TabOrder = 1
    end
    object edBarCode: TDBEdit
      Left = 120
      Top = 54
      Width = 225
      Height = 21
      DataField = 'BarCode'
      DataSource = DataSource1
      TabOrder = 2
    end
    object edUsePrice: TRxDBCalcEdit
      Left = 400
      Top = 54
      Width = 87
      Height = 21
      DataField = 'Price'
      DataSource = DataSource1
      NumGlyphs = 2
      TabOrder = 3
    end
  end
  object pBase: TPanel
    Left = 0
    Top = 0
    Width = 497
    Height = 30
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Категория'
    end
    object edCatName: TEdit
      Left = 120
      Top = 4
      Width = 285
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      Text = ' '
    end
    object BitBtn1: TBitBtn
      Left = 405
      Top = 4
      Width = 23
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 110
    Width = 497
    Height = 193
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = ' '
    TabOrder = 2
    object Label6: TLabel
      Left = 5
      Top = 8
      Width = 102
      Height = 13
      Caption = 'Единица измерения'
      FocusControl = DBEdit4
    end
    object SpeedButton1: TSpeedButton
      Left = 257
      Top = 6
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton1Click
    end
    object Label4: TLabel
      Left = 270
      Top = 35
      Width = 22
      Height = 13
      Caption = 'ГТД'
      FocusControl = DBEdit1
    end
    object Label7: TLabel
      Left = 5
      Top = 35
      Width = 36
      Height = 13
      Caption = 'Страна'
      FocusControl = DBEdit3
    end
    object Label8: TLabel
      Left = 5
      Top = 58
      Width = 112
      Height = 29
      Caption = 'Код товара/ работ, услуг'
      FocusControl = DBEdit5
      WordWrap = True
    end
    object Label9: TLabel
      Left = 5
      Top = 95
      Width = 107
      Height = 13
      Caption = 'Номер прейскуранта'
      FocusControl = DBEdit6
      WordWrap = True
    end
    object Label10: TLabel
      Left = 5
      Top = 120
      Width = 41
      Height = 13
      Caption = 'Артикул'
      FocusControl = DBEdit7
    end
    object Label11: TLabel
      Left = 5
      Top = 137
      Width = 86
      Height = 26
      Caption = '№ по складской картотеке'
      FocusControl = DBEdit8
      WordWrap = True
    end
    object DBEdit4: TDBEdit
      Left = 120
      Top = 6
      Width = 137
      Height = 21
      DataField = 'MeasureName'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object cbDisabled: TDBCheckBox
      Left = 304
      Top = 10
      Width = 125
      Height = 17
      Caption = 'Заблокировано'
      DataField = 'Disabled'
      DataSource = DataSource1
      TabOrder = 1
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Visible = False
    end
    object DBEdit1: TDBEdit
      Left = 296
      Top = 32
      Width = 130
      Height = 21
      DataField = 'GTD'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 120
      Top = 32
      Width = 137
      Height = 21
      DataField = 'Country'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 120
      Top = 62
      Width = 364
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DocNomCode'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 120
      Top = 92
      Width = 364
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DocPriceCode'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 120
      Top = 116
      Width = 364
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DocArt'
      DataSource = DataSource1
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 120
      Top = 140
      Width = 364
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DocNumber'
      DataSource = DataSource1
      TabOrder = 7
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
    object cdsGoodsPropGTD: TStringField
      FieldName = 'GTD'
      Size = 50
    end
    object cdsGoodsPropCountry: TStringField
      FieldName = 'Country'
      Size = 255
    end
    object cdsGoodsPropDocNomCode: TStringField
      FieldName = 'DocNomCode'
      Size = 50
    end
    object cdsGoodsPropDocPriceCode: TStringField
      FieldName = 'DocPriceCode'
      Size = 50
    end
    object cdsGoodsPropDocArt: TStringField
      FieldName = 'DocArt'
      Size = 50
    end
    object cdsGoodsPropDocNumber: TStringField
      FieldName = 'DocNumber'
      Size = 50
    end
    object cdsGoodsPropPrice: TFloatField
      FieldName = 'Price'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsGoodsProp
    Left = 322
    Top = 28
  end
end
