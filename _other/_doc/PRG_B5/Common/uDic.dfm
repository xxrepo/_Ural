object Dic: TDic
  Left = 349
  Top = 125
  Width = 1109
  Height = 728
  Caption = 'Documents'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inline fGrp1: TfGrp
    Width = 1093
    Height = 689
    Align = alClient
    inherited ToolBar12: TToolBar
      Width = 1093
    end
    inherited OrgTreeView: TTreeView
      Width = 1093
      Height = 619
    end
    inherited ToolBar1: TAdvDockPanel
      Width = 1093
      inherited ToolBar2: TAdvToolBar
        Width = 1087
        inherited Button3: TButton
          OnClick = fGrp1Button3Click
        end
      end
    end
    inherited pmGrp: TAdvPopupMenu
      inherited N3: TMenuItem
        OnClick = nil
      end
    end
  end
end
