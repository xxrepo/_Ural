object BalanceArc: TBalanceArc
  Left = 186
  Top = 107
  Width = 529
  Height = 540
  Caption = 'Архив закрытия балансов'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inline fBalanceArc1: TfBalanceArc
    Width = 521
    Height = 513
    Align = alClient
    inherited RxDBGrid1: TRxDBGrid
      Width = 521
      Height = 441
    end
    inherited ToolBar: TToolBar
      Width = 521
      ButtonWidth = 91
      inherited ToolButton2: TToolButton
        Caption = 'До закрытия'
        OnClick = nil
      end
      inherited ToolButton1: TToolButton
        Left = 91
        Caption = 'После закрытия'
      end
      inherited ToolButton5: TToolButton
        Left = 182
      end
    end
    inherited pnDate: TPanel
      Width = 521
      inherited Panel1: TPanel
        Left = 186
      end
      inherited fBsnSelector1: TfBsnSelector
        Width = 185
        inherited edName: TEdit
          Width = 99
        end
        inherited Button1: TButton
          Left = 154
        end
      end
    end
    inherited cdsRezGetList: TClientDataSet
      Params = <
        item
          DataType = ftInteger
          Name = '@RETURN_VALUE'
          ParamType = ptResult
        end
        item
          DataType = ftInteger
          Name = '@id_business'
          ParamType = ptInput
        end
        item
          DataType = ftDateTime
          Name = '@DateFrom'
          ParamType = ptInput
        end
        item
          DataType = ftDateTime
          Name = '@DateTo'
          ParamType = ptInput
        end>
    end
  end
end
