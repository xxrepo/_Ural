object RelinkView: TRelinkView
  Left = 186
  Top = 103
  Width = 696
  Height = 480
  Caption = 'Переназначения'
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
  inline fRelinkView1: TfRelinkView
    Width = 688
    Height = 453
    Align = alClient
    inherited RxDBGrid1: TRxDBGrid
      Width = 688
      Height = 413
      OnDblClick = nil
      OnGetCellParams = nil
    end
    inherited ToolBar: TToolBar
      Width = 688
    end
    inherited DataSource: TDataSource
      OnDataChange = nil
    end
  end
end
