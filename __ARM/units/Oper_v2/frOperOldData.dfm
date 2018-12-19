object fOperOldData: TfOperOldData
  Left = 0
  Top = 0
  Width = 425
  Height = 367
  TabOrder = 0
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 425
    Height = 367
    Align = alClient
    ColCount = 2
    DefaultColWidth = 50
    DefaultRowHeight = 18
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goRowSelect]
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
    ColWidths = (
      114
      194)
  end
  object cdsOldOperProp: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_old_Oper'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsOldOperProp'
    RemoteServer = DM.rsCA
    Left = 176
    Top = 112
  end
  object cdsOperNewData: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_Oper'
        ParamType = ptInput
        Value = 255
      end>
    ProviderName = 'dsOperProp'
    RemoteServer = DM.rsCA
    Left = 96
    Top = 190
  end
end
