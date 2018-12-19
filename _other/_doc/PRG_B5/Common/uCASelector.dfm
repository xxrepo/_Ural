object CASelector: TCASelector
  Left = 120
  Top = 60
  BorderStyle = bsDialog
  ClientHeight = 586
  ClientWidth = 873
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
    Top = 545
    Width = 873
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    DesignSize = (
      873
      41)
    object btnCancel: TButton
      Left = 782
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
      Left = 694
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
  inline fCA1: TfCA
    Left = 0
    Top = 0
    Width = 873
    Height = 545
    Align = alClient
    TabOrder = 1
    inherited Splitter2: TAdvSplitter
      Height = 545
    end
    inherited Panel1: TPanel
      Width = 407
      Height = 545
      inherited Splitter1: TAdvSplitter
        Top = 413
        Width = 405
      end
      inherited ToolBar1: TToolBar
        Width = 405
      end
      inherited dbgCA: TDBGridEh
        Width = 405
        Height = 383
        OnDblClick = fCA1dbgCADblClick
      end
      inherited pcCA: TAdvOfficePager
        Top = 416
        Width = 405
        inherited tsOwners: TAdvOfficePage
          inherited fParents1: TfParents
            Width = 397
            inherited Splitter1: TAdvSplitter
              Height = 100
            end
            inherited Panel1: TPanel
              Width = 147
              Height = 100
              inherited ToolBar1: TToolBar
                Width = 145
              end
              inherited dbgCA: TDBGridEh
                Width = 145
                Height = 69
              end
            end
            inherited Panel2: TPanel
              Height = 100
              inherited dbgDates: TDBGrid
                Height = 69
              end
            end
          end
        end
      end
    end
    inherited pFind: TPanel
      Height = 545
      inherited fFindFirm1: TfFindFirm
        Height = 543
      end
    end
    inherited dsCAList: TDataSource
      OnDataChange = fCA1dsCAListDataChange
    end
  end
end
