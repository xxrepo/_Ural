object fMSGProp: TfMSGProp
  Left = 0
  Top = 0
  Width = 466
  Height = 385
  TabOrder = 0
  object Splitter1: TSplitter
    Left = 0
    Top = 203
    Width = 466
    Height = 5
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 466
    Height = 31
    Align = alTop
    Caption = ' '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 13
      Caption = 'Дата'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 179
      Top = 8
      Width = 30
      Height = 13
      Caption = 'Автор'
      FocusControl = DBEdit3
    end
    object DBEdit1: TDBEdit
      Left = 56
      Top = 5
      Width = 112
      Height = 21
      Color = clMenu
      DataField = 'DateCreate'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 216
      Top = 5
      Width = 241
      Height = 21
      Color = clMenu
      DataField = 'FIO'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 31
    Width = 466
    Height = 172
    Align = alClient
    Caption = 'Текст'
    TabOrder = 1
    object DBMemo1: TDBMemo
      Left = 2
      Top = 15
      Width = 462
      Height = 155
      Align = alClient
      DataField = 'Body'
      DataSource = DataSource1
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 208
    Width = 466
    Height = 177
    Align = alBottom
    Caption = ' '
    TabOrder = 2
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 464
      Height = 29
      Align = alTop
      Caption = ' '
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 7
        Width = 44
        Height = 13
        Caption = 'Закрыто'
        FocusControl = DBEdit2
      end
      object Label4: TLabel
        Left = 179
        Top = 7
        Width = 34
        Height = 13
        Caption = 'Статус'
        FocusControl = DBEdit3
      end
      object DBEdit2: TDBEdit
        Left = 56
        Top = 4
        Width = 112
        Height = 21
        Color = clMenu
        DataField = 'DateClose'
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 0
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 216
        Top = 3
        Width = 241
        Height = 21
        DropDownCount = 8
        DataField = 'id_State'
        DataSource = DataSource1
        LookupField = 'id_State'
        LookupDisplay = 'StateName'
        LookupSource = DataSource2
        ReadOnly = True
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 30
      Width = 464
      Height = 146
      Align = alClient
      Caption = 'Ответ'
      TabOrder = 1
      object DBMemo2: TDBMemo
        Left = 2
        Top = 15
        Width = 460
        Height = 129
        Align = alClient
        Color = clMenu
        DataField = 'RepBody'
        DataSource = DataSource1
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object cdsMSGPr: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Msg'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'dsMSGPr'
    RemoteServer = DM.rsCA
    Left = 392
    Top = 48
    object cdsMSGPrid_Msg: TAutoIncField
      FieldName = 'id_Msg'
      ReadOnly = True
    end
    object cdsMSGPrBody: TStringField
      FieldName = 'Body'
      Size = 8000
    end
    object cdsMSGPrDateCreate: TDateTimeField
      FieldName = 'DateCreate'
      DisplayFormat = 'yyyy-mm-dd hh:nn'
    end
    object cdsMSGPrid_User: TIntegerField
      FieldName = 'id_User'
    end
    object cdsMSGPrWasRead: TBooleanField
      FieldName = 'WasRead'
    end
    object cdsMSGPrDateClose: TDateTimeField
      FieldName = 'DateClose'
      DisplayFormat = 'yyyy-mm-dd hh:nn'
    end
    object cdsMSGPrRepBody: TStringField
      FieldName = 'RepBody'
      Size = 8000
    end
    object cdsMSGPrid_State: TIntegerField
      FieldName = 'id_State'
    end
    object cdsMSGPrStateName: TStringField
      FieldName = 'StateName'
      Size = 50
    end
    object cdsMSGPrFIO: TStringField
      FieldName = 'FIO'
      ReadOnly = True
      Size = 152
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsMSGPr
    Left = 424
    Top = 48
  end
  object cdsMSGState: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end>
    ProviderName = 'dsMSGState'
    RemoteServer = DM.rsCA
    Left = 392
    Top = 83
    object cdsMSGStateid_State: TAutoIncField
      FieldName = 'id_State'
      ReadOnly = True
    end
    object cdsMSGStateStateName: TStringField
      FieldName = 'StateName'
      Size = 50
    end
    object cdsMSGStateOrdNum: TIntegerField
      FieldName = 'OrdNum'
    end
  end
  object DataSource2: TDataSource
    DataSet = cdsMSGState
    Left = 424
    Top = 83
  end
end
