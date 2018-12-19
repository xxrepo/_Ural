object ReplicatorDetailForm: TReplicatorDetailForm
  Left = 228
  Top = 128
  Width = 477
  Height = 436
  Caption = 'ReplicatorDetailForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Scaled = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 372
    Width = 469
    Height = 37
    Align = alBottom
    TabOrder = 2
    object OkButton: TButton
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = OkButtonClick
    end
    object Button1: TButton
      Left = 384
      Top = 8
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
    Width = 469
    Height = 177
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 25
      Height = 13
      Caption = 'Имя:'
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 59
      Height = 13
      Caption = 'Кратк. имя:'
    end
    object Label3: TLabel
      Left = 16
      Top = 72
      Width = 34
      Height = 13
      Caption = 'Логин:'
    end
    object Label4: TLabel
      Left = 16
      Top = 96
      Width = 41
      Height = 13
      Caption = 'Пароль:'
    end
    object Label5: TLabel
      Left = 16
      Top = 120
      Width = 84
      Height = 26
      Caption = 'Период очистки '#13#10'базы, дней:'
    end
    object Label6: TLabel
      Left = 16
      Top = 160
      Width = 82
      Height = 13
      Caption = 'Заблокировано:'
    end
    object Label7: TLabel
      Left = 2
      Top = 2
      Width = 465
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Общие данные:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object NameEdit: TEdit
      Left = 112
      Top = 16
      Width = 281
      Height = 21
      MaxLength = 50
      TabOrder = 0
    end
    object ShortNameEdit: TEdit
      Left = 112
      Top = 40
      Width = 73
      Height = 21
      MaxLength = 5
      TabOrder = 1
    end
    object LoginEdit: TEdit
      Left = 112
      Top = 64
      Width = 121
      Height = 21
      MaxLength = 20
      TabOrder = 2
    end
    object PasswordEdit: TEdit
      Left = 112
      Top = 88
      Width = 121
      Height = 21
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 3
      OnChange = PasswordEditChange
    end
    object DelPeriodEdit: TRxCalcEdit
      Left = 112
      Top = 128
      Width = 121
      Height = 21
      AutoSize = False
      MaxValue = 1000000
      NumGlyphs = 2
      TabOrder = 4
    end
    object DisabledCheckBox: TCheckBox
      Left = 112
      Top = 154
      Width = 25
      Height = 17
      TabOrder = 5
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 177
    Width = 469
    Height = 195
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object Label17: TLabel
      Left = 2
      Top = 2
      Width = 465
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Бизнесы репликатора:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Panel7: TPanel
      Left = 2
      Top = 15
      Width = 465
      Height = 178
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 225
        Top = 2
        Width = 3
        Height = 174
        Cursor = crHSplit
        Beveled = True
      end
      object Panel8: TPanel
        Left = 2
        Top = 2
        Width = 223
        Height = 174
        Align = alLeft
        TabOrder = 0
        object Label18: TLabel
          Left = 1
          Top = 1
          Width = 221
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Все бизнесы '
        end
        object AFListBox: TListBox
          Left = 1
          Top = 14
          Width = 221
          Height = 159
          Align = alClient
          DragMode = dmAutomatic
          ItemHeight = 13
          MultiSelect = True
          Style = lbOwnerDrawVariable
          TabOrder = 0
          OnDblClick = AFListBoxDblClick
          OnDragDrop = AFListBoxDragDrop
          OnDragOver = AFListBoxDragOver
          OnDrawItem = AFListBoxDrawItem
        end
      end
      object Panel9: TPanel
        Left = 228
        Top = 2
        Width = 37
        Height = 174
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
        object SpeedButton2: TSpeedButton
          Left = 8
          Top = 40
          Width = 23
          Height = 22
          Caption = '<'
          NumGlyphs = 2
          OnClick = SpeedButton2Click
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
      end
      object Panel10: TPanel
        Left = 265
        Top = 2
        Width = 198
        Height = 174
        Align = alClient
        TabOrder = 2
        object Label19: TLabel
          Left = 1
          Top = 1
          Width = 196
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Выбранные бизнесы '
        end
        object SFListBox: TListBox
          Left = 1
          Top = 14
          Width = 196
          Height = 159
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
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CallType'
        ParamType = ptUnknown
      end>
    ProviderName = 'dsGetReplicatorInfo'
    RemoteServer = DM.rsCA
    Left = 184
    Top = 160
  end
end
