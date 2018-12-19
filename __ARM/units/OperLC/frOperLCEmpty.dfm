object fOperLCEmpty: TfOperLCEmpty
  Left = 0
  Top = 0
  Width = 650
  Height = 514
  TabOrder = 0
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 650
    Height = 514
    ActivePage = tsData
    Align = alClient
    TabOrder = 0
    object tsData: TTabSheet
      Caption = 'Данные'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 125
        Width = 642
        Height = 361
        Align = alClient
        Caption = 'Описание операции: '
        TabOrder = 0
        object DBMemo1: TDBMemo
          Left = 2
          Top = 15
          Width = 638
          Height = 344
          Align = alClient
          DataField = 'OpComment'
          DataSource = dsOperFin
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 642
        Height = 33
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = ' '
        TabOrder = 1
        inline fBsnSelector1: TfBsnSelector
          Left = 2
          Top = 2
          Width = 638
          Height = 31
          Align = alTop
          inherited edName: TEdit
            Width = 552
          end
          inherited Button1: TButton
            Left = 607
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 33
        Width = 642
        Height = 92
        Align = alTop
        Caption = ' Документ: '
        TabOrder = 2
        object Label8: TLabel
          Left = 10
          Top = 23
          Width = 128
          Height = 13
          Caption = 'Осн. платежа/накладная'
        end
        object Label11: TLabel
          Left = 10
          Top = 46
          Width = 145
          Height = 13
          Caption = 'Пл. поручение/Счет фактура'
        end
        object Label17: TLabel
          Left = 10
          Top = 70
          Width = 44
          Height = 13
          Caption = 'Договор'
        end
        object edContract: TDBEdit
          Left = 173
          Top = 66
          Width = 460
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'Contract'
          DataSource = dsOperFin
          TabOrder = 2
        end
        object edImp_PayBasic: TDBEdit
          Left = 173
          Top = 18
          Width = 460
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'Imp_PayBasic'
          DataSource = dsOperFin
          TabOrder = 0
        end
        object edAccInv_PayAssignment: TDBEdit
          Left = 173
          Top = 42
          Width = 460
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'AccInv_PayAssignment'
          DataSource = dsOperFin
          TabOrder = 1
        end
      end
    end
    object tsComment: TTabSheet
      Caption = 'Доп. информация'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 642
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 0
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
          Left = 96
          Top = 2
          Width = 540
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          Color = clMenu
          DataField = 'CreatorFIO'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 96
          Top = 26
          Width = 132
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DateLocal'
          DataSource = dsOperFin
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
  object cdsOperFin: TClientDataSet
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
        Name = '@id_LC_Oper'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsEmptyOper'
    RemoteServer = DM.rsCA
    AfterPost = cdsOperFinAfterPost
    Left = 96
    Top = 190
    object cdsOperFinid_LC_Oper: TAutoIncField
      FieldName = 'id_LC_Oper'
      ReadOnly = True
    end
    object cdsOperFinOperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object cdsOperFinid_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsOperFinCreatorFIO: TStringField
      FieldName = 'CreatorFIO'
      ReadOnly = True
      Size = 152
    end
    object cdsOperFinDateLocal: TDateTimeField
      FieldName = 'DateLocal'
    end
    object cdsOperFinOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsOperFinid_DocType: TIntegerField
      FieldName = 'id_DocType'
    end
    object cdsOperFinDocTypeName: TStringField
      FieldName = 'DocTypeName'
      Size = 255
    end
    object cdsOperFinContract: TStringField
      FieldName = 'Contract'
      Size = 1000
    end
    object cdsOperFinOpComment: TStringField
      FieldName = 'OpComment'
      Size = 1000
    end
    object cdsOperFinid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsOperFinBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsOperFinImp_PayBasic: TStringField
      FieldName = 'Imp_PayBasic'
      Size = 1000
    end
    object cdsOperFinAccInv_PayAssignment: TStringField
      FieldName = 'AccInv_PayAssignment'
      Size = 1000
    end
  end
  object dsOperFin: TDataSource
    DataSet = cdsOperFin
    Left = 128
    Top = 190
  end
  object ActionList1: TActionList
    Images = DM.ilMenu
    Left = 248
    Top = 192
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
end
