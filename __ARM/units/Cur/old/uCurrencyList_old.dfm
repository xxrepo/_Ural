object CurrencyList_old: TCurrencyList_old
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Валюты'
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
  inline fCurrencyList1: TfCurrencyList_old
    Width = 688
    Height = 453
    Align = alClient
    inherited RxDBGrid1: TRxDBGrid
      Width = 688
      Height = 413
    end
    inherited ToolBar1: TToolBar
      Width = 688
    end
  end
end
