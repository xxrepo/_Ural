object OffsetOperLC: TOffsetOperLC
  Left = 246
  Top = 170
  Width = 516
  Height = 494
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Взаимозачет'
  Color = clBtnFace
  Constraints.MinHeight = 390
  Constraints.MinWidth = 516
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
    Top = 426
    Width = 508
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
      Left = 422
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 331
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
  inline fOperLCOffset1: TfOperLCOffset
    Width = 508
    Height = 426
    Align = alClient
    TabOrder = 1
    inherited PageControl1: TPageControl
      Width = 508
      Height = 426
      inherited tsData: TTabSheet
        inherited Splitter1: TSplitter
          Width = 500
        end
        inherited P1: TPanel
          Width = 500
          inherited edReprName: TDBEdit
            Width = 380
          end
          inherited BitBtn4: TBitBtn
            Left = 467
          end
          inherited DBEdit1: TDBEdit
            Width = 404
          end
        end
        inherited P2: TPanel
          Width = 500
          inherited fCurSelector1: TfCurSelector
            Width = 200
            inherited cbCur: TComboBox
              Width = 129
            end
          end
        end
        inherited GroupBox2: TGroupBox
          Width = 500
          inherited edContract: TDBEdit
            Width = 319
          end
          inherited edImp_PayBasic: TDBEdit
            Width = 319
          end
          inherited edAccInv_PayAssignment: TDBEdit
            Width = 319
          end
        end
        inherited GroupBox4: TGroupBox
          Width = 500
          inherited DBMemo1: TDBMemo
            Width = 496
          end
        end
        inherited fExtDataVal1: TfExtDataValLC
          Width = 500
          Height = 85
          inherited ToolBar: TToolBar
            Width = 500
          end
          inherited RxDBGrid1: TRxDBGrid
            Width = 500
            Height = 59
          end
        end
        inherited P_FF: TPanel
          Width = 500
          inherited lcFuncDistrib: TRxDBLookupCombo
            Width = 91
          end
        end
        inherited pCA: TPanel
          Width = 500
          inherited DBEdit2: TDBEdit
            Width = 403
          end
        end
      end
    end
  end
end
