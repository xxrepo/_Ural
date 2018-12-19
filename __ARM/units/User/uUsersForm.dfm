object UsersForm: TUsersForm
  Left = 192
  Top = 107
  Width = 477
  Height = 435
  Caption = 'Пользователи'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inline UsersFrame: TUsersFrame
    Width = 469
    Height = 367
    Align = alClient
    inherited RxDBGrid1: TRxDBGrid
      Width = 469
      Height = 302
    end
    inherited ToolBar: TToolBar
      Width = 469
    end
    inherited FilterPanel: TPanel
      Width = 469
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 367
    Width = 469
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnOk: TButton
      Left = 278
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 369
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
