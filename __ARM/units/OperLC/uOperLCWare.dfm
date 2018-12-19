object WareOperLC: TWareOperLC
  Left = 277
  Top = -11
  Width = 550
  Height = 685
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Складская операция'
  Color = clBtnFace
  Constraints.MinHeight = 536
  Constraints.MinWidth = 550
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 617
    Width = 542
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnVisa: TSpeedButton
      Left = 16
      Top = 8
      Width = 100
      Height = 25
      Caption = 'Завизировать'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000084000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000840000008400000084000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000840000008400000084000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00008400000084000000840000008400000084000000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000840000008400000084000000840000008400000084000000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
        8400008400000084000000000000FF00FF000084000000840000008400000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00848484000084
        000000000000FF00FF00FF00FF00FF00FF00FF00FF0000840000008400000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000840000008400000084
        000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00008400000084
        000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000084
        00000084000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00848484000084000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00848484000084000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00008400000084000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = btnVisaClick
    end
    object btnCancel: TButton
      Left = 456
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 365
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  inline fOperLCWare1: TfOperLCWare
    Width = 542
    Align = alClient
    TabOrder = 1
    inherited PageControl1: TPageControl
      Width = 542
      inherited tsData: TTabSheet
        inherited Splitter1: TSplitter
          Width = 534
        end
        inherited P1: TPanel
          Width = 534
          inherited edReprName: TDBEdit
            Width = 366
          end
          inherited BitBtn4: TBitBtn
            Left = 506
          end
          inherited edSrcName: TDBEdit
            Width = 366
          end
          inherited BitBtn1: TBitBtn
            Left = 506
          end
          inherited DBEdit8: TDBEdit
            Width = 386
          end
        end
        inherited GroupBox1: TGroupBox
          Width = 534
          inherited edContract: TDBEdit
            Width = 358
          end
          inherited edAccInv_PayAssignment: TDBEdit
            Width = 358
          end
          inherited edImp_PayBasic: TDBEdit
            Width = 358
          end
        end
        inherited gbWare: TGroupBox
          Width = 534
          inherited DBGridEh1: TDBGridEh
            Width = 507
          end
          inherited ToolBar3: TToolBar
            Left = 509
          end
        end
        inherited P3: TPanel
          Width = 534
        end
        inherited pnForSize: TPanel
          Width = 534
          inherited Splitter2: TSplitter
            Width = 534
          end
          inherited P_FF: TPanel
            Width = 534
            inherited lcFuncDistrib: TRxDBLookupCombo
              Width = 169
            end
          end
          inherited GroupBox4: TGroupBox
            Width = 534
            inherited DBMemo1: TDBMemo
              Width = 530
            end
          end
          inherited fExtDataVal1: TfExtDataValLC
            Width = 534
            inherited ToolBar: TToolBar
              Width = 534
            end
            inherited RxDBGrid1: TRxDBGrid
              Width = 534
            end
          end
        end
        inherited pCA: TPanel
          Width = 534
          inherited DBEdit1: TDBEdit
            Width = 387
          end
        end
      end
    end
  end
end
