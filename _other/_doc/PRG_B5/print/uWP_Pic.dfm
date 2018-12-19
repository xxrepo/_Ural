object WP_Pic: TWP_Pic
  Left = 30
  Top = -12
  Width = 910
  Height = 702
  Caption = 'WP_Pic'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <
      item
        Name = 'SecName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CAName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'PName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'APrc'
        DataType = ftFloat
      end>
    Left = 448
    Top = 64
    object RxMemoryData1SecName: TStringField
      FieldName = 'SecName'
      Size = 255
    end
    object RxMemoryData1CAName: TStringField
      FieldName = 'CAName'
      Size = 255
    end
    object RxMemoryData1PName: TStringField
      FieldName = 'PName'
      Size = 255
    end
    object RxMemoryData1APrc: TFloatField
      FieldName = 'APrc'
      OnGetText = RxMemoryData1APrcGetText
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 440
    Top = 336
  end
end
