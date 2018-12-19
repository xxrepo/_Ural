object OperFinLC: TOperFinLC
  Left = 264
  Top = 55
  Width = 535
  Height = 612
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Финансовая операция'
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 500
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
    Top = 544
    Width = 527
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
      Left = 441
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 350
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
  inline fOperLCFin1: TfOperLCFin
    Width = 527
    Height = 544
    Align = alClient
    TabOrder = 1
    inherited PageControl1: TPageControl
      Width = 527
      Height = 544
      inherited tsData: TTabSheet
        inherited Splitter1: TSplitter
          Width = 519
        end
        inherited P1: TPanel
          Width = 519
          inherited edSrcName: TDBEdit
            Width = 346
          end
          inherited BitBtn3: TBitBtn
            Left = 486
          end
          inherited edReprName: TDBEdit
            Width = 347
          end
          inherited BitBtn4: TBitBtn
            Left = 486
          end
          inherited DBEdit8: TDBEdit
            Width = 369
          end
        end
        inherited P2: TPanel
          Width = 519
          inherited fCurSelector1: TfCurSelector
            Width = 219
            inherited cbCur: TComboBox
              Width = 148
            end
          end
        end
        inherited GroupBox2: TGroupBox
          Width = 519
          inherited edContract: TDBEdit
            Width = 337
          end
          inherited edImp_PayBasic: TDBEdit
            Width = 337
          end
          inherited edAccInv_PayAssignment: TDBEdit
            Width = 337
          end
        end
        inherited GroupBox1: TGroupBox
          Width = 519
          inherited pnSys: TPanel
            Width = 515
            inherited fCurSelector2: TfCurSelector
              Width = 215
              inherited cbCur: TComboBox
                Width = 144
              end
            end
          end
          inherited Panel9: TPanel
            Width = 515
          end
        end
        inherited GroupBox4: TGroupBox
          Width = 519
          inherited DBMemo1: TDBMemo
            Width = 515
          end
        end
        inherited P_FF: TPanel
          Width = 519
          inherited cbKoef: TComboBox
            Width = 426
          end
          inherited lcFuncDistrib: TRxDBLookupCombo
            Width = 126
          end
        end
        inherited fExtDataVal1: TfExtDataValLC
          Width = 519
          Height = 85
          inherited ToolBar: TToolBar
            Width = 519
          end
          inherited RxDBGrid1: TRxDBGrid
            Width = 519
            Height = 59
          end
        end
        inherited pCA: TPanel
          Width = 519
          inherited DBEdit1: TDBEdit
            Width = 368
          end
        end
      end
    end
  end
end
