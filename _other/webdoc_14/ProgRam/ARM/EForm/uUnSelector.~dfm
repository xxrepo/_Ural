object UnSelector: TUnSelector
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
      Caption = 'Отмена'
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
  inline fUnDict1: TfUnDict
    Width = 628
    Height = 339
    Align = alClient
    TabOrder = 1
    inherited sSplitter1: TsSplitter
      Top = 335
      Width = 628
    end
    inherited DBGridEh1: TDBGridEh
      Width = 628
      Height = 28
      OnDblClick = fGrp1OrgTreeViewDblClick
    end
    inherited sPanel1: TsPanel
      Top = 100
      Width = 628
      inherited sPageControl1: TsPageControl
        Width = 626
        inherited tsFiles: TsTabSheet
          inherited fFiles1: TfFiles
            Width = 618
            inherited dbgFileList: TDBGridEh
              Width = 618
            end
            inherited sPanel1: TsPanel
              Width = 618
            end
          end
        end
      end
    end
    inherited sPanel2: TsPanel
      Width = 628
    end
    inherited ToolBar1: TsToolBar
      Width = 628
    end
    inherited dsObjGetList: TDataSource
      OnDataChange = fUnDict1dsObjGetListDataChange
    end
  end
end
