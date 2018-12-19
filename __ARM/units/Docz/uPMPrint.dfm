object PMPrint: TPMPrint
  Left = 54
  Top = 25
  Width = 1032
  Height = 748
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Печать платежа'
  Color = clBtnFace
  Constraints.MinHeight = 245
  Constraints.MinWidth = 400
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
    Top = 680
    Width = 1024
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 304
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 219
      Top = 9
      Width = 78
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 8
      Width = 96
      Height = 25
      Caption = 'Просмотр'
      TabOrder = 2
      Visible = False
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C0000000000000000000000000000000000000000000000001F7C
        1F7C000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F7C
        0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001042
        000000001F7C0000FF7FFF7FFF7FFF7FFF7FFF7F000010421F7C1F7C10420000
        10421F7C1F7C0000FF7FFF7FFF7FFF7FFF7F000010421F7C1F7CFF0310421042
        00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00001F7C1F7C1F7C1F7C10421F7C
        00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00001F7CFF031F7C1F7C10421F7C
        00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7F00001042FF03FF031F7C10421042
        00001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7F000010421F7C1F7C10420000
        1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001F7C
        1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F7C
        1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001F7C
        1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F7C00001F7C1F7C
        1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000001F7C1F7C1F7C
        1F7C1F7C1F7C0000000000000000000000000000000000001F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1024
    Height = 680
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Данные'
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 94
        Height = 13
        Caption = 'Дата составления'
      end
      object Label2: TLabel
        Left = 8
        Top = 32
        Width = 57
        Height = 13
        Caption = 'Принято от'
      end
      object Label8: TLabel
        Left = 8
        Top = 56
        Width = 56
        Height = 13
        Caption = 'Основание'
      end
      object Label12: TLabel
        Left = 8
        Top = 77
        Width = 60
        Height = 13
        Caption = 'Сумма (руб)'
      end
      object Label3: TLabel
        Left = 8
        Top = 101
        Width = 61
        Height = 13
        Caption = 'В том числе'
      end
      object Label4: TLabel
        Left = 8
        Top = 123
        Width = 64
        Height = 13
        Caption = 'Приложения'
      end
      object edAndOther: TEdit
        Left = 108
        Top = 96
        Width = 901
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 100
        TabOrder = 3
        Text = ' '
      end
      object edAppendix: TEdit
        Left = 108
        Top = 119
        Width = 902
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 100
        TabOrder = 4
        Text = ' '
      end
      object DBDateEdit1: TDBDateEdit
        Left = 109
        Top = 5
        Width = 121
        Height = 21
        DataField = 'DateCreate'
        DataSource = dsPayMentGetProp
        ReadOnly = True
        Color = clBtnFace
        NumGlyphs = 2
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 109
        Top = 27
        Width = 902
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        DataField = 'ReprName'
        DataSource = dsPayMentGetProp
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 109
        Top = 50
        Width = 902
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        DataSource = dsPayMentGetProp
        ReadOnly = True
        TabOrder = 2
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 108
        Top = 72
        Width = 122
        Height = 21
        AutoSize = False
        TabOrder = 5
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Сам репорт'
      ImageIndex = 1
      object QuickRep2: TQuickRep
        Left = 0
        Top = 2
        Width = 794
        Height = 1123
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        BeforePrint = QuickRep2BeforePrint
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Functions.Strings = (
          'PAGENUMBER'
          'COLUMNNUMBER'
          'REPORTTITLE'
          'QRSTRINGSBAND1')
        Functions.DATA = (
          '0'
          '0'
          #39#39
          #39#39)
        Options = [FirstPageHeader, LastPageFooter]
        Page.Columns = 1
        Page.Orientation = poPortrait
        Page.PaperSize = A4
        Page.Values = (
          100
          2970
          50
          2100
          60
          60
          0)
        PrinterSettings.Copies = 1
        PrinterSettings.Duplex = False
        PrinterSettings.FirstPage = 0
        PrinterSettings.LastPage = 0
        PrinterSettings.OutputBin = Auto
        PrintIfEmpty = True
        SnapToGrid = True
        Units = MM
        Zoom = 100
        object TitleBand1: TQRBand
          Left = 23
          Top = 19
          Width = 749
          Height = 32
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            84.6666666666667
            1981.72916666667)
          BandType = rbTitle
          object QRLabel1: TQRLabel
            Left = 4
            Top = 2
            Width = 436
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              10.5833333333333
              5.29166666666667
              1153.58333333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 
              'Унифицированная форма № КО-1. Утверждена Постановлением Госкомст' +
              'ата России'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object QRLabel5: TQRLabel
            Left = 136
            Top = 17
            Width = 304
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              359.833333333333
              44.9791666666667
              804.333333333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'от 18.08.98 № 88 (в ред. Постановления от 03.05.2000 №36)'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
        end
        object QRBand1: TQRBand
          Left = 23
          Top = 51
          Width = 749
          Height = 490
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = True
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Frame.Style = psDot
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            1296.45833333333
            1981.72916666667)
          BandType = rbDetail
          object QRShape1: TQRShape
            Left = 8
            Top = 119
            Width = 441
            Height = 151
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              399.520833333333
              21.1666666666667
              314.854166666667
              1166.8125)
            Shape = qrsRectangle
          end
          object QRLabel2: TQRLabel
            Left = 475
            Top = 0
            Width = 7
            Height = 480
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = True
            Frame.DrawRight = True
            Size.Values = (
              1270
              1256.77083333333
              0
              18.5208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'QRLabel2'
            Color = clBackground
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel3: TQRLabel
            Left = 489
            Top = 0
            Width = 254
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1293.8125
              0
              672.041666666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'ООО "Формула отдыха"'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel4: TQRLabel
            Left = 489
            Top = 17
            Width = 254
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1293.8125
              44.9791666666667
              672.041666666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'организация'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object QRLabel6: TQRLabel
            Left = 489
            Top = 38
            Width = 254
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1293.8125
              100.541666666667
              672.041666666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'КВИТАНЦИЯ'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel7: TQRLabel
            Left = 489
            Top = 54
            Width = 254
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1293.8125
              142.875
              672.041666666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'к приходному кассовому ордеру'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel8: TQRLabel
            Left = 489
            Top = 80
            Width = 14
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1293.8125
              211.666666666667
              37.0416666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'от'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel10: TQRLabel
            Left = 489
            Top = 104
            Width = 68
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1293.8125
              275.166666666667
              179.916666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Принято от'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRDBText2: TQRDBText
            Left = 505
            Top = 80
            Width = 239
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1336.14583333333
              211.666666666667
              632.354166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataField = 'DateCreate'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            OnPrint = QRDBText2Print
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel9: TQRLabel
            Left = 561
            Top = 104
            Width = 183
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1484.3125
              275.166666666667
              484.1875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'черта'
            Color = clWhite
            OnPrint = QRLabel9Print
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel11: TQRLabel
            Left = 489
            Top = 137
            Width = 64
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1293.8125
              362.479166666667
              169.333333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Основание'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel12: TQRLabel
            Left = 561
            Top = 137
            Width = 183
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1484.3125
              362.479166666667
              484.1875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'черта'
            Color = clWhite
            OnPrint = QRLabel9Print
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel13: TQRLabel
            Left = 489
            Top = 205
            Width = 39
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1293.8125
              542.395833333333
              103.1875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Сумма'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRDBText5: TQRDBText
            Left = 534
            Top = 205
            Width = 211
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1412.875
              542.395833333333
              558.270833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataField = 'PriceOper'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            OnPrint = QRDBText5Print
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRDBText6: TQRDBText
            Left = 489
            Top = 229
            Width = 248
            Height = 53
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              140.229166666667
              1293.8125
              605.895833333333
              656.166666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataField = 'PriceOper'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            OnPrint = QRDBText6Print
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel14: TQRLabel
            Left = 489
            Top = 219
            Width = 256
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1293.8125
              579.4375
              677.333333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'цифрами'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel32: TQRLabel
            Left = 489
            Top = 282
            Width = 70
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1293.8125
              746.125
              185.208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'В том числе'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel17: TQRLabel
            Left = 521
            Top = 332
            Width = 118
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1378.47916666667
              878.416666666667
              312.208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'М.П. (штампа)'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel18: TQRLabel
            Left = 489
            Top = 359
            Width = 111
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1293.8125
              949.854166666667
              293.6875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Главный бухгалтер'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel21: TQRLabel
            Left = 600
            Top = 372
            Width = 142
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1587.5
              984.25
              375.708333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'подпись'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel22: TQRLabel
            Left = 489
            Top = 392
            Width = 256
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1293.8125
              1037.16666666667
              677.333333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'расшифровка подписи'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel23: TQRLabel
            Left = 489
            Top = 413
            Width = 51
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1293.8125
              1092.72916666667
              134.9375)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Кассир'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel27: TQRLabel
            Left = 489
            Top = 446
            Width = 256
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1293.8125
              1180.04166666667
              677.333333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'расшифровка подписи'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel25: TQRLabel
            Left = 544
            Top = 426
            Width = 198
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1439.33333333333
              1127.125
              523.875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'подпись'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel28: TQRLabel
            Left = 3
            Top = 8
            Width = 246
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              7.9375
              21.1666666666667
              650.875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'ООО "Формула отдыха"'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel29: TQRLabel
            Left = 3
            Top = 25
            Width = 246
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              7.9375
              66.1458333333333
              650.875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'организация'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel30: TQRLabel
            Left = 3
            Top = 36
            Width = 246
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              7.9375
              95.25
              650.875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = ' '
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel36: TQRLabel
            Left = 3
            Top = 53
            Width = 246
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              7.9375
              140.229166666667
              650.875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'структурное подразделение'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel37: TQRLabel
            Left = 402
            Top = 5
            Width = 63
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = True
            Frame.DrawRight = True
            Size.Values = (
              44.9791666666667
              1063.625
              13.2291666666667
              166.6875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Код'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel38: TQRLabel
            Left = 402
            Top = 37
            Width = 63
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = True
            Frame.DrawLeft = True
            Frame.DrawRight = True
            Size.Values = (
              44.9791666666667
              1063.625
              97.8958333333333
              166.6875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = '4107218'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel39: TQRLabel
            Left = 402
            Top = 21
            Width = 63
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = True
            Frame.DrawRight = True
            Size.Values = (
              44.9791666666667
              1063.625
              55.5625
              166.6875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = '0310001'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel40: TQRLabel
            Left = 298
            Top = 21
            Width = 105
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              788.458333333333
              55.5625
              277.8125)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Форма по ОКУД'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel41: TQRLabel
            Left = 299
            Top = 37
            Width = 103
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              791.104166666667
              97.8958333333333
              272.520833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Форма по ОКПО'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel42: TQRLabel
            Left = 8
            Top = 77
            Width = 203
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              21.1666666666667
              203.729166666667
              537.104166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'ПРИХОДНЫЙ КАССОВЫЙ ОРДЕР'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel43: TQRLabel
            Left = 368
            Top = 62
            Width = 96
            Height = 32
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = True
            Frame.DrawRight = True
            Size.Values = (
              84.6666666666667
              973.666666666667
              164.041666666667
              254)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Дата составления'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel45: TQRLabel
            Left = 274
            Top = 62
            Width = 95
            Height = 32
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = True
            Frame.DrawRight = True
            Size.Values = (
              84.6666666666667
              724.958333333333
              164.041666666667
              251.354166666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Номер документа'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel44: TQRLabel
            Left = 274
            Top = 93
            Width = 95
            Height = 22
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = True
            Frame.DrawLeft = True
            Frame.DrawRight = True
            Size.Values = (
              58.2083333333333
              724.958333333333
              246.0625
              251.354166666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = ' '
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel46: TQRLabel
            Left = 368
            Top = 93
            Width = 96
            Height = 22
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = True
            Frame.DrawLeft = True
            Frame.DrawRight = True
            Size.Values = (
              58.2083333333333
              973.666666666667
              246.0625
              254)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = ' '
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape2: TQRShape
            Left = 64
            Top = 119
            Width = 5
            Height = 151
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              399.520833333333
              169.333333333333
              314.854166666667
              13.2291666666667)
            Shape = qrsVertLine
          end
          object QRLabel47: TQRLabel
            Left = 16
            Top = 127
            Width = 34
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.9166666666667
              42.3333333333333
              336.020833333333
              89.9583333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Дебет'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel48: TQRLabel
            Left = 149
            Top = 124
            Width = 40
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.9166666666667
              394.229166666667
              328.083333333333
              105.833333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Кредит'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape3: TQRShape
            Left = 66
            Top = 145
            Width = 206
            Height = 10
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              26.4583333333333
              174.625
              383.645833333333
              545.041666666667)
            Shape = qrsHorLine
          end
          object QRShape4: TQRShape
            Left = 98
            Top = 151
            Width = 5
            Height = 118
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              312.208333333333
              259.291666666667
              399.520833333333
              13.2291666666667)
            Shape = qrsVertLine
          end
          object QRShape5: TQRShape
            Left = 152
            Top = 151
            Width = 5
            Height = 118
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              312.208333333333
              402.166666666667
              399.520833333333
              13.2291666666667)
            Shape = qrsVertLine
          end
          object QRShape6: TQRShape
            Left = 212
            Top = 151
            Width = 5
            Height = 118
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              312.208333333333
              560.916666666667
              399.520833333333
              13.2291666666667)
            Shape = qrsVertLine
          end
          object QRShape7: TQRShape
            Left = 270
            Top = 119
            Width = 4
            Height = 151
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              399.520833333333
              714.375
              314.854166666667
              10.5833333333333)
            Shape = qrsVertLine
          end
          object QRShape8: TQRShape
            Left = 415
            Top = 119
            Width = 5
            Height = 151
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              399.520833333333
              1098.02083333333
              314.854166666667
              13.2291666666667)
            Shape = qrsVertLine
          end
          object QRShape9: TQRShape
            Left = 366
            Top = 119
            Width = 5
            Height = 151
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              399.520833333333
              968.375
              314.854166666667
              13.2291666666667)
            Shape = qrsVertLine
          end
          object QRLabel49: TQRLabel
            Left = 376
            Top = 135
            Width = 24
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              994.833333333333
              357.1875
              63.5)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Код'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel50: TQRLabel
            Left = 376
            Top = 151
            Width = 30
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              994.833333333333
              399.520833333333
              79.375)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'целе-'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel51: TQRLabel
            Left = 376
            Top = 167
            Width = 26
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              994.833333333333
              441.854166666667
              68.7916666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'вого'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel52: TQRLabel
            Left = 376
            Top = 215
            Width = 21
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              994.833333333333
              568.854166666667
              55.5625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'ния'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel53: TQRLabel
            Left = 376
            Top = 199
            Width = 31
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              994.833333333333
              526.520833333333
              82.0208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'наче-'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel54: TQRLabel
            Left = 376
            Top = 183
            Width = 23
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              994.833333333333
              484.1875
              60.8541666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'наз-'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel55: TQRLabel
            Left = 297
            Top = 167
            Width = 24
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              785.8125
              441.854166666667
              63.5)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'коп.'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel56: TQRLabel
            Left = 297
            Top = 151
            Width = 25
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              785.8125
              399.520833333333
              66.1458333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'руб.'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel57: TQRLabel
            Left = 297
            Top = 135
            Width = 39
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              785.8125
              357.1875
              103.1875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Сумма'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel58: TQRLabel
            Left = 104
            Top = 159
            Width = 24
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              275.166666666667
              420.6875
              63.5)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Код'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel59: TQRLabel
            Left = 104
            Top = 175
            Width = 37
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              275.166666666667
              463.020833333333
              97.8958333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'струк-'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel60: TQRLabel
            Left = 104
            Top = 191
            Width = 47
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              275.166666666667
              505.354166666667
              124.354166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'турного'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel61: TQRLabel
            Left = 104
            Top = 207
            Width = 44
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              275.166666666667
              547.6875
              116.416666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'подраз-'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel62: TQRLabel
            Left = 104
            Top = 223
            Width = 46
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              275.166666666667
              590.020833333333
              121.708333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'деления'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel63: TQRLabel
            Left = 158
            Top = 223
            Width = 46
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              418.041666666667
              590.020833333333
              121.708333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'субсчет'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel64: TQRLabel
            Left = 158
            Top = 207
            Width = 29
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              418.041666666667
              547.6875
              76.7291666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'счет.'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel65: TQRLabel
            Left = 158
            Top = 191
            Width = 49
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              418.041666666667
              505.354166666667
              129.645833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'рующий'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel66: TQRLabel
            Left = 158
            Top = 175
            Width = 40
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              418.041666666667
              463.020833333333
              105.833333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'понди-'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel67: TQRLabel
            Left = 158
            Top = 159
            Width = 44
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              418.041666666667
              420.6875
              116.416666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'коррес-'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel69: TQRLabel
            Left = 219
            Top = 207
            Width = 33
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              579.4375
              547.6875
              87.3125)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'учета'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel70: TQRLabel
            Left = 219
            Top = 191
            Width = 45
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              579.4375
              505.354166666667
              119.0625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'ческого'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel71: TQRLabel
            Left = 219
            Top = 175
            Width = 50
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              579.4375
              463.020833333333
              132.291666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'аналити-'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel72: TQRLabel
            Left = 219
            Top = 159
            Width = 24
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              579.4375
              420.6875
              63.5)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Код'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape10: TQRShape
            Left = 9
            Top = 244
            Width = 439
            Height = 1
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              2.64583333333333
              23.8125
              645.583333333333
              1161.52083333333)
            Shape = qrsHorLine
          end
          object QRLabel68: TQRLabel
            Left = 16
            Top = 247
            Width = 34
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.9166666666667
              42.3333333333333
              653.520833333333
              89.9583333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = '50.1'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel73: TQRLabel
            Left = 168
            Top = 247
            Width = 34
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.9166666666667
              444.5
              653.520833333333
              89.9583333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = '62.1'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel74: TQRLabel
            Left = 224
            Top = 247
            Width = 34
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.9166666666667
              592.666666666667
              653.520833333333
              89.9583333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = '7'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRDBText4: TQRDBText
            Left = 275
            Top = 247
            Width = 91
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              727.604166666667
              653.520833333333
              240.770833333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataField = 'PriceOper'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            OnPrint = QRDBText5Print
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel75: TQRLabel
            Left = 9
            Top = 274
            Width = 70
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              23.8125
              724.958333333333
              185.208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Принято от'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRDBText1: TQRDBText
            Left = 85
            Top = 275
            Width = 381
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              224.895833333333
              727.604166666667
              1008.0625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataField = 'ReprName'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel76: TQRLabel
            Left = 9
            Top = 293
            Width = 69
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              23.8125
              775.229166666667
              182.5625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Основание'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel79: TQRLabel
            Left = 9
            Top = 327
            Width = 39
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              23.8125
              865.1875
              103.1875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Сумма'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRDBText7: TQRDBText
            Left = 54
            Top = 326
            Width = 410
            Height = 41
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              108.479166666667
              142.875
              862.541666666667
              1084.79166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataField = 'PriceOper'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic, fsUnderline]
            OnPrint = QRDBText7Print
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel80: TQRLabel
            Left = 99
            Top = 337
            Width = 248
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              261.9375
              891.645833333333
              656.166666666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'прописью'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel81: TQRLabel
            Left = 8
            Top = 367
            Width = 70
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              21.1666666666667
              971.020833333333
              185.208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'В том числе'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel84: TQRLabel
            Left = 7
            Top = 424
            Width = 113
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              18.5208333333333
              1121.83333333333
              298.979166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Главный бухгалтер'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel86: TQRLabel
            Left = 117
            Top = 438
            Width = 138
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              309.5625
              1158.875
              365.125)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'подпись'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel20: TQRLabel
            Left = 258
            Top = 438
            Width = 205
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              682.625
              1158.875
              542.395833333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'расшифровка подписи'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel26: TQRLabel
            Left = 7
            Top = 451
            Width = 108
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              18.5208333333333
              1193.27083333333
              285.75)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Кассир'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel88: TQRLabel
            Left = 117
            Top = 465
            Width = 138
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              309.5625
              1230.3125
              365.125)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'подпись'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel89: TQRLabel
            Left = 258
            Top = 465
            Width = 205
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              682.625
              1230.3125
              542.395833333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'расшифровка подписи'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRDBText8: TQRDBText
            Left = 489
            Top = 152
            Width = 254
            Height = 41
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              108.479166666667
              1293.8125
              402.166666666667
              672.041666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRDBText9: TQRDBText
            Left = 85
            Top = 295
            Width = 381
            Height = 33
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              87.3125
              224.895833333333
              780.520833333333
              1008.0625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel15: TQRLabel
            Left = 7
            Top = 403
            Width = 73
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              18.5208333333333
              1066.27083333333
              193.145833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Приложения'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel16: TQRLabel
            Left = 82
            Top = 403
            Width = 384
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              216.958333333333
              1066.27083333333
              1016)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'черта'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            OnPrint = QRLabel16Print
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel19: TQRLabel
            Left = 492
            Top = 241
            Width = 252
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              1301.75
              637.645833333333
              666.75)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'черта'
            Color = clWhite
            OnPrint = QRLabel9Print
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel24: TQRLabel
            Left = 492
            Top = 259
            Width = 252
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              1301.75
              685.270833333333
              666.75)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'черта'
            Color = clWhite
            OnPrint = QRLabel9Print
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel31: TQRLabel
            Left = 491
            Top = 240
            Width = 248
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1299.10416666667
              635
              656.166666666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'прописью'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel35: TQRLabel
            Left = 52
            Top = 337
            Width = 413
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              137.583333333333
              891.645833333333
              1092.72916666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'черта'
            Color = clWhite
            OnPrint = QRLabel9Print
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel77: TQRLabel
            Left = 85
            Top = 307
            Width = 381
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              224.895833333333
              812.270833333333
              1008.0625)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'черта'
            Color = clWhite
            OnPrint = QRLabel9Print
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel33: TQRLabel
            Left = 561
            Top = 282
            Width = 184
            Height = 39
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              103.1875
              1484.3125
              746.125
              486.833333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'В том числе'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            OnPrint = QRLabel33Print
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel34: TQRLabel
            Left = 562
            Top = 295
            Width = 183
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              1486.95833333333
              780.520833333333
              484.1875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'черта'
            Color = clWhite
            OnPrint = QRLabel9Print
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel78: TQRLabel
            Left = 79
            Top = 367
            Width = 386
            Height = 33
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              87.3125
              209.020833333333
              971.020833333333
              1021.29166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'В том числе'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = []
            OnPrint = QRLabel33Print
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel82: TQRLabel
            Left = 80
            Top = 380
            Width = 385
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              211.666666666667
              1005.41666666667
              1018.64583333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'черта'
            Color = clWhite
            OnPrint = QRLabel9Print
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel83: TQRLabel
            Left = 489
            Top = 165
            Width = 255
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              1293.8125
              436.5625
              674.6875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'черта'
            Color = clWhite
            OnPrint = QRLabel9Print
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRDBText3: TQRDBText
            Left = 489
            Top = 120
            Width = 255
            Height = 18
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              47.625
              1293.8125
              317.5
              674.6875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataField = 'ReprName'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel85: TQRLabel
            Left = 491
            Top = 123
            Width = 253
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              1299.10416666667
              325.4375
              669.395833333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'черта'
            Color = clWhite
            OnPrint = QRLabel9Print
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
        end
      end
    end
  end
  object dsPayMentGetProp: TDataSource
    Left = 272
    Top = 56
  end
end
