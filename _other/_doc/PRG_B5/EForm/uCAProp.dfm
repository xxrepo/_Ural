object CAProp: TCAProp
  Left = 206
  Top = 102
  BorderStyle = bsDialog
  Caption = 'CAProp'
  ClientHeight = 372
  ClientWidth = 556
  Color = clBtnFace
  Constraints.MinHeight = 100
  Constraints.MinWidth = 350
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
    Top = 331
    Width = 556
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 465
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 377
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object pcInfo: TAdvOfficePager
    Left = 0
    Top = 0
    Width = 556
    Height = 331
    Align = alClient
    ActivePage = tsMain
    ButtonSettings.CloseButtonPicture.Data = {
      424DA20400000000000036040000280000000900000009000000010008000000
      00006C000000C30E0000C30E00000001000000010000427B8400DEEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001000001010100000100
      0000000202000100020200000000000202020002020200000000010002020202
      0200010000000101000202020001010000000100020202020200010000000002
      0202000202020000000000020200010002020000000001000001010100000100
      0000}
    ButtonSettings.PageListButtonPicture.Data = {
      424DA20400000000000036040000280000000900000009000000010008000000
      00006C000000C30E0000C30E00000001000000010000427B8400DEEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001010101000101010100
      0000010101000200010101000000010100020202000101000000010002020202
      0200010000000002020200020202000000000002020001000202000000000100
      0001010100000100000001010101010101010100000001010101010101010100
      0000}
    ButtonSettings.ScrollButtonPrevPicture.Data = {
      424DA20400000000000036040000280000000900000009000000010008000000
      00006C000000C30E0000C30E00000001000000010000427B8400DEEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001010101000001010100
      0000010101000202000101000000010100020202000101000000010002020200
      0101010000000002020200010101010000000100020202000101010000000101
      0002020200010100000001010100020200010100000001010101000001010100
      0000}
    ButtonSettings.ScrollButtonNextPicture.Data = {
      424DA20400000000000036040000280000000900000009000000010008000000
      00006C000000C30E0000C30E00000001000000010000427B8400DEEFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001010000010101010100
      0000010002020001010101000000010002020200010101000000010100020202
      0001010000000101010002020200010000000101000202020001010000000100
      0202020001010100000001000202000101010100000001010000010101010100
      0000}
    ButtonSettings.ScrollButtonFirstPicture.Data = {
      424DC60400000000000036040000280000001000000009000000010008000000
      000000000000C40E0000C40E00000001000000010000427B84FFDEEFEFFFFFFF
      FFFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF01010101010000010101
      0101000001010101010100020200010101000202000101010100020202000101
      0002020200010101000202020001010002020200010101000202020001010002
      0202000101010101000202020001010002020200010101010100020202000101
      0002020200010101010100020200010101000202000101010101010000010101
      010100000101}
    ButtonSettings.ScrollButtonLastPicture.Data = {
      424DC60400000000000036040000280000001000000009000000010008000000
      000000000000C40E0000C40E00000001000000010000427B84FFDEEFEFFFFFFF
      FFFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF01010000010101010100
      0001010101010100020200010101000202000101010101000202020001010002
      0202000101010101000202020001010002020200010101010100020202000101
      0002020200010101000202020001010002020200010101000202020001010002
      0202000101010100020200010101000202000101010101010000010101010100
      000101010101}
    ButtonSettings.CloseButtonHint = 'Close'
    ButtonSettings.PageListButtonHint = 'Page List'
    ButtonSettings.ScrollButtonNextHint = 'Next'
    ButtonSettings.ScrollButtonPrevHint = 'Previous'
    ButtonSettings.ScrollButtonFirstHint = 'First'
    ButtonSettings.ScrollButtonLastHint = 'Last'
    TabReorder = False
    ShowShortCutHints = False
    TabOrder = 1
    NextPictureChanged = False
    PrevPictureChanged = False
    object tsMain: TAdvOfficePage
      Left = 1
      Top = 26
      Width = 554
      Height = 303
      Caption = 'Main date'
      PageAppearance.BorderColor = 14922381
      PageAppearance.Color = 16445929
      PageAppearance.ColorTo = 15587527
      PageAppearance.ColorMirror = 15587527
      PageAppearance.ColorMirrorTo = 16773863
      PageAppearance.Gradient = ggVertical
      PageAppearance.GradientMirror = ggVertical
      TabAppearance.BorderColor = clNone
      TabAppearance.BorderColorHot = 15383705
      TabAppearance.BorderColorSelected = 14922381
      TabAppearance.BorderColorSelectedHot = 6343929
      TabAppearance.BorderColorDisabled = clNone
      TabAppearance.BorderColorDown = clNone
      TabAppearance.Color = clBtnFace
      TabAppearance.ColorTo = clWhite
      TabAppearance.ColorSelected = 16709360
      TabAppearance.ColorSelectedTo = 16445929
      TabAppearance.ColorDisabled = clWhite
      TabAppearance.ColorDisabledTo = clSilver
      TabAppearance.ColorHot = 14542308
      TabAppearance.ColorHotTo = 16768709
      TabAppearance.ColorMirror = clWhite
      TabAppearance.ColorMirrorTo = clWhite
      TabAppearance.ColorMirrorHot = 14016477
      TabAppearance.ColorMirrorHotTo = 10736609
      TabAppearance.ColorMirrorSelected = 16445929
      TabAppearance.ColorMirrorSelectedTo = 16181984
      TabAppearance.ColorMirrorDisabled = clWhite
      TabAppearance.ColorMirrorDisabledTo = clSilver
      TabAppearance.Font.Charset = DEFAULT_CHARSET
      TabAppearance.Font.Color = clWindowText
      TabAppearance.Font.Height = -11
      TabAppearance.Font.Name = 'Tahoma'
      TabAppearance.Font.Style = []
      TabAppearance.Gradient = ggVertical
      TabAppearance.GradientMirror = ggVertical
      TabAppearance.GradientHot = ggRadial
      TabAppearance.GradientMirrorHot = ggVertical
      TabAppearance.GradientSelected = ggVertical
      TabAppearance.GradientMirrorSelected = ggVertical
      TabAppearance.GradientDisabled = ggVertical
      TabAppearance.GradientMirrorDisabled = ggVertical
      TabAppearance.TextColor = 9126421
      TabAppearance.TextColorHot = 9126421
      TabAppearance.TextColorSelected = 9126421
      TabAppearance.TextColorDisabled = clGray
      TabAppearance.ShadowColor = 15255470
      TabAppearance.HighLightColor = 16775871
      TabAppearance.HighLightColorHot = 16643309
      TabAppearance.HighLightColorSelected = 6540536
      TabAppearance.HighLightColorSelectedHot = 12451839
      TabAppearance.HighLightColorDown = 16776144
      TabAppearance.BackGround.Color = 16767935
      TabAppearance.BackGround.ColorTo = clNone
      TabAppearance.BackGround.Direction = gdHorizontal
      object Panel1: TPanel
        Left = 2
        Top = 2
        Width = 550
        Height = 299
        Align = alClient
        Caption = ' '
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 14
          Width = 33
          Height = 13
          Caption = 'Name'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 8
          Top = 173
          Width = 32
          Height = 13
          Caption = 'Capital'
        end
        object Label8: TLabel
          Left = 224
          Top = 173
          Width = 42
          Height = 13
          Caption = 'Currency'
        end
        object Image1: TImage
          Left = 272
          Top = 248
          Width = 41
          Height = 32
          Center = True
        end
        object Label2: TLabel
          Left = 8
          Top = 82
          Width = 42
          Height = 26
          Caption = 'Register office'
          FocusControl = DBEdit3
          WordWrap = True
        end
        object Label3: TLabel
          Left = 8
          Top = 116
          Width = 37
          Height = 13
          Caption = 'Director'
          FocusControl = DBEdit4
        end
        object Label4: TLabel
          Left = 8
          Top = 136
          Width = 53
          Height = 26
          Caption = 'Secretarial company'
          FocusControl = DBEdit5
          WordWrap = True
        end
        object Label9: TLabel
          Left = 8
          Top = 205
          Width = 44
          Height = 13
          Caption = 'Comment'
          FocusControl = DBEdit8
        end
        object Label6: TLabel
          Left = 8
          Top = 38
          Width = 26
          Height = 13
          Caption = 'Index'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 8
          Top = 260
          Width = 43
          Height = 26
          Caption = 'Stopped activity'
          FocusControl = DBEdit8
          WordWrap = True
        end
        object Label10: TLabel
          Left = 8
          Top = 228
          Width = 34
          Height = 26
          Caption = 'Started activity'
          FocusControl = DBEdit8
          WordWrap = True
        end
        object Bevel1: TBevel
          Left = 248
          Top = 231
          Width = 201
          Height = 65
        end
        object Label12: TLabel
          Left = 8
          Top = 63
          Width = 54
          Height = 13
          Caption = 'Short name'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 69
          Top = 9
          Width = 236
          Height = 21
          DataField = 'NAME'
          DataSource = dsCAProp
          TabOrder = 0
        end
        object RxDBLookupCombo4: TRxDBLookupCombo
          Left = 272
          Top = 170
          Width = 92
          Height = 21
          DropDownCount = 8
          DataField = 'ID_CUR'
          DataSource = dsCAProp
          LookupField = 'ID_CUR'
          LookupDisplay = 'CURNAME'
          LookupSource = dsCur
          TabOrder = 8
        end
        object Button1: TButton
          Left = 328
          Top = 252
          Width = 75
          Height = 25
          Caption = 'Load icon'
          TabOrder = 10
          OnClick = Button1Click
        end
        object RxDBCalcEdit2: TRxDBCalcEdit
          Left = 69
          Top = 170
          Width = 121
          Height = 21
          DataField = 'CAPITAL'
          DataSource = dsCAProp
          NumGlyphs = 2
          TabOrder = 7
        end
        object DBEdit3: TDBEdit
          Left = 69
          Top = 86
          Width = 317
          Height = 21
          DataField = 'ADDR'
          DataSource = dsCAProp
          TabOrder = 4
        end
        object DBEdit4: TDBEdit
          Left = 69
          Top = 112
          Width = 317
          Height = 21
          DataField = 'DIRECTOR'
          DataSource = dsCAProp
          TabOrder = 5
        end
        object DBEdit5: TDBEdit
          Left = 69
          Top = 140
          Width = 317
          Height = 21
          DataField = 'BUH'
          DataSource = dsCAProp
          TabOrder = 6
        end
        object DBEdit8: TDBEdit
          Left = 69
          Top = 201
          Width = 317
          Height = 21
          DataField = 'COMMENTS'
          DataSource = dsCAProp
          TabOrder = 9
        end
        object cbSTATUSNAME: TDBComboBox
          Left = 318
          Top = 8
          Width = 66
          Height = 21
          Style = csDropDownList
          DataField = 'STATUSNAME'
          DataSource = dsCAProp
          ItemHeight = 13
          TabOrder = 1
        end
        object edAIndex: TDBEdit
          Left = 69
          Top = 33
          Width = 236
          Height = 21
          DataField = 'AIndex'
          DataSource = dsCAProp
          MaxLength = 6
          TabOrder = 2
        end
        object DBDateEdit1: TDBDateEdit
          Left = 69
          Top = 262
          Width = 121
          Height = 21
          DataField = 'DELETEDFROM'
          DataSource = dsCAProp
          NumGlyphs = 2
          TabOrder = 11
        end
        object DBDateEdit2: TDBDateEdit
          Left = 69
          Top = 230
          Width = 121
          Height = 21
          DataField = 'STARTACTIVITY'
          DataSource = dsCAProp
          NumGlyphs = 2
          TabOrder = 12
        end
        object DBEdit2: TDBEdit
          Left = 69
          Top = 58
          Width = 140
          Height = 21
          DataField = 'SHORTNAME'
          DataSource = dsCAProp
          MaxLength = 10
          TabOrder = 3
        end
      end
    end
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
  object dsCur: TDataSource
    DataSet = qCur
    Left = 288
    Top = 128
  end
  object qCAProp2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_CA'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from DW_CA where id_CA = :id_CA'
      ' '
      ' ')
    Left = 40
    Top = 64
  end
  object dsCAProp: TDataSource
    DataSet = cdsCAProp
    Left = 80
    Top = 64
  end
  object cdsCAProp: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_CA'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProvider1'
    Left = 32
    Top = 8
  end
  object SQLUpdateDSProvider1: TSQLUpdateDSProvider
    DataSet = qCAProp2
    Constraints = True
    ModifySQL.Strings = (
      'update RF_CA'
      '  SET Name = :Name,'
      '  id_CATYPE = :id_CATYPE,'
      '  id_Activity = :id_Activity,'
      '  id_Cat = :id_Cat,'
      '  id_Icons = :id_Icons,'
      '  AColor = :AColor,'
      '  '
      '  Overdraft_limit = :Overdraft_limit,'
      '  Overdraft_Cur = :Overdraft_Cur,'
      '  '
      '  Turnover_limit = :Turnover_limit,'
      '  Turnover_Cur = :Turnover_Cur,'
      '  '
      '  BJ_limit = :BJ_limit,'
      '  BJ_Cur = :BJ_Cur'
      'where id_CA = :id_CA')
    InsertSQL.Strings = (
      'INSERT INTO RF_CA'
      '(:Name,:id_CATYPE,:id_Activity, :id_Cat, :id_Icons, :AColor,'
      ':Overdraft_limit, :Overdraft_Cur,'
      ':Turnover_limit, :Turnover_Cur,'
      ':BJ_limit, :BJ_Cur)'
      'VALUES'
      '(Name, id_CATYPE, id_Activity, id_Cat, id_Icons, AColor,'
      'Overdraft_limit, Overdraft_Cur,'
      'Turnover_limit, Turnover_Cur,'
      'BJ_limit, BJ_Cur)')
    Left = 160
    Top = 96
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qCAProp2
    Constraints = True
    Left = 24
    Top = 48
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'AIndex'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'PID'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 38
        Size = 19
        Value = Null
      end
      item
        Name = 'Name'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'StatusName'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'id_Icons'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 38
        Size = 19
        Value = Null
      end
      item
        Name = 'Comments'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 2000
        Value = Null
      end
      item
        Name = 'Addr'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'JurAdr'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'JurName'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'Director'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'Buh'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'Capital'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 4
        Precision = 18
        Size = 19
        Value = Null
      end
      item
        Name = 'id_Cur'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 38
        Size = 19
        Value = Null
      end
      item
        Name = 'DELETEDFROM'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'STARTACTIVITY'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'AColor'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 38
        Size = 19
        Value = Null
      end
      item
        Name = 'ShortName'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO dw_CA'
      
        '   (isGrp, AIndex, PID, Name, StatusName, id_Icons, Comments, Ad' +
        'dr,'
      'JurAdr, JurName,'
      'Director, Buh, Capital, id_Cur, DELETEDFROM,'
      'STARTACTIVITY, AColor, ShortName)'
      'VALUES'
      
        '(1, :AIndex, :PID, :Name, :StatusName, :id_Icons, :Comments, :Ad' +
        'dr,'
      ':JurAdr, :JurName,'
      ':Director, :Buh, :Capital, :id_Cur, :DELETEDFROM,'
      ':STARTACTIVITY, :AColor, :ShortName)'
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
      ' ')
    Left = 144
    Top = 24
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'PID'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 38
        Size = 19
        Value = Null
      end
      item
        Name = 'Name'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'StatusName'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'id_Icons'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 38
        Size = 19
        Value = Null
      end
      item
        Name = 'Comments'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 2000
        Value = Null
      end
      item
        Name = 'Addr'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'JurAdr'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'JurName'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'Director'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'Buh'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'Capital'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        NumericScale = 4
        Precision = 18
        Size = 19
        Value = Null
      end
      item
        Name = 'id_Cur'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 38
        Size = 19
        Value = Null
      end
      item
        Name = 'AIndex'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'DELETEDFROM'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'STARTACTIVITY'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'ShortName'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'id_CA'
        Attributes = [paSigned]
        DataType = ftBCD
        Precision = 38
        Size = 19
        Value = Null
      end>
    SQL.Strings = (
      'update dw_CA'
      '  SET'
      '    PID = :PID,'
      '    Name = :Name,'
      '    StatusName = :StatusName,'
      '    id_Icons = :id_Icons,'
      '    Comments = :Comments,'
      '    Addr = :Addr,'
      '    JurAdr = :JurAdr,'
      '    JurName = :JurName,'
      '    Director = :Director,'
      '    Buh = :Buh,'
      '    Capital = :Capital,'
      
        '    id_Cur = :id_Cur, AIndex = :AIndex , DELETEDFROM = :DELETEDF' +
        'ROM,'
      '    STARTACTIVITY = :STARTACTIVITY, ShortName = :ShortName'
      'where id_CA = :id_CA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 184
    Top = 24
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'Icons (*.ico)|*.ico'
    Left = 248
    Top = 192
  end
  object qPicSave: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'PIC'
        DataType = ftVarBytes
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'insert into dw_ICONS (PIC)  values(:PIC)'
      ' ')
    Left = 232
    Top = 16
  end
  object qPicUpd: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'PIC'
        DataType = ftVarBytes
        Size = -1
        Value = Null
      end
      item
        Name = 'id_Icons'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'update dw_ICONS  set PIC = :PIC'
      'where id_Icons = :id_Icons'
      ' '
      ' ')
    Left = 264
    Top = 16
  end
  object ilButtons: TImageList
    Left = 136
    Top = 122
    Bitmap = {
      494C01010C000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008402
      0400FCFE0400FC02040084020400000000000000000004028400000000000402
      FC00040284000402040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008402
      0400FCFE0400FC02040084020400000000000000000004028400000000000402
      FC00040284000402040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000008402
      0400FCFE0400FC02040084020400000000000000000004028400000000000402
      FC00040284000402040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      840000848400000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008402
      0400C4C2C400FCFE0400FC020400000000000000000004028400FCFEFC00C4C2
      C4000402FC000402040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      840000848400008484000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000840204008402040084020400000000000000000000000000040284000402
      8400040284000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000848400008484000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000004020400C4C2C4000402040000000000000000000000000084828400C4C2
      C400040204000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000000000000
      00000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000084840000848400008484000084
      8400008484000084840000848400000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000004020400C4C2C4000402040000000000000000000000000084828400C4C2
      C400040204000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000080000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000004020400C4C2C4000402040000000000000000000000000084828400C4C2
      C400040204000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      80000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000402040000000000000000000402
      040004020400C4C2C40004020400000000000000000000000000040204000402
      0400040204000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000008080000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000008482840004020400040204008482
      840084828400C4C2C40084828400040204000402040004020400848284000402
      0400040204000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000000000FF
      FF0000000000008080000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000C4C2C400FCFEFC00FCFEFC00C4C2
      C400C4C2C400C4C2C400C4C2C400C4C2C400C4C2C400FCFEFC0004020400C4C2
      C400040204000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF00000000000080800000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000008482840084828400FCFE
      FC00FCFEFC00FCFEFC00FCFEFC00FCFEFC00FCFEFC0004020400C4C2C400C4C2
      C400848284000402040000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF000080800000808000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840000FF000000FF000000FF
      000000FF000000FF000000FF00000000000000000000000000000000FF000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000008482
      8400848284008482840084828400848284008482840084828400C4C2C400C4C2
      C400848284000402040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000808000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084828400C4C2C400C4C2
      C400848284000402040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000000000000848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      000000FF0000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084828400FCFEFC00C4C2
      C400848284000402040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084828400848284008482
      8400848284000402040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000808000008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808000008080000080800000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000080808000808080008080
      800080808000808080008080800080808000808080000000000080800000FFFF
      0000FFFF0000FFFFFF0000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFF00008080
      0000808000008080000080800000808000000000000080800000FFFF0000FFFF
      0000FFFFFF000000000000000000000000008000000080000000800000008000
      0000800000008000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      00008080000080800000808000000000000080800000FFFF0000FFFF0000FFFF
      FF0000000000808000000000000000000000800000008000000000FFFF0000FF
      FF0000FFFF0000FFFF0080000000800000008000000080000000800000008000
      00008000000000FFFF0000FFFF00800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF000000800000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000808000000000000080800000FFFF0000FFFF0000FFFFFF000000
      00000000000000000000000000000000000000FFFF0000FFFF00800000008000
      0000008080000080800080000000008080008000000080000000008080000080
      8000800000000080800000FFFF00800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000008000000080000000800000008000000080
      00000080000000800000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080800000FFFF0000FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000008080008000000080000000008080008000000000808000008080008000
      0000800000000080800000FFFF00800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF000000800000008000000080000000800000008000000080
      00000080000000800000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080800000FFFF0000FFFF0000FFFFFF0000000000000000000000
      000000000000000000000000000000000000FF00000080000000FF0000008000
      000080000000FF000000FF000000FF000000FF00000080000000FF000000FF00
      00008000000000FFFF0080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000008000000080000000800000008000000080
      00000080000000800000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      000080800000FFFF0000FFFF0000FFFFFF000000000080800000808080000000
      0000000000000000000000000000000000008000000080000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF00000080000000FF000000FF00
      000000FFFF008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF000000800000FFFF0000FFFF00008080
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000008080
      0000FFFF0000FFFF0000FFFFFF0000000000FFFF000080800000808000008080
      8000000000000000000000000000000000008000000080000000800000008000
      00008000000080000000800000008000000080000000800000008000000000FF
      FF00800000008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008400000084000000000000000000000080800000FFFF
      0000FFFF0000FFFFFF00000000000000000000000000FFFF0000808000008080
      0000808080000000000000000000000000008000000080000000800000008000
      000080000000800000008000000080000000800000008000000000FFFF008000
      0000800000008000000080000000800000000000000080800000FFFF000000FF
      0000FFFF000000FF0000FFFF000000FF0000FFFF000000FF0000FFFF00008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000840000008400000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000FFFF000000FF
      0000FFFF000000FF0000FFFF000000FF0000FFFF000000FF0000FFFF00008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080800000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080800000808000008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C0000000000000000000000000000000000000000000000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F0000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000000000000000000000000000000000007F7F7F000000
      00000000000000000000BFBFBF00BFBFBF00BFBFBF0000000000000000000000
      000000000000000000007F7F7F00000000008000000080000000800000008000
      000080000000800000008080800080000000FFFFFF0080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00000FFFF0000FFFF0000FFFF00C0C0C000C0C0
      C00000000000000000000000000000000000000000007F7F7F0000000000BFBF
      BF007F7F7F000000000000000000BFBFBF00BFBFBF00000000007F7F7F00BFBF
      BF0000000000000000007F7F7F00000000008000000080000000808080008080
      800080808000808080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008000000080000000000000008080800080808000808080000000
      000000000000FF000000FF000000FF000000FF000000FF000000FF000000FFFF
      FF000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080008080800080808000C0C0C000C0C0
      C00000000000C0C0C000000000000000000000000000000000007F7F7F00BFBF
      BF007F7F7F00BFBFBF00BFBFBF007F7F7F0000000000BFBFBF007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000008000000080000000808080008080
      800080808000808080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000800000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000000000000000
      0000BFBFBF00BFBFBF0000000000FFFFFF00FFFFFF0000000000BFBFBF000000
      00000000000000000000000000007F7F7F008000000080000000808080008080
      800080808000808080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000800000000000000000000000FFFFFF00800000008000
      000000000000FF000000FF000000FF000000FF000000FF000000FF000000FFFF
      FF000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C00000000000C0C0C000000000007F7F7F0000000000BFBFBF000000
      0000BFBFBF0000000000BFBFBF00BFBFBF00BFBFBF00FFFFFF007F7F7F000000
      0000BFBFBF00BFBFBF00000000007F7F7F008000000080000000808080008080
      800080808000808080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000800000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C00000000000C0C0C00000000000000000007F7F7F0000000000BFBFBF00BFBF
      BF00FFFFFF00000000007F7F7F0000000000BFBFBF00FFFFFF007F7F7F00BFBF
      BF00BFBFBF00BFBFBF00000000007F7F7F008000000080000000808080008080
      800080808000808080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000800000000000000000000000FFFFFF00800000008000
      00008000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C0C0C00000000000C0C0C000000000007F7F7F0000000000000000000000
      0000FFFFFF00000000007F7F7F007F7F7F00BFBFBF0000000000BFBFBF000000
      0000000000000000000000000000000000008000000080000000808080008080
      800080808000808080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000800000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF00FFFFFF00000000000000000000000000BFBFBF00BFBFBF000000
      0000000000007F7F7F0000000000000000008000000080000000808080008080
      800080808000808080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000800000000000000000000000FFFFFF00800000008000
      000080000000800000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000080808000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000007F7F7F00BFBF
      BF007F7F7F00BFBFBF00FFFFFF00FFFFFF00BFBFBF00BFBFBF007F7F7F007F7F
      7F007F7F7F00000000007F7F7F00000000008000000080000000808080008080
      80008080800080808000800000000000000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0080000000800000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C0000000000000000000000000000000
      0000FFFFFF00FFFFFF0080808000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000007F7F7F0000000000BFBF
      BF007F7F7F000000000000000000BFBFBF000000000000000000BFBFBF00BFBF
      BF00000000007F7F7F0000000000000000000000000080000000800000008000
      0000800000008000000000000000000000000000000080000000800000008000
      00008000000080000000000000000000000000000000FFFFFF00800000008000
      00008000000080000000FFFFFF00C0C0C000FFFFFF0080000000800000008000
      0000800000008000000080808000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F0000000000BFBFBF00BFBFBF00BFBFBF00000000007F7F7F000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F0000000000000000000000000000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000E1A3847F000FFFFFE1A300EF0007DFFB
      E1A331BF00038FFFE18339FF000187F7F1C7993F0000C7EFF1C7CA1F0000E3CF
      F1C7F40F0000F19FF1C79C070007F83F61C796030003FC7F0007CB018003F83F
      0007FF80C001F19F8003F7C0C000C3CFE003FFE0C00087E7FF83EFF0C0018FFB
      FF83FFF8FFC3FFFFFF83FFFCFFE7FFFFFFFFFFFFFFFFFFFF0000800F000FFFE0
      0000800F000F00000000800F000F00010000800F000F80030000800F000FC001
      0000800F000FE00100008003000FF01F00008003008FF01F000080031144E00F
      0000800F0AB8C0070000800F057C81030000800FFAFC03810000800FFDF807C1
      0000800FFE04FFFFFFFF800FFFFFFFFFFFFFFFFEFFFFFC7FFFFFFF0CC007FC27
      F83FFC008003EC230001F8050001C4010001F80500018001000100060001C001
      000100060000E0000001000600000000000100068000000000010005C0000003
      00010005E001E00300010001E007C00101010001F007800383830001F003C407
      FFFF0001F803EC3FFFFF0001FFFFFC7F00000000000000000000000000000000
      000000000000}
  end
  object qStat: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select FTName as STATUSNAME'
      'from DW_FT'
      'WHERE deleted = 0'
      ' order by OrderID, FTName'
      ' ')
    Left = 288
    Top = 176
  end
  object dsStat: TDataSource
    DataSet = qStat
    Left = 328
    Top = 176
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 232
    Top = 144
  end
end
