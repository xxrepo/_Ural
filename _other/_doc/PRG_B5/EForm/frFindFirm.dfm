object fFindFirm: TfFindFirm
  Left = 0
  Top = 0
  Width = 479
  Height = 711
  Constraints.MinHeight = 100
  Constraints.MinWidth = 287
  TabOrder = 0
  object GroupBox1: TGroupBox
    Left = 0
    Top = 38
    Width = 479
    Height = 119
    Align = alTop
    Caption = 'Organization'
    TabOrder = 0
    object Label8: TLabel
      Left = 8
      Top = 20
      Width = 28
      Height = 13
      Caption = 'Name'
    end
    object Label11: TLabel
      Left = 8
      Top = 36
      Width = 42
      Height = 26
      Caption = 'Register office'
      FocusControl = edAddr
      WordWrap = True
    end
    object Label12: TLabel
      Left = 8
      Top = 70
      Width = 37
      Height = 13
      Caption = 'Director'
      FocusControl = edDirector
    end
    object Label13: TLabel
      Left = 224
      Top = 70
      Width = 54
      Height = 13
      Caption = 'Secretarian'
      FocusControl = edBuh
    end
    object Label16: TLabel
      Left = 8
      Top = 93
      Width = 44
      Height = 13
      Caption = 'Comment'
      FocusControl = edComments
    end
    object Label14: TLabel
      Left = 224
      Top = 93
      Width = 40
      Height = 13
      Caption = 'Originals'
      FocusControl = edOriginals
    end
    object Label4: TLabel
      Left = 224
      Top = 18
      Width = 26
      Height = 13
      Caption = 'Index'
    end
    object edName: TEdit
      Left = 65
      Top = 15
      Width = 150
      Height = 21
      TabOrder = 0
    end
    object edAddr: TEdit
      Left = 65
      Top = 40
      Width = 366
      Height = 21
      TabOrder = 2
    end
    object edDirector: TEdit
      Left = 65
      Top = 66
      Width = 150
      Height = 21
      TabOrder = 3
    end
    object edBuh: TEdit
      Left = 281
      Top = 66
      Width = 150
      Height = 21
      TabOrder = 4
    end
    object edComments: TEdit
      Left = 65
      Top = 89
      Width = 150
      Height = 21
      TabOrder = 5
    end
    object edOriginals: TEdit
      Left = 281
      Top = 89
      Width = 150
      Height = 21
      TabOrder = 6
    end
    object edAIndex: TEdit
      Left = 281
      Top = 13
      Width = 72
      Height = 21
      MaxLength = 6
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 479
    Height = 38
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = ' '
    TabOrder = 1
    object SpeedButton2: TSpeedButton
      Left = 10
      Top = 6
      Width = 75
      Height = 26
      Caption = 'Find'
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
      Top = 6
      Width = 75
      Height = 26
      Caption = 'Clear'
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
      Left = 437
      Top = 8
      Width = 31
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'X'
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object gbStamp: TGroupBox
    Left = 0
    Top = 554
    Width = 479
    Height = 157
    Align = alClient
    Caption = 'Stamp'
    TabOrder = 2
    object Label15: TLabel
      Left = 8
      Top = 17
      Width = 28
      Height = 13
      Caption = 'Name'
    end
    object Label20: TLabel
      Left = 8
      Top = 62
      Width = 44
      Height = 13
      Caption = 'Comment'
      FocusControl = edStampComment
    end
    object Residence: TLabel
      Left = 8
      Top = 39
      Width = 51
      Height = 13
      Caption = 'Residence'
      FocusControl = edStampPlaced
    end
    object edStampName: TEdit
      Left = 65
      Top = 12
      Width = 160
      Height = 21
      TabOrder = 0
    end
    object edStampComment: TEdit
      Left = 65
      Top = 58
      Width = 160
      Height = 21
      TabOrder = 2
    end
    object edStampPlaced: TEdit
      Left = 65
      Top = 35
      Width = 160
      Height = 21
      TabOrder = 1
    end
  end
  object pDoc: TPanel
    Left = 0
    Top = 157
    Width = 479
    Height = 397
    Align = alTop
    BevelOuter = bvNone
    Caption = '`'
    TabOrder = 3
    object GroupBox2: TGroupBox
      Left = 0
      Top = 0
      Width = 479
      Height = 157
      Align = alClient
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Document'
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 18
        Width = 46
        Height = 13
        Caption = 'Doc. type'
        FocusControl = edDT
      end
      object lbDocDate: TLabel
        Left = 8
        Top = 42
        Width = 46
        Height = 13
        Caption = 'Date from'
        FocusControl = deDocDate
      end
      object lbNum: TLabel
        Left = 254
        Top = 16
        Width = 37
        Height = 13
        Caption = 'Number'
        FocusControl = edNum
      end
      object lbFIO: TLabel
        Left = 8
        Top = 88
        Width = 42
        Height = 13
        Caption = 'One side'
        FocusControl = edFIO
      end
      object lbCAName: TLabel
        Left = 244
        Top = 87
        Width = 48
        Height = 13
        Caption = 'Other side'
        FocusControl = edCAName
      end
      object lbDocComment: TLabel
        Left = 8
        Top = 105
        Width = 43
        Height = 26
        Caption = 'Doc. comment'
        FocusControl = edDocComment
        WordWrap = True
      end
      object lbDocDate2: TLabel
        Left = 183
        Top = 41
        Width = 9
        Height = 13
        Caption = 'to'
        FocusControl = deDocDateTo
      end
      object lbCloseDate: TLabel
        Left = 8
        Top = 65
        Width = 53
        Height = 13
        Caption = 'Period from'
        FocusControl = deCloseDate
      end
      object lbCloseDate2: TLabel
        Left = 184
        Top = 64
        Width = 9
        Height = 13
        Caption = 'to'
        FocusControl = deCloseDateTo
      end
      object lbSumm2: TLabel
        Left = 180
        Top = 134
        Width = 15
        Height = 13
        Caption = 'cur'
        FocusControl = lcCURNAME
      end
      object lbSumm: TLabel
        Left = 8
        Top = 136
        Width = 29
        Height = 13
        Caption = 'Summ'
        FocusControl = ceSumm
      end
      object lbINTEREST: TLabel
        Left = 296
        Top = 134
        Width = 52
        Height = 13
        Caption = 'Interest (%)'
      end
      object edDT: TEdit
        Left = 88
        Top = 14
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object edNum: TEdit
        Left = 294
        Top = 12
        Width = 150
        Height = 21
        TabOrder = 1
      end
      object edFIO: TEdit
        Left = 88
        Top = 84
        Width = 150
        Height = 21
        TabOrder = 2
      end
      object edCAName: TEdit
        Left = 296
        Top = 83
        Width = 150
        Height = 21
        TabOrder = 3
      end
      object edDocComment: TEdit
        Left = 88
        Top = 107
        Width = 150
        Height = 21
        TabOrder = 4
      end
      object deDocDate: TDateEdit
        Left = 88
        Top = 38
        Width = 85
        Height = 21
        NumGlyphs = 2
        TabOrder = 5
      end
      object deDocDateTo: TDateEdit
        Left = 200
        Top = 38
        Width = 85
        Height = 21
        NumGlyphs = 2
        TabOrder = 6
      end
      object Button1: TButton
        Left = 208
        Top = 13
        Width = 25
        Height = 22
        Caption = '...'
        TabOrder = 7
        OnClick = Button1Click
      end
      object deCloseDate: TDateEdit
        Left = 88
        Top = 61
        Width = 85
        Height = 21
        NumGlyphs = 2
        TabOrder = 8
      end
      object deCloseDateTo: TDateEdit
        Left = 200
        Top = 61
        Width = 85
        Height = 21
        NumGlyphs = 2
        TabOrder = 9
      end
      object lcCURNAME: TRxDBLookupCombo
        Left = 200
        Top = 131
        Width = 87
        Height = 21
        DropDownCount = 8
        DataField = 'ID_CUR'
        DisplayEmpty = ' '
        LookupField = 'ID_CUR'
        LookupDisplay = 'CURNAME'
        LookupSource = dsCur
        TabOrder = 10
      end
      object ceSumm: TRxCalcEdit
        Left = 88
        Top = 131
        Width = 86
        Height = 21
        AutoSize = False
        NumGlyphs = 2
        TabOrder = 11
      end
      object ceInterest: TRxCalcEdit
        Left = 352
        Top = 130
        Width = 65
        Height = 21
        AutoSize = False
        NumGlyphs = 2
        TabOrder = 12
      end
    end
    object pCOL1: TPanel
      Left = 0
      Top = 181
      Width = 479
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object lbCOL2: TLabel
        Left = 8
        Top = 7
        Width = 77
        Height = 13
        Caption = 'Additional field 2'
        FocusControl = ceCol2
      end
      object ceCol2: TEdit
        Left = 96
        Top = 2
        Width = 190
        Height = 21
        TabOrder = 0
      end
    end
    object pCOL2: TPanel
      Left = 0
      Top = 157
      Width = 479
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 2
      object lbCOL1: TLabel
        Left = 8
        Top = 7
        Width = 77
        Height = 13
        Caption = 'Additional field 1'
        FocusControl = ceCol1
      end
      object ceCol1: TEdit
        Left = 96
        Top = 2
        Width = 190
        Height = 21
        TabOrder = 0
      end
    end
    object pCOL3: TPanel
      Left = 0
      Top = 205
      Width = 479
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 3
      object lbCOL3: TLabel
        Left = 8
        Top = 7
        Width = 77
        Height = 13
        Caption = 'Additional field 3'
        FocusControl = ceCol3
      end
      object ceCol3: TEdit
        Left = 96
        Top = 2
        Width = 190
        Height = 21
        TabOrder = 0
      end
    end
    object pCOL4: TPanel
      Left = 0
      Top = 229
      Width = 479
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 4
      object lbCOL4: TLabel
        Left = 8
        Top = 7
        Width = 77
        Height = 13
        Caption = 'Additional field 4'
        FocusControl = ceCol4
      end
      object ceCol4: TEdit
        Left = 96
        Top = 2
        Width = 190
        Height = 21
        TabOrder = 0
      end
    end
    object pCOL5: TPanel
      Left = 0
      Top = 253
      Width = 479
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 5
      object lbCOL5: TLabel
        Left = 8
        Top = 7
        Width = 77
        Height = 13
        Caption = 'Additional field 5'
        FocusControl = ceCol5
      end
      object ceCol5: TEdit
        Left = 96
        Top = 2
        Width = 190
        Height = 21
        TabOrder = 0
      end
    end
    object pCOL6: TPanel
      Left = 0
      Top = 277
      Width = 479
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 6
      object lbCOL6: TLabel
        Left = 8
        Top = 7
        Width = 77
        Height = 13
        Caption = 'Additional field 6'
        FocusControl = ceCol6
      end
      object ceCol6: TEdit
        Left = 96
        Top = 2
        Width = 190
        Height = 21
        TabOrder = 0
      end
    end
    object pCOL7: TPanel
      Left = 0
      Top = 301
      Width = 479
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 7
      object lbCOL7: TLabel
        Left = 8
        Top = 7
        Width = 77
        Height = 13
        Caption = 'Additional field 7'
        FocusControl = ceCol7
      end
      object ceCol7: TEdit
        Left = 96
        Top = 2
        Width = 190
        Height = 21
        TabOrder = 0
      end
    end
    object pCOL8: TPanel
      Left = 0
      Top = 325
      Width = 479
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 8
      object lbCOL8: TLabel
        Left = 8
        Top = 7
        Width = 77
        Height = 13
        Caption = 'Additional field 8'
        FocusControl = ceCol8
      end
      object ceCol8: TEdit
        Left = 96
        Top = 2
        Width = 190
        Height = 21
        TabOrder = 0
      end
    end
    object pCOL9: TPanel
      Left = 0
      Top = 349
      Width = 479
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 9
      object lbCOL9: TLabel
        Left = 8
        Top = 7
        Width = 77
        Height = 13
        Caption = 'Additional field 9'
        FocusControl = ceCol9
      end
      object ceCol9: TEdit
        Left = 96
        Top = 2
        Width = 190
        Height = 21
        TabOrder = 0
      end
    end
    object pCOL10: TPanel
      Left = 0
      Top = 373
      Width = 479
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 10
      object lbCOL10: TLabel
        Left = 8
        Top = 6
        Width = 83
        Height = 13
        Caption = 'Additional field 10'
        FocusControl = ceCol10
      end
      object ceCol10: TEdit
        Left = 96
        Top = 1
        Width = 190
        Height = 21
        TabOrder = 0
      end
    end
  end
  object cdsCAF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    OnCalcFields = cdsCAFCalcFields
    Left = 264
    Top = 96
    object cdsCAFICN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'ICN'
    end
    object cdsCAFID_CA: TBCDField
      FieldName = 'ID_CA'
      Precision = 32
      Size = 0
    end
    object cdsCAFPID: TBCDField
      FieldName = 'PID'
      Precision = 32
      Size = 0
    end
    object cdsCAFNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object cdsCAFDELETED: TBCDField
      FieldName = 'DELETED'
      Precision = 32
      Size = 0
    end
    object cdsCAFSTATUSNAME: TWideStringField
      FieldName = 'STATUSNAME'
    end
    object cdsCAFID_ICONS: TBCDField
      FieldName = 'ID_ICONS'
      Precision = 32
      Size = 0
    end
    object cdsCAFCOMMENTS: TWideStringField
      FieldName = 'COMMENTS'
      Size = 2000
    end
    object cdsCAFDATECREATE: TDateTimeField
      FieldName = 'DATECREATE'
    end
    object cdsCAFADDR: TWideStringField
      FieldName = 'ADDR'
      Size = 255
    end
    object cdsCAFJURADR: TWideStringField
      FieldName = 'JURADR'
      Size = 255
    end
    object cdsCAFJURNAME: TWideStringField
      FieldName = 'JURNAME'
      Size = 255
    end
    object cdsCAFDIRECTOR: TWideStringField
      FieldName = 'DIRECTOR'
      Size = 255
    end
    object cdsCAFBUH: TWideStringField
      FieldName = 'BUH'
      Size = 255
    end
    object cdsCAFCAPITAL: TBCDField
      FieldName = 'CAPITAL'
      DisplayFormat = '### ### ##0.##'
      Precision = 18
    end
    object cdsCAFID_CUR: TBCDField
      FieldName = 'ID_CUR'
      Precision = 32
      Size = 0
    end
    object cdsCAFCURNAME: TWideStringField
      FieldName = 'CURNAME'
    end
    object cdsCAFPNAME: TWideStringField
      FieldName = 'PNAME'
      Size = 255
    end
    object cdsCAFAIndex: TWideStringField
      FieldName = 'AIndex'
      Size = 255
    end
    object cdsCAFISGRP: TBCDField
      FieldName = 'ISGRP'
      Precision = 32
      Size = 0
    end
    object cdsCAFFIO_FAM: TWideStringField
      FieldName = 'FIO_FAM'
      Size = 255
    end
    object cdsCAFFIO_NAME: TWideStringField
      FieldName = 'FIO_NAME'
      Size = 255
    end
    object cdsCAFFIO_SUR: TWideStringField
      FieldName = 'FIO_SUR'
      Size = 255
    end
    object cdsCAFFIO_PSPTYPE: TWideStringField
      FieldName = 'FIO_PSPTYPE'
      Size = 255
    end
    object cdsCAFFIO_PSPSER: TWideStringField
      FieldName = 'FIO_PSPSER'
      Size = 255
    end
    object cdsCAFFIO_PSPNUM: TWideStringField
      FieldName = 'FIO_PSPNUM'
      Size = 255
    end
    object cdsCAFDELETEDFROM: TDateTimeField
      FieldName = 'DELETEDFROM'
      DisplayFormat = 'dd-mm-yyyy'
    end
    object cdsCAFpsp: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'psp'
      Size = 255
    end
    object cdsCAFSTARTACTIVITY: TDateTimeField
      FieldName = 'STARTACTIVITY'
    end
    object cdsCAFACOLOR: TBCDField
      FieldName = 'ACOLOR'
      Precision = 32
      Size = 0
    end
    object cdsCAFShortName: TWideStringField
      FieldName = 'ShortName'
      Size = 255
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qCAF
    Constraints = True
    Left = 264
    Top = 56
  end
  object qCAF: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CA.*, CR.CurName, CA2.Name AS PName'
      'FROM DW_Cur CR, DW_CA CA, DW_CA CA2'
      'WHERE CA.Deleted=0 AND CA2.id_CA(+) = CA.PID AND'
      'CR.id_Cur(+) = CA.id_Cur'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
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
    Left = 264
    Top = 24
    object qCAFID_CA: TBCDField
      FieldName = 'ID_CA'
      Precision = 32
      Size = 0
    end
    object qCAFPID: TBCDField
      FieldName = 'PID'
      Precision = 32
      Size = 0
    end
    object qCAFNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object qCAFDELETED: TBCDField
      FieldName = 'DELETED'
      Precision = 32
      Size = 0
    end
    object qCAFSTATUSNAME: TWideStringField
      FieldName = 'STATUSNAME'
    end
    object qCAFID_ICONS: TBCDField
      FieldName = 'ID_ICONS'
      Precision = 32
      Size = 0
    end
    object qCAFCOMMENTS: TWideStringField
      FieldName = 'COMMENTS'
      Size = 2000
    end
    object qCAFDATECREATE: TDateTimeField
      FieldName = 'DATECREATE'
    end
    object qCAFADDR: TWideStringField
      FieldName = 'ADDR'
      Size = 255
    end
    object qCAFJURADR: TWideStringField
      FieldName = 'JURADR'
      Size = 255
    end
    object qCAFJURNAME: TWideStringField
      FieldName = 'JURNAME'
      Size = 255
    end
    object qCAFDIRECTOR: TWideStringField
      FieldName = 'DIRECTOR'
      Size = 255
    end
    object qCAFBUH: TWideStringField
      FieldName = 'BUH'
      Size = 255
    end
    object qCAFCAPITAL: TBCDField
      FieldName = 'CAPITAL'
      Precision = 18
    end
    object qCAFID_CUR: TBCDField
      FieldName = 'ID_CUR'
      Precision = 32
      Size = 0
    end
    object qCAFCURNAME: TWideStringField
      FieldName = 'CURNAME'
    end
    object qCAFPNAME: TWideStringField
      FieldName = 'PNAME'
      Size = 255
    end
    object qCAFAIndex: TWideStringField
      FieldName = 'AIndex'
      Size = 255
    end
    object qCAFISGRP: TBCDField
      FieldName = 'ISGRP'
      Precision = 32
      Size = 0
    end
    object qCAFFIO_FAM: TWideStringField
      FieldName = 'FIO_FAM'
      Size = 255
    end
    object qCAFFIO_NAME: TWideStringField
      FieldName = 'FIO_NAME'
      Size = 255
    end
    object qCAFFIO_SUR: TWideStringField
      FieldName = 'FIO_SUR'
      Size = 255
    end
    object qCAFFIO_PSPTYPE: TWideStringField
      FieldName = 'FIO_PSPTYPE'
      Size = 255
    end
    object qCAFFIO_PSPSER: TWideStringField
      FieldName = 'FIO_PSPSER'
      Size = 255
    end
    object qCAFFIO_PSPNUM: TWideStringField
      FieldName = 'FIO_PSPNUM'
      Size = 255
    end
    object qCAFDELETEDFROM: TDateTimeField
      FieldName = 'DELETEDFROM'
    end
    object qCAFSTARTACTIVITY: TDateTimeField
      FieldName = 'STARTACTIVITY'
    end
    object qCAFACOLOR: TBCDField
      FieldName = 'ACOLOR'
      Precision = 32
      Size = 0
    end
    object qCAFShortName: TWideStringField
      FieldName = 'ShortName'
      Size = 255
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
  object qDTProp4: TADOQuery
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
      'select DT.*, DT2.NAme AS ParentName'
      'from DW_DocType DT ,'
      '      DW_DocType DT2'
      'where DT.id_DocType = :id_DocType'
      'AND DT.PID = DT2.id_DocType(+)'
      ' ')
    Left = 32
    Top = 48
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
    Top = 64
  end
end
