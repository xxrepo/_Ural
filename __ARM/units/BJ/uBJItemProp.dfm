object BJItemProp: TBJItemProp
  Left = 192
  Top = 107
  Width = 440
  Height = 252
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Категория'
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
    Top = 184
    Width = 432
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 346
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 255
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  inline fBJItemProp1: TfBJItemProp
    Width = 432
    Height = 184
    Align = alClient
    TabOrder = 1
    inherited pBase: TPanel
      Width = 432
      inherited DBEdit5: TDBEdit
        Left = 78
        Width = 323
      end
    end
    inherited Panel1: TPanel
      Width = 432
      Height = 154
      inherited Label1: TLabel
        Width = 55
        Caption = 'Коррекция'
      end
      inherited DBEdit1: TDBEdit
        Left = 78
        Width = 323
      end
      inherited DBEdit2: TDBEdit
        Left = 78
        OnKeyPress = fBJItemProp1DBEdit2KeyPress
      end
      inherited DBEdit3: TDBEdit
        Left = 78
        OnKeyPress = fBJItemProp1DBEdit2KeyPress
      end
      inherited DBEdit4: TDBEdit
        Left = 78
        OnKeyPress = fBJItemProp1DBEdit2KeyPress
      end
      inherited DBCheckBox1: TDBCheckBox
        Left = 80
      end
      inherited DBCheckBox2: TDBCheckBox
        Left = 80
      end
    end
  end
end
