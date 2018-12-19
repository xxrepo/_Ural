object LCEnt: TLCEnt
  Left = 192
  Top = 107
  Width = 953
  Height = 540
  Caption = 'Объекты системы'
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
  inline fLCEntFrame1: TfLCEntFrame
    Width = 945
    Height = 513
    Align = alClient
    inherited Splitter1: TSplitter
      Height = 484
    end
    inherited TreeView1: TTreeView
      Height = 484
    end
    inherited PageControl1: TPageControl
      Width = 738
      Height = 484
      inherited tsFin: TTabSheet
        inherited fAccList1: TfAccList
          inherited Panel1: TPanel
            inherited RxDBGrid1: TRxDBGrid
              Width = 540
              Height = 389
            end
            inherited FilterPanel: TPanel
              Width = 540
            end
            inherited ToolBar: TToolBar
              Width = 540
            end
          end
        end
      end
      inherited tsGoods: TTabSheet
        inherited fWareGoods: TfWare
          inherited pcCldObj: TPageControl
            inherited tsWare: TTabSheet
              inherited Splitter2: TSplitter
                Top = 244
                Width = 269
              end
              inherited grdList: TRxDBGrid
                Width = 269
                Height = 177
              end
              inherited ToolBar2: TToolBar
                Width = 269
              end
              inherited FilterPanel: TPanel
                Width = 269
              end
              inherited pnAmount: TPanel
                Top = 248
                Width = 269
                inherited RxDBGrid1: TRxDBGrid
                  Width = 267
                end
              end
            end
          end
        end
      end
      inherited tsEmpty: TTabSheet
        inherited Image2: TImage
          Width = 560
        end
      end
      inherited tsWH: TTabSheet
        inherited fWHList1: TfWHList
          inherited Panel1: TPanel
            inherited ToolBar: TToolBar
              Width = 540
            end
            inherited FilterPanel: TPanel
              Width = 540
            end
            inherited RxDBGrid1: TRxDBGrid
              Width = 540
              Height = 389
            end
          end
        end
      end
      inherited tsCA: TTabSheet
        inherited fCaNavigator1: TfCaNavigator
          Width = 730
          Height = 456
          inherited Splitter2: TSplitter
            Height = 456
          end
          inherited fCAGroupList1: TfCAGroupList
            Height = 456
            inherited OrgTreeView: TTreeView
              Height = 427
            end
          end
          inherited Panel2: TPanel
            Width = 580
            Height = 456
            inherited Splitter3: TSplitter
              Width = 578
            end
            inherited GroupBox1: TGroupBox
              Width = 578
              Height = 134
              inherited fReprList1: TfReprList
                Width = 574
                Height = 117
                inherited RxDBGrid1: TRxDBGrid
                  Width = 574
                  Height = 51
                end
                inherited ToolBar1: TToolBar
                  Width = 574
                end
                inherited FilterPanel: TPanel
                  Width = 574
                end
              end
            end
            inherited fCntrAgentList1: TfCntrAgentList
              Width = 578
              inherited Splitter1: TSplitter
                Width = 578
              end
              inherited RxDBGrid1: TRxDBGrid
                Width = 578
              end
              inherited ToolBar1: TToolBar
                Width = 578
              end
              inherited FilterPanel: TPanel
                Width = 578
              end
              inherited dbgComment: TDBGrid
                Width = 578
              end
            end
          end
        end
      end
    end
    inherited ToolBar1: TToolBar
      Width = 945
    end
  end
end
