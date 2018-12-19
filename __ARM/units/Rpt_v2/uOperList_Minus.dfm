inherited OperList_Minus: TOperList_Minus
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
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_business'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@HasViza'
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
        Name = '@id_ContrAgent'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_CAGroup'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Repr'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@CANone'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@AllRepr'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Warehouse'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@AllWH'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Acc'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@AllAcc'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Manufact'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@AllMN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_user'
        ParamType = ptInput
      end>
    ProviderName = 'dsMinus'
    RemoteServer = DM.rsCA
    Left = 456
    Top = 72
  end
end
