object MeasureDetailForm: TMeasureDetailForm
  Left = 256
  Top = 192
  BorderStyle = bsDialog
  ClientHeight = 125
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Scaled = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 153
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 79
      Height = 13
      Caption = 'Наименование:'
    end
    object Label2: TLabel
      Left = 16
      Top = 35
      Width = 113
      Height = 13
      Caption = 'Кратк. наименование:'
    end
    object Label3: TLabel
      Left = 280
      Top = 92
      Width = 73
      Height = 13
      Caption = 'Коэффициент:'
      Visible = False
    end
    object Label4: TLabel
      Left = 280
      Top = 68
      Width = 90
      Height = 13
      Caption = 'Базовая ед. изм.:'
      Visible = False
    end
    object Label5: TLabel
      Left = 280
      Top = 116
      Width = 82
      Height = 13
      Caption = 'Заблокировано:'
      Visible = False
    end
    object BaseMeasureSpeedButton: TSpeedButton
      Left = 624
      Top = 64
      Width = 23
      Height = 22
      Caption = '...'
      Visible = False
      OnClick = BaseMeasureSpeedButtonClick
    end
    object Label6: TLabel
      Left = 32
      Top = 192
      Width = 40
      Height = 13
      Caption = 'Бизнес:'
      Visible = False
    end
    object SpeedButton2: TSpeedButton
      Left = 383
      Top = 184
      Width = 23
      Height = 22
      Caption = '...'
      Visible = False
      OnClick = SpeedButton2Click
    end
    object Label7: TLabel
      Left = 16
      Top = 59
      Width = 67
      Height = 13
      Caption = 'Код по ОКЕИ'
      Visible = False
    end
    object NameEdit: TEdit
      Left = 136
      Top = 8
      Width = 249
      Height = 21
      MaxLength = 50
      TabOrder = 0
    end
    object ShortNameEdit: TEdit
      Left = 136
      Top = 32
      Width = 121
      Height = 21
      MaxLength = 10
      TabOrder = 1
    end
    object BaseEdit: TEdit
      Left = 400
      Top = 64
      Width = 225
      Height = 21
      MaxLength = 50
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 2
      Visible = False
      OnKeyDown = BaseEditKeyDown
    end
    object KoefEdit: TRxCalcEdit
      Left = 400
      Top = 88
      Width = 121
      Height = 21
      AutoSize = False
      DecimalPlaces = 9
      DisplayFormat = ',0.##########'
      NumGlyphs = 2
      TabOrder = 4
      Visible = False
    end
    object DisabledCheckBox: TCheckBox
      Left = 400
      Top = 114
      Width = 25
      Height = 17
      TabOrder = 5
      Visible = False
    end
    object BusinessEdit: TEdit
      Left = 152
      Top = 184
      Width = 225
      Height = 21
      MaxLength = 50
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 3
      Visible = False
    end
    object edOKEI: TEdit
      Left = 136
      Top = 56
      Width = 121
      Height = 21
      MaxLength = 10
      TabOrder = 6
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 392
    Height = 36
    Align = alBottom
    TabOrder = 1
    object OkButton: TButton
      Left = 224
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = OkButtonClick
    end
    object Button1: TButton
      Left = 312
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'Id'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'CallType'
        ParamType = ptUnknown
      end>
    ProviderName = 'dsGetMeasure'
    RemoteServer = DM.rsCA
    Left = 288
    Top = 8
  end
end
