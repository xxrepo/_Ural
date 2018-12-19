object BJTree: TBJTree
  Left = 330
  Top = 157
  Width = 664
  Height = 513
  Caption = 'Бюджет'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 445
    Width = 656
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 566
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Закрыть'
      ModalResult = 2
      TabOrder = 0
      OnClick = btnCancelClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 656
    Height = 89
    Align = alTop
    TabOrder = 1
    object Label4: TLabel
      Left = 16
      Top = 37
      Width = 35
      Height = 13
      Caption = 'Дата c'
    end
    object Label3: TLabel
      Left = 184
      Top = 38
      Width = 33
      Height = 13
      Caption = 'Время'
      Visible = False
    end
    object Label1: TLabel
      Left = 16
      Top = 61
      Width = 41
      Height = 13
      Caption = 'Дата по'
    end
    object Label2: TLabel
      Left = 184
      Top = 62
      Width = 33
      Height = 13
      Caption = 'Время'
      Visible = False
    end
    object Label5: TLabel
      Left = 16
      Top = 12
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object dtDFrom: TDateTimePicker
      Left = 72
      Top = 34
      Width = 105
      Height = 21
      CalAlignment = dtaLeft
      Date = 37604.576338125
      Time = 37604.576338125
      Checked = False
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object dtTFrom: TDateTimePicker
      Left = 224
      Top = 34
      Width = 105
      Height = 21
      CalAlignment = dtaLeft
      Date = 37604.576338125
      Time = 37604.576338125
      Checked = False
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkTime
      ParseInput = False
      TabOrder = 1
      Visible = False
    end
    object dtDTo: TDateTimePicker
      Left = 72
      Top = 58
      Width = 105
      Height = 21
      CalAlignment = dtaLeft
      Date = 37604.576338125
      Time = 37604.576338125
      Checked = False
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
    end
    object DateTimePicker2: TDateTimePicker
      Left = 224
      Top = 58
      Width = 105
      Height = 21
      CalAlignment = dtaLeft
      Date = 37604.576338125
      Time = 37604.576338125
      Checked = False
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkTime
      ParseInput = False
      TabOrder = 3
      Visible = False
    end
    object edName: TEdit
      Left = 71
      Top = 8
      Width = 257
      Height = 21
      TabOrder = 4
    end
  end
  inline fBJTree1: TfBJTree
    Top = 89
    Width = 656
    Height = 356
    Align = alClient
    TabOrder = 2
    inherited ToolBar1: TToolBar
      Width = 656
    end
    inherited dxDBTreeList1: TdxDBTreeList
      Width = 656
      Height = 327
    end
  end
  object cdsBJProp: TClientDataSet
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
        Name = '@id_BJ_Obj'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsBJProp'
    RemoteServer = DM.rsCA
    Left = 496
    Top = 24
    object cdsBJPropid_BJ_Obj: TAutoIncField
      FieldName = 'id_BJ_Obj'
      ReadOnly = True
    end
    object cdsBJPropid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsBJPropName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsBJPropDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object cdsBJPropid_Creator: TIntegerField
      FieldName = 'id_Creator'
    end
    object cdsBJPropDateCheck: TDateTimeField
      FieldName = 'DateCheck'
    end
    object cdsBJPropid_Checker: TIntegerField
      FieldName = 'id_Checker'
    end
    object cdsBJPropDisabled: TBooleanField
      FieldName = 'Disabled'
    end
    object cdsBJPropStartDate: TDateTimeField
      FieldName = 'StartDate'
    end
    object cdsBJPropStopDate: TDateTimeField
      FieldName = 'StopDate'
    end
    object cdsBJPropid_ClosedBy: TIntegerField
      FieldName = 'id_ClosedBy'
    end
    object cdsBJPropCloseDate: TDateTimeField
      FieldName = 'CloseDate'
    end
    object cdsBJPropCreatorFIO: TStringField
      FieldName = 'CreatorFIO'
      ReadOnly = True
      Size = 152
    end
    object cdsBJPropCheckerFIO: TStringField
      FieldName = 'CheckerFIO'
      ReadOnly = True
      Size = 152
    end
    object cdsBJPropClosedByFIO: TStringField
      FieldName = 'ClosedByFIO'
      ReadOnly = True
      Size = 152
    end
  end
end
