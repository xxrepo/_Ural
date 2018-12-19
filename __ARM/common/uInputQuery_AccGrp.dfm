object AccGrp: TAccGrp
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'AccGrp'
  ClientHeight = 138
  ClientWidth = 342
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 342
    Height = 97
    Align = alClient
    Caption = ' '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 50
      Height = 13
      Caption = 'Название'
    end
    object Label2: TLabel
      Left = 6
      Top = 5
      Width = 75
      Height = 26
      Caption = 'Родительская группа'
      WordWrap = True
    end
    object Edit1: TEdit
      Left = 88
      Top = 44
      Width = 246
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Text = 'Edit1'
    end
    object cbShowInRoot: TCheckBox
      Left = 88
      Top = 72
      Width = 241
      Height = 17
      Caption = 'Отображать в первом уровне баланса'
      TabOrder = 3
    end
    object Edit2: TEdit
      Left = 88
      Top = 8
      Width = 224
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 0
    end
    object Button1: TButton
      Left = 313
      Top = 9
      Width = 20
      Height = 20
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 342
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object btnCancel: TButton
      Left = 252
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akBottom]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 0
    end
    object btnOk: TButton
      Left = 149
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = btnOkClick
    end
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
    Left = 48
    Top = 28
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
end
