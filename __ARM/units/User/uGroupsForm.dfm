object GroupsForm: TGroupsForm
  Left = 199
  Top = 135
  Width = 655
  Height = 477
  Caption = 'Группы пользователей'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inline GroupsFrame: TGroupsFrame
    Width = 639
    Height = 397
    inherited Splitter1: TSplitter
      Top = 225
      Width = 639
    end
    inherited ToolBar: TToolBar
      Width = 639
      inherited ToolButton2: TToolButton
        OnClick = nil
      end
    end
    inherited RxDBGrid1: TRxDBGrid
      Width = 639
      Height = 160
    end
    inherited UsersFrame1: TUsersFrame
      Top = 228
      Width = 639
      Height = 169
      inherited RxDBGrid1: TRxDBGrid
        Width = 639
        Height = 104
      end
      inherited ToolBar: TToolBar
        Width = 639
      end
      inherited FilterPanel: TPanel
        Width = 639
      end
      inherited cdsUsers: TClientDataSet
        MasterSource = GroupsFrame.DataSource
      end
    end
    inherited FilterPanel: TPanel
      Width = 639
    end
  end
  object Panel2222: TPanel
    Left = 0
    Top = 397
    Width = 639
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    Visible = False
    object btnCancel: TButton
      Left = 561
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
      Left = 470
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
