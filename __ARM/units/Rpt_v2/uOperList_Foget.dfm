inherited OperList_Foget: TOperList_Foget
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
  inherited fRptFrame1: TfRptFrame
    Width = 864
    inherited Splitter1: TSplitter
      Width = 864
    end
    inherited RxDBGrid1: TRxDBGrid
      Width = 864
    end
    inherited Panel3: TPanel
      Width = 864
    end
    inherited fArc1: TfArc
      Width = 864
      inherited ToolBar1: TToolBar
        Width = 864
      end
      inherited pnDate: TPanel
        Width = 864
        inherited Panel3: TPanel
          Width = 590
        end
      end
      inherited RxDBGrid1: TDBGridEh
        Width = 864
      end
      inherited StatusBar1: TStatusBar
        Width = 864
      end
      inherited ToolBar2: TToolBar
        Width = 864
      end
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
    ProviderName = 'dsFoget'
    RemoteServer = DM.rsCA
    Left = 456
    Top = 72
  end
end
