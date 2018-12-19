object MainForm: TMainForm
  Left = 258
  Top = 143
  Width = 800
  Height = 450
  Anchors = []
  Caption = 'ВебАрхив. Версия от 2018-08-16'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  WindowMenu = miWindow
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sToolBar1: TsToolBar
    Left = 0
    Top = 0
    Width = 784
    Height = 28
    ButtonWidth = 8
    Caption = 'sToolBar1'
    TabOrder = 0
    SkinData.SkinSection = 'TOOLBAR'
    object ToolButton4: TToolButton
      Left = 0
      Top = 2
      Width = 9
      Caption = 'ToolButton4'
      Style = tbsSeparator
    end
    object sSpeedButton2: TsSpeedButton
      Tag = 5
      Left = 9
      Top = 2
      Width = 104
      Height = 22
      Action = aArc
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300000000000000000000000000000000000035647F33667F
        33667F33667F33667F33667F33667F33667F33667F33667F33667F33667F3366
        7F33667F33667F35647F5A92AC6FB2D16FB2D16FB2D16FB2D16FB2D16FB2D16F
        B2D16FB2D16FB2D16FB2D16FB2D16FB2D16FB2D16FB2D15A92AC5F97B375B9D9
        75B9D975B9D975B9D975B9D975B9D975B9D975B9D975B9D975B9D975B9D975B9
        D975B9D975B9D95F97B3659EBA7BC0E17BC0E17BC0E17BC0E17BC0E197D4ED97
        D4ED97D4ED97D4ED7BC0E17BC0E17BC0E17BC0E17BC0E1659EBA6AA5BF7FC5E7
        7FC5E77FC5E77FC5E77FC5E732758E32758E32758E32758E7FC5E77FC5E77FC5
        E77FC5E77FC5E76AA5BF6EABC684CAED84CAED84CAED84CAED84CAED5B96B25B
        96B25B96B25B96B284CAED84CAED84CAED84CAED84CAED6EABC671AFC985CBEE
        85CBEE85CBEE85CBEE85CBEE85CBEE85CBEE85CBEE85CBEE85CBEE85CBEE85CB
        EE85CBEE85CBEE71AFC974B1CD86CBEE86CBEE86CBEE86CBEE86CBEE86CBEE86
        CBEE86CBEE86CBEE86CBEE86CBEE86CBEE86CBEE86CBEE74B1CD79B6D08ED0F0
        8ED0F08ED0F08ED0F08ED0F08ED0F08ED0F08ED0F08ED0F08ED0F08ED0F08ED0
        F08ED0F08ED0F079B6D074AEC68AC1D68AC1D68BC2D88AC1D68AC1D68BC2D88A
        C1D68AC1D789C0D689C0D689C0D68AC1D78AC1D78BC2D875ADC5000000CCCCBF
        CDCDC0F2F2E8CDCDC0CDCDC0F2F2E8CDCDC0DBDCD1CACCC0CECFC4BEBFB4D5D7
        CBE2E3D9F2F2E8A7A796000000D0D0C5D3D3C7F4F4EDD3D3C7D3D3C7F4F4EDD3
        D3C7F4F4EDF4F4EDF4F4EDF4F4EDF4F4EDF4F4EDF4F4EDACAC9D000000D6D6CA
        D6D6CBF7F7F1D6D6CBD6D6CBF7F7F1D6D6CBE4E5DDCFD1C7D0D1C9F6F6F0F7F7
        F1F7F7F1F7F7F1B2B2A3000000DADACEDADAD0F9F9F4DADAD0DADAD0F9F9F4DA
        DAD0F9F9F4F9F9F4F9F9F4F9F9F4F9F9F4B1B1A2B1B1A2B7B7A8000000DCDCD1
        DDDDD4FAFAF6DDDDD4DDDDD4FAFAF6DDDDD4FAFAF6FAFAF6FAFAF6FAFAF6FAFA
        F6B1B1A1B3B3A3000000000000BFBFAFBEBEAFBEBEB0BEBEB0BEBEB0BEBEB0BE
        BEB0BEBEB0BEBEB0BEBEB0BEBEB0BFBFB0BFBFB1000000000000}
      Spacing = 0
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 21
      Reflected = True
      TextOffset = 10
      TextAlignment = taLeftJustify
    end
    object sSpeedButton1: TsSpeedButton
      Tag = 5
      Left = 113
      Top = 2
      Width = 104
      Height = 22
      Action = aDict
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F3F3F3F3F
        3F3F3F3F3F3F3F3F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3F3F3F
        3F55554A55555252525151515151515151515151514E53534D53534D54544E4E
        4E485B5B3F3F3FFF00FF534254625262604F605C495C5A45595B475B5A4A5B54
        3B52543B525A4A5B5C475B5A44595C485C604E60625262544155695F6CA2A8A6
        A2AAA79BA4A099A19E9CA4A19FA7A38D8B8F8D8C8FA5ACA98D93AA575AA8ACB3
        B0AFB6B3ABB0AE6C626D645766EFEFEFDCDDDDC8CAC9B6BBB9B1B6B4B4B8B7C2
        C5C3B9BBBAB6BAB9AAADB72B2BAFC5C7C6D1D1D1E1E1E1645766594659E8E8E8
        FFFFFFFFFFFFFEFEFEF9F9F9E5E8E6C7CDCAB1B5B3EAEBEAE6E6E94040B7E3E3
        E3E3E3E3D7D7D7574659412D43DFDEDFFFFFFFFFFFFFFEFEFEF9F9F9E2E5E4C7
        CDCAB0B4B2E9E9E9BABAD87777C7E3E3E3E4E4E4CCCBCC412D4338253DCCC8CB
        FFFFFFFFFFFFFFFFFFF9FAF9E3E6E5C7CDCBAFB3B1E3E3E76767BDC9C9DBE3E3
        E3E8E8E8B5B2B538253D3F1F3FB5AFB6FFFFFFFFFFFFFFFFFFFAFBFAE4E7E6C8
        CDCBAEB2B06C6CB6B3B3D4E6E6E6E3E3E3E9E9E99E989E3F1F3FFF00FFA89FA8
        FFFFFFFFFFFFFFFFFFFBFBFBE5E7E6C9CECB6D70999E9FCAEAEAEAE6E6E6E3E3
        E3E9E9E98F8790FF00FFFF00FF9C939CFFFFFFFFFFFFFFFFFFFBFBFBE5E8E7C9
        CECC5B5D99EAEBEBEBEBEBE7E7E7E3E3E3E9E9E9867E87FF00FFFF00FFA39DA6
        EBEBEBF9F9F9FFFFFFFCFCFCE6E9E8D2D7D56B6CA5EBECEBECECECEBEBEBE7E7
        E7D5D5D5918B91FF00FFFF00FFFF00FFFFFFFFCACACADDDDDDE6E6E6E5E5E5D5
        D5D5AAAAC3E5E5E5E3E3E3D7D7D7C1C1C1BFBFBFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Spacing = 0
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 19
      Reflected = True
      TextOffset = 10
      TextAlignment = taLeftJustify
    end
    object sSpeedButton3: TsSpeedButton
      Tag = 5
      Left = 217
      Top = 2
      Width = 12
      Height = 22
      Caption = 'Ввод билетов по квотам'
      NumGlyphs = 2
      Spacing = 0
      ButtonStyle = tbsSeparator
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      DropdownMenu = pmRep
      Reflected = True
      TextAlignment = taLeftJustify
    end
    object sSpeedButton6: TsSpeedButton
      Tag = 5
      Left = 229
      Top = 2
      Width = 132
      Height = 22
      Action = aUpLoad
      Spacing = 0
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 33
      Images = DM.ilImage
      Reflected = True
      TextOffset = 10
      TextAlignment = taLeftJustify
    end
    object sSpeedButton7: TsSpeedButton
      Tag = 5
      Left = 361
      Top = 2
      Width = 12
      Height = 22
      Caption = 'Ввод билетов по квотам'
      NumGlyphs = 2
      Spacing = 0
      ButtonStyle = tbsSeparator
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      DropdownMenu = pmRep
      Reflected = True
      TextAlignment = taLeftJustify
    end
    object sSpeedButton4: TsSpeedButton
      Tag = 5
      Left = 373
      Top = 2
      Width = 132
      Height = 22
      Action = aNote
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF3F3F3FB6B6B6BBBAB7BDBDBDBDBDBDBD
        BDBDBDBDBDBDBDBDBDBDBDBDBDBDB3B3B3696969FF00FFFF00FFFF00FFFF00FF
        A9A9A9CDCDCDDEDCD0DDDDDDDCDCDCDADADADADADAD9D9D9D8D8D8D8D8D8CCCC
        CC75AF785AA35DFF00FFFF00FF7F7F7F959595B9B9C0D7D5D8D6D6EBD4D4E9D1
        D1E6CFCFE4CDCDE3CCCCE1CBCBE0C9C9DE6CC76D39BD39FF00FFFF00FFFF00FF
        B1B1B1D7D7D7EEECE0F0F0F0EDEDEDEAEAEAE7E7E7E5E5E5E3E3E3E1E1E1DEDE
        DE86CA7F5AC84EFF00FFFF00FFFF00FFB2B2B2CCCCDFE1DFE4E0E0F6DEDEF3DB
        DBF0D9D9EED7D7ECD5D5EAD3D3E8D0D0E572B1C242A7BFFF00FFFF00FF7F7F7F
        959595BFBFBFEEECE0F7F7F7F4F4F4F0F0F0EDEDEDEAEAEAE7E7E7E5E5E5E1E1
        E152CFD90BCBDAFF00FFFF00FFFF00FFB0B0B0CFCFE2E5E3E8E6E6FBE3E3F9E0
        E0F6DEDEF3DBDBF0D9D9EED7D7ECD3D3E87FD3D44DD8D8FF00FFFF00FFFF00FF
        B0B0B0DDDDDDF6F4E8FDFDFDFAFAFAF7F7F7F4F4F4F0F0F0EDEDEDEAEAEAE5E5
        E57573B34644A9FF00FFFF00FF7F7F7F959595BABAC2E2E0E3E9E9FEE8E8FDE6
        E6FBE3E3F9E0E0F6DEDEF3DBDBF0D7D7ED6659CC2A17C5FF00FFFF00FFFF00FF
        B0B0B0DDDDDDF7F5E9FFFFFFFEFEFEFDFDFDFAFAFAF7F7F7F4F4F4F0F0F0EAEA
        EA7A65D14623D4FF00FFFF00FFFF00FFB0B0B0D0D0E2E6E4E9EAEAFFEAEAFFE9
        E9FEE8E8FDE6E6FBE3E3F9E0E0F6DCDCF1C1AF73BFA442FF00FFFF00FF7F7F7F
        959595BFBFBFF1EFE3FFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFAFAFAF7F7F7F1F1
        F1D9C372DAB83CFF00FFFF00FFFF00FFB0B0B0DDDDDDF7F5E9FFFFFFFFFFFFFF
        FFFFFFFFFFFEFEFEFDFDFDFAFAFAF5F5F5D9D4B5DFD6A5FF00FFFF00FFFF00FF
        B6B6B6C3C3C3CFCFCFD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0CFCFCFCCCC
        CCB6B6B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Spacing = 0
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 40
      Reflected = True
      TextOffset = 10
      TextAlignment = taLeftJustify
    end
    object sSpeedButton5: TsSpeedButton
      Tag = 5
      Left = 505
      Top = 2
      Width = 12
      Height = 22
      Caption = 'Ввод билетов по квотам'
      NumGlyphs = 2
      Spacing = 0
      ButtonStyle = tbsSeparator
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      DropdownMenu = pmRep
      Reflected = True
      TextAlignment = taLeftJustify
    end
    object sPanel1: TsPanel
      Left = 517
      Top = 2
      Width = 185
      Height = 22
      Caption = ' '
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object cbNS: TsComboBox
        Left = 0
        Top = 0
        Width = 185
        Height = 22
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        VerticalAlignment = taAlignTop
        Style = csDropDownList
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 16
        ItemIndex = -1
        ParentFont = False
        TabOrder = 0
        OnChange = cbNSChange
      end
    end
    object Button1: TButton
      Left = 702
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Button1'
      TabOrder = 1
      Visible = False
      OnClick = Button1Click
    end
  end
  object pnOutlook: TsPanel
    Left = 714
    Top = 0
    Width = 81
    Height = 57
    Anchors = []
    Caption = 'Для писем и файлов'
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
  end
  object sButton1: TsButton
    Left = 80
    Top = 272
    Width = 75
    Height = 25
    Hint = 'sgbreh r <b>ezdth</b> earyh'
    Caption = 'sButton1'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Visible = False
    SkinData.SkinSection = 'BUTTON'
  end
  object pnLog: TsPanel
    Left = 32
    Top = 48
    Width = 433
    Height = 121
    Caption = 'pnLog'
    TabOrder = 3
    Visible = False
    SkinData.SkinSection = 'PANEL'
  end
  object sButton2: TsButton
    Left = 216
    Top = 272
    Width = 75
    Height = 25
    Caption = 'sButton2'
    TabOrder = 4
    Visible = False
    OnClick = sButton2Click
    SkinData.SkinSection = 'BUTTON'
  end
  object MainStatusBar: THTMLStatusBar
    Left = 0
    Top = 372
    Width = 784
    Height = 19
    AnchorHint = False
    Panels = <
      item
        DateFormat = 'mm/dd/yyyy'
        Progress.BackGround = clBtnFace
        Progress.TextColor = clBlack
        Progress.Indication = piPercentage
        Progress.Min = 0
        Progress.Max = 100
        Progress.Position = 0
        Progress.Level0Color = clLime
        Progress.Level0ColorTo = 14811105
        Progress.Level1Color = clYellow
        Progress.Level1ColorTo = 13303807
        Progress.Level2Color = 5483007
        Progress.Level2ColorTo = 11064319
        Progress.Level3Color = clRed
        Progress.Level3ColorTo = 13290239
        Progress.Level1Perc = 70
        Progress.Level2Perc = 90
        Progress.BorderColor = clBlack
        Progress.ShowBorder = False
        Progress.Stacked = False
        TimeFormat = 'hh:mm:ss'
        Width = 250
      end
      item
        DateFormat = 'mm/dd/yyyy'
        Progress.BackGround = clBtnFace
        Progress.TextColor = clBlack
        Progress.Indication = piPercentage
        Progress.Min = 0
        Progress.Max = 100
        Progress.Position = 0
        Progress.Level0Color = clLime
        Progress.Level0ColorTo = 14811105
        Progress.Level1Color = clYellow
        Progress.Level1ColorTo = 13303807
        Progress.Level2Color = 5483007
        Progress.Level2ColorTo = 11064319
        Progress.Level3Color = clRed
        Progress.Level3ColorTo = 13290239
        Progress.Level1Perc = 70
        Progress.Level2Perc = 90
        Progress.BorderColor = clBlack
        Progress.ShowBorder = False
        Progress.Stacked = False
        Text = '<a href="">ya.ru</a>'
        TimeFormat = 'hh:mm:ss'
        Width = 150
      end
      item
        DateFormat = 'mm/dd/yyyy'
        Progress.BackGround = clBtnFace
        Progress.TextColor = clBlack
        Progress.Indication = piPercentage
        Progress.Min = 0
        Progress.Max = 100
        Progress.Position = 0
        Progress.Level0Color = clLime
        Progress.Level0ColorTo = 14811105
        Progress.Level1Color = clYellow
        Progress.Level1ColorTo = 13303807
        Progress.Level2Color = 5483007
        Progress.Level2ColorTo = 11064319
        Progress.Level3Color = clRed
        Progress.Level3ColorTo = 13290239
        Progress.Level1Perc = 70
        Progress.Level2Perc = 90
        Progress.BorderColor = clBlack
        Progress.ShowBorder = False
        Progress.Stacked = False
        TimeFormat = 'hh:mm:ss'
        Width = 50
      end>
    SimplePanel = False
    URLColor = clBlue
    OnPanelClick = MainStatusBarPanelClick
    Version = '1.4.3.0'
  end
  object MainMenu1: TMainMenu
    Left = 312
    Top = 96
    object N1: TMenuItem
      Caption = '&Данные'
      object N25: TMenuItem
        Caption = 'Настроить название колонок по контрагентам'
        OnClick = N25Click
      end
      object N26: TMenuItem
        Caption = 'Настроить название колонок по файлам'
        Visible = False
      end
      object miErrorLog: TMenuItem
        Caption = 'Протокол ошибок'
        OnClick = miErrorLogClick
      end
      object N4: TMenuItem
        Caption = 'Проверить наличие файлов'
        OnClick = N4Click
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object Ds1: TMenuItem
        Caption = 'Выход'
        OnClick = Ds1Click
      end
    end
    object miRep: TMenuItem
      Caption = 'О&тчеты'
      Visible = False
      object N13: TMenuItem
        Caption = 'Неопознанные штрих-коды'
      end
      object N17: TMenuItem
        Caption = 'Анализ присланного'
      end
      object N22: TMenuItem
        Caption = 'Отчет по продукции'
      end
      object N28: TMenuItem
        Caption = 'Статистика по базе'
      end
      object N31: TMenuItem
        Action = aArc
      end
    end
    object N111: TMenuItem
      Caption = 'Администрирование'
      object rbd1: TMenuItem
        Caption = 'Протокол действий пользователей'
        Visible = False
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object N10: TMenuItem
        Caption = 'Группы'
        Visible = False
      end
      object N11: TMenuItem
        Caption = 'Пользователи'
        OnClick = N11Click
      end
      object N3: TMenuItem
        Caption = 'Бизнесы'
        OnClick = N3Click
      end
    end
    object miWindow: TMenuItem
      Caption = '&Окна'
      object Tile1: TMenuItem
        Caption = '&Рядом'
        OnClick = Tile1Click
      end
      object Cascade1: TMenuItem
        Caption = '&Каскадом'
        OnClick = Cascade1Click
      end
      object ArrangeAll1: TMenuItem
        Caption = '&Упорядочить'
        OnClick = ArrangeAll1Click
      end
      object N8: TMenuItem
        Caption = '&Свернуть все'
        OnClick = N8Click
      end
    end
    object N32: TMenuItem
      Caption = 'Настройки'
      object N33: TMenuItem
        Caption = 'Настройки'
        OnClick = N33Click
      end
      object Builtinskins1: TMenuItem
        Caption = 'Cкины'
      end
    end
  end
  object ActionList1: TActionList
    Images = DM.ilImage
    Left = 344
    Top = 128
    object aDic: TAction
      Caption = 'Администрирование'
      ImageIndex = 10
    end
    object aDict: TAction
      Caption = 'Справочники'
      ImageIndex = 19
      OnExecute = aDictExecute
    end
    object aArc: TAction
      Category = 'Отчеты'
      Caption = 'Архив'
      ImageIndex = 21
      OnExecute = aArcExecute
    end
    object aUpLoad: TAction
      Caption = 'Загрузить файл'
      ImageIndex = 33
      OnExecute = aUpLoadExecute
    end
    object aNote: TAction
      Caption = 'Блокнот'
      ImageIndex = 40
      OnExecute = aNoteExecute
    end
  end
  object pmRep: TPopupMenu
    Left = 216
    Top = 176
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -13
    AddedTitle.Font.Name = 'Comic Sans MS'
    AddedTitle.Font.Style = [fsItalic]
    AddedTitle.Text = '     Программа управления архивом  файлов'
    SkinData.SkinSection = 'FORM'
    MakeSkinMenu = True
    ScreenSnap = True
    TitleButtons = <>
    Left = 68
    Top = 180
  end
  object dctFiles2: TDropComboTarget
    DragTypes = [dtCopy, dtLink]
    OnDrop = dctFiles2Drop
    Target = pnOutlook
    Formats = [mfFile, mfData, mfCustom]
    Left = 764
    Top = 96
  end
  object DataFormatAdapterOutlook: TDataFormatAdapter
    DragDropComponent = dctFiles2
    DataFormatName = 'TOutlookDataFormat'
    Left = 804
    Top = 92
  end
  object sAlphaHints1: TsAlphaHints
    Templates = <>
    HTMLMode = True
    SkinSection = 'HINT'
    UseSkinData = True
    Left = 496
    Top = 104
  end
end
