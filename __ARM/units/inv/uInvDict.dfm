object InvDict: TInvDict
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Справочник'
  ClientHeight = 312
  ClientWidth = 342
  Color = clBtnFace
  Constraints.MinHeight = 128
  Constraints.MinWidth = 350
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 342
    Height = 271
    Align = alClient
    Caption = ' '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 93
      Height = 13
      Caption = 'Затрата на печать'
    end
    object Label2: TLabel
      Left = 8
      Top = 32
      Width = 33
      Height = 13
      Caption = 'Скобы'
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 33
      Height = 13
      Caption = 'Ленты'
    end
    object Label4: TLabel
      Left = 8
      Top = 80
      Width = 156
      Height = 13
      Caption = 'Час работы формного участка'
    end
    object Label5: TLabel
      Left = 8
      Top = 104
      Width = 139
      Height = 13
      Caption = 'Час работы участка печати'
    end
    object Label6: TLabel
      Left = 8
      Top = 128
      Width = 185
      Height = 13
      Caption = 'Час работы участка ламинирования'
    end
    object Label7: TLabel
      Left = 8
      Top = 152
      Width = 135
      Height = 13
      Caption = 'Час работы участка резки'
    end
    object Label8: TLabel
      Left = 8
      Top = 184
      Width = 162
      Height = 13
      Caption = 'Среднестатистическая наценка'
    end
    object cePrintPrice: TCurrencyEdit
      Left = 198
      Top = 5
      Width = 100
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 0
    end
    object ceForm: TCurrencyEdit
      Left = 198
      Top = 77
      Width = 100
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 3
    end
    object cePrint: TCurrencyEdit
      Left = 198
      Top = 101
      Width = 100
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 4
    end
    object ceLam: TCurrencyEdit
      Left = 198
      Top = 125
      Width = 100
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 5
    end
    object ceDiv: TCurrencyEdit
      Left = 198
      Top = 149
      Width = 100
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 6
    end
    object ceSkob: TRxCalcEdit
      Left = 123
      Top = 28
      Width = 177
      Height = 21
      AutoSize = False
      DecimalPlaces = 12
      DisplayFormat = ',0.##################'
      NumGlyphs = 2
      TabOrder = 1
    end
    object ceLent: TRxCalcEdit
      Left = 123
      Top = 52
      Width = 177
      Height = 21
      AutoSize = False
      DecimalPlaces = 12
      DisplayFormat = ',0.##################'
      NumGlyphs = 2
      TabOrder = 2
    end
    object ceFNR_Delta: TCurrencyEdit
      Left = 198
      Top = 181
      Width = 100
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00;-,0.00'
      TabOrder = 7
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 271
    Width = 342
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object btnCancel: TButton
      Left = 252
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
      Left = 149
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
  end
end
