object OperSelector: TOperSelector
  Left = 181
  Top = 106
  Width = 783
  Height = 540
  Caption = 'Выбор операции'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inline fArc1: TfArc
    Width = 775
    Height = 472
    Align = alClient
    inherited ToolBar1: TToolBar
      Width = 775
    end
    inherited pnDate: TPanel
      Width = 775
      inherited Panel3: TPanel
        Width = 501
      end
    end
    inherited RxDBGrid1: TDBGridEh
      Width = 775
      Height = 354
      OnDblClick = nil
    end
    inherited StatusBar1: TStatusBar
      Top = 453
      Width = 775
    end
    inherited ToolBar2: TToolBar
      Width = 775
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 472
    Width = 775
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object btnCancel: TButton
      Left = 689
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 598
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
end
