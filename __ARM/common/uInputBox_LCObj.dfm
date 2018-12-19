object FrmInputBox_LCObj: TFrmInputBox_LCObj
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'FrmInputBox_LCObj'
  ClientHeight = 101
  ClientWidth = 392
  Color = clBtnFace
  Constraints.MinHeight = 128
  Constraints.MinWidth = 350
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnCA: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 28
    Align = alTop
    TabOrder = 0
    object Label8: TLabel
      Left = 8
      Top = 8
      Width = 35
      Height = 13
      Caption = 'Группа'
    end
    object DBLookupComboBox1: TRxDBLookupCombo
      Left = 72
      Top = 2
      Width = 312
      Height = 21
      DropDownCount = 8
      DisplayEmpty = 'без группы'
      LookupField = 'id_Group'
      LookupDisplay = 'Name'
      LookupSource = DataSource1
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 28
    Width = 392
    Height = 32
    Align = alClient
    Caption = ' '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object Edit1: TEdit
      Left = 72
      Top = 4
      Width = 312
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'Edit1'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 60
    Width = 392
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 2
    object btnCancel: TButton
      Left = 294
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 0
    end
    object btnOk: TButton
      Left = 208
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsAccGroup
    Left = 6
    Top = 69
  end
  object cdsAccGroup: TClientDataSet
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
        Value = '0'
      end>
    ProviderName = 'dsAccGroup'
    RemoteServer = DM.rsCA
    Left = 30
    Top = 45
    object cdsAccGroupid_Group: TIntegerField
      FieldName = 'id_Group'
      ReadOnly = True
    end
    object cdsAccGroupName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object cdsAccGroupCnt: TIntegerField
      FieldName = 'Cnt'
      ReadOnly = True
    end
  end
  object cdsMNGroup: TClientDataSet
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
        Value = '0'
      end>
    ProviderName = 'dsMNGroup'
    RemoteServer = DM.rsCA
    Left = 65
    Top = 45
    object IntegerField1: TIntegerField
      FieldName = 'id_Group'
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object IntegerField2: TIntegerField
      FieldName = 'Cnt'
      ReadOnly = True
    end
  end
  object cdsWHGroup: TClientDataSet
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
        Value = '0'
      end>
    ProviderName = 'dsWHGroup'
    RemoteServer = DM.rsCA
    Left = 99
    Top = 45
    object IntegerField3: TIntegerField
      FieldName = 'id_Group'
      ReadOnly = True
    end
    object StringField2: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object IntegerField4: TIntegerField
      FieldName = 'Cnt'
      ReadOnly = True
    end
  end
end
