object DTSelector: TDTSelector
  Left = 322
  Top = 154
  Width = 636
  Height = 407
  BorderIcons = [biSystemMenu, biMaximize]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 339
    Width = 628
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 537
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
    end
    object btnOk: TButton
      Left = 449
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      Enabled = False
      ModalResult = 1
      TabOrder = 1
    end
  end
  inline fGrp1: TfGrp
    Width = 628
    Height = 339
    Align = alClient
    TabOrder = 1
    inherited ToolBar12: TToolBar
      Width = 628
    end
    inherited OrgTreeView: TTreeView
      Width = 628
      Height = 269
      OnChange = fGrp1OrgTreeViewChange
      OnDblClick = fGrp1OrgTreeViewDblClick
    end
    inherited ToolBar1: TAdvDockPanel
      Width = 628
      inherited ToolBar2: TAdvToolBar
        Width = 622
        ToolBarStyler = DM.AdvToolBarOfficeStyler1
        inherited AdvToolBarButton1: TAdvToolBarButton
          Left = 82
        end
        inherited AdvToolBarButton2: TAdvToolBarButton
          Left = 48
        end
        inherited AdvToolBarSeparator1: TAdvToolBarSeparator
          Left = 72
        end
        inherited AdvToolBarSeparator2: TAdvToolBarSeparator
          Left = 106
        end
        inherited AdvToolBarButton3: TAdvToolBarButton
          Left = 116
        end
        inherited AdvToolBarSeparator3: TAdvToolBarSeparator
          Left = 164
        end
        inherited AdvToolBarButton4: TAdvToolBarButton
          Left = 174
        end
        inherited AdvToolBarMenuButton1: TAdvToolBarMenuButton
          Left = 2
        end
        inherited AdvToolBarSeparator4: TAdvToolBarSeparator
          Left = 38
        end
        inherited AdvToolBarMenuButton2: TAdvToolBarMenuButton
          Left = 140
        end
        inherited AdvToolBarSeparator5: TAdvToolBarSeparator
          Left = 198
        end
        inherited Edit1: TEdit
          Left = 208
        end
        inherited Button3: TButton
          Left = 329
          OnClick = fGrp1Button3Click
        end
      end
    end
  end
end
