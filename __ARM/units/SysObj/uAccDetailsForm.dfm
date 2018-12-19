object AccDetailsForm: TAccDetailsForm
  Left = 219
  Top = 140
  Width = 472
  Height = 334
  ActiveControl = NameEdit
  Caption = 'AccDetailsForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 275
    Width = 464
    Height = 32
    Align = alBottom
    TabOrder = 1
    object OkButton: TButton
      Left = 288
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = OkButtonClick
    end
    object Button2: TButton
      Left = 376
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 464
    Height = 248
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 47
      Width = 53
      Height = 13
      Caption = 'Название:'
    end
    object Label5: TLabel
      Left = 16
      Top = 71
      Width = 28
      Height = 13
      Caption = 'Банк:'
    end
    object Label6: TLabel
      Left = 16
      Top = 95
      Width = 55
      Height = 13
      Caption = 'Расч. счет:'
    end
    object Label7: TLabel
      Left = 16
      Top = 119
      Width = 56
      Height = 13
      Caption = 'Корр. счет:'
    end
    object Label8: TLabel
      Left = 16
      Top = 143
      Width = 27
      Height = 13
      Caption = 'ИНН:'
    end
    object Label9: TLabel
      Left = 16
      Top = 167
      Width = 25
      Height = 13
      Caption = 'БИК:'
    end
    object Label10: TLabel
      Left = 16
      Top = 186
      Width = 40
      Height = 13
      Caption = 'Бизнес:'
    end
    object SpeedButton3: TSpeedButton
      Left = 305
      Top = 183
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton3Click
    end
    object Bevel1: TBevel
      Left = 8
      Top = 32
      Width = 449
      Height = 9
      Shape = bsTopLine
    end
    object Label13: TLabel
      Left = 17
      Top = 9
      Width = 38
      Height = 13
      Caption = 'Группа:'
    end
    object NameEdit: TEdit
      Left = 80
      Top = 39
      Width = 353
      Height = 21
      MaxLength = 50
      TabOrder = 2
    end
    object BankEdit: TEdit
      Left = 80
      Top = 63
      Width = 353
      Height = 21
      MaxLength = 50
      TabOrder = 3
    end
    object PrsnAccNameEdit: TEdit
      Left = 80
      Top = 87
      Width = 153
      Height = 21
      MaxLength = 20
      TabOrder = 4
    end
    object CorrAccNameEdit: TEdit
      Left = 80
      Top = 111
      Width = 153
      Height = 21
      MaxLength = 20
      TabOrder = 5
    end
    object INNEdit: TEdit
      Left = 80
      Top = 135
      Width = 153
      Height = 21
      MaxLength = 20
      TabOrder = 6
    end
    object BIKEdit: TEdit
      Left = 80
      Top = 159
      Width = 153
      Height = 21
      MaxLength = 20
      TabOrder = 7
    end
    object BusinessEdit: TEdit
      Left = 80
      Top = 183
      Width = 225
      Height = 21
      MaxLength = 50
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 8
      OnKeyDown = BusinessEditKeyDown
    end
    object DisabledCheckBox: TCheckBox
      Left = 296
      Top = 210
      Width = 66
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Удалить:'
      TabOrder = 9
      Visible = False
    end
    object cbNeedSend: TCheckBox
      Left = 15
      Top = 209
      Width = 225
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Передавать в удаленные базы:'
      TabOrder = 10
    end
    object cbShowInRoot: TCheckBox
      Left = 14
      Top = 227
      Width = 226
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Отображать в первом уровне баланса'
      TabOrder = 11
    end
    object Edit2: TEdit
      Left = 80
      Top = 8
      Width = 329
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 0
    end
    object Button1: TButton
      Left = 409
      Top = 9
      Width = 20
      Height = 20
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 248
    Width = 464
    Height = 27
    ActivePage = CurrTabSheet
    Align = alClient
    TabOrder = 2
    Visible = False
    object CurrTabSheet: TTabSheet
      Caption = 'Валюты счета'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 456
        Height = 0
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object Label2: TLabel
          Left = 2
          Top = 2
          Width = 452
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Валюты счета:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Panel4: TPanel
          Left = 2
          Top = 15
          Width = 452
          Height = 492
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 0
          object Splitter1: TSplitter
            Left = 201
            Top = 2
            Width = 3
            Height = 488
            Cursor = crHSplit
            Beveled = True
          end
          object Panel5: TPanel
            Left = 2
            Top = 2
            Width = 199
            Height = 488
            Align = alLeft
            TabOrder = 0
            object Label3: TLabel
              Left = 1
              Top = 1
              Width = 197
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'Все валюты'
            end
            object AFListBox: TListBox
              Left = 1
              Top = 14
              Width = 197
              Height = 473
              Align = alClient
              DragMode = dmAutomatic
              ItemHeight = 16
              MultiSelect = True
              Style = lbOwnerDrawVariable
              TabOrder = 0
              OnDblClick = AFListBoxDblClick
              OnDragDrop = AFListBoxDragDrop
              OnDragOver = AFListBoxDragOver
              OnDrawItem = AFListBoxDrawItem
            end
          end
          object Panel6: TPanel
            Left = 204
            Top = 2
            Width = 37
            Height = 488
            Align = alLeft
            TabOrder = 1
            object SpeedButton1: TSpeedButton
              Left = 8
              Top = 16
              Width = 23
              Height = 22
              Caption = '>'
              NumGlyphs = 2
              OnClick = SpeedButton1Click
            end
            object SpeedButton4: TSpeedButton
              Left = 8
              Top = 64
              Width = 23
              Height = 22
              Caption = '>>'
              NumGlyphs = 2
              OnClick = SpeedButton4Click
            end
            object SpeedButton5: TSpeedButton
              Left = 8
              Top = 88
              Width = 23
              Height = 22
              Caption = '<<'
              NumGlyphs = 2
              OnClick = SpeedButton5Click
            end
            object SpeedButton2: TSpeedButton
              Left = 8
              Top = 40
              Width = 23
              Height = 22
              Caption = '<'
              NumGlyphs = 2
              OnClick = SpeedButton2Click
            end
          end
          object Panel7: TPanel
            Left = 241
            Top = 2
            Width = 209
            Height = 488
            Align = alClient
            TabOrder = 2
            object Label4: TLabel
              Left = 1
              Top = 1
              Width = 207
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'Выбранные валюты счета'
            end
            object SFListBox: TListBox
              Left = 1
              Top = 14
              Width = 207
              Height = 473
              Align = alClient
              DragMode = dmAutomatic
              ItemHeight = 13
              MultiSelect = True
              Style = lbOwnerDrawVariable
              TabOrder = 0
              OnDblClick = SFListBoxDblClick
              OnDragDrop = AFListBoxDragDrop
              OnDragOver = AFListBoxDragOver
              OnDrawItem = SFListBoxDrawItem
            end
          end
        end
      end
    end
    object BusTabSheet: TTabSheet
      Caption = 'Бизнесы счета'
      ImageIndex = 1
      object BusPanel: TPanel
        Left = 0
        Top = 0
        Width = 456
        Height = 0
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object Label17: TLabel
          Left = 2
          Top = 2
          Width = 48
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Бизнесы:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Panel8: TPanel
          Left = 2
          Top = 15
          Width = 452
          Height = 492
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 0
          object Splitter2: TSplitter
            Left = 209
            Top = 2
            Width = 3
            Height = 488
            Cursor = crHSplit
            Beveled = True
          end
          object Panel9: TPanel
            Left = 2
            Top = 2
            Width = 207
            Height = 488
            Align = alLeft
            TabOrder = 0
            object Label18: TLabel
              Left = 1
              Top = 1
              Width = 69
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'Все бизнесы '
            end
            object BAFListBox: TListBox
              Left = 1
              Top = 14
              Width = 205
              Height = 473
              Align = alClient
              DragMode = dmAutomatic
              ItemHeight = 13
              MultiSelect = True
              Style = lbOwnerDrawVariable
              TabOrder = 0
              OnDblClick = BAFListBoxDblClick
              OnDragDrop = AFListBoxDragDrop
              OnDragOver = AFListBoxDragOver
              OnDrawItem = BAFListBoxDrawItem
            end
          end
          object Panel10: TPanel
            Left = 212
            Top = 2
            Width = 37
            Height = 488
            Align = alLeft
            TabOrder = 1
            object SpeedButton6: TSpeedButton
              Left = 8
              Top = 16
              Width = 23
              Height = 22
              Caption = '>'
              NumGlyphs = 2
              OnClick = SpeedButton6Click
            end
            object SpeedButton7: TSpeedButton
              Left = 8
              Top = 40
              Width = 23
              Height = 22
              Caption = '<'
              NumGlyphs = 2
              OnClick = SpeedButton7Click
            end
            object SpeedButton8: TSpeedButton
              Left = 8
              Top = 64
              Width = 23
              Height = 22
              Caption = '>>'
              NumGlyphs = 2
              OnClick = SpeedButton8Click
            end
            object SpeedButton9: TSpeedButton
              Left = 8
              Top = 88
              Width = 23
              Height = 22
              Caption = '<<'
              NumGlyphs = 2
              OnClick = SpeedButton9Click
            end
          end
          object Panel11: TPanel
            Left = 249
            Top = 2
            Width = 201
            Height = 488
            Align = alClient
            TabOrder = 2
            object Label19: TLabel
              Left = 1
              Top = 1
              Width = 109
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'Выбранные бизнесы '
            end
            object BSFListBox: TListBox
              Left = 1
              Top = 14
              Width = 199
              Height = 473
              Align = alClient
              DragMode = dmAutomatic
              ItemHeight = 13
              MultiSelect = True
              Style = lbOwnerDrawVariable
              TabOrder = 0
              OnDblClick = BSFListBoxDblClick
              OnDragDrop = AFListBoxDragDrop
              OnDragOver = AFListBoxDragOver
              OnDrawItem = BSFListBoxDrawItem
            end
          end
        end
      end
    end
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'CallType'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptUnknown
      end>
    ProviderName = 'dsGetAccInfo'
    RemoteServer = DM.rsCA
    Left = 312
    Top = 88
  end
  object cdsAccGroup: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_business'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'dsAccGroup'
    RemoteServer = DM.rsCA
    Left = 384
    Top = 96
    object cdsAccGroupid_Group: TIntegerField
      FieldName = 'id_Group'
      ReadOnly = True
    end
    object cdsAccGroupName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object cdsAccGroupCnt: TIntegerField
      FieldName = 'Cnt'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsAccGroup
    Left = 376
    Top = 136
  end
end
