object FormARate: TFormARate
  Left = 192
  Top = 107
  HelpContext = 41
  ActiveControl = RxDBLookupCombo1
  BorderStyle = bsDialog
  ClientHeight = 177
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Microsoft Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 38
    Height = 13
    Caption = 'Валюта'
  end
  object Label2: TLabel
    Left = 24
    Top = 90
    Width = 24
    Height = 13
    Caption = 'Курс'
  end
  object Label3: TLabel
    Left = 24
    Top = 58
    Width = 59
    Height = 13
    Caption = 'Количество'
  end
  object BitBtn1: TBitBtn
    Left = 80
    Top = 136
    Width = 97
    Height = 25
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 200
    Top = 136
    Width = 97
    Height = 25
    Caption = 'Отмена'
    TabOrder = 4
    Kind = bkCancel
  end
  object Edit1: TEdit
    Left = 96
    Top = 86
    Width = 121
    Height = 21
    TabOrder = 2
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 96
    Top = 54
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = Edit2KeyPress
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 96
    Top = 20
    Width = 177
    Height = 21
    DropDownCount = 8
    LookupField = 'Id_Currency'
    LookupDisplay = 'Name'
    LookupSource = DataSource1
    TabOrder = 0
  end
  object QueryCurrency: TADOQuery
    Connection = MainForm.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Crn_Currency'
      'WHERE Base=0')
  end
  object DataSource1: TDataSource
    DataSet = QueryCurrency
    Top = 32
  end
end
