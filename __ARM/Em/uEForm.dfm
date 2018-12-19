object EForm: TEForm
  Left = 101
  Top = 178
  Width = 783
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inline fEForm1: TfEForm
    Width = 775
    Height = 513
    Align = alClient
    inherited Splitter1: TSplitter
      Height = 484
    end
    inherited TreeView1: TTreeView
      Height = 484
    end
    inherited PageControl1: TPageControl
      Width = 568
      Height = 484
      ActivePage = fEForm1.tsEmpty
      inherited tsEmpty: TTabSheet
        inherited Label1: TLabel
          Width = 560
          Height = 313
        end
        inherited Image2: TImage
          Width = 560
        end
      end
    end
    inherited ToolBar1: TToolBar
      Width = 775
    end
  end
end
