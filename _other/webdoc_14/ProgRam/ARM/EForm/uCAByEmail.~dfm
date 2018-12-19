object CAByEmail: TCAByEmail
  Left = 277
  Top = 111
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Выберите юр. лицо'
  ClientHeight = 314
  ClientWidth = 920
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
  object Panel2: TsPanel
    Left = 0
    Top = 273
    Width = 920
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object btnCancel: TsButton
      Left = 784
      Top = 9
      Width = 125
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Потом поставлю'
      ModalResult = 2
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON'
    end
    object btnOk: TsButton
      Left = 624
      Top = 9
      Width = 138
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Выбрать'
      Default = True
      Enabled = False
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 920
    Height = 89
    Align = alTop
    Caption = ' Кто это '
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 48
      Height = 16
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 34
      Width = 305
      Height = 47
      Caption = ' Продавец '
      TabOrder = 0
      OnDragDrop = GroupBox2DragDrop
      OnDragOver = GroupBox2DragOver
      object lbSeller: TLabel
        Left = 24
        Top = 16
        Width = 46
        Height = 16
        Caption = 'lbSeller'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Button1: TButton
        Left = 5
        Top = 16
        Width = 16
        Height = 16
        Caption = 'X'
        TabOrder = 0
        OnClick = Button1Click
      end
    end
    object GroupBox3: TGroupBox
      Left = 352
      Top = 34
      Width = 313
      Height = 47
      Caption = ' Покупатель '
      TabOrder = 1
      OnDragDrop = GroupBox3DragDrop
      OnDragOver = GroupBox2DragOver
      object lbBayer: TLabel
        Left = 24
        Top = 16
        Width = 47
        Height = 16
        Caption = 'lbBayer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Button2: TButton
        Left = 5
        Top = 16
        Width = 16
        Height = 16
        Caption = 'X'
        TabOrder = 0
        OnClick = Button2Click
      end
    end
  end
  object DBAdvGrid1: TDBAdvGrid
    Left = 0
    Top = 89
    Width = 920
    Height = 184
    Cursor = crDefault
    Align = alClient
    ColCount = 4
    RowCount = 2
    FixedRows = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
    OnMouseDown = DBAdvGrid1MouseDown
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ActiveCellColor = 15387318
    ControlLook.FixedGradientFrom = clWhite
    ControlLook.FixedGradientTo = clSilver
    ControlLook.FixedGradientHoverFrom = 13619409
    ControlLook.FixedGradientHoverTo = 12502728
    ControlLook.FixedGradientHoverMirrorFrom = 12502728
    ControlLook.FixedGradientHoverMirrorTo = 11254975
    ControlLook.FixedGradientHoverBorder = 12033927
    ControlLook.FixedGradientDownFrom = 8816520
    ControlLook.FixedGradientDownTo = 7568510
    ControlLook.FixedGradientDownMirrorFrom = 7568510
    ControlLook.FixedGradientDownMirrorTo = 6452086
    ControlLook.FixedGradientDownBorder = 14991773
    ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownHeader.Font.Color = clWindowText
    ControlLook.DropDownHeader.Font.Height = -11
    ControlLook.DropDownHeader.Font.Name = 'Tahoma'
    ControlLook.DropDownHeader.Font.Style = []
    ControlLook.DropDownHeader.Visible = True
    ControlLook.DropDownHeader.Buttons = <>
    ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownFooter.Font.Color = clWindowText
    ControlLook.DropDownFooter.Font.Height = -11
    ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
    ControlLook.DropDownFooter.Font.Style = []
    ControlLook.DropDownFooter.Visible = True
    ControlLook.DropDownFooter.Buttons = <>
    Filter = <>
    FilterDropDown.Font.Charset = DEFAULT_CHARSET
    FilterDropDown.Font.Color = clWindowText
    FilterDropDown.Font.Height = -11
    FilterDropDown.Font.Name = 'MS Sans Serif'
    FilterDropDown.Font.Style = []
    FilterDropDownClear = '(All)'
    FixedColWidth = 10
    FixedRowHeight = 22
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = [fsBold]
    FloatFormat = '%.2f'
    Look = glTMS
    PrintSettings.DateFormat = 'dd/mm/yyyy'
    PrintSettings.Font.Charset = DEFAULT_CHARSET
    PrintSettings.Font.Color = clWindowText
    PrintSettings.Font.Height = -11
    PrintSettings.Font.Name = 'MS Sans Serif'
    PrintSettings.Font.Style = []
    PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
    PrintSettings.FixedFont.Color = clWindowText
    PrintSettings.FixedFont.Height = -11
    PrintSettings.FixedFont.Name = 'MS Sans Serif'
    PrintSettings.FixedFont.Style = []
    PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
    PrintSettings.HeaderFont.Color = clWindowText
    PrintSettings.HeaderFont.Height = -11
    PrintSettings.HeaderFont.Name = 'MS Sans Serif'
    PrintSettings.HeaderFont.Style = []
    PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
    PrintSettings.FooterFont.Color = clWindowText
    PrintSettings.FooterFont.Height = -11
    PrintSettings.FooterFont.Name = 'MS Sans Serif'
    PrintSettings.FooterFont.Style = []
    PrintSettings.PageNumSep = '/'
    ScrollWidth = 16
    SearchFooter.ColorTo = 13160660
    SearchFooter.FindNextCaption = 'Find &next'
    SearchFooter.FindPrevCaption = 'Find &previous'
    SearchFooter.Font.Charset = DEFAULT_CHARSET
    SearchFooter.Font.Color = clWindowText
    SearchFooter.Font.Height = -11
    SearchFooter.Font.Name = 'MS Sans Serif'
    SearchFooter.Font.Style = []
    SearchFooter.HighLightCaption = 'Highlight'
    SearchFooter.HintClose = 'Close'
    SearchFooter.HintFindNext = 'Find next occurence'
    SearchFooter.HintFindPrev = 'Find previous occurence'
    SearchFooter.HintHighlight = 'Highlight occurences'
    SearchFooter.MatchCaseCaption = 'Match case'
    Version = '2.1.12.7'
    AutoCreateColumns = True
    AutoRemoveColumns = True
    Columns = <
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        Width = 10
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'ObjName'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = 'Юр. лицо'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        Width = 256
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'CAName'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = 'Принадлежность'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        Width = 184
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'EmailFrom'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header = 'e-mail'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'MS Sans Serif'
        PrintFont.Style = []
        Width = 223
      end>
    DataSource = dsFindCAByEmail
    InvalidPicture.Data = {
      055449636F6E0000010001002020040000000000E80200001600000028000000
      2000000040000000010004000000000000020000000000000000000000000000
      0000000000000000000080000080000000808000800000008000800080800000
      80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
      FFFFFF000000000000777777777777000000000000000000777788FFFF887777
      000000000000007778F8887117788F877700000000000778F87111111111178F
      877000000000778871111111111999178877000000077F811111111111199999
      18F7700000778811111111111119999991887700007881111111111111119199
      99188700077F711111811111111198719997F7700788111118FF111111118FF7
      1991887077F71111888FF1111118FFFF19997F77778111118888FF1111888FF8
      911918777881111118888FF1188888811111188778811111118888FF88888811
      111117877F7111111118888888888111111117F77F7999111111888888881111
      111111F77F7999991111788888F71111111111F77F7999999917888888FF7111
      111117F778879999917FFF88888FF111111117877887999997FFFFF88888FF11
      11111887778799997FFFFFF798888FF11111187777F87997FFFFFF71178F88FF
      71117F7707887997FFFFF7999978F88871118870077F87997FFF799999978F87
      1117F77000788879978799999999787111188700007788879999999999999999
      1188770000077F88799999999999999778F77000000077888879999999999778
      8877000000000778F88877799777788F877000000000007778F8888878888F87
      7700000000000000777788FFFF88777700000000000000000077777777777700
      00000000FFC003FFFF0000FFFC00003FF800001FF000000FE0000007C0000003
      C000000380000001800000010000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000001
      80000001C0000003C0000003E0000007F000000FF800001FFC00003FFF0000FF
      FFC003FF}
    ShowUnicode = False
    ColWidths = (
      10
      256
      184
      223)
  end
  object dsFindCAByEmail: TDataSource
    DataSet = DM.cdsFindCAByEmail
    Left = 176
    Top = 8
  end
end
