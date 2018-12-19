object Settings: TSettings
  Left = 190
  Top = 289
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Настройки'
  ClientHeight = 340
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 299
    Width = 328
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 242
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 151
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 328
    Height = 299
    Align = alClient
    Caption = ' '
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 326
      Height = 124
      Align = alTop
      Caption = 'Параметры сервера'
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 21
        Width = 37
        Height = 13
        Caption = 'Сервер'
      end
      object Label2: TLabel
        Left = 232
        Top = 21
        Width = 25
        Height = 13
        Caption = 'Порт'
      end
      object Label5: TLabel
        Left = 8
        Top = 47
        Width = 140
        Height = 13
        Caption = 'Период обновления (минут)'
      end
      object Label6: TLabel
        Left = 8
        Top = 98
        Width = 38
        Height = 13
        Caption = 'Пароль'
      end
      object Label7: TLabel
        Left = 8
        Top = 72
        Width = 31
        Height = 13
        Caption = 'Логин'
      end
      object edServer: TEdit
        Left = 59
        Top = 18
        Width = 155
        Height = 21
        TabOrder = 0
      end
      object edPort: TCurrencyEdit
        Left = 264
        Top = 18
        Width = 53
        Height = 21
        AutoSize = False
        DisplayFormat = ',0;-,0'#39
        TabOrder = 1
        Value = 211
      end
      object edPeriod: TRxSpinEdit
        Left = 197
        Top = 44
        Width = 53
        Height = 21
        TabOrder = 2
      end
      object edSvrName: TEdit
        Left = 107
        Top = 70
        Width = 144
        Height = 21
        TabOrder = 3
      end
      object edSvrPassword: TEdit
        Left = 107
        Top = 94
        Width = 144
        Height = 21
        PasswordChar = '*'
        TabOrder = 4
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 125
      Width = 326
      Height = 173
      Align = alClient
      Caption = 'Параметры базы данных'
      TabOrder = 1
      object Label3: TLabel
        Left = 8
        Top = 47
        Width = 91
        Height = 13
        Caption = 'Имя базы данных'
      end
      object dsfUserName: TLabel
        Left = 8
        Top = 72
        Width = 31
        Height = 13
        Caption = 'Логин'
      end
      object Label4: TLabel
        Left = 8
        Top = 98
        Width = 38
        Height = 13
        Caption = 'Пароль'
      end
      object Label8: TLabel
        Left = 8
        Top = 23
        Width = 56
        Height = 13
        Caption = 'Сервер БД'
      end
      object edBasePassword: TEdit
        Left = 107
        Top = 94
        Width = 144
        Height = 21
        PasswordChar = '*'
        TabOrder = 2
      end
      object edBaseUserName: TEdit
        Left = 107
        Top = 70
        Width = 144
        Height = 21
        TabOrder = 1
      end
      object edBaseName: TEdit
        Left = 107
        Top = 21
        Width = 144
        Height = 21
        TabOrder = 0
        Text = '127.0.0.1'
      end
      object edxxxCatalog: TEdit
        Left = 107
        Top = 45
        Width = 144
        Height = 21
        TabOrder = 3
      end
    end
  end
end
