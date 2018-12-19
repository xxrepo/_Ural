object frmInputQuery_Obj: TfrmInputQuery_Obj
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = ' '
  ClientHeight = 152
  ClientWidth = 392
  Color = clBtnFace
  Constraints.MinHeight = 100
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 111
    Align = alClient
    Caption = ' '
    TabOrder = 0
    DesignSize = (
      392
      111)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 28
      Height = 13
      Caption = 'Name'
    end
    object Label2: TLabel
      Left = 8
      Top = 88
      Width = 44
      Height = 13
      Caption = 'Comment'
    end
    object Label3: TLabel
      Left = 8
      Top = 35
      Width = 39
      Height = 13
      Caption = 'Quantity'
    end
    object Label4: TLabel
      Left = 8
      Top = 64
      Width = 51
      Height = 13
      Caption = 'Residence'
    end
    object edName: TEdit
      Left = 72
      Top = 4
      Width = 312
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 0
      Text = 'edName'
    end
    object edComment: TEdit
      Left = 72
      Top = 84
      Width = 311
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 3
      Text = 'edComment'
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 72
      Top = 32
      Width = 49
      Height = 21
      AutoSize = False
      DisplayFormat = ',0;-,0'
      TabOrder = 1
    end
    object edPlaced: TEdit
      Left = 72
      Top = 60
      Width = 311
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 2
      Text = 'edPlaced'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 111
    Width = 392
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    DesignSize = (
      392
      41)
    object btnOk: TButton
      Left = 213
      Top = 8
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
      Left = 301
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
