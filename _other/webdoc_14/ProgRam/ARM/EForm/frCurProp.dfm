object fCurProp: TfCurProp
  Left = 0
  Top = 0
  Width = 432
  Height = 324
  TabOrder = 0
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 50
    Height = 13
    Caption = 'Название'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 99
    Height = 13
    Caption = 'Короткое название'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 272
    Top = 25
    Width = 40
    Height = 13
    Caption = 'Код ISO'
    FocusControl = DBEdit3
    Visible = False
  end
  object Label4: TLabel
    Left = 272
    Top = 48
    Width = 73
    Height = 13
    Caption = 'Цифровой код'
    FocusControl = DBEdit4
    Visible = False
  end
  object Label5: TLabel
    Left = 270
    Top = 72
    Width = 86
    Height = 13
    Caption = 'Единиц к обмену'
    FocusControl = DBEdit5
    Visible = False
  end
  object Label6: TLabel
    Left = 8
    Top = 56
    Width = 24
    Height = 13
    Caption = 'Курс'
  end
  object DBEdit1: TDBEdit
    Left = 112
    Top = 5
    Width = 280
    Height = 21
    Color = clScrollBar
    DataField = 'CurName'
    DataSource = dsCurProp
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 112
    Top = 29
    Width = 129
    Height = 21
    Color = clScrollBar
    DataField = 'CurShortName'
    DataSource = dsCurProp
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 376
    Top = 21
    Width = 35
    Height = 21
    Color = clScrollBar
    DataField = 'ISOCode'
    DataSource = dsCurProp
    ReadOnly = True
    TabOrder = 2
    Visible = False
  end
  object DBEdit4: TDBEdit
    Left = 376
    Top = 45
    Width = 35
    Height = 21
    Color = clScrollBar
    DataField = 'NumberCode'
    DataSource = dsCurProp
    ReadOnly = True
    TabOrder = 3
    Visible = False
  end
  object DBEdit5: TDBEdit
    Left = 376
    Top = 69
    Width = 64
    Height = 21
    Color = clScrollBar
    DataField = 'Value'
    DataSource = dsCurProp
    ReadOnly = True
    TabOrder = 4
    Visible = False
  end
  object DBEdit6: TRxDBCalcEdit
    Left = 111
    Top = 53
    Width = 114
    Height = 21
    DataField = 'Rate'
    DataSource = dsCurProp
    DecimalPlaces = 4
    DisplayFormat = ',0.####'
    NumGlyphs = 2
    TabOrder = 5
  end
  object cdsCurProp: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@Id_Cur'
        ParamType = ptInput
      end>
    ProviderName = 'dsCurProp'
    RemoteServer = DM.rsCA
    Left = 272
    Top = 160
    object cdsCurPropId_Cur: TAutoIncField
      FieldName = 'Id_Cur'
      ReadOnly = True
    end
    object cdsCurPropISOCode: TStringField
      FieldName = 'ISOCode'
      FixedChar = True
      Size = 3
    end
    object cdsCurPropNumberCode: TStringField
      FieldName = 'NumberCode'
      FixedChar = True
      Size = 3
    end
    object cdsCurPropValue: TIntegerField
      FieldName = 'Value'
    end
    object cdsCurPropRate: TBCDField
      FieldName = 'Rate'
      Precision = 19
    end
    object cdsCurPropAvForPay: TBooleanField
      FieldName = 'AvForPay'
    end
    object cdsCurPropLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object cdsCurPropID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object cdsCurPropBase: TBooleanField
      FieldName = 'Base'
    end
    object cdsCurPropCurName: TStringField
      FieldName = 'CurName'
      Size = 30
    end
    object cdsCurPropCurShortName: TStringField
      FieldName = 'CurShortName'
      Size = 10
    end
    object cdsCurPropColNum: TIntegerField
      FieldName = 'ColNum'
    end
    object cdsCurPropOrderNum: TIntegerField
      FieldName = 'OrderNum'
    end
  end
  object dsCurProp: TDataSource
    DataSet = cdsCurProp
    Left = 312
    Top = 160
  end
end
