object CR_Cat: TCR_Cat
  Left = 210
  Top = 107
  ActiveControl = DBEdit1
  BorderStyle = bsDialog
  Caption = 'Раздел'
  ClientHeight = 243
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 50
    Height = 13
    Caption = 'Название'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 222
    Height = 13
    Caption = 'Значения параметра "Среднемес. затрата"'
  end
  object Panel2: TPanel
    Left = 0
    Top = 202
    Width = 344
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 258
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 167
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
  object DBEdit1: TDBEdit
    Left = 72
    Top = 8
    Width = 150
    Height = 21
    DataField = 'Name'
    DataSource = dsCCP
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 64
    Width = 320
    Height = 129
    DataSource = dsCCFlt
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ExtStr'
        Title.Caption = 'Значение'
        Width = 241
        Visible = True
      end>
  end
  object cdsCCP: TClientDataSet
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
        Name = '@id_Cat'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsCCP'
    RemoteServer = DM.rsCA
    Left = 208
    Top = 96
    object cdsCCPid_Cat: TAutoIncField
      FieldName = 'id_Cat'
      ReadOnly = True
    end
    object cdsCCPid_Rep: TIntegerField
      FieldName = 'id_Rep'
    end
    object cdsCCPName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsCCPPID: TIntegerField
      FieldName = 'PID'
    end
    object cdsCCPF_OperVid: TStringField
      FieldName = 'F_OperVid'
      Size = 255
    end
    object cdsCCPF_id_ContrAgent: TStringField
      FieldName = 'F_id_ContrAgent'
      Size = 255
    end
    object cdsCCPOrdNum: TIntegerField
      FieldName = 'OrdNum'
    end
    object cdsCCPGrpOper: TBooleanField
      FieldName = 'GrpOper'
    end
  end
  object dsCCP: TDataSource
    DataSet = cdsCCP
    Left = 248
    Top = 96
  end
  object dsCCFlt: TDataSource
    DataSet = cdsCCFlt
    OnDataChange = dsCCFltDataChange
    Left = 248
    Top = 136
  end
  object cdsCCFlt: TClientDataSet
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
        Name = '@id_Cat'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsCCFlt'
    RemoteServer = DM.rsCA
    Left = 208
    Top = 136
    object cdsCCFltid_FLT: TAutoIncField
      FieldName = 'id_FLT'
      ReadOnly = True
    end
    object cdsCCFltid_Cat: TIntegerField
      FieldName = 'id_Cat'
    end
    object cdsCCFltF_OperVid: TStringField
      FieldName = 'F_OperVid'
      Size = 255
    end
    object cdsCCFltF_id_ContrAgent: TStringField
      FieldName = 'F_id_ContrAgent'
      Size = 255
    end
    object cdsCCFltExtStr: TStringField
      FieldName = 'ExtStr'
      Size = 255
    end
    object cdsCCFltEXXX: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'EXXX'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 96
    Top = 112
    object N1: TMenuItem
      Action = aDel
    end
  end
  object ActionList1: TActionList
    Left = 272
    Top = 16
    object aDel: TAction
      Caption = 'Удалить'
      OnExecute = aDelExecute
    end
  end
end
