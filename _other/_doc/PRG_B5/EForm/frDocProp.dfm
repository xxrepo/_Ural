object fDocProp: TfDocProp
  Left = 0
  Top = 0
  Width = 775
  Height = 528
  Constraints.MinHeight = 100
  Constraints.MinWidth = 350
  TabOrder = 0
  object lbDTNAME: TLabel
    Left = 8
    Top = 7
    Width = 19
    Height = 13
    Caption = 'Тип'
    FocusControl = DBEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbDOCDATE: TLabel
    Left = 281
    Top = 225
    Width = 26
    Height = 13
    Caption = 'Дата'
    FocusControl = DBDateEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbNUM: TLabel
    Left = 8
    Top = 226
    Width = 34
    Height = 13
    Caption = 'Номер'
    FocusControl = DBEdit3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 8
    Top = 176
    Width = 83
    Height = 13
    Caption = 'Юрлицо клиента'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbDOCCOMMENT: TLabel
    Left = 8
    Top = 31
    Width = 50
    Height = 13
    Caption = 'Описание'
  end
  object lbSUMM: TLabel
    Left = 8
    Top = 273
    Width = 34
    Height = 13
    Caption = 'Сумма'
    FocusControl = ceSUMM
  end
  object lbCURNAME: TLabel
    Left = 255
    Top = 273
    Width = 37
    Height = 13
    Caption = 'валюта'
    FocusControl = lcCURNAME
  end
  object Label1: TLabel
    Left = 8
    Top = 200
    Width = 95
    Height = 13
    Caption = 'Юрлицо оператора'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 354
    Width = 75
    Height = 13
    Caption = 'Посл. событие'
    FocusControl = DBEdit5
  end
  object Label4: TLabel
    Left = 8
    Top = 297
    Width = 58
    Height = 13
    Caption = 'Кол-во экз.'
    FocusControl = ceSUMM
  end
  object Label5: TLabel
    Left = 6
    Top = 377
    Width = 102
    Height = 13
    Caption = 'Дата посл. события'
    FocusControl = DBDateEdit2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 250
    Width = 81
    Height = 13
    Caption = 'Дата получения'
    FocusControl = edDATECREATE
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 330
    Width = 65
    Height = 13
    Caption = 'Вид события'
    FocusControl = DBEdit6
  end
  object Bevel1: TBevel
    Left = 6
    Top = 317
    Width = 681
    Height = 2
  end
  object DBEdit1: TDBEdit
    Left = 112
    Top = 3
    Width = 554
    Height = 21
    DataField = 'DTNAME'
    DataSource = dsDocProp
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 112
    Top = 222
    Width = 122
    Height = 21
    DataField = 'NUM'
    DataSource = dsDocProp
    TabOrder = 1
  end
  object DBDateEdit1: TDBDateEdit
    Left = 328
    Top = 221
    Width = 121
    Height = 21
    DataField = 'DOCDATE'
    DataSource = dsDocProp
    NumGlyphs = 2
    TabOrder = 2
  end
  object Button1: TButton
    Left = 664
    Top = 2
    Width = 25
    Height = 22
    Caption = '...'
    TabOrder = 3
    OnClick = Button1Click
  end
  object ceSUMM: TRxDBCalcEdit
    Left = 112
    Top = 270
    Width = 121
    Height = 21
    DataField = 'SUMM'
    DataSource = dsDocProp
    NumGlyphs = 2
    TabOrder = 4
    OnKeyDown = ceSUMMKeyDown
    OnKeyPress = ceSUMMKeyPress
  end
  object lcCURNAME: TRxDBLookupCombo
    Left = 305
    Top = 270
    Width = 92
    Height = 21
    DropDownCount = 8
    DataField = 'ID_CUR'
    DataSource = dsDocProp
    LookupField = 'ID_CUR'
    LookupDisplay = 'CURNAME'
    LookupSource = dsCur
    TabOrder = 5
  end
  object DBEdit2: TDBEdit
    Left = 112
    Top = 171
    Width = 554
    Height = 21
    DataField = 'RepName'
    DataSource = dsDocProp
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit4: TDBEdit
    Left = 112
    Top = 195
    Width = 554
    Height = 21
    DataField = 'OrgName'
    DataSource = dsDocProp
    ReadOnly = True
    TabOrder = 7
  end
  object DBEdit5: TDBEdit
    Left = 118
    Top = 350
    Width = 570
    Height = 21
    DataField = 'EV_EventComment'
    DataSource = dsDocProp
    ReadOnly = True
    TabOrder = 8
  end
  object RxDBCalcEdit1: TRxDBCalcEdit
    Left = 112
    Top = 294
    Width = 121
    Height = 21
    DataField = 'Amount'
    DataSource = dsDocProp
    NumGlyphs = 2
    TabOrder = 9
    OnKeyDown = ceSUMMKeyDown
  end
  object DBDateEdit2: TDBDateEdit
    Left = 117
    Top = 373
    Width = 121
    Height = 21
    DataField = 'EV_Date'
    DataSource = dsDocProp
    ReadOnly = True
    NumGlyphs = 2
    TabOrder = 10
  end
  object edDATECREATE: TDBDateEdit
    Left = 112
    Top = 246
    Width = 121
    Height = 21
    DataField = 'DATECREATE'
    DataSource = dsDocProp
    ReadOnly = True
    NumGlyphs = 2
    TabOrder = 11
  end
  object DBCheckBox1: TDBCheckBox
    Left = 257
    Top = 296
    Width = 153
    Height = 17
    Caption = 'Есть печатная форма'
    DataField = 'HasFormPrint'
    DataSource = dsDocProp
    TabOrder = 12
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 409
    Top = 296
    Width = 153
    Height = 17
    Caption = 'Есть электронная форма'
    DataField = 'HasFormEl'
    DataSource = dsDocProp
    TabOrder = 13
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object Button2: TButton
    Left = 664
    Top = 170
    Width = 25
    Height = 22
    Caption = '...'
    TabOrder = 14
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 664
    Top = 194
    Width = 25
    Height = 22
    Caption = '...'
    TabOrder = 15
    OnClick = Button3Click
  end
  object DBMemo1: TDBMemo
    Left = 112
    Top = 32
    Width = 577
    Height = 129
    DataField = 'DOCCOMMENT2'
    DataSource = dsDocProp
    ScrollBars = ssBoth
    TabOrder = 16
  end
  object DBEdit6: TDBEdit
    Left = 118
    Top = 326
    Width = 570
    Height = 21
    DataField = 'EventTypeName'
    DataSource = dsDocProp
    ReadOnly = True
    TabOrder = 17
  end
  object qDocProp2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_DocBase'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select D.*'
      'FROM VW_DOC D WHERE D.id_DocBase = :id_DocBase'
      ''
      ' ')
    Left = 64
    Top = 136
    object qDocProp2ID_DOCBASE: TAutoIncField
      FieldName = 'ID_DOCBASE'
      ReadOnly = True
    end
    object qDocProp2NAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object qDocProp2ID_DOCTYPE: TIntegerField
      FieldName = 'ID_DOCTYPE'
    end
    object qDocProp2NUM: TStringField
      FieldName = 'NUM'
    end
    object qDocProp2DATECREATE: TDateTimeField
      FieldName = 'DATECREATE'
    end
    object qDocProp2DOCDATE: TDateTimeField
      FieldName = 'DOCDATE'
    end
    object qDocProp2ID_CA: TIntegerField
      FieldName = 'ID_CA'
    end
    object qDocProp2id_REP: TIntegerField
      FieldName = 'id_REP'
    end
    object qDocProp2DOCCOMMENT2: TStringField
      FieldName = 'DOCCOMMENT2'
      Size = 8000
    end
    object qDocProp2DELETED: TIntegerField
      FieldName = 'DELETED'
    end
    object qDocProp2SUMM: TFloatField
      FieldName = 'SUMM'
    end
    object qDocProp2ID_CUR: TIntegerField
      FieldName = 'ID_CUR'
    end
    object qDocProp2COL1: TStringField
      FieldName = 'COL1'
      Size = 255
    end
    object qDocProp2COL2: TStringField
      FieldName = 'COL2'
      Size = 255
    end
    object qDocProp2COL3: TStringField
      FieldName = 'COL3'
      Size = 255
    end
    object qDocProp2COL4: TStringField
      FieldName = 'COL4'
      Size = 255
    end
    object qDocProp2COL5: TStringField
      FieldName = 'COL5'
      Size = 255
    end
    object qDocProp2COL6: TStringField
      FieldName = 'COL6'
      Size = 255
    end
    object qDocProp2COL7: TStringField
      FieldName = 'COL7'
      Size = 255
    end
    object qDocProp2COL8: TStringField
      FieldName = 'COL8'
      Size = 255
    end
    object qDocProp2COL9: TStringField
      FieldName = 'COL9'
      Size = 255
    end
    object qDocProp2COL10: TStringField
      FieldName = 'COL10'
      Size = 255
    end
    object qDocProp2EV_Date: TDateTimeField
      FieldName = 'EV_Date'
    end
    object qDocProp2EV_EventComment: TStringField
      FieldName = 'EV_EventComment'
      Size = 1000
    end
    object qDocProp2DateClosed: TDateTimeField
      FieldName = 'DateClosed'
    end
    object qDocProp2Amount: TIntegerField
      FieldName = 'Amount'
    end
    object qDocProp2HasFormPrint: TBooleanField
      FieldName = 'HasFormPrint'
    end
    object qDocProp2HasFormEl: TBooleanField
      FieldName = 'HasFormEl'
    end
    object qDocProp2RedDate: TDateTimeField
      FieldName = 'RedDate'
    end
    object qDocProp2id_EventType: TIntegerField
      FieldName = 'id_EventType'
    end
    object qDocProp2id_BSN: TIntegerField
      FieldName = 'id_BSN'
    end
    object qDocProp2DTName: TStringField
      FieldName = 'DTName'
      Size = 255
    end
    object qDocProp2OrgName: TStringField
      FieldName = 'OrgName'
      Size = 255
    end
    object qDocProp2ID_CAParent: TAutoIncField
      FieldName = 'ID_CAParent'
      ReadOnly = True
    end
    object qDocProp2OrgNameParent: TStringField
      FieldName = 'OrgNameParent'
      Size = 255
    end
    object qDocProp2RepName: TStringField
      FieldName = 'RepName'
      Size = 255
    end
    object qDocProp2ID_RepParent: TAutoIncField
      FieldName = 'ID_RepParent'
      ReadOnly = True
    end
    object qDocProp2RepNameParent: TStringField
      FieldName = 'RepNameParent'
      Size = 255
    end
    object qDocProp2CURNAME: TStringField
      FieldName = 'CURNAME'
    end
    object qDocProp2EventTypeName: TStringField
      FieldName = 'EventTypeName'
      Size = 255
    end
    object qDocProp2XDay: TIntegerField
      FieldName = 'XDay'
      ReadOnly = True
    end
  end
  object dsDocProp: TDataSource
    DataSet = cdsDocProp
    Left = 80
    Top = 64
  end
  object cdsDocProp: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_DocBase'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProvider1'
    Left = 48
    Top = 48
    object cdsDocPropID_DOCBASE: TAutoIncField
      FieldName = 'ID_DOCBASE'
      ReadOnly = True
    end
    object cdsDocPropNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object cdsDocPropID_DOCTYPE: TIntegerField
      FieldName = 'ID_DOCTYPE'
    end
    object cdsDocPropNUM: TStringField
      FieldName = 'NUM'
    end
    object cdsDocPropDATECREATE: TDateTimeField
      FieldName = 'DATECREATE'
    end
    object cdsDocPropDOCDATE: TDateTimeField
      FieldName = 'DOCDATE'
    end
    object cdsDocPropID_CA: TIntegerField
      FieldName = 'ID_CA'
    end
    object cdsDocPropid_REP: TIntegerField
      FieldName = 'id_REP'
    end
    object cdsDocPropDOCCOMMENT2: TStringField
      FieldName = 'DOCCOMMENT2'
      Size = 8000
    end
    object cdsDocPropDELETED: TIntegerField
      FieldName = 'DELETED'
    end
    object cdsDocPropSUMM: TFloatField
      FieldName = 'SUMM'
    end
    object cdsDocPropID_CUR: TIntegerField
      FieldName = 'ID_CUR'
    end
    object cdsDocPropCOL1: TStringField
      FieldName = 'COL1'
      Size = 255
    end
    object cdsDocPropCOL2: TStringField
      FieldName = 'COL2'
      Size = 255
    end
    object cdsDocPropCOL3: TStringField
      FieldName = 'COL3'
      Size = 255
    end
    object cdsDocPropCOL4: TStringField
      FieldName = 'COL4'
      Size = 255
    end
    object cdsDocPropCOL5: TStringField
      FieldName = 'COL5'
      Size = 255
    end
    object cdsDocPropCOL6: TStringField
      FieldName = 'COL6'
      Size = 255
    end
    object cdsDocPropCOL7: TStringField
      FieldName = 'COL7'
      Size = 255
    end
    object cdsDocPropCOL8: TStringField
      FieldName = 'COL8'
      Size = 255
    end
    object cdsDocPropCOL9: TStringField
      FieldName = 'COL9'
      Size = 255
    end
    object cdsDocPropCOL10: TStringField
      FieldName = 'COL10'
      Size = 255
    end
    object cdsDocPropEV_Date: TDateTimeField
      FieldName = 'EV_Date'
    end
    object cdsDocPropEV_EventComment: TStringField
      FieldName = 'EV_EventComment'
      Size = 1000
    end
    object cdsDocPropDateClosed: TDateTimeField
      FieldName = 'DateClosed'
    end
    object cdsDocPropAmount: TIntegerField
      FieldName = 'Amount'
    end
    object cdsDocPropHasFormPrint: TBooleanField
      FieldName = 'HasFormPrint'
    end
    object cdsDocPropHasFormEl: TBooleanField
      FieldName = 'HasFormEl'
    end
    object cdsDocPropRedDate: TDateTimeField
      FieldName = 'RedDate'
    end
    object cdsDocPropid_EventType: TIntegerField
      FieldName = 'id_EventType'
    end
    object cdsDocPropid_BSN: TIntegerField
      FieldName = 'id_BSN'
    end
    object cdsDocPropDTName: TStringField
      FieldName = 'DTName'
      Size = 255
    end
    object cdsDocPropOrgName: TStringField
      FieldName = 'OrgName'
      Size = 255
    end
    object cdsDocPropID_CAParent: TAutoIncField
      FieldName = 'ID_CAParent'
      ReadOnly = True
    end
    object cdsDocPropOrgNameParent: TStringField
      FieldName = 'OrgNameParent'
      Size = 255
    end
    object cdsDocPropRepName: TStringField
      FieldName = 'RepName'
      Size = 255
    end
    object cdsDocPropID_RepParent: TAutoIncField
      FieldName = 'ID_RepParent'
      ReadOnly = True
    end
    object cdsDocPropRepNameParent: TStringField
      FieldName = 'RepNameParent'
      Size = 255
    end
    object cdsDocPropCURNAME: TStringField
      FieldName = 'CURNAME'
    end
    object cdsDocPropEventTypeName: TStringField
      FieldName = 'EventTypeName'
      Size = 255
    end
    object cdsDocPropXDay: TIntegerField
      FieldName = 'XDay'
      ReadOnly = True
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qDocProp2
    Constraints = True
    Left = 24
    Top = 48
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'id_DocType'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'id_CA'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Summ'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'Num'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'DocDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'Amount'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'id_REP'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DateClosed'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'id_Cur'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DocComment2'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 8000
        Value = Null
      end
      item
        Name = 'HasFormPrint'
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'HasFormEl'
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'id_BSN'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO DW_DocBase'
      '   (id_DocType, id_CA, Summ, Num, DocDate, Amount, id_REP,'
      'DateClosed, '
      'id_Cur, DocComment2, HasFormPrint, HasFormEl, id_BSN)'
      'VALUES'
      '(:id_DocType, :id_CA, :Summ, :Num, :DocDate, :Amount, :id_REP,'
      ':DateClosed,'
      ''
      ':id_Cur, :DocComment2, :HasFormPrint, :HasFormEl, :id_BSN)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 144
    Top = 24
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'id_DocType'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'id_CA'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'Num'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'DocDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'Amount'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DateClosed'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'DocComment2'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 8000
        Value = Null
      end
      item
        Name = 'id_REP'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Summ'
        Attributes = [paSigned, paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'id_Cur'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'HasFormPrint'
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'HasFormEl'
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'id_DocBase'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'update DW_DocBase'
      'set'
      '  id_DocType = :id_DocType,'
      '  id_CA = :id_CA,'
      '  Name = :Name,'
      '  Num = :Num,'
      '  DocDate = :DocDate,'
      '  Amount = :Amount,'
      '  DateClosed = :DateClosed,'
      
        '  DocComment2 = :DocComment2, id_REP = :id_REP, Summ = :Summ, id' +
        '_Cur = :id_Cur , HasFormPrint = :HasFormPrint, HasFormEl = :HasF' +
        'ormEl'
      'where id_DocBase = :id_DocBase'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 192
    Top = 24
  end
  object dsCur: TDataSource
    DataSet = qCur
    Left = 288
    Top = 128
  end
  object qCur: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dw_Cur where deleted=0  order by OrderID')
    Left = 248
    Top = 128
  end
end
