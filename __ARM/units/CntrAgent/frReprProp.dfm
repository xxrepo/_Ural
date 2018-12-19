object fReprProp: TfReprProp
  Left = 0
  Top = 0
  Width = 518
  Height = 619
  Constraints.MinHeight = 407
  Constraints.MinWidth = 430
  TabOrder = 0
  object pcCA: TPageControl
    Left = 0
    Top = 0
    Width = 518
    Height = 619
    ActivePage = tsProp
    Align = alClient
    TabOrder = 0
    object tsProp: TTabSheet
      Caption = 'Свойства'
      object Panel1: TPanel
        Left = 0
        Top = 28
        Width = 510
        Height = 563
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = ' '
        TabOrder = 0
        object Label1: TLabel
          Left = 7
          Top = 33
          Width = 50
          Height = 13
          Caption = 'Название'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 8
          Top = 272
          Width = 31
          Height = 13
          Caption = 'Адрес'
          FocusControl = DBMemo1
        end
        object Label3: TLabel
          Left = 8
          Top = 376
          Width = 50
          Height = 13
          Caption = 'Описание'
          FocusControl = DBMemo2
        end
        object Label5: TLabel
          Left = 8
          Top = 80
          Width = 22
          Height = 13
          Caption = 'Имя'
          FocusControl = DBEdit2
        end
        object Label6: TLabel
          Left = 8
          Top = 104
          Width = 47
          Height = 13
          Caption = 'Отчество'
          FocusControl = DBEdit3
        end
        object Label7: TLabel
          Left = 8
          Top = 56
          Width = 49
          Height = 13
          Caption = 'Фамилия'
          FocusControl = DBEdit4
        end
        object Label4: TLabel
          Left = 8
          Top = 8
          Width = 19
          Height = 13
          Caption = 'Тип'
        end
        object Label9: TLabel
          Left = 8
          Top = 152
          Width = 22
          Height = 13
          Caption = 'БИК'
          FocusControl = DBEdit6
        end
        object Label10: TLabel
          Left = 8
          Top = 200
          Width = 25
          Height = 13
          Caption = 'Банк'
          FocusControl = DBEdit7
        end
        object Label11: TLabel
          Left = 8
          Top = 224
          Width = 47
          Height = 13
          Caption = 'Рас. счет'
          FocusControl = DBEdit8
        end
        object Label12: TLabel
          Left = 216
          Top = 152
          Width = 31
          Height = 13
          Caption = 'ОКПО'
          FocusControl = DBEdit9
        end
        object Label13: TLabel
          Left = 8
          Top = 248
          Width = 47
          Height = 13
          Caption = 'Кор. счет'
          FocusControl = DBEdit10
        end
        object Label14: TLabel
          Left = 8
          Top = 176
          Width = 24
          Height = 13
          Caption = 'ИНН'
          FocusControl = DBEdit11
        end
        object Label15: TLabel
          Left = 216
          Top = 176
          Width = 23
          Height = 13
          Caption = 'КПП'
          FocusControl = DBEdit12
        end
        object DBEdit1: TDBEdit
          Left = 62
          Top = 29
          Width = 316
          Height = 21
          DataField = 'Name'
          DataSource = dsProp
          TabOrder = 1
        end
        object cbDisabled: TDBCheckBox
          Left = 64
          Top = 128
          Width = 97
          Height = 17
          Caption = 'Удалить'
          DataField = 'Disabled'
          DataSource = dsProp
          TabOrder = 5
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object DBMemo1: TDBMemo
          Left = 8
          Top = 288
          Width = 493
          Height = 89
          Anchors = [akLeft, akTop, akRight]
          DataField = 'Addr'
          DataSource = dsProp
          ScrollBars = ssBoth
          TabOrder = 14
        end
        object DBMemo2: TDBMemo
          Left = 8
          Top = 392
          Width = 495
          Height = 89
          Anchors = [akLeft, akTop, akRight]
          DataField = 'Descr'
          DataSource = dsProp
          ScrollBars = ssBoth
          TabOrder = 15
        end
        object DBEdit2: TDBEdit
          Left = 62
          Top = 77
          Width = 257
          Height = 21
          DataField = 'FirstName'
          DataSource = dsProp
          TabOrder = 3
        end
        object DBEdit3: TDBEdit
          Left = 62
          Top = 101
          Width = 257
          Height = 21
          DataField = 'MiddleName'
          DataSource = dsProp
          TabOrder = 4
        end
        object DBEdit4: TDBEdit
          Left = 62
          Top = 53
          Width = 257
          Height = 21
          DataField = 'LastName'
          DataSource = dsProp
          TabOrder = 2
        end
        object cbIsJur: TComboBox
          Left = 62
          Top = 4
          Width = 339
          Height = 22
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 0
          OnChange = cbIsJurChange
          Items.Strings = (
            'Юридическое лицо'
            'Физическое лицо')
        end
        object DBCheckBox1: TDBCheckBox
          Left = 184
          Top = 128
          Width = 297
          Height = 17
          Caption = 'Передавать в удаленные базы'
          DataField = 'NeedSend'
          DataSource = dsProp
          TabOrder = 6
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBEdit6: TDBEdit
          Left = 62
          Top = 149
          Width = 123
          Height = 21
          DataField = 'BIK'
          DataSource = dsProp
          MaxLength = 9
          TabOrder = 7
          OnKeyPress = DBEdit6KeyPress
        end
        object DBEdit7: TDBEdit
          Left = 62
          Top = 197
          Width = 257
          Height = 21
          DataField = 'Bank'
          DataSource = dsProp
          TabOrder = 11
        end
        object DBEdit8: TDBEdit
          Left = 62
          Top = 221
          Width = 257
          Height = 21
          DataField = 'AccName'
          DataSource = dsProp
          TabOrder = 12
          OnKeyPress = DBEdit6KeyPress
        end
        object DBEdit9: TDBEdit
          Left = 254
          Top = 149
          Width = 147
          Height = 21
          DataField = 'OKPO'
          DataSource = dsProp
          TabOrder = 8
          OnKeyPress = DBEdit6KeyPress
        end
        object DBEdit10: TDBEdit
          Left = 62
          Top = 245
          Width = 257
          Height = 21
          DataField = 'CorAccNAme'
          DataSource = dsProp
          TabOrder = 13
          OnKeyPress = DBEdit6KeyPress
        end
        object DBEdit11: TDBEdit
          Left = 62
          Top = 173
          Width = 123
          Height = 21
          DataField = 'INN'
          DataSource = dsProp
          MaxLength = 12
          TabOrder = 9
          OnKeyPress = DBEdit6KeyPress
        end
        object DBEdit12: TDBEdit
          Left = 254
          Top = 173
          Width = 147
          Height = 21
          DataField = 'KPP'
          DataSource = dsProp
          MaxLength = 10
          TabOrder = 10
          OnKeyPress = DBEdit6KeyPress
        end
        object Button1: TButton
          Left = 377
          Top = 29
          Width = 24
          Height = 21
          Caption = '<--'
          TabOrder = 16
          OnClick = Button1Click
        end
      end
      object pnCA: TPanel
        Left = 0
        Top = 0
        Width = 510
        Height = 28
        Align = alTop
        TabOrder = 1
        object Label8: TLabel
          Left = 8
          Top = 8
          Width = 58
          Height = 13
          Caption = 'Контрагент'
          FocusControl = DBEdit5
        end
        object DBEdit5: TDBEdit
          Left = 72
          Top = 4
          Width = 400
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'CAName'
          DataSource = dsProp
          TabOrder = 0
        end
        object BitBtn4: TBitBtn
          Left = 470
          Top = 4
          Width = 24
          Height = 21
          Anchors = [akTop, akRight]
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn4Click
        end
      end
    end
    object tsContact: TTabSheet
      Caption = 'Контакты'
      ImageIndex = 1
      object dbgContact: TRxDBGrid
        Left = 0
        Top = 29
        Width = 510
        Height = 562
        Align = alClient
        DataSource = dsReprContact
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgContactDblClick
        TitleButtons = True
        OnCheckButton = dbgContactCheckButton
        OnGetBtnParams = dbgContactGetBtnParams
        Columns = <
          item
            Expanded = False
            FieldName = 'FIO'
            Title.Caption = 'Контактное лицо'
            Width = 263
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Post'
            Title.Caption = 'Должность'
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Phone'
            Title.Caption = 'Телефон'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'email'
            Title.Caption = 'e-mail'
            Visible = True
          end>
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 510
        Height = 29
        Caption = 'ToolBar1'
        Images = DM.ilMenu
        TabOrder = 1
        object ToolButton1: TToolButton
          Left = 0
          Top = 2
          Action = aContNew
        end
        object ToolButton2: TToolButton
          Left = 23
          Top = 2
          Action = aContProp
        end
        object ToolButton3: TToolButton
          Left = 46
          Top = 2
          Action = aContDelete
        end
      end
    end
    object tsComment: TTabSheet
      Caption = 'Комментарии'
      ImageIndex = 2
      object ToolBar2: TToolBar
        Left = 0
        Top = 0
        Width = 510
        Height = 29
        Caption = 'ToolBar1'
        Images = DM.ilMenu
        TabOrder = 0
        object ToolButton4: TToolButton
          Left = 0
          Top = 2
          Action = aCommentNew
        end
        object ToolButton5: TToolButton
          Left = 23
          Top = 2
          Action = aCommentProp
        end
        object ToolButton6: TToolButton
          Left = 46
          Top = 2
          Action = aCommentDel
        end
      end
      object dbgComment: TDBGrid
        Left = 0
        Top = 29
        Width = 510
        Height = 562
        Align = alClient
        DataSource = dsReprComment
        DefaultDrawing = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgCommentDrawColumnCell
        OnDblClick = dbgCommentDblClick
        Columns = <
          item
            Expanded = False
            Title.Caption = '№№'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Comment'
            ReadOnly = False
            Title.Caption = 'Комментарий'
            Width = 342
            Visible = True
          end>
      end
    end
  end
  object cdsReprProp: TClientDataSet
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
        Name = '@id_Repr'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsReprProp'
    RemoteServer = DM.rsCA
    Left = 280
    Top = 272
    object cdsReprPropName: TStringField
      DisplayLabel = 'Название'
      FieldName = 'Name'
      Size = 255
    end
    object cdsReprPropDisabled: TBooleanField
      DisplayLabel = 'Заблокирован'
      FieldName = 'Disabled'
    end
    object cdsReprPropAddr: TStringField
      FieldName = 'Addr'
      Size = 2000
    end
    object cdsReprPropDescr: TStringField
      FieldName = 'Descr'
      Size = 2000
    end
    object cdsReprPropid_Repr: TAutoIncField
      FieldName = 'id_Repr'
      ReadOnly = True
    end
    object cdsReprPropid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
    end
    object cdsReprPropisJur: TBooleanField
      FieldName = 'isJur'
      OnChange = cdsReprPropisJurChange
    end
    object cdsReprPropFirstName: TStringField
      DisplayLabel = 'Имя'
      FieldName = 'FirstName'
      Size = 30
    end
    object cdsReprPropMiddleName: TStringField
      DisplayLabel = 'Отчество'
      FieldName = 'MiddleName'
      Size = 30
    end
    object cdsReprPropLastName: TStringField
      DisplayLabel = 'Фамилия'
      FieldName = 'LastName'
      Size = 30
    end
    object cdsReprPropCAName: TStringField
      FieldName = 'CAName'
      Size = 255
    end
    object cdsReprPropId_Currency: TIntegerField
      FieldName = 'Id_Currency'
    end
    object cdsReprPropCurrencyName: TStringField
      FieldName = 'CurrencyName'
      Size = 30
    end
    object cdsReprPropNeedSend: TBooleanField
      FieldName = 'NeedSend'
    end
    object cdsReprPropGroupName: TStringField
      FieldName = 'GroupName'
      Size = 255
    end
    object cdsReprPropid_Repr_Group: TIntegerField
      FieldName = 'id_Repr_Group'
    end
    object cdsReprPropid_Bsn: TIntegerField
      FieldName = 'id_Bsn'
      ReadOnly = True
    end
    object cdsReprPropBIK: TStringField
      FieldName = 'BIK'
      Size = 255
    end
    object cdsReprPropBank: TStringField
      FieldName = 'Bank'
      Size = 255
    end
    object cdsReprPropAccName: TStringField
      FieldName = 'AccName'
      Size = 255
    end
    object cdsReprPropCorAccNAme: TStringField
      FieldName = 'CorAccNAme'
      Size = 255
    end
    object cdsReprPropOKPO: TStringField
      FieldName = 'OKPO'
      Size = 50
    end
    object cdsReprPropINN: TStringField
      FieldName = 'INN'
      Size = 50
    end
    object cdsReprPropKPP: TStringField
      FieldName = 'KPP'
      Size = 50
    end
  end
  object cdsReprComment: TClientDataSet
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
        Name = '@id_Repr'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsReprComment'
    RemoteServer = DM.rsCA
    Left = 280
    Top = 304
    object cdsReprCommentid_comment: TAutoIncField
      FieldName = 'id_comment'
      ReadOnly = True
    end
    object cdsReprCommentid_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsReprCommentComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object cdsReprCommentCommentType: TIntegerField
      FieldName = 'CommentType'
    end
    object cdsReprCommentDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object cdsReprCommentid_User: TIntegerField
      FieldName = 'id_User'
    end
  end
  object cdsReprContact: TClientDataSet
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
        Name = '@id_Repr'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsReprContact'
    RemoteServer = DM.rsCA
    Left = 280
    Top = 344
    object cdsReprContactid_Contact: TAutoIncField
      FieldName = 'id_Contact'
      ReadOnly = True
    end
    object cdsReprContactid_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsReprContactFIO: TStringField
      FieldName = 'FIO'
      Size = 255
    end
    object cdsReprContactPost: TStringField
      FieldName = 'Post'
      Size = 50
    end
    object cdsReprContactPhone: TStringField
      FieldName = 'Phone'
      Size = 50
    end
    object cdsReprContactemail: TStringField
      FieldName = 'email'
      Size = 50
    end
  end
  object dsProp: TDataSource
    DataSet = cdsReprProp
    Left = 204
    Top = 174
  end
  object ActionList1: TActionList
    Images = DM.ilMenu
    Left = 328
    Top = 88
    object aContNew: TAction
      Caption = 'Создать'
      Hint = 'Создать'
      ImageIndex = 0
      OnExecute = aContNewExecute
    end
    object aContProp: TAction
      Caption = 'Редактировать'
      Enabled = False
      Hint = 'Редактировать'
      ImageIndex = 1
      OnExecute = aContPropExecute
    end
    object aContDelete: TAction
      Caption = 'Удалить'
      Enabled = False
      ImageIndex = 2
      OnExecute = aContDeleteExecute
    end
    object aCommentNew: TAction
      Caption = 'Создать'
      Hint = 'Создать'
      ImageIndex = 0
      OnExecute = aCommentNewExecute
    end
    object aCommentProp: TAction
      Caption = 'Редактировать'
      Enabled = False
      Hint = 'Редактировать'
      ImageIndex = 1
      OnExecute = aCommentPropExecute
    end
    object aCommentDel: TAction
      Caption = 'Удалить'
      Enabled = False
      ImageIndex = 2
      OnExecute = aCommentDelExecute
    end
    object aCAWHNew: TAction
      Caption = 'Создать склад'
      Hint = 'Создать склад'
      ImageIndex = 0
      OnExecute = aCAWHNewExecute
    end
    object aCAWHProp: TAction
      Caption = 'Редактировать склад'
      Hint = 'Редактировать склад'
      ImageIndex = 1
      OnExecute = aCAWHPropExecute
    end
    object aCAWHDel: TAction
      Caption = 'Удалить склад'
      Enabled = False
      Hint = 'Удалить склад'
      ImageIndex = 2
      OnExecute = aCAWHDelExecute
    end
    object aCAWHContactNew: TAction
      Caption = 'Создать'
      Hint = 'Создать'
      ImageIndex = 0
      OnExecute = aCAWHContactNewExecute
    end
    object aCAWHContactProp: TAction
      Caption = 'Редактировать'
      Hint = 'Редактировать'
      ImageIndex = 1
      OnExecute = aCAWHContactPropExecute
    end
    object aCAWHContactDel: TAction
      Caption = 'Удалить'
      Enabled = False
      Hint = 'Удалить'
      ImageIndex = 2
      OnExecute = aCAWHContactDelExecute
    end
  end
  object dsReprContact: TDataSource
    DataSet = cdsReprContact
    OnDataChange = dsReprContactDataChange
    Left = 388
    Top = 144
  end
  object dsReprComment: TDataSource
    DataSet = cdsReprComment
    OnDataChange = dsReprCommentDataChange
    Left = 364
    Top = 176
  end
  object pmCAWH: TPopupMenu
    Images = DM.ilMenu
    Left = 228
    Top = 104
    object N1: TMenuItem
      Action = aCAWHNew
    end
    object N2: TMenuItem
      Action = aCAWHProp
    end
    object N3: TMenuItem
      Action = aCAWHDel
    end
  end
  object pmCAWHCnt: TPopupMenu
    Images = DM.ilMenu
    Left = 164
    Top = 264
    object MenuItem1: TMenuItem
      Action = aCAWHContactNew
    end
    object MenuItem2: TMenuItem
      Action = aCAWHContactProp
    end
    object MenuItem3: TMenuItem
      Action = aCAWHContactDel
    end
  end
  object pmIns: TPopupMenu
    Left = 412
    Top = 76
  end
end
