object fDEP: TfDEP
  Left = 0
  Top = 0
  Width = 443
  Height = 277
  Align = alClient
  TabOrder = 0
  object ImageList: TImageList
    Left = 184
    Top = 80
  end
  object ActionList1: TActionList
    Images = ImageList
    Left = 104
    Top = 104
    object aGoOrg: TAction
      Caption = 'Go to organization'
      Enabled = False
      OnExecute = aGoOrgExecute
    end
  end
  object qDocList: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PID'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select id_CA, Name, Addr, id_Icons, Director, Buh, CA.isGRP'
      'FROM DW_CA CA'
      'WHERE Deleted=0 '
      'AND PID = :PID'
      ''
      ''
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 144
    Top = 24
    object qDocListID_CA: TBCDField
      FieldName = 'ID_CA'
      Precision = 32
      Size = 0
    end
    object qDocListNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object qDocListADDR: TWideStringField
      FieldName = 'ADDR'
      Size = 255
    end
    object qDocListID_ICONS: TBCDField
      FieldName = 'ID_ICONS'
      Precision = 32
      Size = 0
    end
    object qDocListDIRECTOR: TWideStringField
      FieldName = 'DIRECTOR'
      Size = 255
    end
    object qDocListBUH: TWideStringField
      FieldName = 'BUH'
      Size = 255
    end
    object qDocListISGRP: TBCDField
      FieldName = 'ISGRP'
      Precision = 32
      Size = 0
    end
  end
  object dsPMList: TDataSource
    DataSet = cdsDep
    OnDataChange = dsPMListDataChange
    Left = 184
    Top = 32
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = qDocList
    Constraints = True
    Left = 288
    Top = 144
  end
  object cdsDep: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PID'
        ParamType = ptInput
      end>
    ProviderName = 'DataSetProvider1'
    Left = 272
    Top = 104
    object cdsDepID_CA: TBCDField
      FieldName = 'ID_CA'
      Precision = 32
      Size = 0
    end
    object cdsDepNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object cdsDepADDR: TWideStringField
      FieldName = 'ADDR'
      Size = 255
    end
    object cdsDepID_ICONS: TBCDField
      FieldName = 'ID_ICONS'
      Precision = 32
      Size = 0
    end
    object cdsDepDIRECTOR: TWideStringField
      FieldName = 'DIRECTOR'
      Size = 255
    end
    object cdsDepBUH: TWideStringField
      FieldName = 'BUH'
      Size = 255
    end
    object cdsDepICN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'ICN'
    end
    object cdsDepISGRP: TBCDField
      FieldName = 'ISGRP'
      Precision = 32
      Size = 0
    end
  end
  object pmOper: TAdvPopupMenu
    Images = ImageList
    Left = 152
    Top = 176
    object Pending1: TMenuItem
      Action = aGoOrg
    end
  end
end
