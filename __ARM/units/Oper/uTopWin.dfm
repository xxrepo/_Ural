object TopWin: TTopWin
  Left = 727
  Top = 50
  Width = 244
  Height = 337
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Данные'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline fOperEmptyData1: TfOperEmptyData
    Width = 236
    Height = 310
    Align = alClient
    inherited PageControl1: TPageControl
      Width = 236
      Height = 310
      inherited TabSheet1: TTabSheet
        inherited Panel1: TPanel
          Width = 228
          inherited DBEdit1: TDBEdit
            Width = 131
          end
        end
        inherited Panel3: TPanel
          Width = 228
          inherited DBEdit7: TDBEdit
            Width = 131
          end
          inherited DBEdit5: TDBEdit
            Width = 131
          end
        end
        inherited GroupBox1: TGroupBox
          Width = 228
          Height = 209
          inherited DBMemo1: TDBMemo
            Width = 224
            Height = 192
          end
        end
      end
    end
  end
end
