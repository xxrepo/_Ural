object CAFizList: TCAFizList
  Left = 176
  Top = 143
  Width = 811
  Height = 480
  Caption = 'Persons'
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inline fCA1: TfCAFiz
    Left = 0
    Top = 0
    Width = 803
    Height = 453
    Align = alClient
    TabOrder = 0
    inherited Splitter2: TAdvSplitter
      Height = 453
    end
    inherited Panel1: TPanel
      Width = 337
      Height = 453
      inherited Splitter1: TAdvSplitter
        Top = 321
        Width = 335
      end
      inherited ToolBar1: TToolBar
        Width = 335
      end
      inherited dbgCA: TDBGridEh
        Width = 335
        Height = 291
      end
      inherited pcCA: TAdvOfficePager
        Top = 324
        Width = 335
        inherited tsDep: TAdvOfficePage
          inherited fChild1: TfChild
            Width = 327
            inherited Panel1: TPanel
              Width = 204
              inherited dbgCA: TDBGridEh
                Width = 202
              end
            end
          end
        end
      end
    end
    inherited pFind: TPanel
      Height = 453
      inherited fFindFirm1: TfFindFirm
        Height = 451
      end
    end
  end
end
