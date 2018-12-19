object frmInputBoxDate: TfrmInputBoxDate
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Input date'
  ClientHeight = 112
  ClientWidth = 319
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 23
    Height = 13
    Caption = 'Date'
  end
  object Label8: TLabel
    Left = 168
    Top = 59
    Width = 42
    Height = 13
    Caption = 'Currency'
  end
  object Label2: TLabel
    Left = 8
    Top = 35
    Width = 24
    Height = 13
    Caption = 'Total'
  end
  object Label3: TLabel
    Left = 8
    Top = 53
    Width = 41
    Height = 26
    Caption = 'Nominal value'
    WordWrap = True
  end
  object btnOk: TButton
    Left = 154
    Top = 84
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 242
    Top = 84
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object DateEdit1: TDateEdit
    Left = 72
    Top = 8
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object lbCur: TRxDBLookupCombo
    Left = 216
    Top = 56
    Width = 92
    Height = 21
    DropDownCount = 8
    DataField = 'ID_CUR'
    LookupField = 'ID_CUR'
    LookupDisplay = 'CURNAME'
    LookupSource = dsCur
    TabOrder = 3
  end
  object ceActPrice: TRxCalcEdit
    Left = 72
    Top = 56
    Width = 89
    Height = 21
    AutoSize = False
    NumGlyphs = 2
    TabOrder = 4
  end
  object ceActAmount: TCurrencyEdit
    Left = 72
    Top = 32
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0;-,0.0'
    TabOrder = 5
  end
  object qCur: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dw_Cur where deleted=0  order by OrderID')
    Left = 208
    Top = 24
  end
  object dsCur: TDataSource
    DataSet = qCur
    Left = 240
    Top = 24
  end
end
