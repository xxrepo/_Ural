object fOperWareSMP: TfOperWareSMP
  Left = 0
  Top = 0
  Width = 814
  Height = 855
  Constraints.MinWidth = 623
  TabOrder = 0
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 814
    Height = 855
    ActivePage = tsData
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 2
      inline fOperOldData1: TfOperOldData
        Left = 0
        Top = 0
        Width = 806
        Height = 827
        Align = alClient
        TabOrder = 0
        inherited StringGrid1: TStringGrid
          Width = 806
          Height = 827
        end
      end
    end
    object tsData: TTabSheet
      Caption = #1044#1072#1085#1085#1099#1077
      object P1: TPanel
        Left = 0
        Top = 0
        Width = 806
        Height = 96
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 0
        DesignSize = (
          806
          96)
        object lbReprName: TLabel
          Left = 0
          Top = 53
          Width = 72
          Height = 13
          Caption = #1063#1091#1078#1086#1081' '#1086#1073#1098#1077#1082#1090
          FocusControl = edReprName
        end
        object Label3: TLabel
          Left = 576
          Top = 76
          Width = 37
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1041#1080#1079#1085#1077#1089
        end
        object Label9: TLabel
          Left = 0
          Top = 4
          Width = 70
          Height = 13
          Caption = #1058#1080#1087' '#1086#1087#1077#1088#1072#1094#1080#1080
          FocusControl = cbOperTypeIn
        end
        object lbSrcName: TLabel
          Left = 0
          Top = 29
          Width = 64
          Height = 13
          Caption = #1057#1074#1086#1081' '#1086#1073#1098#1077#1082#1090
          FocusControl = DBEdit3
        end
        object Label19: TLabel
          Left = 0
          Top = 77
          Width = 58
          Height = 13
          Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
          FocusControl = DBEdit12
        end
        object Label6: TLabel
          Left = 538
          Top = 3
          Width = 79
          Height = 13
          Caption = #1050#1086#1088#1088#1077#1082#1094#1080#1086#1085#1085#1072#1103
        end
        object edReprName: TDBEdit
          Left = 95
          Top = 49
          Width = 683
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'ReprName'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 4
        end
        object BitBtn4: TBitBtn
          Left = 777
          Top = 49
          Width = 24
          Height = 21
          Anchors = [akTop, akRight]
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = BitBtn4Click
        end
        object cbOperTypeIn: TComboBox
          Left = 96
          Top = 0
          Width = 209
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = cbOperTypeInChange
          Items.Strings = (
            #1055#1088#1080#1093#1086#1076#1085#1072#1103' '#1086#1087#1077#1088#1072#1094#1080#1103
            #1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1086#1087#1077#1088#1072#1094#1080#1103)
        end
        object DBEdit3: TDBEdit
          Left = 95
          Top = 25
          Width = 683
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'SrcName'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 2
        end
        object BitBtn1: TBitBtn
          Left = 777
          Top = 25
          Width = 24
          Height = 21
          Anchors = [akTop, akRight]
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = BitBtn1Click
        end
        object DBEdit12: TDBEdit
          Left = 95
          Top = 73
          Width = 462
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMenu
          DataField = 'ContrAgentName'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit13: TDBEdit
          Left = 631
          Top = 1
          Width = 82
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Correct'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit8: TDBEdit
          Left = 622
          Top = 73
          Width = 179
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          Color = clMenu
          DataField = 'BusinessName'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 7
        end
        object DBCheckBox1: TDBCheckBox
          Left = 317
          Top = 2
          Width = 97
          Height = 17
          Caption = #1053#1044#1057' '#1074#1082#1083#1102#1095#1077#1085
          DataField = 'VatIn'
          DataSource = dsOperFin
          TabOrder = 8
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
      object P4: TPanel
        Left = 0
        Top = 284
        Width = 806
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        Constraints.MinHeight = 28
        TabOrder = 1
        inline fCurSelector1: TfCurSelector
          Left = 0
          Top = 0
          Width = 209
          Height = 31
          Align = alLeft
          TabOrder = 0
          inherited Label1: TLabel
            Left = 4
          end
          inherited cbCur: TComboBox
            Left = 60
            Width = 149
          end
        end
        object POther: TPanel
          Left = 209
          Top = 0
          Width = 383
          Height = 31
          Align = alClient
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 1
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 169
            Height = 31
            Align = alLeft
            BevelOuter = bvNone
            Caption = ' '
            TabOrder = 0
            object CheckBox1: TCheckBox
              Left = 11
              Top = 7
              Width = 156
              Height = 17
              Caption = #1047#1072#1095#1077#1089#1090#1100' '#1074' '#1076#1088#1091#1075#1086#1081' '#1074#1072#1083#1102#1090#1077
              TabOrder = 0
              OnClick = CheckBox1Click
            end
          end
          inline fCurSelector2: TfCurSelector
            Left = 169
            Top = 0
            Width = 208
            Height = 31
            Align = alLeft
            TabOrder = 1
            inherited Label1: TLabel
              Left = 4
            end
            inherited cbCur: TComboBox
              Left = 53
              Width = 150
            end
          end
        end
        object P_FF: TPanel
          Left = 592
          Top = 0
          Width = 214
          Height = 31
          Align = alRight
          BevelOuter = bvNone
          Caption = ' '
          Constraints.MinHeight = 31
          TabOrder = 2
          object Label13: TLabel
            Left = 3
            Top = 0
            Width = 48
            Height = 26
            Caption = #1057#1091#1090#1100' '#1086#1087#1077#1088#1072#1094#1080#1080
            FocusControl = cbKoef
            WordWrap = True
          end
          object cbKoef: TComboBox
            Left = 59
            Top = 3
            Width = 151
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = cbKoefChange
            OnKeyDown = cbKoefKeyDown
            Items.Strings = (
              #1056#1072#1089#1095#1077#1090' '#1089' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1084
              #1055#1088#1080#1073#1099#1083#1100
              #1047#1072#1090#1088#1072#1090#1072)
          end
        end
      end
      object gbWare: TGroupBox
        Left = 0
        Top = 96
        Width = 806
        Height = 188
        Align = alTop
        Caption = #1058#1086#1074#1072#1088#1099
        TabOrder = 2
        object DBGridEh1: TDBGridEh
          Left = 2
          Top = 15
          Width = 781
          Height = 171
          Align = alClient
          AllowedOperations = [alopUpdateEh, alopAppendEh]
          DataSource = dsOperWare
          FooterColor = clSilver
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          FooterRowCount = 1
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          PopupMenu = pmAmount
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColEnter = DBGridEhColEnter
          OnColumnMoved = DBGridEh1ColumnMoved
          OnDblClick = DBGridEh1DblClick
          OnDrawColumnCell = DBGridEh1DrawColumnCell
          OnDrawFooterCell = DBGridEh1DrawFooterCell
          OnEditButtonClick = DBGridEh1EditButtonClick
          OnGetCellParams = DBGridEh1GetCellParams
          OnKeyPress = DBGridEh1KeyPress
          Columns = <
            item
              ButtonStyle = cbsNone
              EndEllipsis = True
              FieldName = 'Numb'
              Footer.EndEllipsis = True
              Footers = <>
              ReadOnly = True
              Title.Caption = #8470#8470
              Width = 32
            end
            item
              AlwaysShowEditButton = True
              ButtonStyle = cbsEllipsis
              EndEllipsis = True
              FieldName = 'WareName'
              Footer.EndEllipsis = True
              Footers = <>
              ReadOnly = True
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Width = 185
            end
            item
              AlwaysShowEditButton = True
              ButtonStyle = cbsNone
              EndEllipsis = True
              FieldName = 'AmountOper'
              Footer.EndEllipsis = True
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clWindowText
              Footer.Font.Height = -11
              Footer.Font.Name = 'MS Sans Serif'
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Increment = 0.010000000000000000
              Title.Caption = #1050#1086#1083'-'#1074#1086
              Width = 51
            end
            item
              AlwaysShowEditButton = True
              ButtonStyle = cbsEllipsis
              EndEllipsis = True
              FieldName = 'MeasureName'
              Footer.EndEllipsis = True
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clWindowText
              Footer.Font.Height = -11
              Footer.Font.Name = 'MS Sans Serif'
              Footer.Font.Style = [fsBold]
              Footers = <>
              ReadOnly = True
              Title.Caption = #1045#1076'. '#1080#1079#1084
              Width = 56
            end
            item
              ButtonStyle = cbsNone
              EndEllipsis = True
              FieldName = 'PriceOper'
              Footer.EndEllipsis = True
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clWindowText
              Footer.Font.Height = -11
              Footer.Font.Name = 'MS Sans Serif'
              Footer.Font.Style = [fsBold]
              Footers = <>
              Increment = 0.010000000000000000
              Title.Caption = #1062#1077#1085#1072
              Width = 51
            end
            item
              ButtonStyle = cbsNone
              EndEllipsis = True
              FieldName = 'SummOper2'
              Footer.EndEllipsis = True
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clWindowText
              Footer.Font.Height = -11
              Footer.Font.Name = 'MS Sans Serif'
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Increment = 0.010000000000000000
              ReadOnly = True
              Title.Caption = #1057#1091#1084#1084#1072
              Width = 72
            end
            item
              ButtonStyle = cbsNone
              EndEllipsis = True
              FieldName = 'SummSys'
              Footer.EndEllipsis = True
              Footer.Font.Charset = DEFAULT_CHARSET
              Footer.Font.Color = clWindowText
              Footer.Font.Height = -11
              Footer.Font.Name = 'MS Sans Serif'
              Footer.Font.Style = [fsBold]
              Footer.ValueType = fvtSum
              Footers = <>
              Increment = 0.010000000000000000
              Title.Caption = #1047#1072#1095#1090#1077#1085#1086
              Width = 59
            end
            item
              EndEllipsis = True
              FieldName = 'PriceInv'
              Footer.EndEllipsis = True
              Footers = <>
              ReadOnly = True
              Title.Caption = #1057#1077#1073#1077#1089#1090'.'
            end
            item
              FieldName = 'AmountOperBaseMS_2'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1042#1099#1087#1080#1089#1072#1085#1086
              Width = 59
            end
            item
              FieldName = 'AmountOperBaseMS_1'
              Footers = <>
              Title.Caption = #1042#1099#1076#1072#1085#1086
              Width = 54
            end
            item
              FieldName = 'delta'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1054#1089#1090#1072#1090#1086#1082
            end>
        end
        object ToolBar3: TToolBar
          Left = 783
          Top = 15
          Width = 21
          Height = 171
          Align = alRight
          Caption = 'ToolBar3'
          Images = ilImage
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          object ToolButton11: TToolButton
            Left = 0
            Top = 2
            Action = aAddWare
            Wrap = True
          end
          object ToolButton12: TToolButton
            Left = 0
            Top = 24
            Action = aDelWare
          end
          object ToolButton13: TToolButton
            Left = 0
            Top = 24
            Width = 8
            Caption = 'ToolButton3'
            ImageIndex = 2
            Wrap = True
            Style = tbsSeparator
          end
          object ToolButton14: TToolButton
            Left = 0
            Top = 51
            Action = aSumm
            Wrap = True
          end
          object ToolButton15: TToolButton
            Left = 0
            Top = 73
            Action = aCalcSys
            Wrap = True
          end
          object ToolButton3: TToolButton
            Left = 0
            Top = 95
            Action = aCalcOper
            Wrap = True
          end
          object ToolButton1: TToolButton
            Left = 0
            Top = 117
            Action = aCalcAmount
            Wrap = True
          end
          object ToolButton2: TToolButton
            Left = 0
            Top = 139
            Action = aClearWare
          end
        end
      end
      object pnForSize: TPanel
        Left = 0
        Top = 315
        Width = 806
        Height = 512
        Align = alClient
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 3
        object GroupBox4: TGroupBox
          Left = 0
          Top = 195
          Width = 806
          Height = 317
          Align = alClient
          Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
          Constraints.MinHeight = 10
          TabOrder = 0
          object DBMemo1: TDBMemo
            Left = 2
            Top = 15
            Width = 802
            Height = 300
            Align = alClient
            DataField = 'OpComment'
            DataSource = dsOperFin
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 103
          Width = 806
          Height = 92
          Align = alTop
          Caption = ' '#1044#1086#1082#1091#1084#1077#1085#1090': '
          TabOrder = 1
          DesignSize = (
            806
            92)
          object Label14: TLabel
            Left = 10
            Top = 23
            Width = 128
            Height = 13
            Caption = #1054#1089#1085'. '#1087#1083#1072#1090#1077#1078#1072'/'#1085#1072#1082#1083#1072#1076#1085#1072#1103
          end
          object Label16: TLabel
            Left = 10
            Top = 46
            Width = 145
            Height = 13
            Caption = #1055#1083'. '#1087#1086#1088#1091#1095#1077#1085#1080#1077'/'#1057#1095#1077#1090' '#1092#1072#1082#1090#1091#1088#1072
          end
          object Label17: TLabel
            Left = 10
            Top = 70
            Width = 44
            Height = 13
            Caption = #1044#1086#1075#1086#1074#1086#1088
          end
          object edContract: TDBEdit
            Left = 160
            Top = 66
            Width = 640
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'Contract'
            DataSource = dsOperFin
            TabOrder = 2
          end
          object edImp_PayBasic: TDBEdit
            Left = 160
            Top = 18
            Width = 640
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'Imp_PayBasic'
            DataSource = dsOperFin
            TabOrder = 0
          end
          object edAccInv_PayAssignment: TDBEdit
            Left = 160
            Top = 42
            Width = 640
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'AccInv_PayAssignment'
            DataSource = dsOperFin
            TabOrder = 1
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 806
          Height = 103
          Align = alTop
          Caption = ' '
          TabOrder = 2
          DesignSize = (
            806
            103)
          object Label4: TLabel
            Left = 4
            Top = 8
            Width = 80
            Height = 13
            Caption = #1042#1074#1077#1083' '#1089#1086#1090#1088#1091#1076#1085#1080#1082
            FocusControl = DBEdit7
          end
          object Label1: TLabel
            Left = 4
            Top = 31
            Width = 59
            Height = 13
            Caption = #1044#1072#1090#1072' '#1074#1074#1086#1076#1072
            FocusControl = DBEdit1
          end
          object Label11: TLabel
            Left = 4
            Top = 56
            Width = 67
            Height = 13
            Caption = #1047#1072#1074#1080#1079#1080#1088#1086#1074#1072#1083
            FocusControl = DBEdit6
          end
          object Label15: TLabel
            Left = 4
            Top = 79
            Width = 95
            Height = 13
            Caption = #1044#1072#1090#1072' '#1074#1080#1079#1080#1088#1086#1074#1072#1085#1080#1103
            FocusControl = DBEdit10
          end
          object DBEdit7: TDBEdit
            Left = 106
            Top = 3
            Width = 577
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clMenu
            DataField = 'CreatorFIO'
            DataSource = dsOperFin
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit1: TDBEdit
            Left = 106
            Top = 27
            Width = 115
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'DateLocal'
            DataSource = dsOperFin
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit6: TDBEdit
            Left = 106
            Top = 51
            Width = 577
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clMenu
            DataField = 'CheckerFIO'
            DataSource = dsOperFin
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit10: TDBEdit
            Left = 106
            Top = 75
            Width = 115
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CheckDate'
            DataSource = dsOperFin
            ReadOnly = True
            TabOrder = 3
          end
        end
      end
    end
    object tsComment: TTabSheet
      Caption = #1044#1086#1087'. '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ImageIndex = 1
      inline fExtDataVal1: TfExtDataVal
        Left = 0
        Top = 57
        Width = 806
        Height = 770
        Align = alClient
        TabOrder = 0
        inherited ToolBar: TToolBar
          Width = 806
        end
        inherited RxDBGrid1: TRxDBGrid
          Width = 806
          Height = 744
        end
        inherited ImageList: TImageList
          Bitmap = {
            494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
            0000000000000000000000000000000000000000000000000000C8D0D400FFFF
            FF0080808000C8D0D40000000000000000000000000000000000000000000000
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
            0000000000000000000000000000000000000000000000000000C8D0D400FFFF
            FF0080808000C8D0D40000000000000000000000000000000000000000000000
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
            0000000000000000000000000000000000000000000000000000C8D0D400FFFF
            FF0080808000C8D0D40000000000000000000000000000000000000000000000
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
            0000000000000000000000000000000000000000000000000000C8D0D400FFFF
            FF0080808000C8D0D40000000000000000000000000000000000000000000000
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
            0000000000000000000000000000000000000000000000000000C8D0D400FFFF
            FF0080808000C8D0D40000000000000000000000000000000000000000000000
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
            0000000000000000000000000000000000000000800000008000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000C8D0D400FFFF
            FF0080808000C8D0D40000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000FF000000FF000000FF00000080000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000FF000000FF000000FF000000FF000000
            8000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000FF000000FF000000FF000000
            0000008080000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000FF000000000000FF
            FF00000000000080800000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000C8D0D400FFFF
            FF0080808000C8D0D40000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000FFFF000000
            000000FFFF000000000000808000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000000000FF
            FF000000000000FFFF0000808000008080000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000FFFF0000FFFF0000FFFF00008080000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000C8D0D400FFFF
            FF0080808000C8D0D40000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000FFFF0000FFFF000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000FFFF000000000000000000000000000000
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
            0000840000008400000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000C8D0D400FFFF
            FF0080808000C8D0D40000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008400
            0000000000000000000084000000000000000000000084000000840000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
            000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000008400
            0000000000000000000084000000000000008400000000000000000000008400
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FFFFFF00FF000000FF000000FF000000FF00
            0000FF000000FFFFFF0000000000000000000000000000848400C6C6C6000084
            8400C6C6C60000848400C6C6C60000000000FFFFFF00FF000000FF000000FF00
            0000FF000000FF000000FFFFFF00000000000000000000000000008484000084
            8400008484000084840000848400008484000084840000848400008484000000
            0000000000000000000000000000000000000000000000000000000000008400
            0000000000000000000084000000000000008400000000000000000000008400
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00000000000000000000000000C6C6C60000848400C6C6
            C60000848400C6C6C6000084840000000000FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000FFFF00000000000084
            8400008484000084840000848400008484000084840000848400008484000084
            8400000000000000000000000000000000000000000000000000000000000000
            0000840000008400000084000000000000008400000000000000000000008400
            00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0000000000FFFFFF00FF000000FF000000FF000000FF00
            0000FF000000FFFFFF0000000000000000000000000000848400C8D0D400FFFF
            FF0080808000C8D0D400C6C6C60000000000FFFFFF00FF000000FF000000FFFF
            FF000000000000000000000000000000000000000000FFFFFF0000FFFF000000
            0000008484000084840000848400008484000084840000848400008484000084
            8400008484000000000000000000000000000000000000000000000000000000
            0000000000000000000084000000000000008400000084000000840000000000
            00000000000000000000000000000000000000000000FFFFFF00840000008400
            0000840000008400000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00000000000000000000000000C6C6C60000848400C6C6
            C60000848400C6C6C6000084840000000000FFFFFF00FFFFFF00FFFFFF00FFFF
            FF0000000000FFFFFF0000000000000000000000000000FFFF00FFFFFF0000FF
            FF00000000000084840000848400008484000084840000848400008484000084
            8400008484000084840000000000000000000000000000000000000000000000
            0000000000000000000084000000000000008400000000000000000000000000
            00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0000000000FFFFFF00FF000000FF000000FFFFFF000000
            0000000000000000000000000000000000000000000000848400C6C6C6000084
            8400C6C6C60000848400C6C6C60000000000FFFFFF00FFFFFF00FFFFFF00FFFF
            FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
            FF0000FFFF000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FFFFFF00840000008400
            0000840000008400000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
            0000FFFFFF0000000000000000000000000000000000C6C6C60000848400C6C6
            C60000848400C6C6C60000848400000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
            FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
            0000000000000000000000000000000000000000000000848400C8D0D400FFFF
            FF0080808000C8D0D400C6C6C60000848400C6C6C60000848400C6C6C6000084
            8400C6C6C60000000000000000000000000000000000FFFFFF0000FFFF00FFFF
            FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FFFFFF00840000008400
            0000FFFFFF000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000C6C6C600008484000000
            000000000000000000000000000000000000000000000000000000000000C6C6
            C600008484000000000000000000000000000000000000FFFF00FFFFFF0000FF
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000848400C6C6C6000000
            0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000084
            8400C6C6C6000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
            FF00FFFFFF000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000C6C6C60000848400C6C6
            C60000000000FFFFFF00000000000000000000FFFF000000000000848400C6C6
            C600008484000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000C8D0D400FFFF
            FF0080808000C8D0D400FFFFFF0000FFFF000000000000000000000000000000
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
            00000000000000000000CED6D600000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000CED6D60084848400000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000CED6D600000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000C8D0D400FFFF
            FF0080808000C8D0D40000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000FF000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000FF0000000000000000000000000084848400FFFFFF00FFFF
            FF009CFFFF00FFFFFF009CFFFF00009C31009CFFFF00FFFFFF009CFFFF00FFFF
            FF000000000000000000CED6D6000000000000000000FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000FF000000FF000000
            FF00000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000CED6D60084848400FFFFFF009CFF
            FF00FFFFFF009CFFFF00009C3100009C3100FFFFFF009CFFFF00FFFFFF009CFF
            FF000000000000000000CED6D6000000000000000000FFFFFF00000000000000
            0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00000000000000000000000000000000000000FF000000FF000000
            FF000000FF000000000000000000000000000000000000000000000000000000
            00000000FF000000000000000000000000000000000084848400FFFFFF00FFFF
            FF009CFFFF00009C3100009C3100009C3100009C3100009C31009CFFFF00FFFF
            FF000000000000000000CED6D6000000000000000000FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0000000000000000000000000000000000000000000000FF000000
            FF000000FF000000000000000000000000000000000000000000000000000000
            FF00000000000000000000000000000000000000000084848400FFFFFF009CFF
            FF00FFFFFF009CFFFF00009C3100009C3100FFFFFF00639C0000636300009CFF
            FF000000000000000000CED6D6000000000000000000FFFFFF00000000000000
            0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
            0000000000000000000000000000000000000000000000000000C8D0D400FFFF
            FF0080808000C8D0D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF000000000000000000000000000000000000000000000000000000
            FF000000FF000000FF00000000000000000000000000000000000000FF000000
            FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
            FF009CFFFF00FFFFFF009CFFFF00009C31009CFFFF00FFFFFF0063630000FFFF
            FF000000000000000000CED6D6000000000000000000FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF000000000000000000000000000000000000000000000000000000
            00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
            0000000000000000000000000000000000000000000084848400FFFFFF009CFF
            FF00636300009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00636300009CFF
            FF000000000000000000CED6D6000000000000000000FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF000000000000000000000000000000000000000000000000000000
            0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
            0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
            FF0063630000FFFFFF009CFFFF00009C31009CFFFF00FFFFFF009CFFFF00FFFF
            FF000000000000000000CED6D6000000000000000000FFFFFF00000000000000
            0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF000000000000000000000000000000000000000000000000000000
            000000000000000000000000FF000000FF000000FF0000000000000000000000
            0000000000000000000000000000000000000000000084848400FFFFFF009CFF
            FF0063630000639C0000FFFFFF00009C3100009C31009CFFFF00FFFFFF009CFF
            FF000000000000000000CED6D6000000000000000000FFFFFF00000000000000
            000000000000FFFFFF0000000000000000000000000000000000000000000000
            0000000000000000000084000000840000000000000000000000C8D0D400FFFF
            FF0080808000C8D0D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF000000000000000000000000000000000000000000000000000000
            0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
            0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
            FF009CFFFF00009C3100009C3100009C3100009C3100009C31009CFFFF00FFFF
            FF000000000000000000CED6D6000000000000000000FFFFFF00FFFFFF000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000084000000840000000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF000000000000000000000000000000000000000000000000000000
            00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
            0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00009C3100009C31009CFFFF00FFFFFF000000
            00000000000000000000CED6D600000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000084000000840000000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
            00000000000000000000000000000000000000000000000000000000FF000000
            FF000000FF000000FF00000000000000000000000000000000000000FF000000
            FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00009C31009CFFFF00FFFFFF00000000000000
            00000000000000000000CED6D600000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000084000000840000000000000000000000000000000000
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
            FF0000000000000000000000000000000000000000000000FF000000FF000000
            FF000000FF000000000000000000000000000000000000000000000000000000
            FF000000FF000000000000000000000000000000000084848400FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF0084848400FFFF
            FF0000000000CED6D600CED6D600000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000084000000840000000000000000000000C8D0D400FFFF
            FF0080808000C8D0D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
            000000000000000000000000000000000000000000000000FF000000FF000000
            FF00000000000000000000000000000000000000000000000000000000000000
            0000000000000000FF0000000000000000000000000084848400FFFFFF00FFFF
            FF00FFFFFF00CED6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
            000000000000CED6D60000000000CED6D6000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000084000000840000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000084848400848484008484
            840084848400848484008484840084848400848484008484840084848400CED6
            D600CED6D60000000000CED6D600000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000424D3E000000000000003E000000
            2800000040000000400000000100010000000000000200000000000000000000
            000000000000000000000000FFFFFF0000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000847F00000000000000EF000000000000
            31BF00000000000039FF000000000000993F000000000000CA1F000000000000
            F40F0000000000009C070000000000009603000000000000CB01000000000000
            FF80000000000000F7C0000000000000FFE0000000000000EFF0000000000000
            FFF8000000000000FFFC000000000000FFFFFFFFFFFFFFFFF3FFFC01FE00FFFF
            ED9FFC018000001FED6FFC010000000FED6F000100000007F16F000100000003
            FD1F000100010001FC7F000100030000FEFF00030003001FFC7F00070003001F
            FD7F000F0003001FF93F00FF00038FF1FBBF01FF0003FFF9FBBF03FF8007FF75
            FBBFFFFFF87FFF8FFFFFFFFFFFFFFFFF8001FFFFFFFFFFFF3FF9000FFFFFDFFB
            8009000FE0038FFF0009000FE00387F78009000FE003C7EF8009000FE003E3CF
            8009000FE003F19F8009000FE003F83F8009008FE003FC7F80091144E003F83F
            80090AB8E003F19F8019057CE003C3CF8001FAFCE00787E78001FDF8E00F8FFB
            800AFE04E01FFFFF8005FFFFFFFFFFFF00000000000000000000000000000000
            000000000000}
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 806
        Height = 57
        Align = alTop
        Caption = 'Panel3'
        TabOrder = 1
        object Label8: TLabel
          Left = 19
          Top = 8
          Width = 34
          Height = 26
          Caption = #1060#1086#1088#1084'. '#1088#1072#1089#1087#1088'.'
          FocusControl = lcFormalDistrib
          Visible = False
          WordWrap = True
        end
        object sbForm: TSpeedButton
          Left = 209
          Top = 12
          Width = 20
          Height = 20
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1086#1088#1084#1072#1083#1100#1085#1086#1077' '#1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077
          BiDiMode = bdLeftToRight
          Enabled = False
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF0000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000000000000000000000000000000000000000000000000000
            000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          Layout = blGlyphRight
          ParentShowHint = False
          ParentBiDiMode = False
          ShowHint = True
          Visible = False
          OnClick = sbFormClick
        end
        object Label10: TLabel
          Left = 238
          Top = 9
          Width = 40
          Height = 26
          Caption = #1060#1091#1085#1082#1094'. '#1088#1072#1089#1087#1088'.'
          FocusControl = lcFuncDistrib
          Visible = False
          WordWrap = True
        end
        object sbFunc: TSpeedButton
          Left = 429
          Top = 13
          Width = 20
          Height = 20
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1091#1085#1082#1094#1080#1086#1085#1072#1083#1100#1085#1086#1077' '#1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077
          BiDiMode = bdLeftToRight
          Enabled = False
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF0000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000000000000000000000000000000000000000000000000000
            000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          Layout = blGlyphRight
          ParentShowHint = False
          ParentBiDiMode = False
          ShowHint = True
          Visible = False
          OnClick = sbFuncClick
        end
        object lcFormalDistrib: TRxDBLookupCombo
          Left = 58
          Top = 12
          Width = 151
          Height = 21
          DropDownCount = 8
          DropDownWidth = 250
          DataField = 'id_FormalDistrib'
          DataSource = dsOperFin
          LookupField = 'id_FormalDistrib'
          LookupDisplay = 'Name'
          LookupSource = dsFormal
          TabOrder = 0
          Visible = False
        end
        object lcFuncDistrib: TRxDBLookupCombo
          Left = 277
          Top = 13
          Width = 151
          Height = 21
          DropDownCount = 8
          DropDownWidth = 250
          DataField = 'id_FuncDistrib'
          DataSource = dsOperFin
          LookupField = 'id_FuncDistrib'
          LookupDisplay = 'Name'
          LookupSource = dsFunc
          TabOrder = 1
          Visible = False
        end
      end
    end
    object tsOperList: TTabSheet
      Caption = #1054#1087#1077#1088#1072#1094#1080#1080
      ImageIndex = 3
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 806
        Height = 41
        Align = alTop
        Caption = ' '
        TabOrder = 0
        object Button1: TButton
          Left = 16
          Top = 8
          Width = 201
          Height = 25
          Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1087#1086' '#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1080#1102
          TabOrder = 0
          OnClick = Button1Click
        end
      end
    end
  end
  object cdsOperFin: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Oper'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@is_Mirr'
        ParamType = ptInput
      end>
    ProviderName = 'dsOperProp_v2'
    RemoteServer = DM.rsCA
    AfterPost = cdsOperFinAfterPost
    Left = 112
    Top = 214
    object cdsOperFinid_Oper: TIntegerField
      FieldName = 'id_Oper'
    end
    object cdsOperFinid_OperParent: TIntegerField
      FieldName = 'id_OperParent'
    end
    object cdsOperFinid_Replicator: TIntegerField
      FieldName = 'id_Replicator'
    end
    object cdsOperFinid_old_Oper: TIntegerField
      FieldName = 'id_old_Oper'
    end
    object cdsOperFinDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object cdsOperFinid_LC_Oper: TIntegerField
      FieldName = 'id_LC_Oper'
    end
    object cdsOperFinOperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object cdsOperFinid_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsOperFinCreatorFIO: TStringField
      FieldName = 'CreatorFIO'
      Size = 152
    end
    object cdsOperFinid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsOperFinId_CurrencyBsn: TIntegerField
      FieldName = 'Id_CurrencyBsn'
    end
    object cdsOperFinBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsOperFinBusinessNum: TStringField
      FieldName = 'BusinessNum'
      Size = 5
    end
    object cdsOperFinDateLocal: TDateTimeField
      FieldName = 'DateLocal'
    end
    object cdsOperFinCorrect: TBooleanField
      FieldName = 'Correct'
      OnGetText = cdsOperFinCorrectGetText
      DisplayValues = #1044#1072';'#1053#1077#1090
    end
    object cdsOperFinOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsOperFinId_CurrencyOper: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object cdsOperFinCurrencyOperName: TStringField
      FieldName = 'CurrencyOperName'
      Size = 30
    end
    object cdsOperFinCurrencyOperShortName: TStringField
      FieldName = 'CurrencyOperShortName'
      Size = 10
    end
    object cdsOperFinPriceOper: TFloatField
      FieldName = 'PriceOper'
    end
    object cdsOperFinRateOper: TFloatField
      FieldName = 'RateOper'
    end
    object cdsOperFinId_CurrencySys: TIntegerField
      FieldName = 'Id_CurrencySys'
    end
    object cdsOperFinCurrencySysName: TStringField
      FieldName = 'CurrencySysName'
      Size = 30
    end
    object cdsOperFinCurrencySysShortName: TStringField
      FieldName = 'CurrencySysShortName'
      Size = 10
    end
    object cdsOperFinSummSys: TFloatField
      FieldName = 'SummSys'
    end
    object cdsOperFinRateSys: TFloatField
      FieldName = 'RateSys'
    end
    object cdsOperFinid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsOperFinid_Warehouse: TIntegerField
      FieldName = 'id_Warehouse'
    end
    object cdsOperFinid_Manufact: TIntegerField
      FieldName = 'id_Manufact'
    end
    object cdsOperFinSrcName: TStringField
      FieldName = 'SrcName'
      Size = 50
    end
    object cdsOperFinSrcID_Main: TIntegerField
      FieldName = 'SrcID_Main'
    end
    object cdsOperFinid_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsOperFinid_Acc_Ext: TIntegerField
      FieldName = 'id_Acc_Ext'
    end
    object cdsOperFinid_Warehouse_Ext: TIntegerField
      FieldName = 'id_Warehouse_Ext'
    end
    object cdsOperFinid_Manufact_Ext: TIntegerField
      FieldName = 'id_Manufact_Ext'
    end
    object cdsOperFinReprName: TStringField
      FieldName = 'ReprName'
      Size = 255
    end
    object cdsOperFinReprID_Main: TIntegerField
      FieldName = 'ReprID_Main'
    end
    object cdsOperFinId_CurrencyInv: TIntegerField
      FieldName = 'Id_CurrencyInv'
    end
    object cdsOperFinRateInv: TFloatField
      FieldName = 'RateInv'
    end
    object cdsOperFinCurrencyInvName: TStringField
      FieldName = 'CurrencyInvName'
      Size = 30
    end
    object cdsOperFinCurrencyInvShortName: TStringField
      FieldName = 'CurrencyInvShortName'
      Size = 10
    end
    object cdsOperFinKoeff: TIntegerField
      FieldName = 'Koeff'
    end
    object cdsOperFinKoeffName: TStringField
      FieldName = 'KoeffName'
      Size = 50
    end
    object cdsOperFinCheckDate: TDateTimeField
      FieldName = 'CheckDate'
    end
    object cdsOperFinCheckerFIO: TStringField
      FieldName = 'CheckerFIO'
      Size = 152
    end
    object cdsOperFinid_FormalDistrib: TIntegerField
      FieldName = 'id_FormalDistrib'
    end
    object cdsOperFinFormalDistribName: TStringField
      FieldName = 'FormalDistribName'
      Size = 50
    end
    object cdsOperFinid_FuncDistrib: TIntegerField
      FieldName = 'id_FuncDistrib'
    end
    object cdsOperFinFuncDistribName: TStringField
      FieldName = 'FuncDistribName'
      Size = 50
    end
    object cdsOperFinDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object cdsOperFinid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
    end
    object cdsOperFinContrAgentName: TStringField
      FieldName = 'ContrAgentName'
      Size = 50
    end
    object cdsOperFinid_CAGroup: TIntegerField
      FieldName = 'id_CAGroup'
    end
    object cdsOperFinSummOper: TFloatField
      FieldName = 'SummOper'
    end
    object cdsOperFinTypeName: TStringField
      FieldName = 'TypeName'
      Size = 30
    end
    object cdsOperFinHasViza: TBooleanField
      FieldName = 'HasViza'
    end
    object cdsOperFinOperState: TIntegerField
      FieldName = 'OperState'
    end
    object cdsOperFinHidedOper: TBooleanField
      FieldName = 'HidedOper'
    end
    object cdsOperFinRateMain: TFloatField
      FieldName = 'RateMain'
    end
    object cdsOperFinid_Repr_Ex: TIntegerField
      FieldName = 'id_Repr_Ex'
    end
    object cdsOperFinid_DocType: TIntegerField
      FieldName = 'id_DocType'
    end
    object cdsOperFinImp_PayBasic: TStringField
      FieldName = 'Imp_PayBasic'
      Size = 1000
    end
    object cdsOperFinAccInv_PayAssignment: TStringField
      FieldName = 'AccInv_PayAssignment'
      Size = 1000
    end
    object cdsOperFinContract: TStringField
      FieldName = 'Contract'
      Size = 1000
    end
    object cdsOperFinOperCrnName: TStringField
      FieldName = 'OperCrnName'
      Size = 10
    end
    object cdsOperFinBlocked: TBooleanField
      FieldName = 'Blocked'
    end
    object cdsOperFinCurrencyBsnName: TStringField
      FieldName = 'CurrencyBsnName'
      Size = 10
    end
    object cdsOperFinOpComment: TStringField
      FieldName = 'OpComment'
      Size = 1000
    end
    object cdsOperFinRealDataCreate: TDateTimeField
      FieldName = 'RealDataCreate'
    end
    object cdsOperFinOperTypeSIGN: TIntegerField
      FieldName = 'OperTypeSIGN'
    end
    object cdsOperFinHasChild: TIntegerField
      FieldName = 'HasChild'
    end
    object cdsOperFinDig1: TFloatField
      FieldName = 'Dig1'
    end
    object cdsOperFinDig2: TFloatField
      FieldName = 'Dig2'
    end
    object cdsOperFinDig3: TFloatField
      FieldName = 'Dig3'
    end
    object cdsOperFinDig4: TFloatField
      FieldName = 'Dig4'
    end
    object cdsOperFinDig5: TFloatField
      FieldName = 'Dig5'
    end
    object cdsOperFinDig6: TFloatField
      FieldName = 'Dig6'
    end
    object cdsOperFinDig7: TFloatField
      FieldName = 'Dig7'
    end
    object cdsOperFinDig8: TFloatField
      FieldName = 'Dig8'
    end
    object cdsOperFinDig9: TFloatField
      FieldName = 'Dig9'
    end
    object cdsOperFinDig10: TFloatField
      FieldName = 'Dig10'
    end
    object cdsOperFinDig11: TFloatField
      FieldName = 'Dig11'
    end
    object cdsOperFinDig12: TFloatField
      FieldName = 'Dig12'
    end
    object cdsOperFinDig13: TFloatField
      FieldName = 'Dig13'
    end
    object cdsOperFinDig14: TFloatField
      FieldName = 'Dig14'
    end
    object cdsOperFinDig15: TFloatField
      FieldName = 'Dig15'
    end
    object cdsOperFinStr1: TStringField
      FieldName = 'Str1'
      Size = 100
    end
    object cdsOperFinStr2: TStringField
      FieldName = 'Str2'
      Size = 100
    end
    object cdsOperFinStr3: TStringField
      FieldName = 'Str3'
      Size = 100
    end
    object cdsOperFinStr4: TStringField
      FieldName = 'Str4'
      Size = 100
    end
    object cdsOperFinStr5: TStringField
      FieldName = 'Str5'
      Size = 100
    end
    object cdsOperFinStr6: TStringField
      FieldName = 'Str6'
      Size = 100
    end
    object cdsOperFinStr7: TStringField
      FieldName = 'Str7'
      Size = 100
    end
    object cdsOperFinStr8: TStringField
      FieldName = 'Str8'
      Size = 100
    end
    object cdsOperFinStr9: TStringField
      FieldName = 'Str9'
      Size = 100
    end
    object cdsOperFinStr10: TStringField
      FieldName = 'Str10'
      Size = 100
    end
    object cdsOperFinStr11: TStringField
      FieldName = 'Str11'
      Size = 100
    end
    object cdsOperFinStr12: TStringField
      FieldName = 'Str12'
      Size = 100
    end
    object cdsOperFinStr13: TStringField
      FieldName = 'Str13'
      Size = 100
    end
    object cdsOperFinStr14: TStringField
      FieldName = 'Str14'
      Size = 100
    end
    object cdsOperFinStr15: TStringField
      FieldName = 'Str15'
      Size = 100
    end
    object cdsOperFinOperVidName: TStringField
      FieldName = 'OperVidName'
      Size = 50
    end
    object cdsOperFinis_Mirr: TBooleanField
      FieldName = 'is_Mirr'
    end
    object cdsOperFinid_Acc_Group: TIntegerField
      FieldName = 'id_Acc_Group'
    end
    object cdsOperFinid_Warehouse_Group: TIntegerField
      FieldName = 'id_Warehouse_Group'
    end
    object cdsOperFinid_Manufact_Group: TIntegerField
      FieldName = 'id_Manufact_Group'
    end
    object cdsOperFinOperNum: TStringField
      FieldName = 'OperNum'
      Size = 255
    end
    object cdsOperFinVatIn: TBooleanField
      FieldName = 'VatIn'
    end
  end
  object dsOperFin: TDataSource
    DataSet = cdsOperFin
    Left = 128
    Top = 206
  end
  object cdsFormal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
      end>
    ProviderName = 'dsFormal'
    RemoteServer = DM.rsCA
    AfterOpen = cdsFormalAfterOpen
    Left = 248
    Top = 392
    object cdsFormalid_FormalDistrib: TAutoIncField
      FieldName = 'id_FormalDistrib'
      ReadOnly = True
    end
    object cdsFormalName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object dsFormal: TDataSource
    DataSet = cdsFormal
    Left = 284
    Top = 392
  end
  object dsFunc: TDataSource
    DataSet = cdsFunc
    Left = 284
    Top = 424
  end
  object cdsFunc: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Bsn'
        ParamType = ptInput
      end>
    ProviderName = 'dsFunc'
    RemoteServer = DM.rsCA
    AfterOpen = cdsFuncAfterOpen
    Left = 248
    Top = 424
    object cdsFuncid_FuncDistrib: TAutoIncField
      FieldName = 'id_FuncDistrib'
      ReadOnly = True
    end
    object cdsFuncName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object cdsOperWare: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Oper'
        ParamType = ptInput
        Value = '31298'
      end>
    ProviderName = 'dsOperWare'
    RemoteServer = DM.rsCA
    BeforeInsert = cdsOperWareBeforeInsert
    AfterPost = cdsOperWareAfterPost
    AfterDelete = cdsOperWareAfterDelete
    OnCalcFields = cdsOperWareCalcFields
    Left = 568
    Top = 178
    object cdsOperWareid_OperWare: TAutoIncField
      FieldName = 'id_OperWare'
    end
    object cdsOperWareid_Oper: TIntegerField
      FieldName = 'id_Oper'
    end
    object cdsOperWareid_Measure: TIntegerField
      FieldName = 'id_Measure'
      OnChange = cdsOperWareid_MeasureChange
    end
    object cdsOperWareid_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsOperWareMeasureName: TStringField
      FieldName = 'MeasureName'
      Size = 10
    end
    object cdsOperWareRealKoef: TFloatField
      FieldName = 'RealKoef'
    end
    object cdsOperWareAmountOperBaseMS: TFloatField
      FieldName = 'AmountOperBaseMS'
    end
    object cdsOperWareWareName: TStringField
      FieldName = 'WareName'
      Size = 255
    end
    object cdsOperWareWareID_Main: TIntegerField
      FieldName = 'WareID_Main'
    end
    object cdsOperWareSummOper2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SummOper2'
      DisplayFormat = '#,##0.00'
      EditFormat = '#.00'
    end
    object cdsOperWareNumb: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'Numb'
    end
    object cdsOperWareAmountOper: TFloatField
      FieldName = 'AmountOper'
    end
    object cdsOperWarePriceOper: TFloatField
      FieldName = 'PriceOper'
      DisplayFormat = '0.00'
    end
    object cdsOperWareSummSys: TFloatField
      FieldName = 'SummSys'
      DisplayFormat = '0.00'
    end
    object cdsOperWarePriceInv: TFloatField
      FieldName = 'PriceInv'
      OnGetText = cdsOperWarePriceInvGetText
    end
    object cdsOperWare2SS: TAggregateField
      FieldName = 'SS'
      Active = True
      Expression = 'Sum(SummOper2)'
    end
  end
  object dsOperWare: TDataSource
    DataSet = cdsOperWare201
    OnDataChange = dsOperWareDataChange
    Left = 540
    Top = 175
  end
  object ilImage: TImageList
    Left = 56
    Top = 208
    Bitmap = {
      494C010121002200040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001002000000000000090
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FF00
      0000FFFFFF00C0C0C00000000000C0C0C0000000FF000000FF000000FF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FF000000FF00
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FF000000FF000000FFFF
      FF00FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FF00
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FF000000FF000000FFFF
      FF00FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FF00
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FF000000FF00
      0000FFFFFF00C0C0C00000000000C0C0C00000000000C0C0C00000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FF00
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000000000000000000000000000FFFF000000000000FFFF000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C00000000000000000000000000000000000000000000000000000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF000000FF000000FF000000FF00BFBF
      BF00000000000000000000000000000000000000000000000000FFFFFF008080
      8000C8D0D4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8D0D400FFFF
      FF0080808000C8D0D40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000080800000808000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF00000000000000000000000000000000000000000080800000F8F8F8008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000080800000F8F800008080
      000000000000F8F8F80000000000F8F8F80000000000F8F8F80000000000F8F8
      F800000000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF000000000000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D4008080000080800000808000008080000080800000808000008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000080000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000080800000F8F800008080
      000000000000F8F8F80000000000F8F8F80000000000F8F8F80000000000F8F8
      F800000000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      800000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF00000000000000000000000000000000000000000080800000F8F8F8008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      000000808000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000080800000F8F800000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000000000FF
      FF0000000000008080000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF000000000000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800C0C0C0008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF00000000000080800000000000000000000000000000000000BFBF
      BF00000000000000000000000000FFFF000000000000FFFF000000000000BFBF
      BF00000000000000000000000000000000000000000080800000F8F800000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF000080800000808000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000080800000F8F8F800F8F8
      0000F8F8F800F8F80000F8F8F800F8F80000F8F8F800F8F80000F8F8F800F8F8
      0000F8F8F8008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000808000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000808000008080
      0000808000008080000080800000808000008080000080800000808000008080
      0000808000008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF00000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8D0D400FFFF
      FF0080808000C8D0D40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000FFFFFF008080
      8000C8D0D4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000080000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      00008080000080800000808000000000000000000000000000000000FF000000
      FF0000000000000000007F7F7F00000000007F7F7F00000000000000FF000000
      FF000000FF0000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000080000000FF000000FF0000008000000080000000
      0000000000000000000000000000000000000000000080808000808080008080
      800080808000808080008080800080808000808080000000000080800000FFFF
      0000FFFF0000FFFFFF000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000FF00FFFFFF000000FF0000008000000080000000
      0000000000000000000000000000000000000000000000000000FFFF00008080
      0000808000008080000080800000808000000000000080800000FFFF0000FFFF
      0000FFFFFF00000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF007F7F7F00000000007F7F7F0000000000000000000000
      00000000FF000000FF000000000000000000000000000080800000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000808000000000000000000000000000000000000000
      00000000000000000000000080000000FF000000800000008000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      00008080000080800000808000000000000080800000FFFF0000FFFF0000FFFF
      FF00000000008080000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000C8D0D400FFFFFF008080
      8000C8D0D40000FFFF000080800000000000000000000080800000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000808000000000000080800000FFFF0000FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080800000FFFF0000FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000007F7F7F00000000007F7F7F0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080800000FFFF0000FFFF0000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000800000000000000080000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080800000FFFF0000FFFF0000FFFFFF000000000080800000808080000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000FF000000FF000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000008000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000FFFF0000FFFF0000FFFFFF0000000000FFFF000080800000808000008080
      800000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      000000000000000000000080800000FFFF0000FFFF0000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000008000000080000000
      000000000000000000000000000000000000000000000000000080800000FFFF
      0000FFFF0000FFFFFF00000000000000000000000000FFFF0000808000008080
      000080808000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00808080000000FF000000FF00000080000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000000000000000FF000000
      FF000000FF00000000007F7F7F00000000007F7F7F0000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808080000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000008080
      8000C8D0D4000080800000FFFF0000FFFF0000FFFF0000FFFF00008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000808080008080800000000000808080008080800080808000C0C0
      C000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000C0C0C0008080
      00008080000080800000808080008080800080808000C0C0C000808080008080
      0000808000008080800000000000000000000000000000000000000000000000
      0000000000000084000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00C8D0D400FFFF
      FF0080808000C8D0D40000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000808080008080
      0000808000008080000080800000C0C0C00080808000C0C0C000808080008080
      8000808000008080000080808000000000000000000000000000000000000000
      0000008400000084000000840000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000848400000000000000000000000000FFFFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000848400000000000000000000000000C0C0C000808000000080
      00008080000080800000808000000000000080808000C0C0C000C0C0C0008080
      8000808000008080000080800000C0C0C0000000000000000000000000000000
      0000008400000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000000FFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000080808000808000008080
      0000808000008080800080808000000000000000000080808000808080008080
      8000808080008080000000800000808080000000000000000000000000000084
      0000008400000084000000840000008400000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000084840000848400008484000084
      84000084840000848400008484000000000000000000FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000084840000848400008484000084
      840000848400008484000084840000000000C0C0C00080800000808080008080
      00008080800000000000000000000000000000000000C0C0C000808080000000
      0000808000008080800080808000808080000000000000000000FFFFFF008080
      8000C8D0D4000084000000840000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00C8D0D400FFFF
      FF0080808000C8D0D400FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808000008080800080808000000000000000000000000000000000008080
      8000808080008080800080808000808080000000000084848400008400000084
      0000000000000000000000840000008400000084000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C6000000000000000000000000000000000000000000FFFFFF0084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C60000000000000000000000000000000000C0C0C00080808000808080008080
      80008080800080800000C0C0C000000000000000000000000000000000000080
      0000808000008080800080808000808080008484840000840000000000000000
      0000000000000000000000000000008400000084000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000080808000C0C0C000C0C0
      C000808080008080800000000000000000000000000000000000000000008080
      8000808000008080000080800000C0C0C0000000000000000000000000000000
      0000000000000000000000000000008400000084000000840000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF008484840000FF
      000000FF0000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000080808000808080008080
      80008080800080808000C0C0C000000000008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000000000000000
      0000000000000000000000000000000000000000000000000000C8D0D400FFFF
      FF0080808000C8D0D400FFFFFF00FFFFFF00FFFFFF00848484008484840000FF
      000000FF0000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400848484008484
      840000000000000000000000000000000000000000000000000000000000C0C0
      C000808080008080000080800000000000008080800080800000808000008080
      8000808000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000008400000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808080008080000080800000808080000000000080808000808000008080
      0000808000008080000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000084
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000FF000000FF000000FF
      000000FF000000FF000000FF000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000008400000084000000
      8400000084000000840000008400000000000000000000000000000000008080
      8000C0C0C0008080800080808000808000008080800080800000808000008080
      0000808000000080000080800000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000000000000000000000000000000000000000000848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      000000FF00000000000000000000000000000000000000000000848484008484
      840084848400848484008484840084848400848484000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000000000000000000000000000C0C0
      C00080808000C0C0C000C0C0C000808080000080000080800000808000008080
      0000808080000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000840000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000C0C0C0008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000000000000000CED6D60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400FFFFFF009CFFFF00009C31009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000000000000000CED6D600000000000000000000000000C8D0D400FFFF
      FF0080808000C8D0D40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000000000000000CED6D60084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00009C3100009C3100FFFFFF009CFFFF00FFFFFF009CFF
      FF000000000000000000CED6D600000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF009CFFFF00009C3100009C3100009C3100009C3100009C31009CFFFF00FFFF
      FF000000000000000000CED6D600000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00009C3100009C3100FFFFFF00639C0000636300009CFF
      FF000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      00000000000000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400FFFFFF009CFFFF00009C31009CFFFF00FFFFFF0063630000FFFF
      FF000000000000000000CED6D600000000000000000000000000C8D0D400FFFF
      FF0080808000C8D0D40000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00636300009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00636300009CFF
      FF000000000000000000CED6D60000000000000000000000000000000000FFFF
      FF00000000000000000000000000C6DEC6000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF0063630000FFFFFF009CFFFF00009C31009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000000000000000CED6D60000000000000000000000000000000000FFFF
      FF00000000000000000000000000C6DEC6000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF0063630000639C0000FFFFFF00009C3100009C31009CFFFF00FFFFFF009CFF
      FF000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      00000000000000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400009C3100009C3100009C3100009C3100009C31009CFFFF00FFFF
      FF000000000000000000CED6D60000000000000000000000000000000000FFFF
      FF0080808000C8D0D40000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00009C3100009C31009CFFFF00FFFFFF000000
      00000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00009C31009CFFFF00FFFFFF00000000000000
      00000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF0084848400FFFF
      FF0000000000CED6D600CED6D600000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400CED6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      000000000000CED6D60000000000CED6D6000000000000000000000000000000
      000080808000C8D0D40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      840084848400848484008484840084848400848484008484840084848400CED6
      D600CED6D60000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000848484000000000000000000C6C6C6000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF008484840000000000848484000000000000FFFF0000000000848484000000
      000084848400FFFFFF00FFFFFF00000000000000000000000000FFFFFF008080
      8000C8D0D400FFFF0000FFFF000000000000FFFF0000FF000000000000000000
      000084848400000000000000000000000000000000000000000000000000FFFF
      FF0080808000C8D0D40000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00C6C6
      C6000000000000FFFF00848484000000000000FFFF00000000008484840000FF
      FF0000000000C6C6C600FFFFFF0000000000000000000000000000000000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000000000000000000084848400000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000848484008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      84008484840000000000FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF000000000000FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400000000000000000000FFFF0084848400000000008484840000FFFF000000
      00000000000084848400FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000FFFF0000FFFF0000FFFF0000000000FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000000000FFFFFF000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400FFFF0000FFFF000000000000FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF0000000000000000000000000000000000000000000000FFFF
      FF0080808000C8D0D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400000000000000000000FFFF0084848400000000008484840000FFFF000000
      00000000000084848400FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00848484008484840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484
      840084848400FFFFFF00FFFFFF000000000000000000FFFF0000FFFF0000FFFF
      00000000FF008484840084848400000000008484840084848400000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF000000000000FFFF00848484000000000000FFFF00000000008484840000FF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFF0000FFFF00008484
      84000000FF00FFFF000000000000FFFF000000000000848484000000FF000000
      FF0000000000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF00FFFF
      FF008484840000000000848484000000000000FFFF0000000000848484000000
      000084848400FFFFFF00FFFFFF000000000000000000C8D0D400FFFFFF000000
      0000C8D0D4000000FF00FFFF00000000000084848400848484000000FF000000
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0080808000C8D0D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF000000000000FFFF
      000000000000FFFF00000000FF00848484000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFF00000000FF0000000000848484000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000848484000000
      00000000000000000000FFFF00008484840084848400848484000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000C8D0D4000000000000000000FFFF000000000000848484000000FF000000
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0080808000C8D0D40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000C6C6C6000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8D0D4000000000000000000000000000084840000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0080808000C8D0D400FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000000000000FFFF0000FFFF0000FFFFFF00FFFF0000FF000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000FF00000000000000FFFFFF0000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000000000000000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      000000000000000000008484840000000000000000000000000000000000FF00
      000000000000FFFFFF00FFFFFF00FFFFFF0000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000084840000FFFF0000000000000000000084840000FFFF00008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF00000000000000000000000000000000000000FF000000FF00
      0000FF00000000000000FFFFFF00FFFFFF00FFFFFF0000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      84000000000000000000000000000000000084848400FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF0000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF00000000000000FFFFFF00FFFFFF00FFFFFF0000000000FF00
      0000000000000000000000000000000000000000000000000000000000008080
      8000C8D0D40000FFFF0000000000000000000084840000FFFF00008484000084
      84000000000000000000000000000000000084848400FFFFFF00C8D0D400FFFF
      FF0080808000C8D0D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000FFFFFF00FFFF0000FF0000000000FF00FF00
      0000FFFF0000FF000000000000000000000084000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FF0000000000000000000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      84000000000000000000000000000000000084848400FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF00FFFF0000FFFF0000C6C6C600FF000000FFFF00000000FF00FFFF
      0000FF000000FFFF00000000000000000000FF00000084000000FF000000FF00
      0000FF000000FF000000FF000000FF00000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FF00000000000000000000000000000000000000000000008484
      84000084840000FFFF0000000000000000000084840000FFFF00008484000084
      84000000000000000000000000000000000084848400FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      00000000FF008484840084848400FFFFFF0084848400848484000000FF00FF00
      0000FFFF0000FF000000000000000000000000000000FF00000084000000FF00
      0000FF00000000000000FF000000FF000000FF00000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FF000000000000000000000000000000000000008484
      840000848400008484000000000000848400000000000084840000FFFF000084
      84000000000000000000000000000000000084848400FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF000000000000FFFF00000000000000000000000000FFFF0000FFFF00008484
      84000000FF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF00000000FF008484
      8400FF000000FFFF000000000000000000000000000000000000FF0000008400
      0000FF000000FF000000FF00000000000000FF000000FF00000000000000FFFF
      FF0000000000FF00000000000000000000000000000000000000000000008080
      8000C8D0D40000FFFF0000000000000000000084840000FFFF00008484000084
      84000000000000000000000000000000000084848400FFFFFF00C8D0D400FFFF
      FF0080808000C8D0D4000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000008484840084848400FFFF
      FF00FFFF00000000FF00FFFF0000FFFFFF00FFFF00000000FF00FFFF0000FFFF
      FF0084848400848484000000000000000000000000000000000000000000FF00
      000084000000FF0000000000000000000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000084840000000000008484000000000000848400000000000084
      84000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF00000000FF000000FF000000FF00FFFF0000FFFFFF00FFFF
      0000FFFFFF00FFFF000000000000000000000000000000000000000000000000
      0000FF00000084000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000000000000FFFF000000000000FFFF000000000000FFFF000000
      00000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF008484840000000000FFFFFF008484840084848400FFFF
      FF0000000000000000000000000000000000848484000000000000000000FFFF
      FF00FFFF00000000FF00FFFFFF00FFFF0000FFFFFF000000FF00FFFF0000FFFF
      FF00000000000000000084848400000000000000000000000000000000000000
      000000000000FF00000084000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF008484840084848400FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000848484000000
      000000000000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00000084000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8D0D4000000000000FFFF000000000000FFFF000000000000FFFF008484
      8400000000000000000000000000000000008484840084848400C8D0D400FFFF
      FF0080808000C8D0D400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000FFFF00000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840000000000000000000000000084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000424242004242420042424200000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600848484008484840084848400848484008484840000000000000000008484
      840084848400C6C6C60000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF000084840000FFFF000084
      84000000000000000000000000000000000000000000BDBDBD00000000007B7B
      7B0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200000000000000
      00000000000000000000000000000000000000000000C6C6C6000063630000A5
      A50000C6C60000C6C60000A5A5000084840000848400002121000042420000E7
      E7000084840000636300C6C6C600000000000000000000000000000000000000
      0000008484000000000000FFFF0000FFFF000084840000848400000000000084
      84000084840000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D400FFFFFF00FFFFFF00BDBDBD000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0080808000C8D0D40000000000848484004242420042424200000000000000
      0000212121000000000000000000000000000000000000424200008484000084
      840031737300315252003152520000424200002121000063630000FFFF0000C6
      C60000A5A5000084840000424200000000000000000000000000000000000084
      84000000000000FFFF0000FFFF000000000000FFFF000084840000FFFF000084
      84000084840000848400000000000000000000000000BDBDBD00BDBDBD000000
      0000000000000000000000000000FFFFFF00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000212121006363
      6300313131002121210021212100A5A5A5006363630000000000000000002121
      21002121210021212100000000000000000000000000000000000084840000A5
      A50000A5A5000084840000848400008484000084840000C6C60000A5A50000C6
      C60000E7E70000C6C60000A5A500848484000000000000000000000000000084
      84000084840000FFFF0000FFFF0000FFFF0000FFFF0000848400008484000084
      8400008484000084840000000000000000000000000000000000000000007B7B
      7B00FFFFFF00FFFFFF00FFFFFF0000000000BDBDBD00BDBDBD00000000000000
      000000000000000000000000000000000000000000000000000021212100A5A5
      A500C6C6C60073737300A5A5A500C6C6C600C6C6C60063636300737373009494
      9400212121004242420000000000000000004263630000A5A500008484000063
      6300006363000063630000424200004242000084840000C6C6000084840000E7
      E70000FFFF0000A5A50000C6C60084848400000000000000000000FFFF000084
      840000FFFF000084840000FFFF0000FFFF000084840000FFFF0000FFFF000084
      840000FFFF000084840000848400000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00BDBDBD00000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000003131
      3100C6C6C60094949400D6D6D600B5B5B500A5A5A500D6D6D600737373007373
      73000000000042424200000000000000000000212100002121000063630000A5
      A50000C6C60000C6C60000A5A500008484000084840000C6C6000084840000C6
      C60000C6C60000C6C60000C6C60084848400000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00008484000084840000848400000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000042424200C8D0D400FFFF
      FF0080808000C8D0D40063636300424242006363630063636300D6D6D6006363
      6300000000004242420042424200424242004263630000424200004242000084
      840063A5A5003194940031949400319494000084840000A5A5000084840000A5
      A50000C6C60000C6C60000A5A500C6C6C600000000000000000000FFFF000084
      840000FFFF00008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000084840000FFFF0000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00BDBDBD00424242003131310063636300E7E7
      E700636363009494940073737300737373005252520063636300A5A5A500C6C6
      C600636363004242420000000000424242000000000000212100006363000042
      4200006363000063630000636300006363000042420000E7E70000A5A5000084
      84000084840000FFFF004263630000000000000000000000000000FFFF000084
      840000FFFF0000848400008484000084840000FFFF0000FFFF000000000000FF
      FF00008484000084840000FFFF00000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000004242420063636300D6D6D600E7E7
      E700424242006363630084848400636363007373730042424200B5B5B500C6C6
      C600A5A5A50084848400000000004242420000000000848484000084840000A5
      A50000A5A50000A5A50000A5A50000A5A50000A5A5000063630000A5A50000A5
      A50000A5A500428484000000000000000000000000000000000000FFFF000084
      84000084840000848400008484000084840000FFFF0000FFFF0000FFFF000084
      840000FFFF000084840000FFFF000000000000000000000000000000000000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000FFFFFF00212121000000000000000000A5A5
      A50063636300B5B5B500C6C6C600848484007373730063636300D6D6D600A5A5
      A500212121002121210000000000212121000000000084848400004242000042
      420000C6C60063A5A50031525200315252003152520000212100000000000021
      210000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00008484000084840000848400008484000084840000848400008484000084
      840000FFFF0000FFFF00000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D40000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF000000000000FFFF000000000000000000000000000000000000000000FFFF
      FF0080808000C8D0D400B5B5B5006363630094949400C6C6C600949494006363
      63000000000042424200000000000000000000000000C6C6C600006363003173
      73000063630000A5A50000C6C60000C6C60000C6C60000C6C60000C6C6000063
      63004263630000000000000000000000000000000000000000000000000000FF
      FF00008484000084840000FFFF000084840000848400008484000084840000FF
      FF0000FFFF0000848400000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF
      FF000000000000FFFF000000000000000000000000000000000000000000A5A5
      A500D6D6D600B5B5B500636363004242420063636300A5A5A500B5B5B500A5A5
      A500212121004242420000000000000000000000000000000000C6C6C6000042
      42003173730073D6D60084FFFF0084E7E70042C6C60000A5A50000A5A5000042
      42000063630084848400000000000000000000000000000000000000000000FF
      FF0000FFFF00008484000084840000848400008484000000000000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF000000
      000000FFFF000000000000000000000000000000000000000000424242005252
      5200A5A5A50031313100A5A5A500E7E7E700E7E7E70063636300212121007373
      7300212121002121210000000000000000000000000000000000000000000021
      21000084840000A5A50000C6C60000FFFF0000FFFF0000C6C60000C6C60000A5
      A500006363008484840000000000000000000000000000000000000000000000
      000000FFFF0000FFFF00008484000084840000FFFF000084840000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000006363
      6300424242002121210000000000D6D6D6006363630042424200000000002121
      210021212100000000000000000000000000000000000000000000000000C6C6
      C600004242000084840000C6C60000E7E70042FFFF0084FFFF0042C6C6000042
      4200426363000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8D0D40000000000000000000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363003131310042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000021212100424242004242420042424200000000000000
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
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      8000C8D0D400218C2100007B0000007B0000007B000008840800218C21005AAD
      5A00B5D6B500FFFFFF0000000000000000008484840000FFFF00C8D0D400FFFF
      FF0080808000C8D0D40000FFFF0000FFFF0000FFFF0000FFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000FFFF000000000000DEEFDE00399C39000084
      000000840000008400000084000000C6000000C6000000840000008400000084
      00000084000031943100DEEFDE00000000008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF00848484000000000000000000000000000000000000000000000000000084
      8400000000000084840000000000008484000000000000848400000000000084
      84000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF0000E7F7E700188C1800008400000084
      0000008400000084000000D6000000FF000000FF000000BD0000008400000084
      00000084000000840000188C1800E7EFE7008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF0000FFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000848400000000000000000000848400008484000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF000063AD630000840000008400000084
      0000008400000084000000E7000000A5000000B5000000F70000008400000084
      00000084000000840000008400005AAD5A008484840084848400848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      FF0000FFFF00848484008484840000000000C6C6C60000848400008484000084
      8400008484000084840000848400008484000084840000000000008400000084
      84000084840000000000000000000000000000000000FFFFFF00FFFF00000000
      000000FFFF000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF0000188C1800C8D0D400FFFFFF008080
      8000C8D0D400008400000094000000C6000000DE000000EF0000008400000084
      0000008400000084000000840000088408008484840000FFFF00C8D0D400FFFF
      FF0080808000C8D0D40000FFFF0000FFFF0000FFFF0000FFFF00848484008484
      840000FFFF008484840000FFFF0084848400FFFFFF0000848400008484000084
      840000848400008484000084840000848400008484000084840000FFFF000000
      00000084840000FFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF0000188C180000840000008400000084
      0000008400000084000000F7000000EF000000DE000000A50000008400000084
      0000008400000084000000840000007B00008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF00848484008484840000FFFF0084848400FFFFFF0000848400008484000084
      840000848400008484000084840000FFFF0000FFFF00000000000084840000FF
      FF0000FFFF0000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000000000FFFF00005AAD5A0000840000008400000084
      0000008400000084000000FF000000B5000000A5000000D60000008400000084
      00000084000000840000008400004AA54A008484840000FFFF0000FFFF0000FF
      FF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FFFF008484840000FF
      FF0000FFFF008484840000FFFF0084848400FFFFFF00FFFFFF00008484000084
      8400008484000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000848400FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF00000000000000000000FFFF00FFFF
      FF0000FFFF00000000000000000000000000DEEFDE00108C1000008400000084
      0000008400000084000000EF000000F7000000F7000000DE0000008400000084
      0000008400000084000008840800D6E7D6008484840084848400848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      FF0000FFFF0084848400848484008484840084000000FFFFFF00C6C6C60000FF
      FF0000000000000000000084840000FFFF0000FFFF0000848400000000000084
      84000084840000000000FFFFFF008400000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000000000000000000000
      00000000000000000000000000000000000000000000C8D0D400FFFFFF008080
      8000C8D0D40000840000008C000000DE000000DE000000840000008400000084
      000000840000188C1800C6DEC600000000008484840000FFFF00C8D0D400FFFF
      FF0080808000C8D0D4008484840000FFFF0000FFFF0000FFFF0000FFFF008484
      840000FFFF008484840000FFFF008484840084000000FFFFFF00C6C6C60000FF
      FF0000FFFF0000FFFF0000000000000000000000000000848400008484000084
      840000848400FFFFFF00FFFFFF008400000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000F7FFF70094C6
      9400399C39000084000000840000008C0000008C00000084000000840000399C
      390094C69400F7FFF7000000000000000000000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF008484840000FFFF0000FFFF0000FFFF0000FF
      FF00848484008484840000FFFF00848484008400000084000000FFFFFF000000
      000000FFFF0000FFFF0000848400008484000084840000FFFF0000FFFF0000FF
      FF0000848400FFFFFF0084000000840000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFF7EF0029942900008400000084000000840000008400005AAD5A00F7FF
      F700000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000FFFF00848484008400000084000000000000000000
      000000000000008484000084840000FFFF000084840000000000000000000000
      0000FFFFFF0084000000840000008400000000000000000000007B7B7B000000
      00007B7B7B00000000007B7B7B00000000007B7B7B00000000000000000000FF
      FF0000000000000000000000000000000000000000000000000000000000F7F7
      F700319C31000084000000840000008400000084000000840000008400003194
      3100E7EFE7000000000000000000000000000000000000000000000000008484
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008484840000FFFF0000FF
      FF0000FFFF0000FFFF0084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084000000840000008400000000000000000000007B7B7B000000
      00007B7B7B00000000007B7B7B00000000007B7B7B0000000000000000000000
      00000000FF000000000000000000000000000000000000000000FFFFFF008080
      8000C8D0D4000084000000840000008400000084000000840000008400000084
      0000108C1000C6DEC60000000000000000000000000000000000000000000000
      000080808000C8D0D40084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094BD940084BD
      840063AD63004AA54A008CBD8C0073B57300088408000884080018841800A5CE
      A5007BBD7B0052A55200B5D6B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000900000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF00C007000000000000C007000000000000
      C007000000000000800700000000000000070000000000000007000000000000
      000700000000000000070000000000008007000000000000C007000000000000
      C007000000000000C007000000000000C007000000000000C007000000000000
      C007000000000000C007000000000000C007FFFFFFFF847FC007FFFFFFFF00EF
      C007C003C00731BFC0078001E7E739FFC0078001F3F7993FC0078001F9F7CA1F
      C0078001FCFFF40FC0078001FE7F9C07C0078001FF3F9603C0078001FE7FCB01
      C0078001FCFFFF80C0078001F9F7F7C0C0078001F3F7FFE0C007C003E7E7EFF0
      C007FFFFC007FFF8C007FFFFFFFFFFFCFFFFF81FFFFFFFFFF83FE007FE1FFFE0
      E00FC003FC1F0000CC478001FC0F000184638001FC0F8003A0730000FC1FC001
      31F90000FF7FE00138F90000FE3FF01F3C790000FE3FF01F3C390000FE1FE00F
      3C190000FC1FC0079C0B8001FC0F81038C438001FC0F0381C467C003F80F07C1
      E00FE007FC0FFFFFF83FF81FFE3FFFFFFF9FFFFF000F000FF107FFFF00070007
      C003F9FF00030003C001F0FF000100018100F0FF000000008180E07F00000000
      0790C07F0000000001E0843F0007000701E01E3F0003000783E0FE1F80038007
      8101FF1FC001C007E103FF8FC000C001E081FFC7C000C000E001FFE3C001C000
      E005FFF8FFC3FF81F00FFFFFFFE7FFFFFFFF8001FFFFFFFFDFFB3FF9FFFFFFFF
      8FFF800983E0001F87F7000983E0000FC7EF800983E00007E3CF800980800003
      F19F800980000001F83F800980000000FC7F80098000001FF83F8009C001001F
      F19F8009E083001FC3CF8019E0838FF187E78001F1C7FFF98FFB8001F1C7FF75
      FFFF800AF1C7FF8FFFFF8005FFFFFFFF8000FC7FFFFFFFFF8000F01FFFFF000F
      8000C107E003000F80008001E003000F80000101E003000F80000001E003000F
      80000101E003000F80000001E003000F80000101E003008F80000281E0031144
      80001101E0030AB880002801E003057C80009201E007FAFC8001C403E00FFDF8
      8003F007E01FFE048007FC4FFFFFFFFFFFFFFFFFFFFFFC7FFDFFFC3FD8BFF01F
      F8FFF30FE07FC007F07FE287F07F0001E03FE30700010001C01FE28700010001
      800FE307000100010007E287000100010003E307000100018001E28700010001
      C003E30700010001E00FE2A700050001F00FE55700010001F81FEAA70005C007
      FC7FF54F0101F01FFFFFF81FC387FC7FFE0F81FFFE3FE063F00780FFFFBF8001
      E003007FE2378001C001001FC0638000C0018007C00300008000E001E00B0000
      8000F800800800008000F800000280018000E000000280038000C0006002800F
      80018002E00B8007C0018003E003C003C003C003C003E003E007E007E227E007
      F00FF00FFE3FF81FFC1FFC3FFC3FFFFF803FFFFFFFFFFFFF001FFFFF001FFF7F
      0004C003000FE00F000080010007C00F00000000000300070000000000010003
      0000000000000003000000000000000000000000000000000000000000000000
      0007800100000000001FC00380000000000FF00FC00008008007E007E0007FF0
      8023C003F000FFFC5577C001FFFFFFFE00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Images = ilImage
    Left = 52
    Top = 243
    object aAddWare: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088
      ImageIndex = 22
      OnExecute = aAddWareExecute
    end
    object aDelWare: TAction
      Caption = #1059#1073#1088#1072#1090#1100' '#1090#1086#1074#1072#1088
      Enabled = False
      Hint = #1059#1073#1088#1072#1090#1100' '#1090#1086#1074#1072#1088
      ImageIndex = 16
      OnExecute = aDelWareExecute
    end
    object aCalcSys: TAction
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1089#1091#1084#1084#1091' '#1079#1072#1095#1077#1090#1072
      Enabled = False
      Hint = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1089#1091#1084#1084#1091' '#1079#1072#1095#1077#1090#1072
      ImageIndex = 28
      OnExecute = aCalcSysExecute
    end
    object aSumm: TAction
      Caption = #1042#1074#1077#1089#1090#1080' '#1089#1091#1084#1084#1091' '#1090#1086#1074#1072#1088#1072
      Enabled = False
      Hint = #1042#1074#1077#1089#1090#1080' '#1089#1091#1084#1084#1091' '#1090#1086#1074#1072#1088#1072
      ImageIndex = 30
      OnExecute = aSummExecute
    end
    object aCalcAmount: TAction
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100'...'
      Enabled = False
      Hint = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100'...'
      ImageIndex = 29
      OnExecute = aCalcAmountExecute
    end
    object aClearWare: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      Enabled = False
      ImageIndex = 31
      OnExecute = aClearWareExecute
    end
    object aCalcOper: TAction
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1089#1091#1084#1084#1091' '#1086#1087#1077#1088#1072#1094#1080#1080
      Enabled = False
      Hint = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1089#1091#1084#1084#1091' '#1086#1087#1077#1088#1072#1094#1080#1080
      ImageIndex = 32
      OnExecute = aCalcOperExecute
    end
  end
  object pmAmount: TPopupMenu
    Left = 260
    Top = 184
    object aAddWare1: TMenuItem
      Action = aAddWare
    end
    object aDelWare1: TMenuItem
      Action = aDelWare
    end
    object aSumm1: TMenuItem
      Action = aSumm
    end
    object aCalcSys1: TMenuItem
      Action = aCalcSys
    end
    object Action11: TMenuItem
      Action = aCalcOper
    end
    object aCalcAmount1: TMenuItem
      Action = aCalcAmount
    end
  end
  object cdsOperWare201: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Oper'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@Mode'
        ParamType = ptInput
      end>
    ProviderName = 'dsOperWare201'
    RemoteServer = DM.rsCA
    BeforeInsert = cdsOperWareBeforeInsert
    AfterPost = cdsOperWareAfterPost
    AfterDelete = cdsOperWareAfterDelete
    OnCalcFields = cdsOperWareCalcFields
    Left = 560
    Top = 221
    object cdsOperWare201id_OperWare: TAutoIncField
      FieldName = 'id_OperWare'
    end
    object cdsOperWare201id_Oper: TIntegerField
      FieldName = 'id_Oper'
    end
    object cdsOperWare201AmountOper: TFloatField
      FieldName = 'AmountOper'
      DisplayFormat = '0.00'
    end
    object cdsOperWare201id_Measure: TIntegerField
      FieldName = 'id_Measure'
    end
    object cdsOperWare201PriceOper: TFloatField
      FieldName = 'PriceOper'
      DisplayFormat = '0.00'
    end
    object cdsOperWare201SummSys: TFloatField
      FieldName = 'SummSys'
      DisplayFormat = '0.00'
    end
    object cdsOperWare201PriceInv: TFloatField
      FieldName = 'PriceInv'
      DisplayFormat = '0.00'
    end
    object cdsOperWare201id_Goods: TIntegerField
      FieldName = 'id_Goods'
    end
    object cdsOperWare201MeasureName: TStringField
      FieldName = 'MeasureName'
      Size = 10
    end
    object cdsOperWare201RealKoef: TFloatField
      FieldName = 'RealKoef'
    end
    object cdsOperWare201AmountOperBaseMS: TFloatField
      FieldName = 'AmountOperBaseMS'
    end
    object cdsOperWare201WareName: TStringField
      FieldName = 'WareName'
      Size = 255
    end
    object cdsOperWare201WareID_Main: TIntegerField
      FieldName = 'WareID_Main'
    end
    object cdsOperWare201AmountOperBaseMS_2: TFloatField
      FieldName = 'AmountOperBaseMS_2'
    end
    object cdsOperWare201AmountOperBaseMS_1: TFloatField
      FieldName = 'AmountOperBaseMS_1'
    end
    object cdsOperWare201id_Raw: TIntegerField
      FieldName = 'id_Raw'
    end
    object cdsOperWare201id_ExtRaw: TIntegerField
      FieldName = 'id_ExtRaw'
    end
    object cdsOperWare201id_Service: TIntegerField
      FieldName = 'id_Service'
    end
    object cdsOperWare201SummOper_2: TFloatField
      FieldName = 'SummOper_2'
    end
    object cdsOperWare201SummSys_2: TFloatField
      FieldName = 'SummSys_2'
    end
    object cdsOperWare201PriceInv_2: TFloatField
      FieldName = 'PriceInv_2'
    end
    object cdsOperWare201DMName: TStringField
      FieldName = 'DMName'
      Size = 10
    end
    object cdsOperWare201SummOper_1: TFloatField
      FieldName = 'SummOper_1'
    end
    object cdsOperWare201SummSys_1: TFloatField
      FieldName = 'SummSys_1'
    end
    object cdsOperWare201PriceInv_1: TFloatField
      FieldName = 'PriceInv_1'
    end
    object cdsOperWare201delta: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'delta'
    end
    object cdsOperWare201SummOper2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SummOper2'
    end
    object cdsOperWare201Numb: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'Numb'
    end
    object AggregateField1: TAggregateField
      FieldName = 'SS'
      Active = True
      Expression = 'Sum(SummOper2)'
    end
  end
end
