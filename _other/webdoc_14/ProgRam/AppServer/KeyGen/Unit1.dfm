object Form1: TForm1
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Генератор ключей'
  ClientHeight = 222
  ClientWidth = 523
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
  object Label1: TLabel
    Left = 8
    Top = 15
    Width = 91
    Height = 13
    Caption = 'Имя базы данных'
  end
  object dsfUserName: TLabel
    Left = 8
    Top = 40
    Width = 31
    Height = 13
    Caption = 'Логин'
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 38
    Height = 13
    Caption = 'Пароль'
  end
  object Memo2: TMemo
    Left = 256
    Top = 8
    Width = 173
    Height = 145
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Button3: TButton
    Left = 16
    Top = 144
    Width = 100
    Height = 25
    Caption = 'Генерировать'
    TabOrder = 1
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 144
    Top = 144
    Width = 100
    Height = 25
    Caption = 'Просмотр'
    TabOrder = 2
    OnClick = Button4Click
  end
  object edBaseName: TEdit
    Left = 107
    Top = 13
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'localhost'
  end
  object edUserName: TEdit
    Left = 107
    Top = 38
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'sa'
  end
  object edPassword: TEdit
    Left = 107
    Top = 62
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 5
  end
  object Button1: TButton
    Left = 128
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 6
    Visible = False
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 88
    Width = 233
    Height = 17
    Caption = 'Проверять доступность базы'
    Checked = True
    State = cbChecked
    TabOrder = 7
  end
  object CheckBox2: TCheckBox
    Left = 56
    Top = 120
    Width = 97
    Height = 17
    Caption = 'CheckBox2'
    TabOrder = 8
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'ack'
    FileName = 'Key.ack'
    Filter = 'Файлы настроек (*.ack)|*.ack|Все файлы (*.*)|*.*'
    Left = 328
    Top = 32
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'ack'
    FileName = 'Key.ack'
    Filter = 'Файлы настроек (*.ack)|*.ack|Все файлы (*.*)|*.*'
    Left = 392
    Top = 32
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=1013;Persist Security Info=True;Use' +
      'r ID=sa;Initial Catalog=ACS_MBase;Data Source=SP'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 296
    Top = 32
  end
  object ADOConnection2: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID=sa;Initial Catalog=ACS_MBase;Data Source=COALSE' +
      'RV'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 312
    Top = 96
  end
end
