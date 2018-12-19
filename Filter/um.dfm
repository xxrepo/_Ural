object Form1: TForm1
  Left = 24
  Top = 22
  Width = 1108
  Height = 805
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
  object Button1: TButton
    Left = 568
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 248
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 376
    Top = 48
    Width = 713
    Height = 361
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object RxSpinEdit1: TRxSpinEdit
    Left = 104
    Top = 8
    Width = 121
    Height = 21
    Value = 5
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 0
    Top = 410
    Width = 1100
    Height = 368
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 4
    object Splitter1: TSplitter
      Left = 273
      Top = 1
      Width = 3
      Height = 366
      Cursor = crHSplit
    end
    object PageControl1: TPageControl
      Left = 276
      Top = 1
      Width = 823
      Height = 366
      ActivePage = TabSheet3
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
      end
      object TabSheet2: TTabSheet
        Caption = 'Данные'
        ImageIndex = 1
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 815
          Height = 338
          Align = alClient
          DataSource = DataSource1
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'TabSheet3'
        ImageIndex = 2
      end
    end
    object TreeView1: TTreeView
      Left = 1
      Top = 1
      Width = 272
      Height = 366
      Align = alLeft
      Indent = 19
      TabOrder = 1
    end
  end
  object Button3: TButton
    Left = 184
    Top = 184
    Width = 75
    Height = 25
    Caption = 'FROM'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 184
    Top = 248
    Width = 75
    Height = 25
    Caption = 'WHERE'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 192
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 7
    OnClick = Button5Click
  end
  object SocketConnection1: TSocketConnection
    ServerGUID = '{1955E435-8CCB-47D9-840E-7E95C08B28F8}'
    ServerName = 'UNFilterApp.UnFilter'
    Address = '127.0.0.1'
    Left = 624
    Top = 24
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 88
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=1;Persist Security Info=True;User I' +
      'D=sa;Initial Catalog=ACS_MBase;Data Source=ovk;Use Procedure for' +
      ' Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=H' +
      'P;Use Encryption for Data=False;Tag with column collation when p' +
      'ossible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 34
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 248
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery2
    Left = 328
    Top = 24
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 248
    Top = 64
  end
end
