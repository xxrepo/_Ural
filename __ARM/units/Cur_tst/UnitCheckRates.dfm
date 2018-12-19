object FormCheckRates: TFormCheckRates
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  HelpContext = 38
  Caption = 'Загрузка курсов по данным сайтов'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGridRates: TStringGrid
    Left = 0
    Top = 0
    Width = 688
    Height = 384
    Align = alClient
    FixedCols = 0
    TabOrder = 0
    ColWidths = (
      64
      64
      64
      64
      64)
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 434
    Width = 688
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 384
    Width = 688
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 368
      Top = 0
      Width = 320
      Height = 50
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 32
        Top = 16
        Width = 113
        Height = 25
        Caption = 'Применить'
        TabOrder = 0
        OnClick = BitBtn1Click
        Kind = bkOK
      end
      object BitBtn2: TBitBtn
        Left = 176
        Top = 16
        Width = 97
        Height = 25
        Caption = 'Отмена'
        TabOrder = 1
        Kind = bkCancel
      end
    end
  end
  object QueryRatesInet: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '    CU.Id_URL,  CU.Name,'
      '    CU.URL,             '
      '    CU.UseTable,'
      '    CUT.Id_URLTable,'
      '    CUT.ColName, CUT.ColISO,'
      '    CUT.ColCode,  CUT.ColRate,'
      '    CUT.ColPieces'
      'FROM Crn_URL CU (NOLOCK) '
      'INNER JOIN Crn_URLTable CUT (NOLOCK)  ON CU.Id_URL = CUT.Id_URL'
      ' '
      '')
    Left = 32
  end
  object QueryRates: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '    Crn_Currency.Name,'
      '    Crn_Currency.ISOCode,'
      '    Crn_Currency.NumberCode,'
      '    Crn_Currency.Value,'
      '    Crn_Currency.Rate'
      'FROM Crn_Currency (NOLOCK)'
      '')
  end
  object sp_SetNewRate: TADOStoredProc
    Connection = Form1.ADOConnection1
    ProcedureName = 'CurrSetNewRate;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = Null
      end
      item
        Name = '@ISOCode'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@NumberCode'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Pieces'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Rate'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 64
  end
end
