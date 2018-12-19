object Form1: TForm1
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = #1043#1077#1085#1077#1088#1072#1090#1086#1088' '#1082#1083#1102#1095#1077#1081
  ClientHeight = 400
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
    Width = 37
    Height = 13
    Caption = #1057#1077#1088#1074#1077#1088
  end
  object dsfUserName: TLabel
    Left = 8
    Top = 40
    Width = 31
    Height = 13
    Caption = #1051#1086#1075#1080#1085
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 38
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 25
    Height = 13
    Caption = #1041#1072#1079#1072
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
    Top = 184
    Width = 100
    Height = 25
    Caption = #1043#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 136
    Top = 184
    Width = 100
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088
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
    Left = 344
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 6
    Visible = False
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 128
    Width = 233
    Height = 17
    Caption = #1055#1088#1086#1074#1077#1088#1103#1090#1100' '#1076#1086#1089#1090#1091#1087#1085#1086#1089#1090#1100' '#1073#1072#1079#1099
    Checked = True
    State = cbChecked
    TabOrder = 7
  end
  object CheckBox2: TCheckBox
    Left = 328
    Top = 200
    Width = 97
    Height = 17
    Caption = 'CheckBox2'
    TabOrder = 8
  end
  object edIC: TEdit
    Left = 107
    Top = 86
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 9
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'ack'
    FileName = 'Key.ack'
    Filter = #1060#1072#1081#1083#1099' '#1085#1072#1089#1090#1088#1086#1077#1082' (*.ack)|*.ack|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Left = 328
    Top = 32
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'ack'
    FileName = 'Key.ack'
    Filter = #1060#1072#1081#1083#1099' '#1085#1072#1089#1090#1088#1086#1077#1082' (*.ack)|*.ack|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
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
