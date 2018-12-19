object FormParser: TFormParser
  Left = 121
  Top = 156
  HelpContext = 44
  AutoScroll = False
  Caption = 'Настройка загрузки курсов валют'
  ClientHeight = 423
  ClientWidth = 632
  Color = clBtnFace
  Constraints.MinHeight = 369
  Constraints.MinWidth = 639
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 382
    Width = 632
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Panel3: TPanel
      Left = 255
      Top = 0
      Width = 377
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtnFinish: TBitBtn
        Left = 136
        Top = 8
        Width = 105
        Height = 25
        Hint = 'Завершить настройку'
        Caption = 'OK'
        TabOrder = 2
        TabStop = False
        OnClick = BitBtnFinishClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object BitBtnPrev: TBitBtn
        Left = 16
        Top = 8
        Width = 105
        Height = 25
        Caption = 'Назад'
        TabOrder = 0
        OnClick = BitBtnPrevClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333333333333333333333333333FF333333333333
          3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
          E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
          E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
          E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
          000033333373FF77777733333330003333333333333777333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object BitBtnNext: TBitBtn
        Left = 136
        Top = 8
        Width = 105
        Height = 25
        Caption = 'Далее'
        TabOrder = 1
        OnClick = BitBtnNextClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333FFF333333333333000333333333
          3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
          3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
          0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
          BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
          33337777773FF733333333333300033333333333337773333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object BitBtn5: TBitBtn
        Left = 256
        Top = 8
        Width = 105
        Height = 25
        Caption = 'Отмена'
        TabOrder = 3
        Kind = bkCancel
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 632
    Height = 341
    ActivePage = tsParse
    Align = alClient
    HotTrack = True
    TabOrder = 1
    TabPosition = tpBottom
    OnChange = PageControl1Change
    object tsUrl: TTabSheet
      Caption = 'Настройка URL'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 41
        Align = alTop
        Caption = ' '
        TabOrder = 0
        object Label7: TLabel
          Left = 16
          Top = 12
          Width = 22
          Height = 13
          Caption = 'URL'
        end
        object SpeedButton1: TSpeedButton
          Left = 488
          Top = 8
          Width = 25
          Height = 25
          Hint = 'Открыть в браузере'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555FFFFF555555555544C4C5555555555F777775FF5555554C444C444
            5555555775FF55775F55554C4334444445555575577F55557FF554C4C334C4C4
            335557F5577FF55577F554CCC3334444335557555777F555775FCCCCC333CCC4
            C4457F55F777F555557F4CC33333CCC444C57F577777F5F5557FC4333333C3C4
            CCC57F777777F7FF557F4CC33333333C4C457F577777777F557FCCC33CC4333C
            C4C575F7755F777FF5755CCCCC3333334C5557F5FF777777F7F554C333333333
            CC55575777777777F755553333CC3C33C555557777557577755555533CC4C4CC
            5555555775FFFF77555555555C4CCC5555555555577777555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton1Click
        end
        object edUrl: TEdit
          Left = 72
          Top = 8
          Width = 416
          Height = 21
          MaxLength = 255
          TabOrder = 0
        end
      end
      object WebBrowser1: TWebBrowser
        Left = 0
        Top = 41
        Width = 624
        Height = 272
        Align = alClient
        TabOrder = 1
        OnNewWindow2 = WebBrowser1NewWindow2
        ControlData = {
          4C000000AD330000CA2700000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object tsParse: TTabSheet
      Caption = 'Разбор URL'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 129
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 78
          Width = 174
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Label1'
          Visible = False
        end
        object Label2: TLabel
          Left = 291
          Top = 14
          Width = 201
          Height = 13
          Caption = 'Использовать для определения курсов'
          Visible = False
        end
        object bBack: TBitBtn
          Left = 8
          Top = 48
          Width = 75
          Height = 25
          Hint = 'Предыдущая таблица'
          Caption = '<<'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = bBackClick
        end
        object bNext: TBitBtn
          Left = 96
          Top = 48
          Width = 75
          Height = 25
          Hint = 'Следующая таблица'
          Caption = '>>'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = bNextClick
        end
        object btnUseIt: TBitBtn
          Left = 504
          Top = 8
          Width = 113
          Height = 25
          Hint = 'Использовать для определения курсов'
          Caption = 'Использовать'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnUseItClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object BitBtn1: TBitBtn
          Left = 8
          Top = 8
          Width = 161
          Height = 25
          Caption = 'Разбор'
          TabOrder = 3
          OnClick = BitBtn1Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          NumGlyphs = 2
        end
        object Memo1: TMemo
          Left = 248
          Top = 40
          Width = 361
          Height = 81
          Lines.Strings = (
            'Memo1')
          TabOrder = 4
        end
      end
      object StringGrid1: TStringGrid
        Left = 0
        Top = 129
        Width = 624
        Height = 184
        Align = alClient
        DefaultColWidth = 70
        FixedCols = 0
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 1
      end
    end
    object tsStng: TTabSheet
      Caption = 'Настройка'
      ImageIndex = 1
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 624
        Height = 41
        Align = alTop
        Shape = bsBottomLine
      end
      object Label3: TLabel
        Left = 136
        Top = 56
        Width = 98
        Height = 13
        Caption = 'Буквенный код ISO'
      end
      object Label4: TLabel
        Left = 256
        Top = 56
        Width = 94
        Height = 13
        Caption = 'Цифровой код ISO'
      end
      object Label5: TLabel
        Left = 376
        Top = 56
        Width = 86
        Height = 13
        Caption = 'Единиц к обмену'
      end
      object Label6: TLabel
        Left = 496
        Top = 56
        Width = 24
        Height = 13
        Caption = 'Курс'
      end
      object Label9: TLabel
        Left = 16
        Top = 16
        Width = 22
        Height = 13
        Caption = 'URL'
      end
      object Label10: TLabel
        Left = 88
        Top = 16
        Width = 3
        Height = 13
      end
      object Label12: TLabel
        Left = 16
        Top = 56
        Width = 76
        Height = 13
        Caption = 'Наименование'
      end
      object ComboBox2: TComboBox
        Left = 136
        Top = 80
        Width = 105
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = ComboBox2Change
      end
      object ListBox1: TListBox
        Left = 136
        Top = 112
        Width = 105
        Height = 169
        TabStop = False
        ItemHeight = 13
        TabOrder = 5
      end
      object ComboBox3: TComboBox
        Left = 256
        Top = 80
        Width = 105
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnChange = ComboBox3Change
      end
      object ListBox2: TListBox
        Left = 256
        Top = 112
        Width = 105
        Height = 169
        TabStop = False
        ItemHeight = 13
        TabOrder = 6
      end
      object ComboBox4: TComboBox
        Left = 376
        Top = 80
        Width = 105
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
        OnChange = ComboBox4Change
      end
      object ListBox3: TListBox
        Left = 376
        Top = 112
        Width = 105
        Height = 169
        TabStop = False
        ItemHeight = 13
        TabOrder = 7
      end
      object ComboBox5: TComboBox
        Left = 496
        Top = 80
        Width = 105
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
        OnChange = ComboBox5Change
      end
      object ListBox4: TListBox
        Left = 496
        Top = 112
        Width = 105
        Height = 169
        TabStop = False
        ItemHeight = 13
        TabOrder = 8
      end
      object ComboBox1: TComboBox
        Left = 16
        Top = 80
        Width = 105
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = ComboBox1Change
      end
      object ListBox5: TListBox
        Left = 16
        Top = 112
        Width = 105
        Height = 169
        TabStop = False
        ItemHeight = 13
        TabOrder = 9
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 41
    Align = alTop
    Caption = ' '
    TabOrder = 2
    object Label11: TLabel
      Left = 16
      Top = 10
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object edName: TEdit
      Left = 72
      Top = 6
      Width = 185
      Height = 21
      MaxLength = 20
      TabOrder = 0
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 
      'Текстовые файлы (*.txt)|*.txt|Документы HTML (*.html;*.htm)|*.ht' +
      'ml;*.htm|Все файлы (*.*)|*.*'
  end
  object cdsURLProp: TClientDataSet
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
        Name = '@id_Url'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsURLProp'
    RemoteServer = DM.rsCA
    Left = 308
    Top = 111
    object cdsURLPropId_URL: TAutoIncField
      FieldName = 'Id_URL'
      ReadOnly = True
    end
    object cdsURLPropName: TStringField
      FieldName = 'Name'
    end
    object cdsURLPropURL: TStringField
      FieldName = 'URL'
      Size = 255
    end
    object cdsURLPropUseTable: TSmallintField
      FieldName = 'UseTable'
    end
    object cdsURLPropColName: TIntegerField
      FieldName = 'ColName'
    end
    object cdsURLPropColISO: TIntegerField
      FieldName = 'ColISO'
    end
    object cdsURLPropColCode: TIntegerField
      FieldName = 'ColCode'
    end
    object cdsURLPropColRate: TIntegerField
      FieldName = 'ColRate'
    end
    object cdsURLPropColPieces: TIntegerField
      FieldName = 'ColPieces'
    end
  end
end
