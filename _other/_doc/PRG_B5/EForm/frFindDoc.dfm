object fFindDoc: TfFindDoc
  Left = 0
  Top = 0
  Width = 503
  Height = 568
  Constraints.MinHeight = 100
  Constraints.MinWidth = 287
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 503
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = ' '
    TabOrder = 0
    object SpeedButton2: TSpeedButton
      Left = 10
      Top = 8
      Width = 75
      Height = 26
      Caption = 'Найти'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFBA8130
        BA8130BA8130BA8130BA8130BA8130BA8130BA8130BA8130BA8130BA81300000
        9D00009DC18448FF00FFFF00FFBA8130FFFBF4FFFBF4FFFBF4FFFBF4FFFBF4FF
        FBF4FFFBF4FFFBF4FFFBF400009D7699FF0734C000009DFF00FFFF00FFBA8130
        FFFFF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00009D7699FF021D
        D73352D800009DFF00FFFF00FFBA8130FFFFF7FFFFFFFFFFFFFFFFFFAC741CAC
        741CAC741CAC741C7699FF020BF24460E400009DBA8233FF00FFFF00FFBA8130
        FFFEF6FFFFFFFFFFFFAC741CFFF8E5EECE8CE9C376D69A29AC741C4F64E40000
        9DFFFFF7BA8130FF00FFFF00FFBA8130FFFDF4FFFBF7AC741CFFF8E5FEF8DBFF
        FCDFFFFFE8F8EBCBD9A135AC741CFFFBF7FFFEF6BA8130FF00FFFF00FFBA8130
        FFFBF3FFF6EBAC741CFFF8E5FFF8DEFFF4C7FFFCDFFFFFE8EFCF89AC741CFFF6
        EBFFFDF4BA8130FF00FFFF00FFBA8130FFFAF1FFF2E1AC741CFFF8E5FFFFFFFF
        EEB3FFF4C7FFFCDFF5DDA3AC741CFFF2E1FFFBF3BA8130FF00FFFF00FFBA8130
        FFFAF0FFEED8AC741CFFF8E5FFF8E5FFFFFFFFF8DEFEF7DAF6D98FAC741CFFEE
        D8FFFAF1BA8130FF00FFFF00FFBA8130FFF9EFFFEBD0FFEBD0AC741CFFF8E5FF
        F2CBFFF1C8FDE9AFAC741CFFEBD0FFEBD0FFFAF0BA8130FF00FFFF00FFBA8130
        FFFBF4FFE8CAFFE8CAFFE8CAAC741CAC741CAC741CAC741CFFE8CAFFE8CAFFE8
        CAFFF9EFBA8130FF00FFFF00FFBA8130FFFBF4FFE6C6FFE6C6FFE6C6FFE6C6FF
        E6C6FFE6C6FFE6C6FFE6C6FFE6C6FFE6C7FFFBF4BA8130FF00FFFF00FFBA8130
        FFFBF4FFE6C5FFE6C5FFE6C5FFE6C5FFE6C5FFE6C5FFE6C5FFE6C50030CB001C
        C22A2386BA8130FF00FFFF00FFBA8130FFFBF4FFE6C5FFE6C5FFE6C5FFE6C5FF
        E6C5FFE6C5FFE6C5FFE6C50030CB2A2386BA8130FF00FFFF00FFFF00FFBA8130
        FFFBF4FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF9F32A2386BA81
        30FF00FFFF00FFFF00FFFF00FFBA8130C08844BA8130BA8130BA8130BA8130BA
        8130BA8130BA8130BA8130BA8130FF00FFFF00FFFF00FFFF00FF}
      OnClick = SpeedButton2Click
    end
    object SpeedButton1: TSpeedButton
      Left = 98
      Top = 8
      Width = 75
      Height = 26
      Caption = 'Очистить'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object Button2: TButton
      Left = 461
      Top = 8
      Width = 31
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'X'
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 41
    Width = 503
    Height = 398
    Align = alTop
    Caption = 'Документ'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 76
      Height = 13
      Caption = 'Тип документа'
      FocusControl = edDT
    end
    object lbDocDate: TLabel
      Left = 8
      Top = 114
      Width = 50
      Height = 13
      Caption = 'Дата док.'
      FocusControl = deDocDate
    end
    object lbNum: TLabel
      Left = 8
      Top = 90
      Width = 34
      Height = 13
      Caption = 'Номер'
      FocusControl = edNum
    end
    object lbDocComment: TLabel
      Left = 8
      Top = 185
      Width = 50
      Height = 13
      Caption = 'Описание'
      FocusControl = edDocComment
      WordWrap = True
    end
    object lbDocDate2: TLabel
      Left = 178
      Top = 113
      Width = 12
      Height = 13
      Caption = 'по'
      FocusControl = deDocDateTo
    end
    object lbCloseDate: TLabel
      Left = 8
      Top = 161
      Width = 38
      Height = 13
      Caption = 'Закрыт'
      FocusControl = deCloseDate
    end
    object lbCloseDate2: TLabel
      Left = 179
      Top = 160
      Width = 12
      Height = 13
      Caption = 'по'
      FocusControl = deCloseDateTo
    end
    object lbSumm2: TLabel
      Left = 181
      Top = 206
      Width = 37
      Height = 13
      Caption = 'валюта'
      FocusControl = lcCURNAME
    end
    object lbSumm: TLabel
      Left = 8
      Top = 208
      Width = 34
      Height = 13
      Caption = 'Сумма'
      FocusControl = ceSumm
    end
    object Label2: TLabel
      Left = 8
      Top = 287
      Width = 72
      Height = 13
      Caption = 'Дата события'
      FocusControl = deEV_Date
    end
    object Label3: TLabel
      Left = 180
      Top = 286
      Width = 12
      Height = 13
      Caption = 'по'
      FocusControl = deCloseDateTo
    end
    object Label4: TLabel
      Left = 8
      Top = 311
      Width = 70
      Height = 13
      Caption = 'Комментарий'
      FocusControl = edEV_EventComment
      WordWrap = True
    end
    object Label5: TLabel
      Left = 8
      Top = 42
      Width = 77
      Height = 13
      Caption = 'Юрлицо клиент'
      FocusControl = edRep
    end
    object Label6: TLabel
      Left = 8
      Top = 66
      Width = 69
      Height = 13
      Caption = 'Юрлицо опер.'
      FocusControl = edCA
    end
    object Label7: TLabel
      Left = 8
      Top = 264
      Width = 65
      Height = 13
      Caption = 'Тип события'
      FocusControl = edEventType
    end
    object Label8: TLabel
      Left = 8
      Top = 138
      Width = 72
      Height = 13
      Caption = 'Внесен в базу'
      FocusControl = edDateCreate
    end
    object Label9: TLabel
      Left = 178
      Top = 137
      Width = 12
      Height = 13
      Caption = 'по'
      FocusControl = edDateCreate2
    end
    object Bevel1: TBevel
      Left = 8
      Top = 253
      Width = 280
      Height = 2
    end
    object Bevel2: TBevel
      Left = 10
      Top = 352
      Width = 280
      Height = 2
    end
    object Label10: TLabel
      Left = 6
      Top = 231
      Width = 151
      Height = 13
      Caption = 'Дней без движения не менее'
    end
    object edDT: TEdit
      Left = 88
      Top = 14
      Width = 172
      Height = 21
      TabOrder = 0
    end
    object edNum: TEdit
      Left = 88
      Top = 86
      Width = 196
      Height = 21
      TabOrder = 1
    end
    object edDocComment: TEdit
      Left = 88
      Top = 181
      Width = 196
      Height = 21
      TabOrder = 2
    end
    object deDocDate: TDateEdit
      Left = 88
      Top = 110
      Width = 85
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object deDocDateTo: TDateEdit
      Left = 204
      Top = 110
      Width = 80
      Height = 21
      NumGlyphs = 2
      TabOrder = 4
    end
    object Button1: TButton
      Left = 259
      Top = 13
      Width = 25
      Height = 22
      Caption = '...'
      TabOrder = 5
      OnClick = Button1Click
    end
    object deCloseDate: TDateEdit
      Left = 88
      Top = 157
      Width = 85
      Height = 21
      NumGlyphs = 2
      TabOrder = 6
    end
    object deCloseDateTo: TDateEdit
      Left = 204
      Top = 157
      Width = 80
      Height = 21
      NumGlyphs = 2
      TabOrder = 7
    end
    object lcCURNAME: TRxDBLookupCombo
      Left = 230
      Top = 203
      Width = 54
      Height = 21
      DropDownCount = 8
      DataField = 'ID_CUR'
      DisplayEmpty = ' '
      LookupField = 'ID_CUR'
      LookupDisplay = 'CURNAME'
      LookupSource = dsCur
      TabOrder = 8
    end
    object ceSumm: TRxCalcEdit
      Left = 88
      Top = 203
      Width = 86
      Height = 21
      AutoSize = False
      NumGlyphs = 2
      TabOrder = 9
    end
    object deEV_Date: TDateEdit
      Left = 88
      Top = 283
      Width = 85
      Height = 21
      NumGlyphs = 2
      TabOrder = 10
    end
    object deEV_Date2: TDateEdit
      Left = 204
      Top = 283
      Width = 80
      Height = 21
      NumGlyphs = 2
      TabOrder = 11
    end
    object edEV_EventComment: TEdit
      Left = 88
      Top = 307
      Width = 196
      Height = 21
      TabOrder = 12
    end
    object cbAllEvent: TAdvOfficeCheckBox
      Left = 88
      Top = 334
      Width = 201
      Height = 17
      Caption = 'Искать во всех событиях'
      TabOrder = 13
    end
    object edRep: TEdit
      Left = 88
      Top = 38
      Width = 172
      Height = 21
      TabOrder = 14
    end
    object Button3: TButton
      Left = 259
      Top = 37
      Width = 25
      Height = 22
      Caption = '...'
      TabOrder = 15
      OnClick = Button3Click
    end
    object edCA: TEdit
      Left = 88
      Top = 62
      Width = 172
      Height = 21
      TabOrder = 16
    end
    object Button4: TButton
      Left = 259
      Top = 61
      Width = 25
      Height = 22
      Caption = '...'
      TabOrder = 17
      OnClick = Button4Click
    end
    object edEventType: TEdit
      Left = 88
      Top = 260
      Width = 172
      Height = 21
      TabOrder = 18
    end
    object Button5: TButton
      Left = 259
      Top = 259
      Width = 25
      Height = 22
      Caption = '...'
      TabOrder = 19
      OnClick = Button5Click
    end
    object edDateCreate: TDateEdit
      Left = 88
      Top = 134
      Width = 85
      Height = 21
      NumGlyphs = 2
      TabOrder = 20
    end
    object edDateCreate2: TDateEdit
      Left = 204
      Top = 134
      Width = 80
      Height = 21
      NumGlyphs = 2
      TabOrder = 21
    end
    object cbAllW: TAdvOfficeCheckBox
      Left = 88
      Top = 358
      Width = 201
      Height = 17
      Caption = 'Все открытые'
      TabOrder = 22
    end
    object cbAllClosed: TAdvOfficeCheckBox
      Left = 88
      Top = 378
      Width = 201
      Height = 17
      Caption = 'Все закрытые'
      TabOrder = 23
    end
    object RxSpinEdit1: TRxSpinEdit
      Left = 230
      Top = 228
      Width = 54
      Height = 21
      TabOrder = 24
    end
  end
  object ActionList1: TActionList
    Left = 96
    Top = 89
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = SpeedButton2Click
    end
  end
  object qDocList: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_DocType'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'id_DocType2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'id_CA'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'id_CA2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * FROM VW_DOC D ')
    Left = 288
    Top = 24
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qDocList
    Constraints = True
    Left = 312
    Top = 64
  end
  object cdsDocList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_DocType'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_DocType2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_CA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_CA2'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProvider1'
    Left = 336
    Top = 112
    object cdsDocListID_DOCBASE: TAutoIncField
      FieldName = 'ID_DOCBASE'
      ReadOnly = True
    end
    object cdsDocListNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object cdsDocListID_DOCTYPE: TIntegerField
      FieldName = 'ID_DOCTYPE'
    end
    object cdsDocListNUM: TStringField
      FieldName = 'NUM'
    end
    object cdsDocListDATECREATE: TDateTimeField
      FieldName = 'DATECREATE'
      DisplayFormat = 'yyyy-mm-dd hh:nn'
    end
    object cdsDocListDOCDATE: TDateTimeField
      FieldName = 'DOCDATE'
      DisplayFormat = 'yyyy-mm-dd hh:nn'
    end
    object cdsDocListID_CA: TIntegerField
      FieldName = 'ID_CA'
    end
    object cdsDocListid_REP: TIntegerField
      FieldName = 'id_REP'
    end
    object cdsDocListDELETED: TIntegerField
      FieldName = 'DELETED'
    end
    object cdsDocListSUMM: TFloatField
      FieldName = 'SUMM'
    end
    object cdsDocListID_CUR: TIntegerField
      FieldName = 'ID_CUR'
    end
    object cdsDocListCOL1: TStringField
      FieldName = 'COL1'
      Size = 255
    end
    object cdsDocListCOL2: TStringField
      FieldName = 'COL2'
      Size = 255
    end
    object cdsDocListCOL3: TStringField
      FieldName = 'COL3'
      Size = 255
    end
    object cdsDocListCOL4: TStringField
      FieldName = 'COL4'
      Size = 255
    end
    object cdsDocListCOL5: TStringField
      FieldName = 'COL5'
      Size = 255
    end
    object cdsDocListCOL6: TStringField
      FieldName = 'COL6'
      Size = 255
    end
    object cdsDocListCOL7: TStringField
      FieldName = 'COL7'
      Size = 255
    end
    object cdsDocListCOL8: TStringField
      FieldName = 'COL8'
      Size = 255
    end
    object cdsDocListCOL9: TStringField
      FieldName = 'COL9'
      Size = 255
    end
    object cdsDocListCOL10: TStringField
      FieldName = 'COL10'
      Size = 255
    end
    object cdsDocListEV_Date: TDateTimeField
      FieldName = 'EV_Date'
      DisplayFormat = 'yyyy-mm-dd hh:nn'
    end
    object cdsDocListEV_EventComment: TStringField
      FieldName = 'EV_EventComment'
      Size = 1000
    end
    object cdsDocListDateClosed: TDateTimeField
      FieldName = 'DateClosed'
      DisplayFormat = 'yyyy-mm-dd hh:nn'
    end
    object cdsDocListAmount: TIntegerField
      FieldName = 'Amount'
    end
    object cdsDocListHasFormPrint: TBooleanField
      FieldName = 'HasFormPrint'
    end
    object cdsDocListHasFormEl: TBooleanField
      FieldName = 'HasFormEl'
    end
    object cdsDocListRedDate: TDateTimeField
      FieldName = 'RedDate'
    end
    object cdsDocListid_EventType: TIntegerField
      FieldName = 'id_EventType'
    end
    object cdsDocListDTName: TStringField
      FieldName = 'DTName'
      Size = 255
    end
    object cdsDocListOrgName: TStringField
      FieldName = 'OrgName'
      Size = 255
    end
    object cdsDocListID_CAParent: TAutoIncField
      FieldName = 'ID_CAParent'
      ReadOnly = True
    end
    object cdsDocListOrgNameParent: TStringField
      FieldName = 'OrgNameParent'
      Size = 255
    end
    object cdsDocListRepName: TStringField
      FieldName = 'RepName'
      Size = 255
    end
    object cdsDocListID_RepParent: TAutoIncField
      FieldName = 'ID_RepParent'
      ReadOnly = True
    end
    object cdsDocListRepNameParent: TStringField
      FieldName = 'RepNameParent'
      Size = 255
    end
    object cdsDocListCURNAME: TStringField
      FieldName = 'CURNAME'
    end
    object cdsDocListEventTypeName: TStringField
      FieldName = 'EventTypeName'
      Size = 255
    end
    object cdsDocListXDay: TIntegerField
      FieldName = 'XDay'
      ReadOnly = True
    end
    object cdsDocListDOCCOMMENT2: TStringField
      FieldName = 'DOCCOMMENT2'
      Size = 8000
    end
  end
  object qCur: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dw_Cur')
    Left = 152
    Top = 128
  end
  object dsCur: TDataSource
    DataSet = qCur
    Left = 192
    Top = 128
  end
  object qColProp: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_DocType'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from DW_ColProp'
      'where id_DocType = :id_DocType'
      'ORDER BY OrderID'
      ' ')
    Left = 192
    Top = 72
  end
end
