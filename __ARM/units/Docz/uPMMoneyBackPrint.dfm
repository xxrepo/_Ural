object PMMoneyBackPrint: TPMMoneyBackPrint
  Left = -4
  Top = -4
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
      Left = 306
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 215
      Top = 9
      Width = 75
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
        Top = 54
        Width = 108
        Height = 13
        Caption = 'Документ-основание'
      end
      object Label12: TLabel
        Left = 8
        Top = 101
        Width = 60
        Height = 13
        Caption = 'Сумма (руб)'
      end
      object Label4: TLabel
        Left = 8
        Top = 124
        Width = 64
        Height = 13
        Caption = 'Приложения'
      end
      object Label5: TLabel
        Left = 8
        Top = 78
        Width = 56
        Height = 13
        Caption = 'Основание'
      end
      object edAppendix: TEdit
        Left = 120
        Top = 120
        Width = 865
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 100
        TabOrder = 5
        Text = ' '
      end
      object DBDateEdit1: TDBDateEdit
        Left = 120
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
        Left = 120
        Top = 27
        Width = 865
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        DataField = 'Payer'
        DataSource = dsPayMentGetProp
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 120
        Top = 97
        Width = 64
        Height = 21
        Color = clBtnFace
        DataField = 'SummRBL'
        DataSource = dsPayMentGetProp
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit3: TDBEdit
        Left = 120
        Top = 50
        Width = 865
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        DataField = 'PayBase'
        DataSource = dsPayMentGetProp
        ReadOnly = True
        TabOrder = 2
      end
      object edBase: TEdit
        Left = 120
        Top = 74
        Width = 865
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 100
        TabOrder = 3
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Сам репорт'
      ImageIndex = 1
      object QuickRep2: TQuickRep
        Left = 24
        Top = -14
        Width = 794
        Height = 1123
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        DataSet = cdsPayMentGetProp
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
          Height = 20
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
            52.9166666666667
            1981.72916666667)
          BandType = rbTitle
          object QRLabel1: TQRLabel
            Left = 4
            Top = 2
            Width = 733
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
              1939.39583333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 
              'Унифицированная форма № КО-1. Утверждена Постановлением Госкомст' +
              'ата России от 18.08.98 № 88'
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
          Top = 39
          Width = 749
          Height = 505
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
            1336.14583333333
            1981.72916666667)
          BandType = rbDetail
          object QRShape1: TQRShape
            Left = 4
            Top = 118
            Width = 737
            Height = 80
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              211.666666666667
              10.5833333333333
              312.208333333333
              1949.97916666667)
            Shape = qrsRectangle
          end
          object QRLabel28: TQRLabel
            Left = 3
            Top = 8
            Width = 557
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
              1473.72916666667)
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
            Width = 557
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
              1473.72916666667)
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
            Top = 39
            Width = 557
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              7.9375
              103.1875
              1473.72916666667)
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
            Top = 56
            Width = 557
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              7.9375
              148.166666666667
              1473.72916666667)
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
            Left = 674
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
              1783.29166666667
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
            Left = 674
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
              1783.29166666667
              97.8958333333333
              166.6875)
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
          object QRLabel39: TQRLabel
            Left = 674
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
              1783.29166666667
              55.5625
              166.6875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = '0310002'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel40: TQRLabel
            Left = 570
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
              1508.125
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
            Left = 571
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
              1510.77083333333
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
            Left = 184
            Top = 95
            Width = 233
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              486.833333333333
              251.354166666667
              616.479166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'РАСХОДНЫЙ КАССОВЫЙ ОРДЕР'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel43: TQRLabel
            Left = 628
            Top = 74
            Width = 110
            Height = 19
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = True
            Size.Values = (
              50.2708333333333
              1661.58333333333
              195.791666666667
              291.041666666667)
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
            Left = 514
            Top = 74
            Width = 116
            Height = 19
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = True
            Frame.DrawRight = True
            Size.Values = (
              50.2708333333333
              1359.95833333333
              195.791666666667
              306.916666666667)
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
            Left = 513
            Top = 91
            Width = 116
            Height = 21
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = True
            Frame.DrawLeft = True
            Frame.DrawRight = True
            Frame.Width = 2
            Size.Values = (
              55.5625
              1357.3125
              240.770833333333
              306.916666666667)
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
            Left = 629
            Top = 91
            Width = 109
            Height = 21
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = True
            Frame.Width = 2
            Size.Values = (
              55.5625
              1664.22916666667
              240.770833333333
              288.395833333333)
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
            Left = 415
            Top = 118
            Width = 5
            Height = 80
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              211.666666666667
              1098.02083333333
              312.208333333333
              13.2291666666667)
            Shape = qrsVertLine
          end
          object QRLabel47: TQRLabel
            Left = 188
            Top = 123
            Width = 49
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              497.416666666667
              325.4375
              129.645833333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'ДЕБЕТ'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel48: TQRLabel
            Left = 423
            Top = 137
            Width = 67
            Height = 20
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              52.9166666666667
              1119.1875
              362.479166666667
              177.270833333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'КРЕДИТ'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape3: TQRShape
            Left = 4
            Top = 137
            Width = 413
            Height = 8
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              21.1666666666667
              10.5833333333333
              362.479166666667
              1092.72916666667)
            Shape = qrsHorLine
          end
          object QRShape7: TQRShape
            Left = 493
            Top = 118
            Width = 4
            Height = 80
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              211.666666666667
              1304.39583333333
              312.208333333333
              10.5833333333333)
            Shape = qrsVertLine
          end
          object QRShape8: TQRShape
            Left = 688
            Top = 118
            Width = 5
            Height = 80
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              211.666666666667
              1820.33333333333
              312.208333333333
              13.2291666666667)
            Shape = qrsVertLine
          end
          object QRShape9: TQRShape
            Left = 602
            Top = 118
            Width = 5
            Height = 80
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              211.666666666667
              1592.79166666667
              312.208333333333
              13.2291666666667)
            Shape = qrsVertLine
          end
          object QRLabel50: TQRLabel
            Left = 615
            Top = 137
            Width = 65
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              1627.1875
              362.479166666667
              171.979166666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'целевого'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel54: TQRLabel
            Left = 615
            Top = 153
            Width = 65
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              1627.1875
              404.8125
              171.979166666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'назначения'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel56: TQRLabel
            Left = 526
            Top = 147
            Width = 54
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              1391.70833333333
              388.9375
              142.875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'руб., коп.'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel57: TQRLabel
            Left = 526
            Top = 131
            Width = 54
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              1391.70833333333
              346.604166666667
              142.875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Сумма'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel67: TQRLabel
            Left = 185
            Top = 142
            Width = 131
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              489.479166666667
              375.708333333333
              346.604166666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'корреспондирующий'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel70: TQRLabel
            Left = 325
            Top = 158
            Width = 86
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              859.895833333333
              418.041666666667
              227.541666666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'ского учета'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel72: TQRLabel
            Left = 325
            Top = 142
            Width = 86
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              859.895833333333
              375.708333333333
              227.541666666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Код аналитиче-'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape10: TQRShape
            Left = 4
            Top = 175
            Width = 737
            Height = 2
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              5.29166666666667
              10.5833333333333
              463.020833333333
              1949.97916666667)
            Shape = qrsHorLine
          end
          object QRLabel75: TQRLabel
            Left = 9
            Top = 202
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
              534.458333333333
              185.208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Выдать'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRDBText1: TQRDBText
            Left = 85
            Top = 203
            Width = 652
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              224.895833333333
              537.104166666667
              1725.08333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = cdsPayMentGetProp
            DataField = 'Payer'
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
            Top = 233
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
              616.479166666667
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
            Top = 263
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
              695.854166666667
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
            Left = 86
            Top = 263
            Width = 547
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              227.541666666667
              695.854166666667
              1447.27083333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = cdsPayMentGetProp
            DataField = 'SummRBL'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            OnPrint = QRDBText7Print
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel80: TQRLabel
            Left = 83
            Top = 276
            Width = 550
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              219.604166666667
              730.25
              1455.20833333333)
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
          object QRLabel84: TQRLabel
            Left = 7
            Top = 345
            Width = 127
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              18.5208333333333
              912.8125
              336.020833333333)
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
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel86: TQRLabel
            Left = 141
            Top = 358
            Width = 138
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              373.0625
              947.208333333333
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
            Left = 290
            Top = 358
            Width = 205
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              767.291666666667
              947.208333333333
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
            Left = 175
            Top = 469
            Width = 108
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              463.020833333333
              1240.89583333333
              285.75)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Выдал кассир'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel88: TQRLabel
            Left = 285
            Top = 483
            Width = 188
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              754.0625
              1277.9375
              497.416666666667)
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
            Left = 480
            Top = 483
            Width = 255
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1270
              1277.9375
              674.6875)
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
          object QRDBText9: TQRDBText
            Left = 85
            Top = 233
            Width = 652
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              224.895833333333
              616.479166666667
              1725.08333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = cdsPayMentGetProp
            DataField = 'PayBase'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            OnPrint = QRDBText9Print
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel15: TQRLabel
            Left = 7
            Top = 291
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
              769.9375
              193.145833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Приложение'
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
          object QRLabel77: TQRLabel
            Left = 85
            Top = 219
            Width = 652
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              224.895833333333
              579.4375
              1725.08333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'фамилия, имя, отчество'
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
          object QRLabel2: TQRLabel
            Left = 674
            Top = 53
            Width = 63
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = True
            Frame.DrawLeft = True
            Frame.DrawRight = True
            Size.Values = (
              44.9791666666667
              1783.29166666667
              140.229166666667
              166.6875)
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
          object QRLabel3: TQRLabel
            Left = 615
            Top = 121
            Width = 65
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              1627.1875
              320.145833333333
              171.979166666667)
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
          object TextCop: TQRDBText
            Left = 574
            Top = 178
            Width = 29
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              1518.70833333333
              470.958333333333
              76.7291666666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = cdsPayMentGetProp
            DataField = 'SummRBL'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            OnPrint = TextCopPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object TExtRbl: TQRDBText
            Left = 500
            Top = 178
            Width = 61
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              1322.91666666667
              470.958333333333
              161.395833333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = cdsPayMentGetProp
            DataField = 'SummRBL'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsItalic]
            OnPrint = TExtRblPrint
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel4: TQRLabel
            Left = 185
            Top = 158
            Width = 131
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              489.479166666667
              418.041666666667
              346.604166666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'счет, субсчет'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel5: TQRLabel
            Left = 50
            Top = 142
            Width = 111
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              132.291666666667
              375.708333333333
              293.6875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'код структорного'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel6: TQRLabel
            Left = 49
            Top = 158
            Width = 111
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              129.645833333333
              418.041666666667
              293.6875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'подразделения'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape4: TQRShape
            Left = 318
            Top = 142
            Width = 5
            Height = 56
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              148.166666666667
              841.375
              375.708333333333
              13.2291666666667)
            Shape = qrsVertLine
          end
          object QRShape5: TQRShape
            Left = 172
            Top = 142
            Width = 5
            Height = 56
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              148.166666666667
              455.083333333333
              375.708333333333
              13.2291666666667)
            Shape = qrsVertLine
          end
          object QRShape6: TQRShape
            Left = 43
            Top = 142
            Width = 5
            Height = 56
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              148.166666666667
              113.770833333333
              375.708333333333
              13.2291666666667)
            Shape = qrsVertLine
          end
          object QRShape11: TQRShape
            Left = 568
            Top = 177
            Width = 4
            Height = 21
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              55.5625
              1502.83333333333
              468.3125
              10.5833333333333)
            Shape = qrsVertLine
          end
          object QRLabel7: TQRLabel
            Left = 85
            Top = 251
            Width = 652
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              224.895833333333
              664.104166666667
              1725.08333333333)
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
          object lbAppendix: TQRLabel
            Left = 85
            Top = 291
            Width = 652
            Height = 19
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              50.2708333333333
              224.895833333333
              769.9375
              1725.08333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'приложение'
            Color = clWhite
            OnPrint = AppendixPrint
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel8: TQRLabel
            Left = 7
            Top = 317
            Width = 170
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              18.5208333333333
              838.729166666667
              449.791666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Руководитель организации'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel9: TQRLabel
            Left = 365
            Top = 331
            Width = 138
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              965.729166666667
              875.770833333333
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
          object QRLabel10: TQRLabel
            Left = 530
            Top = 330
            Width = 205
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1402.29166666667
              873.125
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
          object QRLabel11: TQRLabel
            Left = 179
            Top = 331
            Width = 166
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              473.604166666667
              875.770833333333
              439.208333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'должность'
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
          object QRLabel12: TQRLabel
            Left = 83
            Top = 388
            Width = 654
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              219.604166666667
              1026.58333333333
              1730.375)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'сумма прописью'
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
          object QRLabel13: TQRLabel
            Left = 7
            Top = 374
            Width = 50
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              18.5208333333333
              989.541666666667
              132.291666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Получил'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel14: TQRLabel
            Left = 709
            Top = 373
            Width = 24
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1875.89583333333
              986.895833333333
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
          object QRLabel16: TQRLabel
            Left = 637
            Top = 373
            Width = 25
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1685.39583333333
              986.895833333333
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
          object QRLabel18: TQRLabel
            Left = 10
            Top = 402
            Width = 40
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              26.4583333333333
              1063.625
              105.833333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = '"        "'
            Color = clWhite
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel17: TQRLabel
            Left = 30
            Top = 434
            Width = 715
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              79.375
              1148.29166666667
              1891.77083333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'наименование, номер, дата и место выдачи документа,'
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
          object QRLabel19: TQRLabel
            Left = 58
            Top = 402
            Width = 207
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              153.458333333333
              1063.625
              547.6875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = ' '
            Color = clWhite
            OnPrint = QRLabel9Print
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel21: TQRLabel
            Left = 266
            Top = 402
            Width = 58
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              703.791666666667
              1063.625
              153.458333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = '200     г.'
            Color = clWhite
            Transparent = True
            WordWrap = True
            FontSize = 10
          end
          object QRLabel22: TQRLabel
            Left = 433
            Top = 402
            Width = 74
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              1145.64583333333
              1063.625
              195.791666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Подпись'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel23: TQRLabel
            Left = 512
            Top = 404
            Width = 231
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = True
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1354.66666666667
              1068.91666666667
              611.1875)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = ' '
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
          object QRLabel24: TQRLabel
            Left = 9
            Top = 419
            Width = 17
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              23.8125
              1108.60416666667
              44.9791666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'По'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel25: TQRLabel
            Left = 9
            Top = 455
            Width = 734
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              23.8125
              1203.85416666667
              1942.04166666667)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'удостоверяющего личность получателя'
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
            Left = 662
            Top = 275
            Width = 42
            Height = 16
            Frame.Color = clBlack
            Frame.DrawTop = True
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              42.3333333333333
              1751.54166666667
              727.604166666667
              111.125)
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
        object QRLabel27: TQRLabel
          Left = 657
          Top = 301
          Width = 25
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.9791666666667
            1738.3125
            796.395833333333
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
        object QRLabel31: TQRLabel
          Left = 729
          Top = 301
          Width = 24
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.9791666666667
            1928.8125
            796.395833333333
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
        object QRDBText2: TQRDBText
          Left = 694
          Top = 298
          Width = 29
          Height = 16
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            42.3333333333333
            1836.20833333333
            788.458333333333
            76.7291666666667)
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          AutoStretch = False
          Color = clWhite
          DataSet = cdsPayMentGetProp
          DataField = 'SummRBL'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          OnPrint = TextCopPrint
          ParentFont = False
          Transparent = False
          WordWrap = True
          FontSize = 10
        end
      end
    end
  end
  object cdsPayMentGetProp: TClientDataSet
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
        Name = '@id_PayMent'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsPayMentGetProp'
    Left = 232
    Top = 56
    object cdsPayMentGetPropid_PayMent: TAutoIncField
      FieldName = 'id_PayMent'
      ReadOnly = True
    end
    object cdsPayMentGetPropDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object cdsPayMentGetPropid_PayerOrg: TIntegerField
      FieldName = 'id_PayerOrg'
    end
    object cdsPayMentGetPropid_Creator: TIntegerField
      FieldName = 'id_Creator'
    end
    object cdsPayMentGetPropDateClose: TDateTimeField
      FieldName = 'DateClose'
    end
    object cdsPayMentGetPropid_Closer: TIntegerField
      FieldName = 'id_Closer'
    end
    object cdsPayMentGetPropDateEnd: TDateTimeField
      FieldName = 'DateEnd'
    end
    object cdsPayMentGetPropCreator: TStringField
      FieldName = 'Creator'
      Size = 72
    end
    object cdsPayMentGetPropPayer: TStringField
      FieldName = 'Payer'
      Size = 72
    end
    object cdsPayMentGetPropid_Client: TIntegerField
      FieldName = 'id_Client'
    end
    object cdsPayMentGetPropBaseType: TIntegerField
      FieldName = 'BaseType'
    end
    object cdsPayMentGetPropid_Base: TIntegerField
      FieldName = 'id_Base'
    end
    object cdsPayMentGetPropid_Currency: TIntegerField
      FieldName = 'id_Currency'
    end
    object cdsPayMentGetPropCurrencyName: TStringField
      FieldName = 'CurrencyName'
      Size = 30
    end
    object cdsPayMentGetPropSumm: TFloatField
      FieldName = 'Summ'
    end
    object cdsPayMentGetPropMoneyBack: TBooleanField
      FieldName = 'MoneyBack'
    end
    object cdsPayMentGetPropCheckNum: TStringField
      FieldName = 'CheckNum'
      Size = 255
    end
    object cdsPayMentGetPropPayForm: TIntegerField
      FieldName = 'PayForm'
    end
    object cdsPayMentGetPropOffShore: TBooleanField
      FieldName = 'OffShore'
    end
    object cdsPayMentGetPropExchPercent: TFloatField
      FieldName = 'ExchPercent'
    end
    object cdsPayMentGetPropSummUSD: TFloatField
      FieldName = 'SummUSD'
    end
    object cdsPayMentGetPropid_Reserv: TIntegerField
      FieldName = 'id_Reserv'
    end
    object cdsPayMentGetPropid_TicketOrder: TIntegerField
      FieldName = 'id_TicketOrder'
    end
    object cdsPayMentGetPropSummRBL: TFloatField
      FieldName = 'SummRBL'
      DisplayFormat = '0.00'
    end
    object cdsPayMentGetPropPayBase: TStringField
      FieldName = 'PayBase'
      Size = 255
    end
    object cdsPayMentGetPropWasChecked: TIntegerField
      FieldName = 'WasChecked'
    end
    object cdsPayMentGetPropRate: TFloatField
      FieldName = 'Rate'
    end
    object cdsPayMentGetPropDescr: TStringField
      FieldName = 'Descr'
      Size = 5000
    end
  end
  object dsPayMentGetProp: TDataSource
    DataSet = cdsPayMentGetProp
    Left = 200
    Top = 56
  end
end
