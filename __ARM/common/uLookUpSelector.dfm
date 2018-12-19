object LookUpSelector: TLookUpSelector
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'LookUpSelector'
  ClientHeight = 70
  ClientWidth = 392
  Color = clBtnFace
  Constraints.MinHeight = 97
  Constraints.MinWidth = 350
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
  object pnCA: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 29
    Align = alClient
    TabOrder = 0
    object Label8: TLabel
      Left = 8
      Top = 6
      Width = 71
      Height = 13
      Caption = 'Выберите вид'
    end
    object DBLookupComboBox1: TRxDBLookupCombo
      Left = 96
      Top = 2
      Width = 288
      Height = 21
      DropDownCount = 8
      LookupField = 'IDType'
      LookupDisplay = 'Name'
      LookupSource = DataSource1
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 29
    Width = 392
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object btnCancel: TButton
      Left = 294
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akBottom]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 0
    end
    object btnOk: TButton
      Left = 200
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
  object DataSource1: TDataSource
    Left = 30
    Top = 5
  end
end
