object FuncsFrame: TFuncsFrame
  Left = 0
  Top = 0
  Width = 397
  Height = 245
  TabOrder = 0
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 397
    Height = 245
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FuncName'
        Title.Caption = 'Наименование'
        Width = 286
        Visible = True
      end>
  end
  object cdsFuncs: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Group'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Business'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Func'
        ParamType = ptInput
      end>
    ProviderName = 'dsNoR'
    RemoteServer = DM.SocketConnection
    Left = 116
    Top = 194
    object cdsFuncsid_Func: TAutoIncField
      FieldName = 'id_Func'
      ReadOnly = True
    end
    object cdsFuncsFuncName: TStringField
      FieldName = 'FuncName'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsFuncs
    Left = 208
    Top = 88
  end
end
