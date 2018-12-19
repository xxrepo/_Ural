object SMGList: TSMGList
  Left = 186
  Top = 107
  Width = 783
  Height = 540
  Caption = 'Сообщения'
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
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inline fMSG1: TfMSG
    Width = 775
    Height = 513
    Align = alClient
    inherited ToolBar1: TToolBar
      Width = 775
    end
    inherited RxDBGrid1: TRxDBGrid
      Width = 775
      Height = 444
    end
    inherited pnDate: TPanel
      Width = 775
      inherited Panel3: TPanel
        Width = 501
      end
    end
  end
end
