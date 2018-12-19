object fFiles: TfFiles
  Left = 0
  Top = 0
  Width = 950
  Height = 380
  Align = alClient
  TabOrder = 0
  object dbgFileList: TDBGridEh
    Left = 0
    Top = 26
    Width = 950
    Height = 354
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = dsFileList
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = pmFile
    RowDetailPanel.Color = clBtnFace
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnCellClick = dbgFileListCellClick
    OnDblClick = dbgFileListDblClick
    OnDrawColumnCell = dbgFileListDrawColumnCell
    OnSelectionChanged = dbgFileListSelectionChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'id_File'
        Footers = <>
        Title.Caption = 'ID'
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'EmailDate'
        Footers = <>
        Title.Caption = 'Email|Дата'
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'EmailFrom'
        Footers = <>
        Title.Caption = 'Email|От кого'
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'EmailTo'
        Footers = <>
        Title.Caption = 'Email|Кому'
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'Subj'
        Footers = <>
        Title.Caption = 'Email|Тема'
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'DocNum'
        Footers = <>
        Title.Caption = 'Документ|Номер'
        Width = 80
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'DocDate'
        Footers = <>
        Title.Caption = 'Документ|Дата'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'DateCreate'
        Footers = <>
        Title.Caption = 'Внесен'
        Width = 128
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'DocTypeName'
        Footers = <>
        Title.Caption = 'Тип документа'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 158
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'CalcName'
        Footers = <>
        Title.Caption = 'Название|Системное'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 165
      end
      item
        EditButtons = <>
        FieldName = 'OrigName'
        Footers = <>
        Title.Caption = 'Название|Исходное'
        Width = 100
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'SellerName'
        Footers = <>
        Title.Caption = 'Стороны|Продавец'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 146
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'BayerName'
        Footers = <>
        Title.Caption = 'Стороны|Покупатель'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 120
      end
      item
        EditButtons = <>
        EndEllipsis = True
        FieldName = 'WorkTypeName'
        Footers = <>
        Tag = -777
        Title.Caption = 'Вид деятельности'
        Title.EndEllipsis = True
        Title.TitleButton = True
        Width = 160
      end
      item
        EditButtons = <>
        FieldName = 'Comment'
        Footers = <>
        Title.Caption = 'Комментарий'
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'DocSumm'
        Footers = <>
        Title.Caption = 'Сумма|Сумма'
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'CrnName'
        Footers = <>
        Title.Caption = 'Сумма|Валюта'
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'Adv_Str1'
        Footers = <>
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'Adv_Str2'
        Footers = <>
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'Adv_Str3'
        Footers = <>
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'Adv_Str4'
        Footers = <>
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'Adv_Str5'
        Footers = <>
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'Adv_Str6'
        Footers = <>
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'Adv_Str7'
        Footers = <>
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'Adv_Str8'
        Footers = <>
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'Adv_Str9'
        Footers = <>
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'Adv_Str10'
        Footers = <>
        Visible = False
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'DC2'
        Footers = <>
        Title.Caption = 'Дата-время ввода'
      end
      item
        EditButtons = <>
        FieldName = 'FIO'
        Footers = <>
        Title.Caption = 'Создал'
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'LastFIO'
        Footers = <>
        Title.Caption = 'Кем сохранен'
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'LastEdit'
        Footers = <>
        Title.Caption = 'Посл. изменения'
      end
      item
        EditButtons = <>
        FieldName = 'FileSize'
        Footers = <>
        Title.Caption = 'Размер, байт'
        Visible = False
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 950
    Height = 26
    Align = alTop
    Caption = ' '
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object sLabel5: TsLabel
      Left = 8
      Top = 5
      Width = 81
      Height = 13
      Caption = 'Фильтр файлов'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object FilterEdit: TsEdit
      Left = 96
      Top = 2
      Width = 217
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = FilterEditChange
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
    object sButton3: TsButton
      Left = 313
      Top = 2
      Width = 25
      Height = 22
      Caption = '<='
      TabOrder = 1
      OnClick = sButton3Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object pmFile: TPopupMenu
    Images = DM.ilImage
    Left = 51
    Top = 37
    object N5: TMenuItem
      Action = aCopySelected
      Caption = 'Копировать значение ячейки'
    end
    object N11: TMenuItem
      Action = aCopyData
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Action = aFileEdit
    end
    object N3: TMenuItem
      Action = aFileCopy
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Action = aOpen
    end
    object N15: TMenuItem
      Action = aOpenWith
    end
    object N16: TMenuItem
      Action = aCopyToBuff
    end
    object N10: TMenuItem
      Action = aSave
    end
    object N7: TMenuItem
      Action = aSendMail
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object N14: TMenuItem
      Action = aSelAll
    end
    object N13: TMenuItem
      Action = aSetRead
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N17: TMenuItem
      Action = aBuff
    end
    object N18: TMenuItem
      Action = aBuffOut
    end
    object N19: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Action = aDelFile
    end
  end
  object ActionList1: TActionList
    Images = DM.ilImage
    Left = 123
    Top = 13
    object aFileEdit: TAction
      Caption = 'Редактировать файл'
      Enabled = False
      ImageIndex = 15
      OnExecute = aFileEditExecute
    end
    object aFileCopy: TAction
      Caption = 'Копировать файл'
      Enabled = False
      ImageIndex = 36
      OnExecute = aFileCopyExecute
    end
    object aCopySelected: TAction
      Caption = 'Копировать значения'
      ShortCut = 16451
      OnExecute = aCopySelectedExecute
    end
    object aOpen: TAction
      Caption = 'Открыть файл'
      Enabled = False
      OnExecute = aOpenExecute
    end
    object aSendMail: TAction
      Caption = 'Отправить по почте'
      Enabled = False
      OnExecute = aSendMailExecute
    end
    object aDelFile: TAction
      Caption = 'Удалить файл'
      Enabled = False
      ImageIndex = 17
      OnExecute = aDelFileExecute
    end
    object aSave: TAction
      Caption = 'Сохранить на диск'
      Enabled = False
      OnExecute = aSaveExecute
    end
    object aCopyData: TAction
      Caption = 'Данные в буфер'
      Enabled = False
      ImageIndex = 43
      OnExecute = aCopyDataExecute
    end
    object aSetRead: TAction
      Caption = 'Пометить как прочитанные'
      Enabled = False
      ShortCut = 16465
      OnExecute = aSetReadExecute
    end
    object aSelAll: TAction
      Caption = 'Выбрать все'
      ShortCut = 16449
      OnExecute = aSelAllExecute
    end
    object aOpenWith: TAction
      Caption = 'Открыть с помощью...'
      Enabled = False
      OnExecute = aOpenWithExecute
    end
    object aCopyToBuff: TAction
      Caption = 'Копировать файл в буфер'
      Enabled = False
      OnExecute = aCopyToBuffExecute
    end
    object aBuff: TAction
      Caption = 'В буфер'
      Enabled = False
      OnExecute = aBuffExecute
    end
    object aBuffOut: TAction
      Caption = 'Убрать из буфера'
      Enabled = False
      OnExecute = aBuffOutExecute
    end
  end
  object cdsFileList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_User'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_NS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@ExtSQL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@Comment'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@FileInfo'
        ParamType = ptInput
      end
      item
        DataType = ftBCD
        Name = '@DocSumm'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Crn'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DateFrom'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@DateTo'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@OnlyNAN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@CAIDList'
        ParamType = ptInput
      end>
    ProviderName = 'dsFileList'
    RemoteServer = DM.rsCA
    OnCalcFields = cdsFileListCalcFields
    OnFilterRecord = cdsFileListFilterRecord
    Left = 184
    Top = 16
    object cdsFileListid_File: TIntegerField
      FieldName = 'id_File'
    end
    object cdsFileListFileGUID: TStringField
      FieldName = 'FileGUID'
      Size = 50
    end
    object cdsFileListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object cdsFileListid_DocType: TIntegerField
      FieldName = 'id_DocType'
    end
    object cdsFileListid_WorkType: TIntegerField
      FieldName = 'id_WorkType'
    end
    object cdsFileListid_Seller: TIntegerField
      FieldName = 'id_Seller'
    end
    object cdsFileListid_Bayer: TIntegerField
      FieldName = 'id_Bayer'
    end
    object cdsFileListid_Org3: TIntegerField
      FieldName = 'id_Org3'
    end
    object cdsFileListid_Org4: TIntegerField
      FieldName = 'id_Org4'
    end
    object cdsFileListDocNum: TStringField
      FieldName = 'DocNum'
      Size = 255
    end
    object cdsFileListDocDate: TDateTimeField
      FieldName = 'DocDate'
    end
    object cdsFileListDocDateStop: TDateTimeField
      FieldName = 'DocDateStop'
    end
    object cdsFileListDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object cdsFileListisAutoLong: TBooleanField
      FieldName = 'isAutoLong'
    end
    object cdsFileListDocSumm: TBCDField
      FieldName = 'DocSumm'
      Precision = 19
    end
    object cdsFileListid_Crn: TIntegerField
      FieldName = 'id_Crn'
    end
    object cdsFileListid_State: TIntegerField
      FieldName = 'id_State'
    end
    object cdsFileListComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object cdsFileListxVers: TIntegerField
      FieldName = 'xVers'
    end
    object cdsFileListCalcName: TStringField
      FieldName = 'CalcName'
      Size = 255
    end
    object cdsFileListOrigName: TStringField
      FieldName = 'OrigName'
      Size = 255
    end
    object cdsFileListFileInfo: TStringField
      FieldName = 'FileInfo'
      Size = 255
    end
    object cdsFileListAdv_Digit1: TBCDField
      FieldName = 'Adv_Digit1'
      Precision = 19
    end
    object cdsFileListAdv_Digit2: TBCDField
      FieldName = 'Adv_Digit2'
      Precision = 19
    end
    object cdsFileListAdv_Digit3: TBCDField
      FieldName = 'Adv_Digit3'
      Precision = 19
    end
    object cdsFileListAdv_Digit4: TBCDField
      FieldName = 'Adv_Digit4'
      Precision = 19
    end
    object cdsFileListAdv_Digit5: TBCDField
      FieldName = 'Adv_Digit5'
      Precision = 19
    end
    object cdsFileListAdv_Digit6: TBCDField
      FieldName = 'Adv_Digit6'
      Precision = 19
    end
    object cdsFileListAdv_Digit7: TBCDField
      FieldName = 'Adv_Digit7'
      Precision = 19
    end
    object cdsFileListAdv_Digit8: TBCDField
      FieldName = 'Adv_Digit8'
      Precision = 19
    end
    object cdsFileListAdv_Digit9: TBCDField
      FieldName = 'Adv_Digit9'
      Precision = 19
    end
    object cdsFileListAdv_Digit10: TBCDField
      FieldName = 'Adv_Digit10'
      Precision = 19
    end
    object cdsFileListAdv_Str1: TStringField
      FieldName = 'Adv_Str1'
      Size = 255
    end
    object cdsFileListAdv_Str2: TStringField
      FieldName = 'Adv_Str2'
      Size = 255
    end
    object cdsFileListAdv_Str3: TStringField
      FieldName = 'Adv_Str3'
      Size = 255
    end
    object cdsFileListAdv_Str4: TStringField
      FieldName = 'Adv_Str4'
      Size = 255
    end
    object cdsFileListAdv_Str5: TStringField
      FieldName = 'Adv_Str5'
      Size = 255
    end
    object cdsFileListAdv_Str6: TStringField
      FieldName = 'Adv_Str6'
      Size = 255
    end
    object cdsFileListAdv_Str7: TStringField
      FieldName = 'Adv_Str7'
      Size = 255
    end
    object cdsFileListAdv_Str8: TStringField
      FieldName = 'Adv_Str8'
      Size = 255
    end
    object cdsFileListAdv_Str9: TStringField
      FieldName = 'Adv_Str9'
      Size = 255
    end
    object cdsFileListAdv_Str10: TStringField
      FieldName = 'Adv_Str10'
      Size = 255
    end
    object cdsFileListAdv_Date1: TDateTimeField
      FieldName = 'Adv_Date1'
    end
    object cdsFileListAdv_Date2: TDateTimeField
      FieldName = 'Adv_Date2'
    end
    object cdsFileListAdv_Date3: TDateTimeField
      FieldName = 'Adv_Date3'
    end
    object cdsFileListAdv_Date4: TDateTimeField
      FieldName = 'Adv_Date4'
    end
    object cdsFileListAdv_Date5: TDateTimeField
      FieldName = 'Adv_Date5'
    end
    object cdsFileListAdv_Date6: TDateTimeField
      FieldName = 'Adv_Date6'
    end
    object cdsFileListAdv_Date7: TDateTimeField
      FieldName = 'Adv_Date7'
    end
    object cdsFileListAdv_Date8: TDateTimeField
      FieldName = 'Adv_Date8'
    end
    object cdsFileListAdv_Date9: TDateTimeField
      FieldName = 'Adv_Date9'
    end
    object cdsFileListAdv_Date10: TDateTimeField
      FieldName = 'Adv_Date10'
    end
    object cdsFileListID_NS: TIntegerField
      FieldName = 'ID_NS'
    end
    object cdsFileListBayerName: TStringField
      FieldName = 'BayerName'
      Size = 255
    end
    object cdsFileListSellerName: TStringField
      FieldName = 'SellerName'
      Size = 255
    end
    object cdsFileListOrg3Name: TStringField
      FieldName = 'Org3Name'
      Size = 255
    end
    object cdsFileListOrg4Name: TStringField
      FieldName = 'Org4Name'
      Size = 255
    end
    object cdsFileListWorkTypeName: TStringField
      Tag = -777
      FieldName = 'WorkTypeName'
      Size = 255
    end
    object cdsFileListDocTypeName: TStringField
      FieldName = 'DocTypeName'
      Size = 255
    end
    object cdsFileListStateName: TStringField
      FieldName = 'StateName'
      Size = 255
    end
    object cdsFileListCrnName: TStringField
      FieldName = 'CrnName'
      Size = 255
    end
    object cdsFileListBayerCAName: TStringField
      FieldName = 'BayerCAName'
      Size = 255
    end
    object cdsFileListBayerID_CA: TIntegerField
      FieldName = 'BayerID_CA'
    end
    object cdsFileListSellerCAName: TStringField
      FieldName = 'SellerCAName'
      Size = 255
    end
    object cdsFileListSellerID_CA: TIntegerField
      FieldName = 'SellerID_CA'
    end
    object cdsFileListxID_NS: TIntegerField
      FieldName = 'xID_NS'
    end
    object cdsFileListid_email: TIntegerField
      FieldName = 'id_email'
    end
    object cdsFileListFileSize: TIntegerField
      FieldName = 'FileSize'
    end
    object cdsFileListid_DicFile1: TIntegerField
      FieldName = 'id_DicFile1'
    end
    object cdsFileListid_DicFile2: TIntegerField
      FieldName = 'id_DicFile2'
    end
    object cdsFileListid_DicFile3: TIntegerField
      FieldName = 'id_DicFile3'
    end
    object cdsFileListid_DicFile4: TIntegerField
      FieldName = 'id_DicFile4'
    end
    object cdsFileListid_DicFile5: TIntegerField
      FieldName = 'id_DicFile5'
    end
    object cdsFileListid_DicFile6: TIntegerField
      FieldName = 'id_DicFile6'
    end
    object cdsFileListid_DicFile7: TIntegerField
      FieldName = 'id_DicFile7'
    end
    object cdsFileListid_DicFile8: TIntegerField
      FieldName = 'id_DicFile8'
    end
    object cdsFileListid_DicFile9: TIntegerField
      FieldName = 'id_DicFile9'
    end
    object cdsFileListid_DicFile10: TIntegerField
      FieldName = 'id_DicFile10'
    end
    object cdsFileListisBayer: TBooleanField
      FieldName = 'isBayer'
    end
    object cdsFileListisSeller: TBooleanField
      FieldName = 'isSeller'
    end
    object cdsFileListEmailDateCreate: TDateTimeField
      FieldName = 'EmailDateCreate'
    end
    object cdsFileListEmailDate: TDateTimeField
      FieldName = 'EmailDate'
    end
    object cdsFileListEmailFrom: TStringField
      FieldName = 'EmailFrom'
      Size = 255
    end
    object cdsFileListEmailName: TStringField
      FieldName = 'EmailName'
      Size = 255
    end
    object cdsFileListEmailTo: TStringField
      FieldName = 'EmailTo'
      Size = 255
    end
    object cdsFileListSubj: TStringField
      FieldName = 'Subj'
      Size = 255
    end
    object cdsFileListDC2: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'DC2'
    end
    object cdsFileListid_User_F: TIntegerField
      FieldName = 'id_User_F'
    end
    object cdsFileListBayerDeleted: TBooleanField
      FieldName = 'BayerDeleted'
    end
    object cdsFileListSellerDeleted: TBooleanField
      FieldName = 'SellerDeleted'
    end
    object cdsFileListFIO: TStringField
      FieldName = 'FIO'
      Size = 255
    end
    object cdsFileListid_User_L: TIntegerField
      FieldName = 'id_User_L'
    end
    object cdsFileListLastFIO: TStringField
      FieldName = 'LastFIO'
      Size = 255
    end
    object cdsFileListLastEdit: TDateTimeField
      FieldName = 'LastEdit'
    end
  end
  object dsFileList: TDataSource
    DataSet = cdsFileList
    OnDataChange = dsFileListDataChange
    Left = 224
    Top = 16
  end
  object sSaveDialog1: TsSaveDialog
    Filter = 
      'Все файлы (*.*)|*.*|Microsoft Word (*.doc)|*.doc|Microsoft Word ' +
      '2007 (*.docx)|*.docx|Microsoft Excel 97-2003 (*.xls)|*.xls|Micro' +
      'soft Excel 2007 (*.xlsx)|*.xlsx|Adobe Acrobar (*.pdf)|*.pdf|Изоб' +
      'ржения (*.bmp)|*.bmp|Изобржения (*.gif)|*.gif|Изобржения (*.jpg)' +
      '|*.jpg'
    Left = 288
    Top = 184
  end
  object sSaveDialog2: TsSaveDialog
    Filter = 
      'Все файлы (*.*)|*.*|Microsoft Word (*.doc)|*.doc|Microsoft Word ' +
      '2007 (*.docx)|*.docx|Microsoft Excel 97-2003 (*.xls)|*.xls|Micro' +
      'soft Excel 2007 (*.xlsx)|*.xlsx|Adobe Acrobar (*.pdf)|*.pdf|Изоб' +
      'ржения (*.bmp)|*.bmp|Изобржения (*.gif)|*.gif|Изобржения (*.jpg)' +
      '|*.jpg'
    Left = 352
    Top = 120
  end
end
