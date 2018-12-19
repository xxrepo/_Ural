object ReprProp: TReprProp
  Left = 192
  Top = 107
  Width = 438
  Height = 556
  Caption = 'Представитель'
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
    Top = 488
    Width = 430
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 344
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
      Left = 253
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  inline fReprProp1: TfReprProp
    Width = 430
    Height = 488
    Align = alClient
    TabOrder = 1
    inherited pcCA: TPageControl
      Width = 430
      Height = 488
      inherited tsProp: TTabSheet
        inherited Panel1: TPanel
          Width = 422
          Height = 432
          inherited Label2: TLabel
            Top = 245
          end
          inherited Label3: TLabel
            Top = 345
          end
          inherited Label13: TLabel
            Left = 200
            Top = 224
          end
          inherited DBMemo1: TDBMemo
            Top = 261
            Width = 405
            Height = 80
          end
          inherited DBMemo2: TDBMemo
            Top = 360
            Width = 407
            Height = 65
            Anchors = [akLeft, akTop, akRight, akBottom]
          end
          inherited DBEdit7: TDBEdit
            Width = 339
          end
          inherited DBEdit8: TDBEdit
            Width = 123
          end
          inherited DBEdit10: TDBEdit
            Left = 254
            Top = 221
            Width = 147
          end
        end
        inherited pnCA: TPanel
          Width = 422
          inherited DBEdit5: TDBEdit
            Width = 312
          end
          inherited BitBtn4: TBitBtn
            Left = 382
          end
        end
      end
      inherited tsContact: TTabSheet
        inherited dbgContact: TRxDBGrid
          Width = 422
          Height = 431
        end
        inherited ToolBar1: TToolBar
          Width = 422
        end
      end
      inherited tsComment: TTabSheet
        inherited ToolBar2: TToolBar
          Width = 422
        end
        inherited dbgComment: TDBGrid
          Width = 422
          Height = 431
        end
      end
    end
  end
end
