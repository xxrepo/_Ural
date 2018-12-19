object UserDetailsForm: TUserDetailsForm
  Left = 136
  Top = 87
  Width = 494
  Height = 551
  Caption = 'UserDetailsForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 486
    Height = 97
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label4: TLabel
      Left = 24
      Top = 32
      Width = 52
      Height = 13
      Caption = 'Фамилия:'
    end
    object Label5: TLabel
      Left = 24
      Top = 56
      Width = 25
      Height = 13
      Caption = 'Имя:'
    end
    object Label6: TLabel
      Left = 24
      Top = 80
      Width = 50
      Height = 13
      Caption = 'Отчество:'
    end
    object Label2: TLabel
      Left = 2
      Top = 2
      Width = 482
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'ФИО:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LastNameEdit: TEdit
      Left = 88
      Top = 24
      Width = 121
      Height = 21
      MaxLength = 50
      TabOrder = 0
    end
    object FirstNameEdit: TEdit
      Left = 88
      Top = 48
      Width = 121
      Height = 21
      MaxLength = 50
      TabOrder = 1
    end
    object MiddleNameEdit: TEdit
      Left = 88
      Top = 72
      Width = 121
      Height = 21
      MaxLength = 50
      TabOrder = 2
    end
    object cbisPPP: TCheckBox
      Left = 228
      Top = 71
      Width = 252
      Height = 17
      Caption = 'Ограничить доступ к счетам и контрагентам'
      TabOrder = 3
    end
    object cbid_UADM: TCheckBox
      Left = 229
      Top = 31
      Width = 252
      Height = 17
      Caption = 'Админ'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 137
    Width = 486
    Height = 88
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 482
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Паспортные данные:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 34
      Height = 13
      Caption = 'Серия:'
    end
    object Label7: TLabel
      Left = 248
      Top = 24
      Width = 37
      Height = 13
      Caption = 'Номер:'
    end
    object Label11: TLabel
      Left = 24
      Top = 48
      Width = 36
      Height = 13
      Caption = 'Выдан:'
    end
    object Label12: TLabel
      Left = 24
      Top = 72
      Width = 53
      Height = 13
      Caption = 'Прописан:'
    end
    object PspSeriesEdit: TEdit
      Left = 88
      Top = 16
      Width = 121
      Height = 21
      MaxLength = 10
      TabOrder = 0
    end
    object pspNumberEdit: TEdit
      Left = 312
      Top = 16
      Width = 153
      Height = 21
      MaxLength = 10
      TabOrder = 1
    end
    object pspPlaceEdit: TEdit
      Left = 87
      Top = 40
      Width = 225
      Height = 21
      MaxLength = 255
      TabOrder = 2
    end
    object pspAddrEdit: TEdit
      Left = 88
      Top = 64
      Width = 377
      Height = 21
      MaxLength = 255
      TabOrder = 4
    end
    object pspDate: TDateEdit
      Left = 312
      Top = 40
      Width = 153
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 97
    Width = 486
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label8: TLabel
      Left = 2
      Top = 2
      Width = 482
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Данные аутентификации:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 24
      Top = 24
      Width = 34
      Height = 13
      Caption = 'Логин:'
    end
    object Label10: TLabel
      Left = 248
      Top = 24
      Width = 41
      Height = 13
      Caption = 'Пароль:'
    end
    object LoginEdit: TEdit
      Left = 88
      Top = 16
      Width = 121
      Height = 21
      MaxLength = 20
      TabOrder = 0
    end
    object PasswordEdit: TEdit
      Left = 312
      Top = 16
      Width = 121
      Height = 21
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 1
      OnChange = PasswordEditChange
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 381
    Width = 486
    Height = 113
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 4
    object Label13: TLabel
      Left = 2
      Top = 2
      Width = 482
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Дополнительная информация:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 24
      Top = 48
      Width = 34
      Height = 13
      Caption = 'Адрес:'
    end
    object Label15: TLabel
      Left = 24
      Top = 72
      Width = 48
      Height = 13
      Caption = 'Телефон:'
    end
    object Label16: TLabel
      Left = 280
      Top = 72
      Width = 28
      Height = 13
      Caption = 'eMail:'
    end
    object Label20: TLabel
      Left = 24
      Top = 24
      Width = 61
      Height = 13
      Caption = 'Должность:'
    end
    object AddrRealEdit: TEdit
      Left = 88
      Top = 40
      Width = 377
      Height = 21
      MaxLength = 255
      TabOrder = 1
    end
    object PhonesEdit: TEdit
      Left = 88
      Top = 64
      Width = 137
      Height = 21
      MaxLength = 255
      TabOrder = 2
    end
    object EmailsEdit: TEdit
      Left = 328
      Top = 64
      Width = 137
      Height = 21
      MaxLength = 255
      TabOrder = 3
    end
    object DisabledCheckBox: TCheckBox
      Left = 24
      Top = 88
      Width = 105
      Height = 17
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = 'Заблокирован:'
      ParentBiDiMode = False
      TabOrder = 4
    end
    object OrgPostEdit: TEdit
      Left = 88
      Top = 16
      Width = 377
      Height = 21
      MaxLength = 254
      TabOrder = 0
    end
    object cbisRelp: TCheckBox
      Left = 280
      Top = 88
      Width = 131
      Height = 17
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = 'Передавать на места'
      ParentBiDiMode = False
      TabOrder = 5
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 494
    Width = 486
    Height = 30
    Align = alBottom
    TabOrder = 5
    object OkButton: TButton
      Left = 312
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = OkButtonClick
    end
    object CancelButton: TButton
      Left = 400
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object Button1: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Action = Action1
      TabOrder = 2
      Visible = False
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 225
    Width = 486
    Height = 156
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    object Label17: TLabel
      Left = 2
      Top = 2
      Width = 482
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Участие в группах:'
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
      Width = 482
      Height = 139
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 225
        Top = 2
        Width = 3
        Height = 135
        Cursor = crHSplit
        Beveled = True
      end
      object Panel8: TPanel
        Left = 2
        Top = 2
        Width = 223
        Height = 135
        Align = alLeft
        TabOrder = 0
        object Label18: TLabel
          Left = 1
          Top = 1
          Width = 221
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Все группы'
        end
        object AFListBox: TListBox
          Left = 1
          Top = 14
          Width = 221
          Height = 120
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
        Height = 135
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
        object SpeedButton3: TSpeedButton
          Left = 8
          Top = 64
          Width = 23
          Height = 22
          Caption = '>>'
          NumGlyphs = 2
          OnClick = SpeedButton3Click
        end
        object SpeedButton4: TSpeedButton
          Left = 8
          Top = 88
          Width = 23
          Height = 25
          Caption = '<<'
          NumGlyphs = 2
          OnClick = SpeedButton4Click
        end
      end
      object Panel10: TPanel
        Left = 265
        Top = 2
        Width = 215
        Height = 135
        Align = alClient
        TabOrder = 2
        object Label19: TLabel
          Left = 1
          Top = 1
          Width = 213
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Выбранные группы'
        end
        object SFListBox: TListBox
          Left = 1
          Top = 14
          Width = 213
          Height = 120
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
    ProviderName = 'dsGetUser'
    RemoteServer = DM.rsCA
    Left = 360
    Top = 296
  end
  object ActionList1: TActionList
    Left = 368
    Top = 24
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 24688
      OnExecute = Action1Execute
    end
  end
end
