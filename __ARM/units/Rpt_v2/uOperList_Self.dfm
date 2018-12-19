inherited OperList_Self: TOperList_Self
  Width = 872
  Caption = 'Удаленные операции'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 864
    inherited btnCancel: TButton
      Left = 778
    end
  end
  object cdsMinus: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_business'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DateFrom'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DateTo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_user'
        ParamType = ptInput
      end>
    ProviderName = 'dsSelf'
    RemoteServer = DM.rsCA
    Left = 456
    Top = 72
  end
end
