object RepSelector: TRepSelector
  Left = 181
  Top = 106
  Width = 468
  Height = 323
  Caption = 'Выбрать контрагента'
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
  object Panel2: TPanel
    Left = 0
    Top = 255
    Width = 460
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 374
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 283
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object Button1: TButton
      Left = 16
      Top = 8
      Width = 129
      Height = 25
      Caption = 'Расширенный поиск'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  inline fRepSelector1: TfRepSelector
    Width = 460
    Height = 255
    Align = alClient
    TabOrder = 1
    inherited RxDBGrid1: TRxDBGrid
      Width = 460
      Height = 214
    end
    inherited ToolBar1: TToolBar
      Width = 460
      inherited ToolButton1: TToolButton
        Visible = False
      end
    end
    inherited dsCAgent: TDataSource
      OnDataChange = nil
    end
    inherited ActionList1: TActionList
      inherited aNew: TAction
        OnExecute = nil
      end
      inherited aProperty: TAction
        OnExecute = nil
      end
    end
  end
end
