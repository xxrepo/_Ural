object fOperEmptyData: TfOperEmptyData
  Left = 0
  Top = 0
  Width = 449
  Height = 348
  TabOrder = 0
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 449
    Height = 348
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Исходные данные'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 441
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 0
        object Label9: TLabel
          Left = 4
          Top = 4
          Width = 70
          Height = 13
          Caption = 'Тип операции'
        end
        object DBEdit1: TDBEdit
          Left = 88
          Top = 2
          Width = 344
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMenu
          DataField = 'OperTypeIn'
          DataSource = DataSource1
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 25
        Width = 441
        Height = 48
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 1
        object Label7: TLabel
          Left = 4
          Top = 8
          Width = 80
          Height = 13
          Caption = 'Ввел сотрудник'
          FocusControl = DBEdit7
        end
        object Label5: TLabel
          Left = 4
          Top = 31
          Width = 59
          Height = 13
          Caption = 'Дата ввода'
          FocusControl = DBEdit5
        end
        object DBEdit7: TDBEdit
          Left = 88
          Top = 2
          Width = 344
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMenu
          DataField = 'CreatorFIO'
          DataSource = DataSource1
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 88
          Top = 26
          Width = 137
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DateLocal'
          DataSource = DataSource1
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 73
        Width = 441
        Height = 247
        Align = alClient
        Caption = 'Описание операции: '
        TabOrder = 2
        object Label1: TLabel
          Left = 120
          Top = 88
          Width = 70
          Height = 13
          Caption = 'id_UserCreator'
        end
        object DBMemo1: TDBMemo
          Left = 2
          Top = 15
          Width = 437
          Height = 230
          Align = alClient
          Color = clMenu
          DataField = 'Body'
          DataSource = DataSource1
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  object ActionList1: TActionList
    Images = DM.ilMenu
    Left = 64
    Top = 64
    object aCommentNew: TAction
      Caption = 'Создать'
      Hint = 'Создать'
      ImageIndex = 0
    end
    object aCommentProp: TAction
      Caption = 'Редактировать'
      Enabled = False
      Hint = 'Редактировать'
      ImageIndex = 1
    end
    object aCommentDel: TAction
      Caption = 'Удалить'
      Enabled = False
      ImageIndex = 2
    end
  end
  object cdsEmptyProp: TClientDataSet
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
        Value = 1
      end>
    ProviderName = 'dsEmptyProp'
    RemoteServer = DM.rsCA
    Left = 44
    Top = 112
    object cdsEmptyPropid_Oper: TAutoIncField
      FieldName = 'id_Oper'
      ReadOnly = True
    end
    object cdsEmptyPropid_OperParent: TIntegerField
      FieldName = 'id_OperParent'
    end
    object cdsEmptyPropOperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object cdsEmptyPropOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
      OnGetText = cdsEmptyPropOperTypeInGetText
    end
    object cdsEmptyPropid_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsEmptyPropCreatorFIO: TStringField
      FieldName = 'CreatorFIO'
      ReadOnly = True
      Size = 152
    end
    object cdsEmptyPropManagerFIO: TStringField
      FieldName = 'ManagerFIO'
      ReadOnly = True
      Size = 152
    end
    object cdsEmptyPropDateLocal: TDateTimeField
      FieldName = 'DateLocal'
    end
    object cdsEmptyPropBody: TStringField
      FieldName = 'Body'
      Size = 5000
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsEmptyProp
    Left = 76
    Top = 113
  end
end
