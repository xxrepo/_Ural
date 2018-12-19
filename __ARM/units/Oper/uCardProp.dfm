object CardProp: TCardProp
  Left = 187
  Top = 188
  Width = 400
  Height = 320
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Настройка колонок'
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 252
    Width = 392
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 306
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 215
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
  object ListBox1: TRxCheckListBox
    Left = 0
    Top = 0
    Width = 392
    Height = 252
    Align = alClient
    DragMode = dmAutomatic
    ItemHeight = 13
    MultiSelect = True
    Style = lbOwnerDrawVariable
    TabOrder = 1
    InternalVersion = 202
  end
end
