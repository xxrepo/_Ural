object fOperOffset: TfOperOffset
  Left = 0
  Top = 0
  Width = 656
  Height = 642
  TabOrder = 0
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 656
    Height = 642
    ActivePage = tsData
    Align = alClient
    TabOrder = 0
    object tsData: TTabSheet
      Caption = '������'
      object P1: TPanel
        Left = 0
        Top = 0
        Width = 648
        Height = 96
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        Constraints.MinWidth = 500
        TabOrder = 0
        object lbReprName: TLabel
          Left = 2
          Top = 28
          Width = 78
          Height = 13
          Caption = '�������������'
          FocusControl = edReprName
        end
        object Label9: TLabel
          Left = 2
          Top = 5
          Width = 70
          Height = 13
          Caption = '��� ��������'
          FocusControl = cbOperTypeIn
        end
        object Label13: TLabel
          Left = 2
          Top = 51
          Width = 58
          Height = 13
          Caption = '����������'
          FocusControl = DBEdit3
        end
        object Label1: TLabel
          Left = 438
          Top = 3
          Width = 79
          Height = 13
          Caption = '�������������'
        end
        object Label3: TLabel
          Left = 4
          Top = 79
          Width = 37
          Height = 13
          Caption = '������'
        end
        object edReprName: TDBEdit
          Left = 88
          Top = 24
          Width = 532
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'ReprName'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 1
        end
        object BitBtn4: TBitBtn
          Left = 619
          Top = 24
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
          TabOrder = 2
          OnClick = BitBtn4Click
        end
        object cbOperTypeIn: TComboBox
          Left = 89
          Top = 1
          Width = 344
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = cbOperTypeInChange
          Items.Strings = (
            '��������� ��������'
            '��������� ��������')
        end
        object DBEdit3: TDBEdit
          Left = 88
          Top = 47
          Width = 555
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMenu
          DataField = 'ContrAgentName'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit9: TDBEdit
          Left = 525
          Top = 1
          Width = 72
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Correct'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit8: TDBEdit
          Left = 88
          Top = 71
          Width = 555
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMenu
          DataField = 'BusinessName'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 5
        end
      end
      object P2: TPanel
        Left = 0
        Top = 96
        Width = 648
        Height = 26
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 1
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 308
          Height = 26
          Align = alLeft
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 0
          object Label2: TLabel
            Left = 4
            Top = 8
            Width = 34
            Height = 13
            Caption = '�����'
          end
          object sbConvert: TSpeedButton
            Left = 241
            Top = 4
            Width = 23
            Height = 21
            Hint = '���������� ����� ������ � ��������� ������'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
              73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
              0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
              0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
              0333337F777777737F333308888888880333337F333333337F33330888888888
              03333373FFFFFFFF733333700000000073333337777777773333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbConvertClick
          end
          object RxSpeedButton1: TRxSpeedButton
            Left = 271
            Top = 4
            Width = 25
            Height = 21
            Caption = '<<--'
            OnClick = RxSpeedButton1Click
          end
          object DBEdit2: TRxDBCalcEdit
            Left = 88
            Top = 3
            Width = 129
            Height = 21
            DataField = 'PriceOper'
            DataSource = dsOperFin
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
            OnClick = DBEdit2Click
          end
          object BitBtn1: TBitBtn
            Left = 213
            Top = 3
            Width = 22
            Height = 21
            TabOrder = 1
            OnClick = BitBtn1Click
            Glyph.Data = {
              46020000424D460200000000000036000000280000000E0000000C0000000100
              1800000000001002000000000000000000000000000000000000F800F8000000
              0000000000000000000000000000000000000000000000000000000000000000
              00F800F800008080008080008000008000008000008000008000008000008000
              008000008000008000008000000000000000808000F8F8F88080008080008080
              0080800080800080800080800080800080800080800080000000000000008080
              00F8F800808000000000F8F8F8000000F8F8F8000000F8F8F8000000F8F8F800
              00008000000000000000808000F8F8F880800080800080800080800080800080
              80008080008080008080008080008000000000000000808000F8F80080800000
              0000F8F8F8000000F8F8F8000000F8F8F8000000F8F8F8000000800000000000
              0000808000F8F8F8808000808000808000808000808000808000808000808000
              8080008080008000000000000000808000F8F800000000C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C08080008080008000000000000000808000F8F8F8
              000000F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8C0C0C08080008080008000
              000000000000808000F8F8000000000000000000000000000000000000000000
              000000008080008080008000000000000000808000F8F8F8F8F800F8F8F8F8F8
              00F8F8F8F8F800F8F8F8F8F800F8F8F8F8F800F8F8F88080000000000000F800
              F880800080800080800080800080800080800080800080800080800080800080
              8000808000F800F80000}
            Layout = blGlyphBottom
          end
        end
        inline fCurSelector1: TfCurSelector
          Left = 308
          Width = 340
          Height = 26
          Align = alClient
          TabOrder = 1
          inherited Label1: TLabel
            Left = 4
          end
          inherited cbCur: TComboBox
            Left = 97
            Width = 104
          end
        end
      end
      object P_FF: TPanel
        Left = 0
        Top = 122
        Width = 648
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 2
        object Label5: TLabel
          Left = 3
          Top = 0
          Width = 70
          Height = 26
          Caption = '���������� �����.'
          FocusControl = lcFormalDistrib
          WordWrap = True
        end
        object Label10: TLabel
          Left = 312
          Top = 0
          Width = 91
          Height = 26
          Caption = '�������������� �����.'
          FocusControl = lcFuncDistrib
          WordWrap = True
        end
        object sbForm: TSpeedButton
          Left = 276
          Top = 5
          Width = 20
          Height = 20
          Hint = '�������� ���������� �������������'
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
          OnClick = sbFormClick
        end
        object sbFunc: TSpeedButton
          Left = 590
          Top = 5
          Width = 20
          Height = 20
          Hint = '�������� �������������� �������������'
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
          OnClick = sbFuncClick
        end
        object lcFormalDistrib: TRxDBLookupCombo
          Left = 87
          Top = 4
          Width = 178
          Height = 21
          DropDownCount = 8
          DropDownWidth = 250
          DataField = 'id_FormalDistrib'
          DataSource = dsOperFin
          LookupField = 'id_FormalDistrib'
          LookupDisplay = 'Name'
          LookupSource = dsFormal
          TabOrder = 0
        end
        object lcFuncDistrib: TRxDBLookupCombo
          Left = 405
          Top = 4
          Width = 180
          Height = 21
          DropDownCount = 8
          DataField = 'id_FuncDistrib'
          DataSource = dsOperFin
          LookupField = 'id_FuncDistrib'
          LookupDisplay = 'Name'
          LookupSource = dsFunc
          TabOrder = 1
        end
      end
      object pnForSize: TPanel
        Left = 0
        Top = 237
        Width = 648
        Height = 377
        Align = alClient
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 3
        object Splitter2: TSplitter
          Left = 0
          Top = 79
          Width = 648
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 648
          Height = 79
          Align = alTop
          Caption = '�����������'
          Constraints.MinHeight = 45
          TabOrder = 0
          object DBMemo1: TDBMemo
            Left = 2
            Top = 15
            Width = 644
            Height = 62
            Align = alClient
            DataField = 'OpComment'
            DataSource = dsOperFin
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        inline fExtDataVal1: TfExtDataVal
          Top = 82
          Width = 648
          Height = 295
          Align = alClient
          TabOrder = 1
          inherited ToolBar: TToolBar
            Width = 648
          end
          inherited RxDBGrid1: TRxDBGrid
            Width = 648
            Height = 269
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 149
        Width = 648
        Height = 88
        Align = alTop
        Caption = ' ��������: '
        TabOrder = 4
        object Label8: TLabel
          Left = 10
          Top = 23
          Width = 128
          Height = 13
          Caption = '���. �������/���������'
        end
        object Label12: TLabel
          Left = 10
          Top = 44
          Width = 145
          Height = 13
          Caption = '��. ���������/���� �������'
        end
        object Label14: TLabel
          Left = 10
          Top = 67
          Width = 44
          Height = 13
          Caption = '�������'
        end
        object DBEdit5: TDBEdit
          Left = 162
          Top = 63
          Width = 452
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'Contract'
          DataSource = dsOperFin
          TabOrder = 2
        end
        object edImp_PayBasic: TDBEdit
          Left = 162
          Top = 18
          Width = 452
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'Imp_PayBasic'
          DataSource = dsOperFin
          TabOrder = 0
        end
        object edAccInv_PayAssignment: TDBEdit
          Left = 162
          Top = 40
          Width = 452
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'AccInv_PayAssignment'
          DataSource = dsOperFin
          TabOrder = 1
        end
        object btnX1: TButton
          Left = 616
          Top = 17
          Width = 24
          Height = 21
          Anchors = [akTop, akRight]
          Caption = '<--'
          TabOrder = 3
          OnClick = btnX1Click
        end
        object btnX2: TButton
          Left = 616
          Top = 40
          Width = 24
          Height = 21
          Anchors = [akTop, akRight]
          Caption = '<--'
          TabOrder = 4
          OnClick = btnX2Click
        end
        object btnX3: TButton
          Left = 616
          Top = 64
          Width = 24
          Height = 21
          Anchors = [akTop, akRight]
          Caption = '<--'
          TabOrder = 5
          OnClick = btnX3Click
        end
      end
    end
    object tsComment: TTabSheet
      Caption = '���. ����������'
      ImageIndex = 1
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 648
        Height = 103
        Align = alTop
        Caption = ' '
        TabOrder = 0
        object Label4: TLabel
          Left = 4
          Top = 8
          Width = 80
          Height = 13
          Caption = '���� ���������'
          FocusControl = DBEdit7
        end
        object Label6: TLabel
          Left = 4
          Top = 31
          Width = 59
          Height = 13
          Caption = '���� �����'
          FocusControl = DBEdit1
        end
        object Label11: TLabel
          Left = 4
          Top = 56
          Width = 67
          Height = 13
          Caption = '�����������'
          FocusControl = DBEdit6
        end
        object Label15: TLabel
          Left = 4
          Top = 79
          Width = 95
          Height = 13
          Caption = '���� �����������'
          FocusControl = DBEdit10
        end
        object DBEdit7: TDBEdit
          Left = 106
          Top = 3
          Width = 536
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
          Width = 536
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
      inline fBJByOper1: TfBJByOper
        Top = 103
        Width = 648
        Height = 154
        Align = alTop
        TabOrder = 1
        inherited dbgBJ: TDBGridEh
          Width = 648
          Height = 154
        end
      end
    end
    object tsOperList_Off: TTabSheet
      Caption = '��������������� ��������'
      ImageIndex = 2
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 648
        Height = 41
        Align = alTop
        Caption = ' '
        TabOrder = 0
        object btnShowOper: TButton
          Left = 16
          Top = 8
          Width = 201
          Height = 25
          Caption = '�������� ��������'
          TabOrder = 0
          OnClick = btnShowOperClick
        end
        object btnGen: TButton
          Left = 296
          Top = 8
          Width = 137
          Height = 25
          Caption = '������������'
          TabOrder = 1
          Visible = False
          OnClick = btnGenClick
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
    Left = 96
    Top = 190
    object cdsOperFinid_Oper: TIntegerField
      FieldName = 'id_Oper'
    end
    object cdsOperFinid_OperParent: TIntegerField
      FieldName = 'id_OperParent'
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
      DisplayValues = '��;���'
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
    object cdsOperFinid_Replicator: TIntegerField
      FieldName = 'id_Replicator'
    end
  end
  object dsOperFin: TDataSource
    DataSet = cdsOperFin
    Left = 128
    Top = 190
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
    Left = 240
    Top = 240
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
    Left = 276
    Top = 240
  end
  object dsFunc: TDataSource
    DataSet = cdsFunc
    Left = 276
    Top = 272
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
    Left = 240
    Top = 272
    object cdsFuncid_FuncDistrib: TAutoIncField
      FieldName = 'id_FuncDistrib'
      ReadOnly = True
    end
    object cdsFuncName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object pmIns: TPopupMenu
    Left = 620
    Top = 124
  end
end