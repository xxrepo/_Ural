object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 285
  Top = 161
  Height = 528
  Width = 923
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=asd;Data Source=hp26\SQL2008R2;Use Proc' +
      'edure for Prepare=1;Auto Translate=True;Packet Size=4096;Worksta' +
      'tion ID=WS25;Use Encryption for Data=False;Tag with column colla' +
      'tion when possible=False;'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    AfterConnect = ADOConnection1AfterConnect
    BeforeConnect = ADOConnection1BeforeConnect
    Left = 48
    Top = 32
  end
  object ADOQueryTmp: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 64
    Top = 112
  end
  object qryWhoIAm: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Login'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = ''
      end
      item
        Name = 'Password'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'SELECT * FROM dw_User WHERE Login = :Login AND Psw = :Password'
      'and AccDisabled = 0'
      ' ')
    Left = 424
    Top = 272
  end
  object qryFuncName: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ExtID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT * FROM RT_Func WHERE ExtID = :ExtID')
    Left = 424
    Top = 336
  end
  object qGetPic: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'id_Icons'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from dw_ICONS  '
      'where id_Icons = :id_Icons'
      ' '
      ' '
      ' ')
    Left = 296
    Top = 16
    object qGetPicID_ICONS: TBCDField
      FieldName = 'ID_ICONS'
      Precision = 32
      Size = 0
    end
    object qGetPicPIC: TBlobField
      FieldName = 'PIC'
      BlobType = ftBlob
    end
  end
  object rxIC: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ID_ICONS'
        DataType = ftInteger
      end
      item
        Name = 'Index'
        DataType = ftInteger
      end>
    Left = 72
    Top = 200
    object rxICName: TWideStringField
      FieldName = 'Name'
      Size = 255
    end
    object rxICID_ICONS: TIntegerField
      FieldName = 'ID_ICONS'
    end
    object rxICIndex: TIntegerField
      FieldName = 'Index'
    end
  end
  object qRate: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_Cur'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'DateCancel1'
        Size = -1
        Value = Null
      end
      item
        Name = 'DateCancel2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select Rate FROM RF_CurRate WHERE id_Cur = :id_Cur AND DateCreat' +
        'e <= :DateCancel1 '
      'AND (DateCancel > :DateCancel2 OR DateCancel IS NULL)'
      'ORDER BY DateCreate')
    Left = 176
    Top = 32
  end
  object qProt: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_CA'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'id_CAT'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'P_Action'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'id_USER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'insert into RF_Protocol(id_CA, id_CAT, P_Action, id_USER)'
      'VALUES(:id_CA, :id_CAT, :P_Action, :id_USER)')
    Left = 184
    Top = 120
  end
  object qDTProp: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_DocType'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from DW_DocType DT'
      'where DT.id_DocType = :id_DocType'
      ''
      ' ')
    Left = 336
    Top = 120
  end
  object getCA: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'sysKey'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'id_User'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'sysKey2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'id_User2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_CA'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_CA4'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'sysKey3'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'id_User3'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_CA2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'sysKey4'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'id_User4'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID_CA3'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'insert into DW_FAV_CA_X(id_CA, sysKey, id_User)'
      'SELECT id_CA, :sysKey, :id_User'
      'FROM ('
      ''
      'SELECT id_Parent AS ID_CA'
      'FROM ('
      'select id_CA, id_Parent'
      'FROM DW_FAV_REL'
      'WHERE sysKey = :sysKey2 AND id_User = :id_User2'
      ') T'
      'WHERE Level < 10  '
      'start with T.ID_CA = :ID_CA'
      'connect by prior T.ID_Parent = T.ID_CA '
      'GROUP BY id_Parent'
      ''
      'UNION'
      'SELECT CAST(:ID_CA4 AS INTEGER) AS ID_CA FROM DUAL'
      ''
      'UNION'
      ''
      ''
      'select ID_CA'
      'FROM ('
      'select id_CA, id_Parent'
      'FROM DW_FAV_REL'
      'WHERE sysKey = :sysKey3 AND id_User = :id_User3'
      ') T'
      'WHERE Level < 10'
      'start with T.ID_CA = :ID_CA2 '
      'connect by prior T.ID_CA=T.ID_Parent'
      ''
      'UNION'
      ''
      'select ID_CA'
      'FROM ('
      'select id_CA, id_Parent'
      'FROM DW_FAV_REL'
      'WHERE sysKey = :sysKey4 AND id_User = :id_User4'
      ') T'
      'WHERE Level < 10'
      'start with T.ID_Parent = :ID_CA3 '
      'connect by prior T.ID_CA=T.ID_Parent'
      ') T_R'
      'GROUP BY ID_CA'
      ' ')
    Left = 536
    Top = 16
    object DateTimeField1: TDateTimeField
      FieldName = 'DDD'
      ReadOnly = True
    end
  end
  object qSysDate: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select getdate() as DDD '
      ' ')
    Left = 472
    Top = 104
    object qSysDateDDD: TDateTimeField
      FieldName = 'DDD'
      ReadOnly = True
    end
  end
  object qList2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_uSER'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'id_BSN'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select * from DW_LIST where id_USER = :id_uSER and id_BSN=:id_BS' +
        'N'
      ' ')
    Left = 136
    Top = 272
  end
  object dsList: TDataSetProvider
    DataSet = qList2
    Constraints = True
    Left = 80
    Top = 272
  end
  object cdsList: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_uSER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_BSN'
        ParamType = ptInput
      end>
    ProviderName = 'dsList'
    BeforeOpen = cdsListBeforeOpen
    AfterOpen = cdsListAfterOpen
    AfterPost = cdsListAfterPost
    AfterDelete = cdsListAfterDelete
    Left = 96
    Top = 320
    object cdsListid_LIST: TAutoIncField
      FieldName = 'id_LIST'
      ReadOnly = True
    end
    object cdsListID_USER: TIntegerField
      FieldName = 'ID_USER'
    end
    object cdsListID_DOCBASE: TIntegerField
      FieldName = 'ID_DOCBASE'
    end
    object cdsListid_BSN: TIntegerField
      FieldName = 'id_BSN'
    end
  end
  object spBSN: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_User'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'id_User2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select B.id_BSN, BsnName'
      'from DW_BSN B '
      'WHERE Bsndeleted=0  '
      'AND ('
      
        'B.id_BSN in (SELECT id_BSN FROM DW_UTB UT WHERE id_User = :id_Us' +
        'er)'
      
        'OR exists(select * from DW_User WHERE id_User = :id_User2 AND is' +
        'admin=1)'
      ')'
      ''
      ' '
      ' ')
    Left = 424
    Top = 232
    object spBSNid_BSN: TAutoIncField
      FieldName = 'id_BSN'
      ReadOnly = True
    end
    object spBSNBsnName: TStringField
      FieldName = 'BsnName'
      Size = 255
    end
  end
  object AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler
    Style = psOffice2007Silver
    AutoThemeAdapt = True
    BorderColor = 7760481
    PanelAppearanceLight.BorderColor = clNone
    PanelAppearanceLight.BorderColorHot = 10079963
    PanelAppearanceLight.BorderColorDown = 4548219
    PanelAppearanceLight.Color = 15460583
    PanelAppearanceLight.ColorTo = 13089717
    PanelAppearanceLight.ColorHot = 16515071
    PanelAppearanceLight.ColorHotTo = 12644607
    PanelAppearanceLight.ColorDown = 7845111
    PanelAppearanceLight.ColorDownTo = 4561657
    PanelAppearanceLight.ColorMirror = 12038314
    PanelAppearanceLight.ColorMirrorTo = 13552071
    PanelAppearanceLight.ColorMirrorHot = 7067903
    PanelAppearanceLight.ColorMirrorHotTo = 10544892
    PanelAppearanceLight.ColorMirrorDown = 1671928
    PanelAppearanceLight.ColorMirrorDownTo = 241407
    PanelAppearanceLight.TextColor = 2762275
    PanelAppearanceLight.TextColorHot = clBlack
    PanelAppearanceLight.TextColorDown = clBlack
    PanelAppearanceLight.TextStyle = []
    PanelAppearanceDark.BorderColor = clNone
    PanelAppearanceDark.BorderColorHot = 10079963
    PanelAppearanceDark.BorderColorDown = 4548219
    PanelAppearanceDark.Color = 15460583
    PanelAppearanceDark.ColorTo = 13089718
    PanelAppearanceDark.ColorHot = 16515071
    PanelAppearanceDark.ColorHotTo = 12644607
    PanelAppearanceDark.ColorDown = 7845111
    PanelAppearanceDark.ColorDownTo = 4561657
    PanelAppearanceDark.ColorMirror = 12235950
    PanelAppearanceDark.ColorMirrorTo = 11512741
    PanelAppearanceDark.ColorMirrorHot = 7067903
    PanelAppearanceDark.ColorMirrorHotTo = 10544892
    PanelAppearanceDark.ColorMirrorDown = 1671928
    PanelAppearanceDark.ColorMirrorDownTo = 241407
    PanelAppearanceDark.TextColor = 2762275
    PanelAppearanceDark.TextColorHot = 6365193
    PanelAppearanceDark.TextColorDown = 6365193
    PanelAppearanceDark.TextStyle = []
    Left = 248
    Top = 180
  end
  object AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler
    AutoThemeAdapt = True
    ButtonBorderColor = clNone
    GlowButtonAppearance.BorderColor = 13289414
    GlowButtonAppearance.BorderColorHot = 10079963
    GlowButtonAppearance.BorderColorDown = 4548219
    GlowButtonAppearance.BorderColorChecked = 4548219
    GlowButtonAppearance.Color = 15987697
    GlowButtonAppearance.ColorTo = 15921904
    GlowButtonAppearance.ColorChecked = 11918331
    GlowButtonAppearance.ColorCheckedTo = 7915518
    GlowButtonAppearance.ColorDisabled = 15921906
    GlowButtonAppearance.ColorDisabledTo = 15921906
    GlowButtonAppearance.ColorDown = 7778289
    GlowButtonAppearance.ColorDownTo = 4296947
    GlowButtonAppearance.ColorHot = 15465983
    GlowButtonAppearance.ColorHotTo = 11332863
    GlowButtonAppearance.ColorMirror = 16316406
    GlowButtonAppearance.ColorMirrorTo = 15657703
    GlowButtonAppearance.ColorMirrorHot = 5888767
    GlowButtonAppearance.ColorMirrorHotTo = 10807807
    GlowButtonAppearance.ColorMirrorDown = 946929
    GlowButtonAppearance.ColorMirrorDownTo = 5021693
    GlowButtonAppearance.ColorMirrorChecked = 10480637
    GlowButtonAppearance.ColorMirrorCheckedTo = 5682430
    GlowButtonAppearance.ColorMirrorDisabled = 11974326
    GlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    Style = tsOffice2007Silver
    TabAppearance.BorderColor = clNone
    TabAppearance.BorderColorHot = 12697277
    TabAppearance.BorderColorSelected = 16775873
    TabAppearance.BorderColorSelectedHot = 6343929
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = clNone
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 16185078
    TabAppearance.ColorSelectedTo = 16185078
    TabAppearance.ColorDisabled = clWhite
    TabAppearance.ColorDisabledTo = clSilver
    TabAppearance.ColorHot = 14542308
    TabAppearance.ColorHotTo = 16768709
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 14016477
    TabAppearance.ColorMirrorHotTo = 10736609
    TabAppearance.ColorMirrorSelected = 16185078
    TabAppearance.ColorMirrorSelectedTo = 15722209
    TabAppearance.ColorMirrorDisabled = clWhite
    TabAppearance.ColorMirrorDisabledTo = clSilver
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Tahoma'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggRadial
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = 6050636
    TabAppearance.TextColorHot = 6050636
    TabAppearance.TextColorSelected = 6050636
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.ShadowColor = 14077385
    TabAppearance.HighLightColorSelected = 16775871
    TabAppearance.HighLightColorHot = 16250099
    TabAppearance.HighLightColorSelectedHot = 12451839
    TabAppearance.HighLightColorDown = 16776144
    TabAppearance.BackGround.Color = 14537936
    TabAppearance.BackGround.ColorTo = clNone
    TabAppearance.BackGround.Direction = gdHorizontal
    Left = 248
    Top = 220
  end
  object AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler
    Style = bsOffice2007Silver
    AutoThemeAdapt = True
    BorderColor = 9671313
    BorderColorHot = 9539727
    ButtonAppearance.Color = 13627626
    ButtonAppearance.ColorTo = 9224369
    ButtonAppearance.ColorChecked = 9229823
    ButtonAppearance.ColorCheckedTo = 5812223
    ButtonAppearance.ColorDown = 5149182
    ButtonAppearance.ColorDownTo = 9556991
    ButtonAppearance.ColorHot = 13432063
    ButtonAppearance.ColorHotTo = 9556223
    ButtonAppearance.BorderDownColor = 3693887
    ButtonAppearance.BorderHotColor = 3693887
    ButtonAppearance.BorderCheckedColor = 3693887
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Segoe UI'
    ButtonAppearance.CaptionFont.Style = []
    CaptionAppearance.CaptionColor = 15721439
    CaptionAppearance.CaptionColorTo = 13748163
    CaptionAppearance.CaptionTextColor = 5854291
    CaptionAppearance.CaptionBorderColor = 13021361
    CaptionAppearance.CaptionColorHot = 15655646
    CaptionAppearance.CaptionColorHotTo = 13089203
    CaptionAppearance.CaptionTextColorHot = 5854291
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Segoe UI'
    CaptionFont.Style = []
    ContainerAppearance.LineColor = clBtnShadow
    ContainerAppearance.Line3D = True
    Color.Color = 15195349
    Color.ColorTo = 16053486
    Color.Direction = gdVertical
    Color.Mirror.Color = 16315633
    Color.Mirror.ColorTo = 15788259
    Color.Mirror.ColorMirror = 15195349
    Color.Mirror.ColorMirrorTo = 15921128
    ColorHot.Color = 16052462
    ColorHot.ColorTo = 16382455
    ColorHot.Direction = gdVertical
    ColorHot.Mirror.Color = 16447735
    ColorHot.Mirror.ColorTo = 16315891
    ColorHot.Mirror.ColorMirror = 15920876
    ColorHot.Mirror.ColorMirrorTo = 16382455
    CompactGlowButtonAppearance.BorderColor = 13289414
    CompactGlowButtonAppearance.BorderColorHot = 12695712
    CompactGlowButtonAppearance.BorderColorDown = 9079434
    CompactGlowButtonAppearance.BorderColorChecked = 9079434
    CompactGlowButtonAppearance.Color = 15987697
    CompactGlowButtonAppearance.ColorTo = 15921904
    CompactGlowButtonAppearance.ColorChecked = 13419455
    CompactGlowButtonAppearance.ColorCheckedTo = 14079700
    CompactGlowButtonAppearance.ColorDisabled = 15921906
    CompactGlowButtonAppearance.ColorDisabledTo = 15921906
    CompactGlowButtonAppearance.ColorDown = 13419455
    CompactGlowButtonAppearance.ColorDownTo = 14079700
    CompactGlowButtonAppearance.ColorHot = 16250098
    CompactGlowButtonAppearance.ColorHotTo = 15460834
    CompactGlowButtonAppearance.ColorMirror = 16316406
    CompactGlowButtonAppearance.ColorMirrorTo = 15657703
    CompactGlowButtonAppearance.ColorMirrorHot = 15461354
    CompactGlowButtonAppearance.ColorMirrorHotTo = 15460834
    CompactGlowButtonAppearance.ColorMirrorDown = 14607588
    CompactGlowButtonAppearance.ColorMirrorDownTo = 14079700
    CompactGlowButtonAppearance.ColorMirrorChecked = 14607588
    CompactGlowButtonAppearance.ColorMirrorCheckedTo = 14079700
    CompactGlowButtonAppearance.ColorMirrorDisabled = 11974326
    CompactGlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    CompactGlowButtonAppearance.GradientHot = ggVertical
    CompactGlowButtonAppearance.GradientMirrorHot = ggVertical
    CompactGlowButtonAppearance.GradientDown = ggVertical
    CompactGlowButtonAppearance.GradientMirrorDown = ggVertical
    CompactGlowButtonAppearance.GradientChecked = ggVertical
    DockColor.Color = 15062999
    DockColor.ColorTo = 16249843
    DockColor.Direction = gdHorizontal
    DockColor.Steps = 128
    DragGripStyle = dsNone
    FloatingWindowBorderColor = 13021361
    FloatingWindowBorderWidth = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    GlowButtonAppearance.BorderColor = 13289414
    GlowButtonAppearance.BorderColorHot = 10079963
    GlowButtonAppearance.BorderColorDown = 4548219
    GlowButtonAppearance.BorderColorChecked = 4548219
    GlowButtonAppearance.Color = 15987697
    GlowButtonAppearance.ColorTo = 15921904
    GlowButtonAppearance.ColorChecked = 11918331
    GlowButtonAppearance.ColorCheckedTo = 7915518
    GlowButtonAppearance.ColorDisabled = 15921906
    GlowButtonAppearance.ColorDisabledTo = 15921906
    GlowButtonAppearance.ColorDown = 7778289
    GlowButtonAppearance.ColorDownTo = 4296947
    GlowButtonAppearance.ColorHot = 15465983
    GlowButtonAppearance.ColorHotTo = 11332863
    GlowButtonAppearance.ColorMirror = 16316406
    GlowButtonAppearance.ColorMirrorTo = 15657703
    GlowButtonAppearance.ColorMirrorHot = 5888767
    GlowButtonAppearance.ColorMirrorHotTo = 10807807
    GlowButtonAppearance.ColorMirrorDown = 946929
    GlowButtonAppearance.ColorMirrorDownTo = 5021693
    GlowButtonAppearance.ColorMirrorChecked = 10480637
    GlowButtonAppearance.ColorMirrorCheckedTo = 5682430
    GlowButtonAppearance.ColorMirrorDisabled = 11974326
    GlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    GroupAppearance.BorderColor = 12038060
    GroupAppearance.Color = 13749706
    GroupAppearance.ColorTo = 12836576
    GroupAppearance.ColorMirror = 14934753
    GroupAppearance.ColorMirrorTo = 1828350
    GroupAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.Font.Color = clWindowText
    GroupAppearance.Font.Height = -11
    GroupAppearance.Font.Name = 'Segoe UI'
    GroupAppearance.Font.Style = []
    GroupAppearance.Gradient = ggVertical
    GroupAppearance.GradientMirror = ggRadial
    GroupAppearance.TextColor = 6050636
    GroupAppearance.CaptionAppearance.CaptionColor = 15721439
    GroupAppearance.CaptionAppearance.CaptionColorTo = 13748163
    GroupAppearance.CaptionAppearance.CaptionTextColor = 5854291
    GroupAppearance.CaptionAppearance.CaptionColorHot = 15655646
    GroupAppearance.CaptionAppearance.CaptionColorHotTo = 13089203
    GroupAppearance.CaptionAppearance.CaptionTextColorHot = 5854291
    GroupAppearance.PageAppearance.BorderColor = 12763842
    GroupAppearance.PageAppearance.Color = 13170943
    GroupAppearance.PageAppearance.ColorTo = clWhite
    GroupAppearance.PageAppearance.ColorMirror = clWhite
    GroupAppearance.PageAppearance.ColorMirrorTo = clWhite
    GroupAppearance.PageAppearance.Gradient = ggVertical
    GroupAppearance.PageAppearance.GradientMirror = ggVertical
    GroupAppearance.PageAppearance.ShadowColor = clBlack
    GroupAppearance.PageAppearance.HighLightColor = 15526887
    GroupAppearance.TabAppearance.BorderColor = 10534860
    GroupAppearance.TabAppearance.BorderColorHot = 12697277
    GroupAppearance.TabAppearance.BorderColorSelected = 11454153
    GroupAppearance.TabAppearance.BorderColorSelectedHot = 10534860
    GroupAppearance.TabAppearance.BorderColorDisabled = clNone
    GroupAppearance.TabAppearance.BorderColorDown = clNone
    GroupAppearance.TabAppearance.Color = clBtnFace
    GroupAppearance.TabAppearance.ColorTo = clWhite
    GroupAppearance.TabAppearance.ColorSelected = 10483199
    GroupAppearance.TabAppearance.ColorSelectedTo = 12122111
    GroupAppearance.TabAppearance.ColorDisabled = clNone
    GroupAppearance.TabAppearance.ColorDisabledTo = clNone
    GroupAppearance.TabAppearance.ColorHot = 14475744
    GroupAppearance.TabAppearance.ColorHotTo = 10279647
    GroupAppearance.TabAppearance.ColorMirror = clWhite
    GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
    GroupAppearance.TabAppearance.ColorMirrorHot = 10279647
    GroupAppearance.TabAppearance.ColorMirrorHotTo = 6546157
    GroupAppearance.TabAppearance.ColorMirrorSelected = 12122111
    GroupAppearance.TabAppearance.ColorMirrorSelectedTo = 13695486
    GroupAppearance.TabAppearance.ColorMirrorDisabled = clNone
    GroupAppearance.TabAppearance.ColorMirrorDisabledTo = clNone
    GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.TabAppearance.Font.Color = clWindowText
    GroupAppearance.TabAppearance.Font.Height = -11
    GroupAppearance.TabAppearance.Font.Name = 'Tahoma'
    GroupAppearance.TabAppearance.Font.Style = []
    GroupAppearance.TabAppearance.Gradient = ggRadial
    GroupAppearance.TabAppearance.GradientMirror = ggRadial
    GroupAppearance.TabAppearance.GradientHot = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorHot = ggVertical
    GroupAppearance.TabAppearance.GradientSelected = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorSelected = ggVertical
    GroupAppearance.TabAppearance.GradientDisabled = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorDisabled = ggVertical
    GroupAppearance.TabAppearance.TextColor = 6050636
    GroupAppearance.TabAppearance.TextColorHot = 6050636
    GroupAppearance.TabAppearance.TextColorSelected = 6050636
    GroupAppearance.TabAppearance.TextColorDisabled = clWhite
    GroupAppearance.TabAppearance.ShadowColor = clBlack
    GroupAppearance.TabAppearance.HighLightColor = 9803929
    GroupAppearance.TabAppearance.HighLightColorHot = 9803929
    GroupAppearance.TabAppearance.HighLightColorSelected = 6540536
    GroupAppearance.TabAppearance.HighLightColorSelectedHot = 12451839
    GroupAppearance.TabAppearance.HighLightColorDown = 16776144
    GroupAppearance.ToolBarAppearance.BorderColor = 11780804
    GroupAppearance.ToolBarAppearance.BorderColorHot = 11780804
    GroupAppearance.ToolBarAppearance.Color.Color = 15924477
    GroupAppearance.ToolBarAppearance.Color.ColorTo = clWhite
    GroupAppearance.ToolBarAppearance.Color.Direction = gdHorizontal
    GroupAppearance.ToolBarAppearance.ColorHot.Color = 16252414
    GroupAppearance.ToolBarAppearance.ColorHot.ColorTo = 16711422
    GroupAppearance.ToolBarAppearance.ColorHot.Direction = gdHorizontal
    PageAppearance.BorderColor = 12697533
    PageAppearance.Color = 16315633
    PageAppearance.ColorTo = 15788259
    PageAppearance.ColorMirror = 15261401
    PageAppearance.ColorMirrorTo = 16250607
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    PageAppearance.ShadowColor = 11248798
    PageAppearance.HighLightColor = 15526887
    PagerCaption.BorderColor = 10000536
    PagerCaption.Color = 15460583
    PagerCaption.ColorTo = 13749706
    PagerCaption.ColorMirror = 13287866
    PagerCaption.ColorMirrorTo = 16248553
    PagerCaption.Gradient = ggVertical
    PagerCaption.GradientMirror = ggVertical
    PagerCaption.TextColor = 11168318
    PagerCaption.TextColorExtended = 7958633
    PagerCaption.Font.Charset = DEFAULT_CHARSET
    PagerCaption.Font.Color = clWindowText
    PagerCaption.Font.Height = -13
    PagerCaption.Font.Name = 'Segoe UI'
    PagerCaption.Font.Style = []
    QATAppearance.BorderColor = 9671313
    QATAppearance.Color = 15195349
    QATAppearance.ColorTo = 16053486
    QATAppearance.FullSizeBorderColor = 15986669
    QATAppearance.FullSizeColor = 15130329
    QATAppearance.FullSizeColorTo = 15130329
    RightHandleColor = 13021361
    RightHandleColorTo = 9729913
    RightHandleColorHot = 13891839
    RightHandleColorHotTo = 7782911
    RightHandleColorDown = 557032
    RightHandleColorDownTo = 8182519
    TabAppearance.BorderColor = clNone
    TabAppearance.BorderColorHot = 12697277
    TabAppearance.BorderColorSelected = 12697533
    TabAppearance.BorderColorSelectedHot = 6343929
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = clNone
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 16185078
    TabAppearance.ColorSelectedTo = 16185078
    TabAppearance.ColorDisabled = clWhite
    TabAppearance.ColorDisabledTo = clSilver
    TabAppearance.ColorHot = 14542308
    TabAppearance.ColorHotTo = 16768709
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 14016477
    TabAppearance.ColorMirrorHotTo = 10736609
    TabAppearance.ColorMirrorSelected = 16185078
    TabAppearance.ColorMirrorSelectedTo = 15722209
    TabAppearance.ColorMirrorDisabled = clWhite
    TabAppearance.ColorMirrorDisabledTo = clSilver
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Segoe UI'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggRadial
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = 6050636
    TabAppearance.TextColorHot = 6050636
    TabAppearance.TextColorSelected = 6050636
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.ShadowColor = 14077385
    TabAppearance.HighLightColor = 16775871
    TabAppearance.HighLightColorHot = 16250099
    TabAppearance.HighLightColorSelected = 6540536
    TabAppearance.HighLightColorSelectedHot = 12451839
    TabAppearance.HighLightColorDown = 16776144
    TabAppearance.BackGround.Color = 14537936
    TabAppearance.BackGround.ColorTo = clNone
    TabAppearance.BackGround.Direction = gdVertical
    Left = 248
    Top = 264
  end
  object AdvMenuOfficeStyler1: TAdvMenuOfficeStyler
    AntiAlias = aaNone
    AutoThemeAdapt = True
    Style = osOffice2003Blue
    Background.Position = bpCenter
    Background.Color = 16185078
    Background.ColorTo = 16185078
    ButtonAppearance.DownColor = 5149182
    ButtonAppearance.DownColorTo = 9556991
    ButtonAppearance.HoverColor = 13432063
    ButtonAppearance.HoverColorTo = 9556223
    ButtonAppearance.DownBorderColor = clNavy
    ButtonAppearance.HoverBorderColor = clNavy
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Tahoma'
    ButtonAppearance.CaptionFont.Style = []
    IconBar.Color = 16773091
    IconBar.ColorTo = 14986631
    IconBar.CheckBorder = clNavy
    IconBar.RadioBorder = clNavy
    IconBar.SeparatorColor = 12961221
    SelectedItem.BorderColor = clNavy
    SelectedItem.Font.Charset = DEFAULT_CHARSET
    SelectedItem.Font.Color = clWindowText
    SelectedItem.Font.Height = -11
    SelectedItem.Font.Name = 'Tahoma'
    SelectedItem.Font.Style = []
    SelectedItem.NotesFont.Charset = DEFAULT_CHARSET
    SelectedItem.NotesFont.Color = clWindowText
    SelectedItem.NotesFont.Height = -8
    SelectedItem.NotesFont.Name = 'Tahoma'
    SelectedItem.NotesFont.Style = []
    SelectedItem.CheckBorder = clNavy
    SelectedItem.RadioBorder = clNavy
    RootItem.Color = 16105118
    RootItem.ColorTo = 16240050
    RootItem.Font.Charset = DEFAULT_CHARSET
    RootItem.Font.Color = clMenuText
    RootItem.Font.Height = -11
    RootItem.Font.Name = 'Tahoma'
    RootItem.Font.Style = []
    RootItem.SelectedColor = 16773091
    RootItem.SelectedColorTo = 15185299
    RootItem.SelectedBorderColor = 9841920
    RootItem.HoverColor = 13432063
    RootItem.HoverColorTo = 10147583
    Glyphs.SubMenu.Data = {
      5A000000424D5A000000000000003E0000002800000004000000070000000100
      0100000000001C0000000000000000000000020000000200000000000000FFFF
      FF0070000000300000001000000000000000100000003000000070000000}
    Glyphs.Check.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FDFF0000F8FF0000F07F0000F23F
      0000F71F0000FF8F0000FFCF0000FFEF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    Glyphs.Radio.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FC3F0000F81F0000F81F
      0000F81F0000F81F0000FC3F0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    SideBar.Font.Charset = DEFAULT_CHARSET
    SideBar.Font.Color = clWhite
    SideBar.Font.Height = -19
    SideBar.Font.Name = 'Tahoma'
    SideBar.Font.Style = [fsBold, fsItalic]
    SideBar.Image.Position = bpCenter
    SideBar.Background.Position = bpCenter
    SideBar.SplitterColorTo = clBlack
    Separator.Color = 13339754
    Separator.GradientType = gtBoth
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clGray
    NotesFont.Height = -8
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    MenuBorderColor = 9841920
    Left = 252
    Top = 312
  end
  object AdvPanelStyler1: TAdvPanelStyler
    Tag = 0
    AutoThemeAdapt = True
    Settings.AnchorHint = False
    Settings.BevelInner = bvNone
    Settings.BevelOuter = bvNone
    Settings.BevelWidth = 1
    Settings.BorderColor = 16765615
    Settings.BorderShadow = False
    Settings.BorderStyle = bsNone
    Settings.BorderWidth = 0
    Settings.CanMove = False
    Settings.CanSize = False
    Settings.Caption.Color = 16316406
    Settings.Caption.ColorTo = 15261915
    Settings.Caption.Font.Charset = DEFAULT_CHARSET
    Settings.Caption.Font.Color = clBlack
    Settings.Caption.Font.Height = -11
    Settings.Caption.Font.Name = 'MS Sans Serif'
    Settings.Caption.Font.Style = []
    Settings.Caption.GradientDirection = gdVertical
    Settings.Caption.Indent = 2
    Settings.Caption.ShadeLight = 255
    Settings.Collaps = False
    Settings.CollapsColor = clNone
    Settings.CollapsDelay = 0
    Settings.CollapsSteps = 0
    Settings.Color = 16381427
    Settings.ColorTo = 15195349
    Settings.ColorMirror = 15195349
    Settings.ColorMirrorTo = 16513776
    Settings.Cursor = crDefault
    Settings.Font.Charset = DEFAULT_CHARSET
    Settings.Font.Color = 7485192
    Settings.Font.Height = -11
    Settings.Font.Name = 'MS Sans Serif'
    Settings.Font.Style = []
    Settings.FixedTop = False
    Settings.FixedLeft = False
    Settings.FixedHeight = False
    Settings.FixedWidth = False
    Settings.Height = 120
    Settings.Hover = False
    Settings.HoverColor = clNone
    Settings.HoverFontColor = clNone
    Settings.Indent = 0
    Settings.ShadowColor = clBlack
    Settings.ShadowOffset = 0
    Settings.ShowHint = False
    Settings.ShowMoveCursor = False
    Settings.StatusBar.BorderStyle = bsSingle
    Settings.StatusBar.Font.Charset = DEFAULT_CHARSET
    Settings.StatusBar.Font.Color = 7485192
    Settings.StatusBar.Font.Height = -11
    Settings.StatusBar.Font.Name = 'Tahoma'
    Settings.StatusBar.Font.Style = []
    Settings.StatusBar.Color = 16445163
    Settings.StatusBar.ColorTo = 15064023
    Settings.StatusBar.GradientDirection = gdVertical
    Settings.TextVAlign = tvaTop
    Settings.TopIndent = 0
    Settings.URLColor = clBlue
    Settings.Width = 0
    Style = psOffice2007Silver
    Left = 248
    Top = 132
  end
  object AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler
    Style = psOffice2007Silver
    AutoThemeAdapt = True
    PageAppearance.BorderColor = 12500670
    PageAppearance.Color = 16381427
    PageAppearance.ColorTo = 15195349
    PageAppearance.ColorMirror = 15195349
    PageAppearance.ColorMirrorTo = 16513776
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    TabAppearance.BorderColor = clNone
    TabAppearance.BorderColorHot = 12697277
    TabAppearance.BorderColorSelected = 12697533
    TabAppearance.BorderColorSelectedHot = 6277882
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = clNone
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 16316660
    TabAppearance.ColorSelectedTo = 15722466
    TabAppearance.ColorDisabled = clWhite
    TabAppearance.ColorDisabledTo = clSilver
    TabAppearance.ColorHot = 13558249
    TabAppearance.ColorHotTo = 14669780
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 12966111
    TabAppearance.ColorMirrorHotTo = 9359081
    TabAppearance.ColorMirrorSelected = 15722466
    TabAppearance.ColorMirrorSelectedTo = 15722466
    TabAppearance.ColorMirrorDisabled = clWhite
    TabAppearance.ColorMirrorDisabledTo = clSilver
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Tahoma'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggRadial
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = 6050636
    TabAppearance.TextColorHot = 6050636
    TabAppearance.TextColorSelected = 6050636
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.ShadowColor = 14077385
    TabAppearance.HighLightColor = 16775871
    TabAppearance.HighLightColorHot = 16250099
    TabAppearance.HighLightColorSelected = 6540536
    TabAppearance.HighLightColorSelectedHot = 12451839
    TabAppearance.HighLightColorDown = 16776144
    TabAppearance.BackGround.Color = 14537936
    TabAppearance.BackGround.ColorTo = clNone
    TabAppearance.BackGround.Direction = gdHorizontal
    GlowButtonAppearance.BorderColor = 13421257
    GlowButtonAppearance.BorderColorHot = 10079963
    GlowButtonAppearance.BorderColorDown = 4548219
    GlowButtonAppearance.BorderColorChecked = 4548219
    GlowButtonAppearance.Color = 15987697
    GlowButtonAppearance.ColorTo = 16119283
    GlowButtonAppearance.ColorChecked = 11918331
    GlowButtonAppearance.ColorCheckedTo = 7915518
    GlowButtonAppearance.ColorDisabled = 15921906
    GlowButtonAppearance.ColorDisabledTo = 15921906
    GlowButtonAppearance.ColorDown = 7778289
    GlowButtonAppearance.ColorDownTo = 4296947
    GlowButtonAppearance.ColorHot = 15465983
    GlowButtonAppearance.ColorHotTo = 11332863
    GlowButtonAppearance.ColorMirror = 15657703
    GlowButtonAppearance.ColorMirrorTo = 16316406
    GlowButtonAppearance.ColorMirrorHot = 5888767
    GlowButtonAppearance.ColorMirrorHotTo = 10807807
    GlowButtonAppearance.ColorMirrorDown = 946929
    GlowButtonAppearance.ColorMirrorDownTo = 5021693
    GlowButtonAppearance.ColorMirrorChecked = 10480637
    GlowButtonAppearance.ColorMirrorCheckedTo = 5682430
    GlowButtonAppearance.ColorMirrorDisabled = 11974326
    GlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    Left = 240
    Top = 88
  end
  object AdvInputTaskDialog1: TAdvInputTaskDialog
    CommonButtons = []
    DefaultButton = 0
    Icon = tiInformation
    InputType = itEdit
    InputItems.Strings = (
      'BMW'
      'Audi'
      'Mercedes'
      'Porsche'
      'VW'
      'Ferrari')
    Title = 'Windows Vista Input dialog'
    Content = 'Enter value here'
    Left = 128
    Top = 64
  end
end
