object FltList: TFltList
  Left = 181
  Top = 106
  Width = 783
  Height = 540
  Caption = 'Фильтры'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inline fFltList1: TfFltList
    Width = 775
    Height = 513
    Align = alClient
    inherited RxDBGrid1: TRxDBGrid
      Width = 775
      Height = 448
    end
    inherited ToolBar: TToolBar
      Width = 775
      inherited ToolButton1: TToolButton
        OnClick = nil
      end
    end
    inherited FilterPanel: TPanel
      Width = 775
    end
  end
end
