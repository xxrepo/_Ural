object Settings: TSettings
  Left = 394
  Top = 216
  Width = 464
  Height = 232
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Настройки'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 152
    Width = 448
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 370
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 279
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 448
    Height = 30
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Сервер'
    end
    object Label2: TLabel
      Left = 272
      Top = 8
      Width = 25
      Height = 13
      Caption = 'Порт'
    end
    object edServer: TEdit
      Left = 56
      Top = 5
      Width = 209
      Height = 21
      TabOrder = 0
    end
    object edPort: TCurrencyEdit
      Left = 304
      Top = 5
      Width = 44
      Height = 21
      AutoSize = False
      DisplayFormat = ',0;-,0'#39
      TabOrder = 1
      Value = 211
      OnKeyPress = edPortKeyPress
    end
    object Button1: TButton
      Left = 361
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Тест'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 30
    Width = 448
    Height = 122
    Align = alClient
    Caption = ' '
    TabOrder = 2
    object sLabel1: TsLabel
      Left = 8
      Top = 28
      Width = 96
      Height = 13
      Caption = 'Временные файлы'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 8
      Top = 79
      Width = 188
      Height = 13
      Caption = 'Программа для просмотра картинок'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cbShowSplash: TCheckBox
      Left = 8
      Top = 4
      Width = 233
      Height = 17
      Caption = 'Показывать заставку при загрузке'
      TabOrder = 0
    end
    object deTmp: TsDirectoryEdit
      Left = 8
      Top = 48
      Width = 425
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 255
      ParentFont = False
      TabOrder = 1
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
      Root = 'rfDesktop'
    end
    object edImgViewer: TsFilenameEdit
      Left = 8
      Top = 96
      Width = 425
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 255
      ParentFont = False
      TabOrder = 2
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
      Filter = 'Программы (*.exe)|*.exe'
    end
    object cbSkin: TCheckBox
      Left = 264
      Top = 4
      Width = 233
      Height = 17
      Caption = 'Использовать скины'
      TabOrder = 3
    end
  end
end
