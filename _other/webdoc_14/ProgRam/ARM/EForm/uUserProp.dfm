object UserProp: TUserProp
  Left = 196
  Top = 125
  BorderStyle = bsDialog
  Caption = 'UserProp'
  ClientHeight = 412
  ClientWidth = 600
  Color = clBtnFace
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 83
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 11
      Width = 30
      Height = 13
      Caption = 'ФИО:'
    end
    object Label9: TLabel
      Left = 8
      Top = 34
      Width = 34
      Height = 13
      Caption = 'Логин:'
    end
    object Label10: TLabel
      Left = 8
      Top = 61
      Width = 41
      Height = 13
      Caption = 'Пароль:'
    end
    object edFIO: TsDBEdit
      Left = 63
      Top = 6
      Width = 530
      Height = 21
      Color = clWhite
      DataField = 'FIO'
      DataSource = dsUsers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object LoginEdit: TsDBEdit
      Left = 63
      Top = 32
      Width = 123
      Height = 21
      Color = clWhite
      DataField = 'USERNAME'
      DataSource = dsUsers
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object cbAdm: TDBCheckBox
      Left = 216
      Top = 59
      Width = 177
      Height = 17
      Caption = 'Админские права'
      DataField = 'id_UADM'
      DataSource = dsUsers
      TabOrder = 2
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object PasswordEdit: TEdit
      Left = 63
      Top = 58
      Width = 123
      Height = 21
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 3
      Text = '********'
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 374
    Width = 600
    Height = 38
    Align = alBottom
    TabOrder = 1
    object OkButton: TButton
      Left = 426
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = OkButtonClick
    end
    object CancelButton: TButton
      Left = 514
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 83
    Width = 600
    Height = 291
    Align = alClient
    Caption = 'Бизнесы'
    TabOrder = 2
    inline fDualList1: TfDualList
      Left = 2
      Top = 15
      Width = 596
      Height = 274
      inherited Splitter1: TAdvSplitter
        Height = 274
      end
      inherited SrcPanel: TPanel
        Height = 274
        inherited SrcList: TTextListBox
          Height = 248
        end
      end
      inherited DestPanel: TPanel
        Width = 272
        Height = 274
        inherited Panel4: TPanel
          Width = 270
        end
        inherited DstList: TTextListBox
          Width = 270
          Height = 248
        end
      end
      inherited BtnPanel: TPanel
        Height = 274
      end
    end
  end
  object cdsUsers: TClientDataSet
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
        Name = '@id_User'
        ParamType = ptInput
        Value = 112
      end>
    ProviderName = 'dsUserProp'
    RemoteServer = DM.rsCA
    Left = 120
    Top = 176
    object cdsUsersid_User: TAutoIncField
      FieldName = 'id_User'
      ReadOnly = True
    end
    object cdsUsersFIO: TStringField
      FieldName = 'FIO'
      Size = 255
    end
    object cdsUsersUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 255
    end
    object cdsUsersid_UADM: TBooleanField
      FieldName = 'id_UADM'
    end
  end
  object dsUsers: TDataSource
    DataSet = cdsUsers
    Left = 152
    Top = 184
  end
end
