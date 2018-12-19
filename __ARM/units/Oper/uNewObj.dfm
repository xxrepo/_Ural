object NewObj: TNewObj
  Left = 291
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Визирование объектов'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 412
    Width = 688
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 504
      Top = 8
      Width = 169
      Height = 25
      Action = fNewObj1.aSave
      Anchors = [akTop, akRight]
      Caption = 'Сохранить и обновить'
      TabOrder = 0
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000000000000000
        000000001F7C1F7C000000420042000000000000000000000000186318630000
        004200001F7C1F7C000000420042000000000000000000000000186318630000
        004200001F7C1F7C000000420042000000000000000000000000186318630000
        004200001F7C1F7C000000420042000000000000000000000000000000000000
        004200001F7C1F7C000000420042004200420042004200420042004200420042
        004200001F7C1F7C000000420042000000000000000000000000000000000042
        004200001F7C1F7C000000420000186318631863186318631863186318630000
        004200001F7C1F7C000000420000186318631863186318631863186318630000
        004200001F7C1F7C000000420000186318631863186318631863186318630000
        004200001F7C1F7C000000420000186318631863186318631863186318630000
        004200001F7C1F7C000000420000186318631863186318631863186318630000
        000000001F7C1F7C000000420000186318631863186318631863186318630000
        186300001F7C1F7C000000000000000000000000000000000000000000000000
        000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
  end
  inline fNewObj1: TfNewObj
    Width = 688
    Height = 412
    Align = alClient
    TabOrder = 1
    inherited RxDBGrid1: TRxDBGrid
      Width = 688
      Height = 316
    end
    inherited ToolBar1: TToolBar
      Width = 688
      inherited ToolButton2: TToolButton
        OnClick = nil
      end
    end
    inherited Panel1: TPanel
      Width = 688
    end
    inherited FilterPanel: TPanel
      Width = 688
    end
    inherited pmNewObj: TPopupMenu
      inherited N7: TMenuItem [5]
      end
      inherited N8: TMenuItem [6]
        Caption = 'Выбрать'
      end
      inherited N9: TMenuItem [7]
        Caption = 'Снять выбор'
      end
      inherited N3: TMenuItem
        Caption = 'Выбрать все'
      end
      inherited N4: TMenuItem
        Caption = 'Снять выбор со всех'
      end
    end
  end
end
