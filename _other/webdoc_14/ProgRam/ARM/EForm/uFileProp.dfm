object FileProp: TFileProp
  Left = 330
  Top = 35
  BorderStyle = bsDialog
  Caption = 'Файл'
  ClientHeight = 467
  ClientWidth = 813
  Color = clBtnFace
  Constraints.MinHeight = 100
  Constraints.MinWidth = 350
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TsPanel
    Left = 0
    Top = 426
    Width = 813
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sSpeedButton1: TsSpeedButton
      Left = 8
      Top = 8
      Width = 105
      Height = 25
      Action = aNote
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 40
      Images = DM.ilImage
    end
    object sSpeedButton2: TsSpeedButton
      Left = 136
      Top = 8
      Width = 121
      Height = 25
      Action = aCopyData
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 43
      Images = DM.ilImage
    end
    object sSpeedButton3: TsSpeedButton
      Left = 272
      Top = 8
      Width = 145
      Height = 25
      Action = aPasteData
      ParentShowHint = False
      ShowHint = True
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 41
      Images = DM.ilImage
    end
    object btnCancel: TsButton
      Left = 722
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnOk: TsButton
      Left = 634
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object pcData: TsPageControl
    Left = 0
    Top = 0
    Width = 813
    Height = 426
    ActivePage = tsInfo
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'PAGECONTROL'
    object tsInfo: TsTabSheet
      Caption = 'Информация'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object pnCA: TsPanel
        Left = 0
        Top = 63
        Width = 805
        Height = 262
        Align = alTop
        Caption = ' '
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object sPanel13: TsPanel
          Left = 1
          Top = 230
          Width = 803
          Height = 31
          Align = alTop
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 0
          SkinData.SkinSection = 'PANEL'
          object sSpeedButton7: TsSpeedButton
            Left = 705
            Top = 3
            Width = 17
            Height = 22
            Caption = '<'
            OnClick = sSpeedButton4Click
            SkinData.SkinSection = 'SPEEDBUTTON'
            DropdownMenu = pmStateName
          end
          object sLabel3: TsLabel
            Left = 7
            Top = 7
            Width = 34
            Height = 13
            Caption = 'Статус'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object sButton1: TsButton
            Left = 678
            Top = 3
            Width = 25
            Height = 22
            Caption = '...'
            TabOrder = 0
            OnClick = sButton1Click
            SkinData.SkinSection = 'BUTTON'
          end
          object edStateName: TsDBEdit
            Left = 126
            Top = 4
            Width = 554
            Height = 21
            Color = clWhite
            DataField = 'StateName'
            DataSource = dsFileProp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            OnKeyDown = edUnNameKeyDown
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
        end
        object ppW5: TsPanel
          Left = 1
          Top = 201
          Width = 803
          Height = 29
          Align = alTop
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 1
          SkinData.SkinSection = 'PANEL'
          object sSpeedButton6: TsSpeedButton
            Left = 705
            Top = 4
            Width = 17
            Height = 22
            Caption = '<'
            OnClick = sSpeedButton4Click
            SkinData.SkinSection = 'SPEEDBUTTON'
            DropdownMenu = pmWorkTypeName
          end
          object Label2: TsLabel
            Left = 6
            Top = 8
            Width = 59
            Height = 13
            Caption = 'Тематика 5'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object edWorkTypeName: TsDBEdit
            Left = 126
            Top = 5
            Width = 554
            Height = 21
            Color = clWhite
            DataField = 'WorkTypeName5'
            DataSource = dsFileProp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnKeyDown = edUnNameKeyDown
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object Button5: TsButton
            Left = 678
            Top = 4
            Width = 25
            Height = 22
            Caption = '...'
            TabOrder = 1
            OnClick = Button5Click
            SkinData.SkinSection = 'BUTTON'
          end
        end
        object ppW1: TsPanel
          Left = 1
          Top = 85
          Width = 803
          Height = 29
          Align = alTop
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 2
          SkinData.SkinSection = 'PANEL'
          object sSpeedButton9: TsSpeedButton
            Left = 705
            Top = 4
            Width = 17
            Height = 22
            Caption = '<'
            OnClick = sSpeedButton4Click
            SkinData.SkinSection = 'SPEEDBUTTON'
            DropdownMenu = pmWorkTypeName
          end
          object sLabel4: TsLabel
            Left = 6
            Top = 8
            Width = 59
            Height = 13
            Caption = 'Тематика 1'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object sDBEdit2: TsDBEdit
            Left = 126
            Top = 5
            Width = 554
            Height = 21
            Color = clWhite
            DataField = 'WorkTypeName1'
            DataSource = dsFileProp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnKeyDown = edUnNameKeyDown
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sButton2: TsButton
            Left = 678
            Top = 4
            Width = 25
            Height = 22
            Caption = '...'
            TabOrder = 1
            OnClick = sButton2Click
            SkinData.SkinSection = 'BUTTON'
          end
        end
        object ppW2: TsPanel
          Left = 1
          Top = 114
          Width = 803
          Height = 29
          Align = alTop
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 3
          SkinData.SkinSection = 'PANEL'
          object sSpeedButton10: TsSpeedButton
            Left = 705
            Top = 4
            Width = 17
            Height = 22
            Caption = '<'
            OnClick = sSpeedButton4Click
            SkinData.SkinSection = 'SPEEDBUTTON'
            DropdownMenu = pmWorkTypeName
          end
          object sLabel5: TsLabel
            Left = 6
            Top = 8
            Width = 59
            Height = 13
            Caption = 'Тематика 2'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object sDBEdit19: TsDBEdit
            Left = 126
            Top = 5
            Width = 554
            Height = 21
            Color = clWhite
            DataField = 'WorkTypeName2'
            DataSource = dsFileProp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnKeyDown = edUnNameKeyDown
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sButton3: TsButton
            Left = 678
            Top = 4
            Width = 25
            Height = 22
            Caption = '...'
            TabOrder = 1
            OnClick = sButton3Click
            SkinData.SkinSection = 'BUTTON'
          end
        end
        object ppW3: TsPanel
          Left = 1
          Top = 143
          Width = 803
          Height = 29
          Align = alTop
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 4
          SkinData.SkinSection = 'PANEL'
          object sSpeedButton11: TsSpeedButton
            Left = 705
            Top = 4
            Width = 17
            Height = 22
            Caption = '<'
            OnClick = sSpeedButton4Click
            SkinData.SkinSection = 'SPEEDBUTTON'
            DropdownMenu = pmWorkTypeName
          end
          object sLabel6: TsLabel
            Left = 6
            Top = 8
            Width = 59
            Height = 13
            Caption = 'Тематика 3'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object sDBEdit20: TsDBEdit
            Left = 126
            Top = 5
            Width = 554
            Height = 21
            Color = clWhite
            DataField = 'WorkTypeName3'
            DataSource = dsFileProp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnKeyDown = edUnNameKeyDown
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sButton4: TsButton
            Left = 678
            Top = 4
            Width = 25
            Height = 22
            Caption = '...'
            TabOrder = 1
            OnClick = sButton4Click
            SkinData.SkinSection = 'BUTTON'
          end
        end
        object ppW4: TsPanel
          Left = 1
          Top = 172
          Width = 803
          Height = 29
          Align = alTop
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 5
          SkinData.SkinSection = 'PANEL'
          object sSpeedButton12: TsSpeedButton
            Left = 705
            Top = 4
            Width = 17
            Height = 22
            Caption = '<'
            OnClick = sSpeedButton4Click
            SkinData.SkinSection = 'SPEEDBUTTON'
            DropdownMenu = pmWorkTypeName
          end
          object sLabel7: TsLabel
            Left = 6
            Top = 8
            Width = 59
            Height = 13
            Caption = 'Тематика 4'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object sDBEdit21: TsDBEdit
            Left = 126
            Top = 5
            Width = 554
            Height = 21
            Color = clWhite
            DataField = 'WorkTypeName4'
            DataSource = dsFileProp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnKeyDown = edUnNameKeyDown
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sButton5: TsButton
            Left = 678
            Top = 4
            Width = 25
            Height = 22
            Caption = '...'
            TabOrder = 1
            OnClick = sButton5Click
            SkinData.SkinSection = 'BUTTON'
          end
        end
        object sPanel2: TsPanel
          Left = 1
          Top = 1
          Width = 803
          Height = 84
          Align = alTop
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 6
          SkinData.SkinSection = 'PANEL'
          object sLabel1: TsLabel
            Left = 8
            Top = 10
            Width = 108
            Height = 13
            Caption = 'Название системное'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object sSpeedButton4: TsSpeedButton
            Left = 705
            Top = 34
            Width = 17
            Height = 22
            Caption = '<'
            OnClick = sSpeedButton4Click
            SkinData.SkinSection = 'SPEEDBUTTON'
            DropdownMenu = pmSellerName
          end
          object sSpeedButton5: TsSpeedButton
            Left = 705
            Top = 58
            Width = 17
            Height = 22
            Caption = '<'
            OnClick = sSpeedButton4Click
            SkinData.SkinSection = 'SPEEDBUTTON'
            DropdownMenu = pmBayerName
          end
          object Label8: TsLabel
            Left = 7
            Top = 39
            Width = 50
            Height = 13
            Caption = 'Продавец'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object Label1: TsLabel
            Left = 7
            Top = 63
            Width = 60
            Height = 13
            Caption = 'Покупатель'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object sDBEdit1: TsDBEdit
            Left = 127
            Top = 6
            Width = 577
            Height = 21
            Color = clWhite
            DataField = 'CalcName'
            DataSource = dsFileProp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object Button3: TsButton
            Left = 678
            Top = 34
            Width = 25
            Height = 22
            Caption = '...'
            TabOrder = 1
            OnClick = Button3Click
            SkinData.SkinSection = 'BUTTON'
          end
          object Button4: TsButton
            Left = 678
            Top = 58
            Width = 25
            Height = 22
            Caption = '...'
            TabOrder = 2
            OnClick = Button4Click
            SkinData.SkinSection = 'BUTTON'
          end
          object edBayerName: TsDBEdit
            Left = 126
            Top = 59
            Width = 554
            Height = 21
            Color = clWhite
            DataField = 'BayerName'
            DataSource = dsFileProp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            OnKeyDown = edUnNameKeyDown
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object edSellerName: TsDBEdit
            Left = 126
            Top = 35
            Width = 554
            Height = 21
            Color = clWhite
            DataField = 'SellerName'
            DataSource = dsFileProp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            OnKeyDown = edUnNameKeyDown
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
        end
      end
      object sPanel122: TsPanel
        Left = 0
        Top = 399
        Width = 805
        Height = 27
        Align = alTop
        Caption = ' '
        TabOrder = 1
        Visible = False
        SkinData.SkinSection = 'PANEL'
        object lbAdv_Str1: TsLabel
          Left = 8
          Top = 7
          Width = 50
          Height = 13
          Caption = 'Продавец'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sDBEdit18: TsDBEdit
          Left = 128
          Top = 3
          Width = 554
          Height = 21
          Color = clWhite
          DataField = 'Adv_Str1'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnKeyDown = edUnNameKeyDown
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object btnAdv1: TsButton
          Left = 680
          Top = 2
          Width = 25
          Height = 22
          Caption = '...'
          TabOrder = 1
          OnClick = btnAdv1Click
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object sPanel11: TsPanel
        Left = 0
        Top = 426
        Width = 805
        Height = 27
        Align = alTop
        Caption = ' '
        TabOrder = 2
        Visible = False
        SkinData.SkinSection = 'PANEL'
        object lbAdv_Str2: TsLabel
          Left = 8
          Top = 7
          Width = 60
          Height = 13
          Caption = 'Покупатель'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sDBEdit17: TsDBEdit
          Left = 128
          Top = 3
          Width = 554
          Height = 21
          Color = clWhite
          DataField = 'Adv_Str2'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnKeyDown = edUnNameKeyDown
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sButton10: TsButton
          Left = 680
          Top = 2
          Width = 25
          Height = 22
          Caption = '...'
          TabOrder = 1
          OnClick = sAdvv3Click
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object sPanel10: TsPanel
        Left = 0
        Top = 453
        Width = 805
        Height = 27
        Align = alTop
        Caption = ' '
        TabOrder = 3
        Visible = False
        SkinData.SkinSection = 'PANEL'
        object lbAdv_Str3: TsLabel
          Left = 8
          Top = 7
          Width = 60
          Height = 13
          Caption = 'Покупатель'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sDBEdit16: TsDBEdit
          Left = 128
          Top = 3
          Width = 554
          Height = 21
          Color = clWhite
          DataField = 'Adv_Str3'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnKeyDown = edUnNameKeyDown
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sButton9: TsButton
          Left = 680
          Top = 2
          Width = 25
          Height = 22
          Caption = '...'
          TabOrder = 1
          OnClick = saButton4Click
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object sPanel9: TsPanel
        Left = 0
        Top = 480
        Width = 805
        Height = 27
        Align = alTop
        Caption = ' '
        TabOrder = 4
        Visible = False
        SkinData.SkinSection = 'PANEL'
        object lbAdv_Str4: TsLabel
          Left = 8
          Top = 7
          Width = 60
          Height = 13
          Caption = 'Покупатель'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sDBEdit15: TsDBEdit
          Left = 128
          Top = 3
          Width = 554
          Height = 21
          Color = clWhite
          DataField = 'Adv_Str4'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnKeyDown = edUnNameKeyDown
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sButton8: TsButton
          Left = 680
          Top = 2
          Width = 25
          Height = 22
          Caption = '...'
          TabOrder = 1
          OnClick = saButton5Click
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object sPanel8: TsPanel
        Left = 0
        Top = 507
        Width = 805
        Height = 27
        Align = alTop
        Caption = ' '
        TabOrder = 5
        Visible = False
        SkinData.SkinSection = 'PANEL'
        object lbAdv_Str5: TsLabel
          Left = 8
          Top = 7
          Width = 60
          Height = 13
          Caption = 'Покупатель'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sDBEdit14: TsDBEdit
          Left = 128
          Top = 3
          Width = 554
          Height = 21
          Color = clWhite
          DataField = 'Adv_Str5'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnKeyDown = edUnNameKeyDown
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sButton7: TsButton
          Left = 680
          Top = 2
          Width = 25
          Height = 22
          Caption = '...'
          TabOrder = 1
          OnClick = saButton7Click
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object sPanel3: TsPanel
        Left = 0
        Top = 534
        Width = 805
        Height = 27
        Align = alTop
        Caption = ' '
        TabOrder = 6
        Visible = False
        SkinData.SkinSection = 'PANEL'
        object lbAdv_Str6: TsLabel
          Left = 8
          Top = 7
          Width = 50
          Height = 13
          Caption = 'Продавец'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sDBEdit9: TsDBEdit
          Left = 128
          Top = 3
          Width = 554
          Height = 21
          Color = clWhite
          DataField = 'Adv_Str6'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnKeyDown = edUnNameKeyDown
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sBtnAdv6: TsButton
          Left = 680
          Top = 2
          Width = 25
          Height = 22
          Caption = '...'
          TabOrder = 1
          OnClick = sBtnAdv6Click
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object sPanel4: TsPanel
        Left = 0
        Top = 561
        Width = 805
        Height = 27
        Align = alTop
        Caption = ' '
        TabOrder = 7
        Visible = False
        SkinData.SkinSection = 'PANEL'
        object lbAdv_Str7: TsLabel
          Left = 8
          Top = 7
          Width = 60
          Height = 13
          Caption = 'Покупатель'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sDBEdit11: TsDBEdit
          Left = 128
          Top = 3
          Width = 554
          Height = 21
          Color = clWhite
          DataField = 'Adv_Str7'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnKeyDown = edUnNameKeyDown
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sBtnAdv7: TsButton
          Left = 680
          Top = 2
          Width = 25
          Height = 22
          Caption = '...'
          TabOrder = 1
          OnClick = sBtnAdv7Click
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object sPanel5: TsPanel
        Left = 0
        Top = 588
        Width = 805
        Height = 27
        Align = alTop
        Caption = ' '
        TabOrder = 8
        Visible = False
        SkinData.SkinSection = 'PANEL'
        object lbAdv_Str8: TsLabel
          Left = 8
          Top = 7
          Width = 60
          Height = 13
          Caption = 'Покупатель'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sDBEdit10: TsDBEdit
          Left = 128
          Top = 3
          Width = 554
          Height = 21
          Color = clWhite
          DataField = 'Adv_Str8'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnKeyDown = edUnNameKeyDown
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sBtnAdv8: TsButton
          Left = 680
          Top = 2
          Width = 25
          Height = 22
          Caption = '...'
          TabOrder = 1
          OnClick = sBtnAdv8Click
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object sPanel7: TsPanel
        Left = 0
        Top = 615
        Width = 805
        Height = 27
        Align = alTop
        Caption = ' '
        TabOrder = 9
        Visible = False
        SkinData.SkinSection = 'PANEL'
        object lbAdv_Str9: TsLabel
          Left = 8
          Top = 7
          Width = 60
          Height = 13
          Caption = 'Покупатель'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sDBEdit13: TsDBEdit
          Left = 128
          Top = 3
          Width = 554
          Height = 21
          Color = clWhite
          DataField = 'Adv_Str9'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnKeyDown = edUnNameKeyDown
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sBtnAdv9: TsButton
          Left = 680
          Top = 2
          Width = 25
          Height = 22
          Caption = '...'
          TabOrder = 1
          OnClick = sBtnAdv9Click
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object sPanel6: TsPanel
        Left = 0
        Top = 642
        Width = 805
        Height = 27
        Align = alTop
        Caption = ' '
        TabOrder = 10
        Visible = False
        SkinData.SkinSection = 'PANEL'
        object lbAdv_Str10: TsLabel
          Left = 8
          Top = 7
          Width = 60
          Height = 13
          Caption = 'Покупатель'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sDBEdit12: TsDBEdit
          Left = 128
          Top = 3
          Width = 554
          Height = 21
          Color = clWhite
          DataField = 'Adv_Str10'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnKeyDown = edUnNameKeyDown
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sBtnAdv10: TsButton
          Left = 680
          Top = 2
          Width = 25
          Height = 22
          Caption = '...'
          TabOrder = 1
          OnClick = sBtnAdv10Click
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object sPanel1: TsPanel
        Left = 0
        Top = 325
        Width = 805
        Height = 74
        Align = alTop
        Caption = ' '
        TabOrder = 11
        SkinData.SkinSection = 'PANEL'
        object lbDOCCOMMENT: TsLabel
          Left = 575
          Top = 3
          Width = 50
          Height = 13
          Caption = 'Описание'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object lbNUM: TsLabel
          Left = 184
          Top = 3
          Width = 34
          Height = 13
          Caption = 'Номер'
          FocusControl = DBEdit3
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object lbDTNAME: TsLabel
          Left = 8
          Top = 3
          Width = 76
          Height = 13
          Caption = 'Тип документа'
          FocusControl = edDocTypeName
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object lbDOCDATE: TsLabel
          Left = 273
          Top = 3
          Width = 26
          Height = 13
          Caption = 'Дата'
          FocusControl = DBDateEdit1
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object sLabel2: TsLabel
          Left = 377
          Top = 3
          Width = 34
          Height = 13
          Caption = 'Сумма'
          FocusControl = DBDateEdit1
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object DldBtn: TsSpeedButton
          Left = 685
          Top = 44
          Width = 104
          Height = 22
          Caption = 'Файл'
          ButtonStyle = tbsDropDown
          SkinData.SkinSection = 'SPEEDBUTTON'
          DropdownMenu = pmFile
          ImageIndex = 34
          Images = DM.ilImage
        end
        object UplBtn: TsSpeedButton
          Left = 573
          Top = 44
          Width = 105
          Height = 22
          Caption = 'Загрузить'
          OnClick = UplBtnClick
          SkinData.SkinSection = 'SPEEDBUTTON'
          ImageIndex = 33
          Images = DM.ilImage
        end
        object sSpeedButton8: TsSpeedButton
          Left = 163
          Top = 19
          Width = 17
          Height = 22
          Caption = '<'
          OnClick = sSpeedButton4Click
          SkinData.SkinSection = 'SPEEDBUTTON'
          DropdownMenu = pmDocTypeName
        end
        object edDocTypeName: TsDBEdit
          Left = 8
          Top = 19
          Width = 129
          Height = 21
          Color = clWhite
          DataField = 'DocTypeName'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object DBEdit3: TsDBEdit
          Left = 182
          Top = 19
          Width = 81
          Height = 21
          Color = clWhite
          DataField = 'DocNum'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object DBDateEdit1: TsDBDateEdit
          Left = 272
          Top = 18
          Width = 97
          Height = 21
          AutoSize = False
          Color = clWhite
          EditMask = '!99/99/9999;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 2
          Text = '  .  .    '
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
          DataField = 'DocDate'
          DataSource = dsFileProp
        end
        object sDBLookupComboBox1: TsDBLookupComboBox
          Left = 495
          Top = 18
          Width = 65
          Height = 21
          Color = clWhite
          DataField = 'id_Crn'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'id_Obj'
          ListField = 'ObjName'
          ListSource = dsCur
          ParentFont = False
          TabOrder = 3
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
        end
        object Button2: TsButton
          Left = 136
          Top = 19
          Width = 25
          Height = 22
          Caption = '...'
          TabOrder = 4
          OnClick = Button2Click
          SkinData.SkinSection = 'BUTTON'
        end
        object sDBEdit3: TsDBEdit
          Left = 8
          Top = 44
          Width = 561
          Height = 21
          Color = clWhite
          DataField = 'OrigName'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sDBEdit4: TsDBEdit
          Left = 575
          Top = 17
          Width = 208
          Height = 21
          Color = clWhite
          DataField = 'Comment'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object btnSumm: TsButton
          Left = 466
          Top = 17
          Width = 25
          Height = 22
          Caption = '<<--'
          TabOrder = 7
          OnClick = btnSummClick
          SkinData.SkinSection = 'BUTTON'
        end
        object RxDBCalcEdit1: TRxDBCalcEdit
          Left = 376
          Top = 18
          Width = 89
          Height = 21
          DataField = 'DocSumm'
          DataSource = dsFileProp
          NumGlyphs = 2
          TabOrder = 8
        end
      end
      object pnMail2: TsGroupBox
        Left = 0
        Top = 0
        Width = 805
        Height = 63
        Align = alTop
        Caption = ' Письмо '
        TabOrder = 12
        SkinData.SkinSection = 'GROUPBOX'
        object Label5: TLabel
          Left = 6
          Top = 16
          Width = 42
          Height = 13
          Caption = 'От кого:'
          Transparent = True
        end
        object Label6: TLabel
          Left = 448
          Top = 17
          Width = 29
          Height = 13
          Caption = 'Кому:'
          Transparent = True
        end
        object Label7: TLabel
          Left = 6
          Top = 41
          Width = 30
          Height = 13
          Caption = 'Тема:'
          Transparent = True
        end
        object Label3: TLabel
          Left = 446
          Top = 39
          Width = 29
          Height = 13
          Caption = 'Дата:'
          Transparent = True
        end
        object sDBEdit5: TsDBEdit
          Left = 58
          Top = 13
          Width = 376
          Height = 21
          Color = clWhite
          DataField = 'EmailFrom'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sDBEdit6: TsDBEdit
          Left = 480
          Top = 13
          Width = 225
          Height = 21
          Color = clWhite
          DataField = 'EmailTo'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sDBEdit7: TsDBEdit
          Left = 58
          Top = 37
          Width = 376
          Height = 21
          Color = clWhite
          DataField = 'Subj'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sDBEdit8: TsDBEdit
          Left = 482
          Top = 36
          Width = 223
          Height = 21
          Color = clWhite
          DataField = 'EmailDate'
          DataSource = dsFileProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
      end
    end
    object sTabSheet2: TsTabSheet
      Caption = 'Блокнот'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sMemo1: TsMemo
        Left = 0
        Top = 0
        Width = 805
        Height = 398
        Align = alClient
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
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
      end
    end
  end
  object cdsFileProp: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_File'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_User'
        ParamType = ptInput
      end>
    ProviderName = 'dsFileProp'
    RemoteServer = DM.rsCA
    AfterOpen = cdsFilePropAfterOpen
    AfterPost = cdsFilePropAfterPost
    Left = 24
    Top = 136
    object cdsFilePropid_File: TIntegerField
      FieldName = 'id_File'
    end
    object cdsFilePropid_email: TIntegerField
      FieldName = 'id_email'
    end
    object cdsFilePropFileGUID: TStringField
      FieldName = 'FileGUID'
      Size = 50
    end
    object cdsFilePropDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object cdsFilePropid_DocType: TIntegerField
      FieldName = 'id_DocType'
    end
    object cdsFilePropid_WorkType: TIntegerField
      FieldName = 'id_WorkType'
    end
    object cdsFilePropid_Seller: TIntegerField
      FieldName = 'id_Seller'
    end
    object cdsFilePropid_Bayer: TIntegerField
      FieldName = 'id_Bayer'
    end
    object cdsFilePropid_Org3: TIntegerField
      FieldName = 'id_Org3'
    end
    object cdsFilePropid_Org4: TIntegerField
      FieldName = 'id_Org4'
    end
    object cdsFilePropDocNum: TStringField
      FieldName = 'DocNum'
      Size = 255
    end
    object cdsFilePropDocDate: TDateTimeField
      FieldName = 'DocDate'
    end
    object cdsFilePropDocDateStop: TDateTimeField
      FieldName = 'DocDateStop'
    end
    object cdsFilePropDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object cdsFilePropisAutoLong: TBooleanField
      FieldName = 'isAutoLong'
    end
    object cdsFilePropDocSumm: TBCDField
      FieldName = 'DocSumm'
      Precision = 19
    end
    object cdsFilePropid_Crn: TIntegerField
      FieldName = 'id_Crn'
    end
    object cdsFilePropid_State: TIntegerField
      FieldName = 'id_State'
    end
    object cdsFilePropComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object cdsFilePropxVers: TIntegerField
      FieldName = 'xVers'
    end
    object cdsFilePropCalcName: TStringField
      FieldName = 'CalcName'
      Size = 255
    end
    object cdsFilePropOrigName: TStringField
      FieldName = 'OrigName'
      Size = 255
    end
    object cdsFilePropFileInfo: TStringField
      FieldName = 'FileInfo'
      Size = 255
    end
    object cdsFilePropFileSize: TIntegerField
      FieldName = 'FileSize'
    end
    object cdsFilePropAdv_Digit1: TBCDField
      FieldName = 'Adv_Digit1'
      Precision = 19
    end
    object cdsFilePropAdv_Digit2: TBCDField
      FieldName = 'Adv_Digit2'
      Precision = 19
    end
    object cdsFilePropAdv_Digit3: TBCDField
      FieldName = 'Adv_Digit3'
      Precision = 19
    end
    object cdsFilePropAdv_Digit4: TBCDField
      FieldName = 'Adv_Digit4'
      Precision = 19
    end
    object cdsFilePropAdv_Digit5: TBCDField
      FieldName = 'Adv_Digit5'
      Precision = 19
    end
    object cdsFilePropAdv_Digit6: TBCDField
      FieldName = 'Adv_Digit6'
      Precision = 19
    end
    object cdsFilePropAdv_Digit7: TBCDField
      FieldName = 'Adv_Digit7'
      Precision = 19
    end
    object cdsFilePropAdv_Digit8: TBCDField
      FieldName = 'Adv_Digit8'
      Precision = 19
    end
    object cdsFilePropAdv_Digit9: TBCDField
      FieldName = 'Adv_Digit9'
      Precision = 19
    end
    object cdsFilePropAdv_Digit10: TBCDField
      FieldName = 'Adv_Digit10'
      Precision = 19
    end
    object cdsFilePropAdv_Date1: TDateTimeField
      FieldName = 'Adv_Date1'
    end
    object cdsFilePropAdv_Date2: TDateTimeField
      FieldName = 'Adv_Date2'
    end
    object cdsFilePropAdv_Date3: TDateTimeField
      FieldName = 'Adv_Date3'
    end
    object cdsFilePropAdv_Date4: TDateTimeField
      FieldName = 'Adv_Date4'
    end
    object cdsFilePropAdv_Date5: TDateTimeField
      FieldName = 'Adv_Date5'
    end
    object cdsFilePropAdv_Date6: TDateTimeField
      FieldName = 'Adv_Date6'
    end
    object cdsFilePropAdv_Date7: TDateTimeField
      FieldName = 'Adv_Date7'
    end
    object cdsFilePropAdv_Date8: TDateTimeField
      FieldName = 'Adv_Date8'
    end
    object cdsFilePropAdv_Date9: TDateTimeField
      FieldName = 'Adv_Date9'
    end
    object cdsFilePropAdv_Date10: TDateTimeField
      FieldName = 'Adv_Date10'
    end
    object cdsFilePropid_DicFile1: TIntegerField
      FieldName = 'id_DicFile1'
    end
    object cdsFilePropid_DicFile2: TIntegerField
      FieldName = 'id_DicFile2'
    end
    object cdsFilePropid_DicFile3: TIntegerField
      FieldName = 'id_DicFile3'
    end
    object cdsFilePropid_DicFile4: TIntegerField
      FieldName = 'id_DicFile4'
    end
    object cdsFilePropid_DicFile5: TIntegerField
      FieldName = 'id_DicFile5'
    end
    object cdsFilePropid_DicFile6: TIntegerField
      FieldName = 'id_DicFile6'
    end
    object cdsFilePropid_DicFile7: TIntegerField
      FieldName = 'id_DicFile7'
    end
    object cdsFilePropid_DicFile8: TIntegerField
      FieldName = 'id_DicFile8'
    end
    object cdsFilePropid_DicFile9: TIntegerField
      FieldName = 'id_DicFile9'
    end
    object cdsFilePropid_DicFile10: TIntegerField
      FieldName = 'id_DicFile10'
    end
    object cdsFilePropID_NS: TIntegerField
      FieldName = 'ID_NS'
    end
    object cdsFilePropBayerName: TStringField
      FieldName = 'BayerName'
      Size = 255
    end
    object cdsFilePropBayerCAName: TStringField
      FieldName = 'BayerCAName'
      Size = 255
    end
    object cdsFilePropBayerID_CA: TIntegerField
      FieldName = 'BayerID_CA'
    end
    object cdsFilePropSellerName: TStringField
      FieldName = 'SellerName'
      Size = 255
    end
    object cdsFilePropSellerCAName: TStringField
      FieldName = 'SellerCAName'
      Size = 255
    end
    object cdsFilePropSellerID_CA: TIntegerField
      FieldName = 'SellerID_CA'
    end
    object cdsFilePropisBayer: TBooleanField
      FieldName = 'isBayer'
    end
    object cdsFilePropisSeller: TBooleanField
      FieldName = 'isSeller'
    end
    object cdsFilePropOrg3Name: TStringField
      FieldName = 'Org3Name'
      Size = 255
    end
    object cdsFilePropOrg4Name: TStringField
      FieldName = 'Org4Name'
      Size = 255
    end
    object cdsFilePropWorkTypeName: TStringField
      FieldName = 'WorkTypeName'
      Size = 255
    end
    object cdsFilePropDocTypeName: TStringField
      FieldName = 'DocTypeName'
      Size = 255
    end
    object cdsFilePropStateName: TStringField
      FieldName = 'StateName'
      Size = 255
    end
    object cdsFilePropCrnName: TStringField
      FieldName = 'CrnName'
      Size = 255
    end
    object cdsFilePropEmailDateCreate: TDateTimeField
      FieldName = 'EmailDateCreate'
    end
    object cdsFilePropEmailDate: TDateTimeField
      FieldName = 'EmailDate'
    end
    object cdsFilePropEmailFrom: TStringField
      FieldName = 'EmailFrom'
      Size = 255
    end
    object cdsFilePropEmailName: TStringField
      FieldName = 'EmailName'
      Size = 255
    end
    object cdsFilePropEmailTo: TStringField
      FieldName = 'EmailTo'
      Size = 255
    end
    object cdsFilePropSubj: TStringField
      FieldName = 'Subj'
      Size = 255
    end
    object cdsFilePropAdv_Str1: TStringField
      FieldName = 'Adv_Str1'
      Size = 255
    end
    object cdsFilePropAdv_Str2: TStringField
      FieldName = 'Adv_Str2'
      Size = 255
    end
    object cdsFilePropAdv_Str3: TStringField
      FieldName = 'Adv_Str3'
      Size = 255
    end
    object cdsFilePropAdv_Str4: TStringField
      FieldName = 'Adv_Str4'
      Size = 255
    end
    object cdsFilePropAdv_Str5: TStringField
      FieldName = 'Adv_Str5'
      Size = 255
    end
    object cdsFilePropAdv_Str6: TStringField
      FieldName = 'Adv_Str6'
      Size = 255
    end
    object cdsFilePropAdv_Str7: TStringField
      FieldName = 'Adv_Str7'
      Size = 255
    end
    object cdsFilePropAdv_Str8: TStringField
      FieldName = 'Adv_Str8'
      Size = 255
    end
    object cdsFilePropAdv_Str9: TStringField
      FieldName = 'Adv_Str9'
      Size = 255
    end
    object cdsFilePropAdv_Str10: TStringField
      FieldName = 'Adv_Str10'
      Size = 255
    end
    object cdsFilePropxID_NS: TIntegerField
      FieldName = 'xID_NS'
    end
    object cdsFilePropid_User_F: TIntegerField
      FieldName = 'id_User_F'
    end
    object cdsFilePropid_User_L: TIntegerField
      FieldName = 'id_User_L'
    end
    object cdsFilePropLastEdit: TDateTimeField
      FieldName = 'LastEdit'
    end
    object cdsFilePropid_WorkType2: TIntegerField
      FieldName = 'id_WorkType2'
    end
    object cdsFilePropid_WorkType3: TIntegerField
      FieldName = 'id_WorkType3'
    end
    object cdsFilePropid_WorkType4: TIntegerField
      FieldName = 'id_WorkType4'
    end
    object cdsFilePropid_WorkType5: TIntegerField
      FieldName = 'id_WorkType5'
    end
    object cdsFilePropBayerDeleted: TBooleanField
      FieldName = 'BayerDeleted'
    end
    object cdsFilePropSellerDeleted: TBooleanField
      FieldName = 'SellerDeleted'
    end
    object cdsFilePropFIO: TStringField
      FieldName = 'FIO'
      Size = 255
    end
    object cdsFilePropLastFIO: TStringField
      FieldName = 'LastFIO'
      Size = 255
    end
    object cdsFilePropWorkTypeName1: TStringField
      FieldName = 'WorkTypeName1'
      Size = 255
    end
    object cdsFilePropWorkTypeName2: TStringField
      FieldName = 'WorkTypeName2'
      Size = 255
    end
    object cdsFilePropWorkTypeName3: TStringField
      FieldName = 'WorkTypeName3'
      Size = 255
    end
    object cdsFilePropWorkTypeName4: TStringField
      FieldName = 'WorkTypeName4'
      Size = 255
    end
    object cdsFilePropWorkTypeName5: TStringField
      FieldName = 'WorkTypeName5'
      Size = 255
    end
  end
  object dsFileProp: TDataSource
    DataSet = cdsFileProp
    Left = 720
    Top = 96
  end
  object cdsCur: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@ExtId'
        ParamType = ptInput
        Value = '1000'
      end
      item
        DataType = ftInteger
        Name = '@id_NS'
        ParamType = ptInput
      end>
    ProviderName = 'dsObjGetList'
    RemoteServer = DM.rsCA
    Left = 752
    Top = 96
    object cdsCurid_Obj: TAutoIncField
      FieldName = 'id_Obj'
      ReadOnly = True
    end
    object cdsCurid_NS: TIntegerField
      FieldName = 'id_NS'
    end
    object cdsCurPID: TIntegerField
      FieldName = 'PID'
    end
    object cdsCurid_ObjType: TIntegerField
      FieldName = 'id_ObjType'
    end
    object cdsCurObjName: TStringField
      FieldName = 'ObjName'
      Size = 255
    end
    object cdsCurFileName: TStringField
      FieldName = 'FileName'
      Size = 255
    end
    object cdsCurDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object cdsCurDateStart: TDateTimeField
      FieldName = 'DateStart'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object cdsCurDateStop: TDateTimeField
      FieldName = 'DateStop'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object cdsCurisDef: TBooleanField
      FieldName = 'isDef'
    end
    object cdsCurPName: TStringField
      FieldName = 'PName'
      Size = 255
    end
  end
  object dsCur: TDataSource
    DataSet = cdsCur
    Left = 56
    Top = 136
  end
  object DataFormatAdapterOutlook: TDataFormatAdapter
    DragDropComponent = dctFiles2
    DataFormatName = 'TOutlookDataFormat'
    Left = 92
    Top = 116
  end
  object dctFiles2: TDropComboTarget
    DragTypes = [dtCopy, dtLink]
    OnDrop = dctFiles2Drop
    MultiTarget = True
    Formats = [mfText, mfFile, mfURL, mfBitmap, mfMetaFile, mfData, mfCustom]
    Left = 44
    Top = 80
  end
  object sOpenDialog1: TsOpenDialog
    Filter = 
      'Документы всех типов (*.rar;*.doc;*.docx;*.xls;*.xlsx;*.pdf;*.bm' +
      'p;*.gif;*.jpg;*.jpeg)|*.rar;*.zip;*.doc;*.docx;*.xls;*.xlsx;*.pd' +
      'f;*.bmp;*.gif;*.jpg;*.jpeg|Документы Microsoft Office (*.doc;*.d' +
      'ocx;*.xls;*.xlsx)|*.doc;*.docx;*.xls;*.xlsx|Microsoft Word (*.do' +
      'c;*.docx)|*.doc;*.docx|Microsoft Excel (*.xls;*.xlsx)|*.xls;*.xl' +
      'sx|Adobe Acrobar (*.pdf)|*.pdf|Изобржения (*.bmp;*.gif;*.jpg;*.j' +
      'peg)|*.bmp;*.gif;*.jpg;*.jpeg|Архивы (*.rar;*.zip)|*.rar;*.zip|В' +
      'се файлы (*.*)|*.*'
    Left = 392
    Top = 128
  end
  object ActionList1: TActionList
    Images = DM.ilImage
    OnUpdate = ActionList1Update
    Left = 752
    Top = 49
    object aOpenFile: TAction
      Caption = 'Открыть'
      OnExecute = aOpenFileExecute
    end
    object aSaveFile: TAction
      Caption = 'Сохранить'
      OnExecute = aSaveFileExecute
    end
    object Action1: TAction
      Caption = 'Action1'
      ImageIndex = 34
    end
    object aNote: TAction
      Caption = 'Блокнот'
      ImageIndex = 40
      OnExecute = aNoteExecute
    end
    object aCopyData: TAction
      Caption = 'Данные в буфер'
      ImageIndex = 43
      OnExecute = aCopyDataExecute
    end
    object aPasteData: TAction
      Caption = 'Вставить из буфера'
      Enabled = False
      ImageIndex = 41
      OnExecute = aPasteDataExecute
    end
  end
  object sSaveDialog1: TsSaveDialog
    Filter = 
      'Microsoft Word 97-2003 (*.doc)|*.doc|Microsoft Word 2007 (*.docx' +
      ')|docx|Microsoft Excel 97-2003 (*.xls)|*.xls|Microsoft Excel 200' +
      '7 (*.xls)|*.xlsx|Adobe Acrobar (*.pdf)|*.pdf|Изобржения (*.bmp)|' +
      '*.bmp|Изобржения (*.gif)|*.gif|Изобржения (*.jpg)|*.jpg'
    Left = 352
    Top = 120
  end
  object pmFile: TPopupMenu
    OnPopup = pmFilePopup
    Left = 728
    Top = 25
    object N1: TMenuItem
      Action = aOpenFile
    end
    object N2: TMenuItem
      Action = aSaveFile
    end
  end
  object pmSellerName: TPopupMenu
    Left = 744
    Top = 120
  end
  object pmBayerName: TPopupMenu
    OnPopup = pmSellerNamePopup
    Left = 744
    Top = 152
  end
  object pmStateName: TPopupMenu
    OnPopup = pmSellerNamePopup
    Left = 752
    Top = 216
  end
  object pmWorkTypeName: TPopupMenu
    OnPopup = pmSellerNamePopup
    Left = 752
    Top = 184
  end
  object pmDocTypeName: TPopupMenu
    OnPopup = pmSellerNamePopup
    Left = 752
    Top = 264
  end
end
