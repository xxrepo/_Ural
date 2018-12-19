object UserSelector: TUserSelector
  Left = 291
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Выболр пользователя'
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
    Top = 412
    Width = 688
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 602
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
      Left = 511
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
  inline fUsersListLC1: TfUsersListLC
    Width = 688
    Height = 412
    Align = alClient
    TabOrder = 1
    inherited RxDBGrid1: TRxDBGrid
      Width = 688
      Height = 387
    end
    inherited FilterPanel: TPanel
      Width = 688
    end
    inherited DataSource: TDataSource
      OnDataChange = fUsersListLC1DataSourceDataChange
    end
  end
end
