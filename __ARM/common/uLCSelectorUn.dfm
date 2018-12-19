object LCSelectorUn: TLCSelectorUn
  Left = 118
  Top = 122
  Width = 905
  Height = 614
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Объекты системы'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 546
    Width = 897
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 811
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
      Left = 720
      Top = 9
      Width = 75
      Height = 25
      Action = aOk
      Anchors = [akTop, akRight]
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 897
    Height = 21
    Align = alTop
    Caption = ' '
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 39
      Height = 13
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 21
    Width = 897
    Height = 21
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 4
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
  end
  inline fLCEntFrame1: TfLCEntFrame
    Top = 42
    Width = 897
    Height = 504
    Align = alClient
    TabOrder = 3
    inherited Splitter1: TSplitter
      Height = 475
    end
    inherited TreeView1: TTreeView
      Height = 475
    end
    inherited PageControl1: TPageControl
      Width = 690
      Height = 475
      inherited tsFin: TTabSheet
        inherited fAccList1: TfAccList
          inherited Panel1: TPanel
            inherited RxDBGrid1: TRxDBGrid
              Width = 747
              Height = 610
            end
            inherited FilterPanel: TPanel
              Width = 747
            end
            inherited ToolBar: TToolBar
              Width = 747
            end
          end
        end
      end
      inherited tsEmpty: TTabSheet
        inherited Image2: TImage
          Width = 560
        end
      end
      inherited tsRepr: TTabSheet
        inherited fReprListLC1: TfReprListLC
          inherited Panel1: TPanel
            inherited ToolBar1: TToolBar
              Width = 492
            end
            inherited FilterPanel: TPanel
              Width = 492
            end
            inherited RxDBGrid1: TRxDBGrid
              Width = 492
              Height = 379
            end
          end
        end
      end
      inherited tsNoRights: TTabSheet
        inherited Label2: TLabel
          Width = 454
          Height = 24
        end
      end
      inherited tsCA: TTabSheet
        inherited fCaNavigator1: TfCaNavigator
          Width = 682
          Height = 447
          inherited Splitter2: TSplitter
            Height = 447
          end
          inherited fCAGroupList1: TfCAGroupList
            Height = 447
            inherited OrgTreeView: TTreeView
              Height = 418
            end
          end
          inherited Panel2: TPanel
            Width = 532
            Height = 447
            inherited Splitter3: TSplitter
              Width = 530
            end
            inherited GroupBox1: TGroupBox
              Width = 530
              Height = 125
              inherited fReprList1: TfReprList
                Width = 526
                Height = 108
                inherited RxDBGrid1: TRxDBGrid
                  Width = 526
                  Height = 42
                end
                inherited ToolBar1: TToolBar
                  Width = 526
                end
                inherited FilterPanel: TPanel
                  Width = 526
                end
              end
            end
            inherited fCntrAgentList1: TfCntrAgentList
              Width = 530
              inherited Splitter1: TSplitter
                Width = 530
              end
              inherited RxDBGrid1: TRxDBGrid
                Width = 530
              end
              inherited ToolBar1: TToolBar
                Width = 530
              end
              inherited FilterPanel: TPanel
                Width = 530
              end
              inherited dbgComment: TDBGrid
                Width = 530
              end
            end
          end
        end
      end
    end
    inherited ToolBar1: TToolBar
      Width = 897
    end
  end
  object ActionList1: TActionList
    OnUpdate = ActionList1Update
    Left = 136
    Top = 480
    object aOk: TAction
      Caption = 'OK'
      OnExecute = aOkExecute
    end
  end
end
