object CAList: TCAList
  Left = 204
  Top = 178
  Width = 811
  Height = 480
  Caption = 'Organizations'
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
  inline fCA1: TfCA
    Width = 803
    Height = 453
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
        inherited tsDoc: TAdvOfficePage
          inherited fDoc1: TfDoc
            inherited Panel1: TPanel
              inherited dxDBGDocList1: TdxDBGrid
                Filter.Criteria = {00000000}
              end
            end
          end
        end
        inherited tsStempels: TAdvOfficePage
          inherited fObjListST: TfObjList
            Width = 327
            inherited ToolBar3: TToolBar
              Width = 327
            end
            inherited RxDBGrid3: TRxDBGrid
              Width = 327
            end
          end
        end
      end
    end
    inherited pFind: TPanel
      Height = 453
      inherited fFindFirm1: TfFindFirm
        Height = 451
        inherited Panel1: TPanel
          inherited Button2: TButton
            Left = 402
          end
        end
      end
    end
  end
end
