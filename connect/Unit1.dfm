object Form1: TForm1
  Left = 349
  Top = 105
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button4: TButton
    Left = 32
    Top = 40
    Width = 425
    Height = 25
    Caption = #1057#1086#1077#1076#1080#1085#1077#1085#1080#1077' '#1089' '#1073#1072#1079#1086#1081
    TabOrder = 0
    Visible = False
    OnClick = Button4Click
  end
  object Button2: TButton
    Left = 16
    Top = 88
    Width = 177
    Height = 25
    Caption = #1054#1089#1085#1086#1074#1085#1086#1081' - '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1077
    TabOrder = 1
    OnClick = Button2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 408
    Top = 144
    Width = 185
    Height = 89
    Caption = #1058#1080#1087' '#1076#1086#1089#1090#1091#1087#1072
    Items.Strings = (
      #1051#1086#1082#1072#1083#1100#1085#1086
      #1043#1083#1086#1073#1072#1083#1100#1085#1086)
    TabOrder = 2
    OnClick = RadioGroup1Click
  end
  object Button5: TButton
    Left = 16
    Top = 168
    Width = 177
    Height = 25
    Caption = #1060#1080#1083#1100#1090#1088' - '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1077
    TabOrder = 3
    OnClick = Button5Click
  end
  object Button7: TButton
    Left = 224
    Top = 88
    Width = 177
    Height = 25
    Caption = #1054#1089#1085#1086#1074#1085#1086#1081' - '#1083#1086#1075#1080#1085
    TabOrder = 4
    OnClick = Button7Click
  end
  object Button9: TButton
    Left = 224
    Top = 168
    Width = 177
    Height = 25
    Caption = #1060#1080#1083#1100#1090#1088' - '#1083#1086#1075#1080#1085
    TabOrder = 5
    OnClick = Button9Click
  end
  object Button1: TButton
    Left = 16
    Top = 248
    Width = 177
    Height = 25
    Caption = #1088#1077#1087#1083#1080#1082#1072#1090#1086#1088'-'#1089#1086#1077#1076#1080#1085#1077#1085#1080#1077
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button11: TButton
    Left = 224
    Top = 248
    Width = 177
    Height = 25
    Caption = #1056#1077#1087#1083#1080#1082#1072#1090#1086#1088' - '#1082#1086#1085#1085#1077#1082#1090
    TabOrder = 7
    OnClick = Button11Click
  end
  object Edit1: TEdit
    Left = 64
    Top = 320
    Width = 121
    Height = 21
    TabOrder = 8
    Text = 'admin'
    Visible = False
  end
  object Edit2: TEdit
    Left = 64
    Top = 352
    Width = 121
    Height = 21
    TabOrder = 9
    Text = '123'
    Visible = False
  end
  object edIP: TEdit
    Left = 448
    Top = 256
    Width = 121
    Height = 21
    TabOrder = 10
    Text = '212.119.47.74'
  end
  object rsCA: TSocketConnection
    ServerGUID = '{5F4D097E-5296-4553-813D-385D363107E8}'
    ServerName = 'svc_Dict.Dic'
    Address = '212.119.47.74'
    Left = 576
    Top = 16
  end
  object rsFlt: TSocketConnection
    ServerGUID = '{1955E435-8CCB-47D9-840E-7E95C08B28F8}'
    ServerName = 'UNFilterApp.UnFilter'
    Address = '212.119.47.74'
    Left = 579
    Top = 49
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=iwanttobelive;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=ACS_MBase;Data Source=server;Ex' +
      'tended Properties="Use Encryption for Data=False;Tag with column' +
      ' collation when possible=False";Use Procedure for Prepare=1;Auto' +
      ' Translate=True;Packet Size=4096;Workstation ID=HP'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 522
    Top = 284
  end
  object scReplSvc: TSocketConnection
    ServerGUID = '{67884D55-9085-474F-B7AF-14F2836208ED}'
    ServerName = 'ReplSvc.ReplDM'
    Address = '212.119.47.74'
    Left = 384
    Top = 363
  end
  object SocketConnection1: TSocketConnection
    ServerName = 'svc_Dict.Dic'
    Address = '212.119.47.74'
    Left = 80
    Top = 384
  end
end
