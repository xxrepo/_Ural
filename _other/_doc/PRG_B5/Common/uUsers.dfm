object Users: TUsers
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'User list'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inline fUsers1: TfUsers
    Width = 688
    Height = 453
    Align = alClient
    inherited RxDBGrid1: TRxDBGrid
      Width = 688
      Height = 388
      Columns = <
        item
          Expanded = False
          FieldName = 'FIO'
          PickList.Strings = ()
          Title.Caption = 'Name'
          Width = 149
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Login'
          PickList.Strings = ()
          Width = 58
          Visible = True
        end>
    end
    inherited ToolBar: TToolBar
      Width = 688
    end
    inherited FilterPanel: TPanel
      Width = 688
    end
  end
end
