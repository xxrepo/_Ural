object BJTreeEdit_v2: TBJTreeEdit_v2
  Left = 330
  Top = 157
  ActiveControl = edName
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Бюджет'
  ClientHeight = 104
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 338
    Height = 63
    Align = alClient
    TabOrder = 0
    object Label4: TLabel
      Left = 16
      Top = 37
      Width = 18
      Height = 13
      Caption = 'Год'
    end
    object Label5: TLabel
      Left = 16
      Top = 12
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object edName: TEdit
      Left = 71
      Top = 8
      Width = 257
      Height = 21
      TabOrder = 0
    end
    object ceYear: TCurrencyEdit
      Left = 72
      Top = 32
      Width = 73
      Height = 21
      AutoSize = False
      DisplayFormat = '0'
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 63
    Width = 338
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object Button1: TButton
      Left = 252
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 161
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
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
