object LogInForm: TLogInForm
  Left = 341
  Top = 166
  ActiveControl = edPassword
  BorderStyle = bsDialog
  Caption = 'System login'
  ClientHeight = 118
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 88
    Width = 32
    Height = 25
    Caption = '>>'
    ParentShowHint = False
    ShowHint = True
    Visible = False
    OnClick = SpeedButton1Click
  end
  object Button1: TButton
    Left = 101
    Top = 90
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 189
    Top = 90
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Отмена'
    ModalResult = 2
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 2
    Top = 3
    Width = 267
    Height = 79
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = ' '
    TabOrder = 2
    object Label2: TLabel
      Left = 9
      Top = 13
      Width = 31
      Height = 13
      Caption = 'Логин'
    end
    object Label3: TLabel
      Left = 9
      Top = 43
      Width = 38
      Height = 13
      Caption = 'Пароль'
    end
    object edUserID: TEdit
      Left = 63
      Top = 11
      Width = 198
      Height = 21
      TabOrder = 0
    end
    object edPassword: TEdit
      Left = 63
      Top = 41
      Width = 198
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Left = 26
    Top = 11
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 8304
      OnExecute = Action1Execute
    end
  end
end
