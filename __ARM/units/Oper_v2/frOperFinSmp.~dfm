object fOperFinSmp: TfOperFinSmp
  Left = 0
  Top = 0
  Width = 833
  Height = 581
  TabOrder = 0
  OnResize = FrameResize
  inline fBJByOper1: TfBJByOper
    Top = 264
    Width = 833
    Height = 317
    Align = alClient
    inherited dbgBJ: TDBGridEh
      Width = 833
      Height = 317
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 209
    Width = 833
    Height = 55
    Align = alTop
    BevelInner = bvLowered
    Caption = ' '
    TabOrder = 1
    object Label7: TLabel
      Left = 4
      Top = 7
      Width = 80
      Height = 13
      Caption = 'Ввел сотрудник'
      FocusControl = DBEdit7
    end
    object Label5: TLabel
      Left = 428
      Top = 7
      Width = 59
      Height = 13
      Caption = 'Дата ввода'
      FocusControl = DBEdit5
    end
    object Label12: TLabel
      Left = 4
      Top = 30
      Width = 67
      Height = 13
      Caption = 'Завизировал'
      FocusControl = DBEdit6
    end
    object Label14: TLabel
      Left = 428
      Top = 32
      Width = 95
      Height = 13
      Caption = 'Дата визирования'
      FocusControl = DBEdit10
    end
    object DBEdit7: TDBEdit
      Left = 106
      Top = 3
      Width = 314
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
      Left = 530
      Top = 3
      Width = 115
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'DateLocal'
      DataSource = dsOperFin
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit6: TDBEdit
      Left = 106
      Top = 28
      Width = 314
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clMenu
      DataField = 'CheckerFIO'
      DataSource = dsOperFin
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit10: TDBEdit
      Left = 530
      Top = 28
      Width = 115
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CheckDate'
      DataSource = dsOperFin
      ReadOnly = True
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 96
    Width = 833
    Height = 113
    Align = alTop
    Caption = ' Документ: '
    TabOrder = 2
    object Label8: TLabel
      Left = 10
      Top = 18
      Width = 128
      Height = 13
      Caption = 'Осн. платежа/накладная'
    end
    object Label6: TLabel
      Left = 10
      Top = 41
      Width = 145
      Height = 13
      Caption = 'Пл. поручение/Счет фактура'
    end
    object Label17: TLabel
      Left = 10
      Top = 65
      Width = 44
      Height = 13
      Caption = 'Договор'
    end
    object Label1: TLabel
      Left = 10
      Top = 89
      Width = 70
      Height = 13
      Caption = 'Комментарий'
    end
    object edContract: TDBEdit
      Left = 162
      Top = 61
      Width = 640
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Contract'
      DataSource = dsOperFin
      TabOrder = 2
    end
    object edImp_PayBasic: TDBEdit
      Left = 162
      Top = 13
      Width = 640
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Imp_PayBasic'
      DataSource = dsOperFin
      TabOrder = 0
    end
    object edAccInv_PayAssignment: TDBEdit
      Left = 162
      Top = 37
      Width = 640
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'AccInv_PayAssignment'
      DataSource = dsOperFin
      TabOrder = 1
    end
    object btnX1: TButton
      Left = 803
      Top = 13
      Width = 24
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '<--'
      TabOrder = 3
      OnClick = btnX1Click
    end
    object btnX2: TButton
      Left = 803
      Top = 36
      Width = 24
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '<--'
      TabOrder = 4
      OnClick = btnX2Click
    end
    object btnX3: TButton
      Left = 803
      Top = 60
      Width = 24
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '<--'
      TabOrder = 5
      OnClick = btnX3Click
    end
    object DBEdit4: TDBEdit
      Left = 162
      Top = 85
      Width = 640
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'OpComment'
      DataSource = dsOperFin
      TabOrder = 6
    end
  end
  object P1: TPanel
    Left = 0
    Top = 0
    Width = 833
    Height = 96
    Align = alTop
    BevelOuter = bvNone
    Caption = '.'
    Constraints.MinWidth = 500
    TabOrder = 3
    object lbSrcName: TLabel
      Left = 316
      Top = 3
      Width = 23
      Height = 13
      Caption = 'Счет'
      FocusControl = DBEdit1
    end
    object lbReprName: TLabel
      Left = 4
      Top = 27
      Width = 39
      Height = 13
      Caption = 'Юрлицо'
      FocusControl = edReprName
    end
    object lbOperTypeIn: TLabel
      Left = 2
      Top = 4
      Width = 70
      Height = 13
      Caption = 'Тип операции'
      FocusControl = cbOperTypeIn
    end
    object Label13: TLabel
      Left = 4
      Top = 52
      Width = 58
      Height = 13
      Caption = 'Контрагент'
      FocusControl = DBEdit3
    end
    object RxSpeedButton1: TRxSpeedButton
      Left = 216
      Top = 73
      Width = 25
      Height = 21
      Caption = '<<--'
      OnClick = Button1Click
    end
    object Label2: TLabel
      Left = 4
      Top = 78
      Width = 34
      Height = 13
      Caption = 'Сумма'
    end
    object DBEdit1: TDBEdit
      Left = 352
      Top = 0
      Width = 447
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'SrcName'
      DataSource = dsOperFin
      ReadOnly = True
      TabOrder = 0
      OnChange = DBEdit1Change
    end
    object BitBtn3: TBitBtn
      Left = 798
      Top = 0
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
      OnClick = BitBtn3Click
    end
    object edReprName: TDBEdit
      Left = 88
      Top = 24
      Width = 710
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ReprName'
      DataSource = dsOperFin
      ReadOnly = True
      TabOrder = 2
      OnChange = DBEdit1Change
    end
    object BitBtn4: TBitBtn
      Left = 798
      Top = 24
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
      TabOrder = 3
      OnClick = BitBtn4Click
    end
    object cbOperTypeIn: TComboBox
      Left = 88
      Top = 0
      Width = 209
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnChange = cbOperTypeInChange
      Items.Strings = (
        'Приходная операция'
        'Расходная операция')
    end
    object DBEdit3: TDBEdit
      Left = 88
      Top = 48
      Width = 735
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clMenu
      DataField = 'ContrAgentName'
      DataSource = dsOperFin
      ReadOnly = True
      TabOrder = 5
      OnChange = DBEdit1Change
    end
    object DBEdit2: TRxDBCalcEdit
      Left = 87
      Top = 73
      Width = 103
      Height = 21
      DataField = 'PriceOper'
      DataSource = dsOperFin
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 6
      OnClick = DBEdit2Click
    end
    object BitBtn1: TBitBtn
      Left = 190
      Top = 73
      Width = 22
      Height = 21
      TabOrder = 7
      OnClick = BitBtn1Click
      Glyph.Data = {
        46020000424D460200000000000036000000280000000E0000000C0000000100
        1800000000001002000000000000000000000000000000000000F800F8000000
        0000000000000000000000000000000000000000000000000000000000000000
        00F800F800008080008080008000008000008000008000008000008000008000
        008000008000008000008000000000000000808000F8F8F88080008080008080
        0080800080800080800080800080800080800080800080000000000000008080
        00F8F800808000000000F8F8F8000000F8F8F8000000F8F8F8000000F8F8F800
        00008000000000000000808000F8F8F880800080800080800080800080800080
        80008080008080008080008080008000000000000000808000F8F80080800000
        0000F8F8F8000000F8F8F8000000F8F8F8000000F8F8F8000000800000000000
        0000808000F8F8F8808000808000808000808000808000808000808000808000
        8080008080008000000000000000808000F8F800000000C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C08080008080008000000000000000808000F8F8F8
        000000F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8C0C0C08080008080008000
        000000000000808000F8F8000000000000000000000000000000000000000000
        000000008080008080008000000000000000808000F8F8F8F8F800F8F8F8F8F8
        00F8F8F8F8F800F8F8F8F8F800F8F8F8F8F800F8F8F88080000000000000F800
        F880800080800080800080800080800080800080800080800080800080800080
        8000808000F800F80000}
      Layout = blGlyphBottom
    end
  end
  object cdsOperFin: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Oper'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@is_Mirr'
        ParamType = ptInput
      end>
    ProviderName = 'dsOperProp_v2'
    RemoteServer = DM.rsCA
    AfterPost = cdsOperFinAfterPost
    Left = 80
    Top = 174
    object cdsOperFinid_Oper: TIntegerField
      FieldName = 'id_Oper'
    end
    object cdsOperFinid_OperParent: TIntegerField
      FieldName = 'id_OperParent'
    end
    object cdsOperFinid_old_Oper: TIntegerField
      FieldName = 'id_old_Oper'
    end
    object cdsOperFinDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object cdsOperFinid_LC_Oper: TIntegerField
      FieldName = 'id_LC_Oper'
    end
    object cdsOperFinOperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object cdsOperFinid_UserCreator: TIntegerField
      FieldName = 'id_UserCreator'
    end
    object cdsOperFinCreatorFIO: TStringField
      FieldName = 'CreatorFIO'
      Size = 152
    end
    object cdsOperFinid_business: TIntegerField
      FieldName = 'id_business'
    end
    object cdsOperFinId_CurrencyBsn: TIntegerField
      FieldName = 'Id_CurrencyBsn'
    end
    object cdsOperFinBusinessName: TStringField
      FieldName = 'BusinessName'
      Size = 50
    end
    object cdsOperFinBusinessNum: TStringField
      FieldName = 'BusinessNum'
      Size = 5
    end
    object cdsOperFinDateLocal: TDateTimeField
      FieldName = 'DateLocal'
    end
    object cdsOperFinCorrect: TBooleanField
      FieldName = 'Correct'
      OnGetText = cdsOperFinCorrectGetText
    end
    object cdsOperFinOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object cdsOperFinId_CurrencyOper: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object cdsOperFinCurrencyOperName: TStringField
      FieldName = 'CurrencyOperName'
      Size = 30
    end
    object cdsOperFinCurrencyOperShortName: TStringField
      FieldName = 'CurrencyOperShortName'
      Size = 10
    end
    object cdsOperFinPriceOper: TFloatField
      FieldName = 'PriceOper'
    end
    object cdsOperFinRateOper: TFloatField
      FieldName = 'RateOper'
    end
    object cdsOperFinId_CurrencySys: TIntegerField
      FieldName = 'Id_CurrencySys'
    end
    object cdsOperFinCurrencySysName: TStringField
      FieldName = 'CurrencySysName'
      Size = 30
    end
    object cdsOperFinCurrencySysShortName: TStringField
      FieldName = 'CurrencySysShortName'
      Size = 10
    end
    object cdsOperFinSummSys: TFloatField
      FieldName = 'SummSys'
    end
    object cdsOperFinRateSys: TFloatField
      FieldName = 'RateSys'
    end
    object cdsOperFinid_Acc: TIntegerField
      FieldName = 'id_Acc'
    end
    object cdsOperFinid_Warehouse: TIntegerField
      FieldName = 'id_Warehouse'
    end
    object cdsOperFinid_Manufact: TIntegerField
      FieldName = 'id_Manufact'
    end
    object cdsOperFinSrcName: TStringField
      FieldName = 'SrcName'
      Size = 50
    end
    object cdsOperFinSrcID_Main: TIntegerField
      FieldName = 'SrcID_Main'
    end
    object cdsOperFinid_Repr: TIntegerField
      FieldName = 'id_Repr'
    end
    object cdsOperFinid_Acc_Ext: TIntegerField
      FieldName = 'id_Acc_Ext'
    end
    object cdsOperFinid_Warehouse_Ext: TIntegerField
      FieldName = 'id_Warehouse_Ext'
    end
    object cdsOperFinid_Manufact_Ext: TIntegerField
      FieldName = 'id_Manufact_Ext'
    end
    object cdsOperFinReprName: TStringField
      FieldName = 'ReprName'
      Size = 255
    end
    object cdsOperFinReprID_Main: TIntegerField
      FieldName = 'ReprID_Main'
    end
    object cdsOperFinId_CurrencyInv: TIntegerField
      FieldName = 'Id_CurrencyInv'
    end
    object cdsOperFinRateInv: TFloatField
      FieldName = 'RateInv'
    end
    object cdsOperFinCurrencyInvName: TStringField
      FieldName = 'CurrencyInvName'
      Size = 30
    end
    object cdsOperFinCurrencyInvShortName: TStringField
      FieldName = 'CurrencyInvShortName'
      Size = 10
    end
    object cdsOperFinKoeff: TIntegerField
      FieldName = 'Koeff'
    end
    object cdsOperFinKoeffName: TStringField
      FieldName = 'KoeffName'
      Size = 50
    end
    object cdsOperFinCheckDate: TDateTimeField
      FieldName = 'CheckDate'
    end
    object cdsOperFinCheckerFIO: TStringField
      FieldName = 'CheckerFIO'
      Size = 152
    end
    object cdsOperFinid_FormalDistrib: TIntegerField
      FieldName = 'id_FormalDistrib'
    end
    object cdsOperFinFormalDistribName: TStringField
      FieldName = 'FormalDistribName'
      Size = 50
    end
    object cdsOperFinid_FuncDistrib: TIntegerField
      FieldName = 'id_FuncDistrib'
    end
    object cdsOperFinFuncDistribName: TStringField
      FieldName = 'FuncDistribName'
      Size = 50
    end
    object cdsOperFinDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object cdsOperFinid_ContrAgent: TIntegerField
      FieldName = 'id_ContrAgent'
    end
    object cdsOperFinContrAgentName: TStringField
      FieldName = 'ContrAgentName'
      Size = 50
    end
    object cdsOperFinid_CAGroup: TIntegerField
      FieldName = 'id_CAGroup'
    end
    object cdsOperFinSummOper: TFloatField
      FieldName = 'SummOper'
    end
    object cdsOperFinTypeName: TStringField
      FieldName = 'TypeName'
      Size = 30
    end
    object cdsOperFinHasViza: TBooleanField
      FieldName = 'HasViza'
    end
    object cdsOperFinOperState: TIntegerField
      FieldName = 'OperState'
    end
    object cdsOperFinHidedOper: TBooleanField
      FieldName = 'HidedOper'
    end
    object cdsOperFinRateMain: TFloatField
      FieldName = 'RateMain'
    end
    object cdsOperFinid_Repr_Ex: TIntegerField
      FieldName = 'id_Repr_Ex'
    end
    object cdsOperFinid_DocType: TIntegerField
      FieldName = 'id_DocType'
    end
    object cdsOperFinImp_PayBasic: TStringField
      FieldName = 'Imp_PayBasic'
      Size = 1000
    end
    object cdsOperFinAccInv_PayAssignment: TStringField
      FieldName = 'AccInv_PayAssignment'
      Size = 1000
    end
    object cdsOperFinContract: TStringField
      FieldName = 'Contract'
      Size = 1000
    end
    object cdsOperFinOperCrnName: TStringField
      FieldName = 'OperCrnName'
      Size = 10
    end
    object cdsOperFinBlocked: TBooleanField
      FieldName = 'Blocked'
    end
    object cdsOperFinCurrencyBsnName: TStringField
      FieldName = 'CurrencyBsnName'
      Size = 10
    end
    object cdsOperFinOpComment: TStringField
      FieldName = 'OpComment'
      Size = 1000
    end
    object cdsOperFinRealDataCreate: TDateTimeField
      FieldName = 'RealDataCreate'
    end
    object cdsOperFinOperTypeSIGN: TIntegerField
      FieldName = 'OperTypeSIGN'
    end
    object cdsOperFinHasChild: TIntegerField
      FieldName = 'HasChild'
    end
    object cdsOperFinDig1: TFloatField
      FieldName = 'Dig1'
    end
    object cdsOperFinDig2: TFloatField
      FieldName = 'Dig2'
    end
    object cdsOperFinDig3: TFloatField
      FieldName = 'Dig3'
    end
    object cdsOperFinDig4: TFloatField
      FieldName = 'Dig4'
    end
    object cdsOperFinDig5: TFloatField
      FieldName = 'Dig5'
    end
    object cdsOperFinDig6: TFloatField
      FieldName = 'Dig6'
    end
    object cdsOperFinDig7: TFloatField
      FieldName = 'Dig7'
    end
    object cdsOperFinDig8: TFloatField
      FieldName = 'Dig8'
    end
    object cdsOperFinDig9: TFloatField
      FieldName = 'Dig9'
    end
    object cdsOperFinDig10: TFloatField
      FieldName = 'Dig10'
    end
    object cdsOperFinDig11: TFloatField
      FieldName = 'Dig11'
    end
    object cdsOperFinDig12: TFloatField
      FieldName = 'Dig12'
    end
    object cdsOperFinDig13: TFloatField
      FieldName = 'Dig13'
    end
    object cdsOperFinDig14: TFloatField
      FieldName = 'Dig14'
    end
    object cdsOperFinDig15: TFloatField
      FieldName = 'Dig15'
    end
    object cdsOperFinStr1: TStringField
      FieldName = 'Str1'
      Size = 100
    end
    object cdsOperFinStr2: TStringField
      FieldName = 'Str2'
      Size = 100
    end
    object cdsOperFinStr3: TStringField
      FieldName = 'Str3'
      Size = 100
    end
    object cdsOperFinStr4: TStringField
      FieldName = 'Str4'
      Size = 100
    end
    object cdsOperFinStr5: TStringField
      FieldName = 'Str5'
      Size = 100
    end
    object cdsOperFinStr6: TStringField
      FieldName = 'Str6'
      Size = 100
    end
    object cdsOperFinStr7: TStringField
      FieldName = 'Str7'
      Size = 100
    end
    object cdsOperFinStr8: TStringField
      FieldName = 'Str8'
      Size = 100
    end
    object cdsOperFinStr9: TStringField
      FieldName = 'Str9'
      Size = 100
    end
    object cdsOperFinStr10: TStringField
      FieldName = 'Str10'
      Size = 100
    end
    object cdsOperFinStr11: TStringField
      FieldName = 'Str11'
      Size = 100
    end
    object cdsOperFinStr12: TStringField
      FieldName = 'Str12'
      Size = 100
    end
    object cdsOperFinStr13: TStringField
      FieldName = 'Str13'
      Size = 100
    end
    object cdsOperFinStr14: TStringField
      FieldName = 'Str14'
      Size = 100
    end
    object cdsOperFinStr15: TStringField
      FieldName = 'Str15'
      Size = 100
    end
    object cdsOperFinOperVidName: TStringField
      FieldName = 'OperVidName'
      Size = 50
    end
    object cdsOperFinis_Mirr: TBooleanField
      FieldName = 'is_Mirr'
    end
    object cdsOperFinid_Acc_Group: TIntegerField
      FieldName = 'id_Acc_Group'
    end
    object cdsOperFinid_Warehouse_Group: TIntegerField
      FieldName = 'id_Warehouse_Group'
    end
    object cdsOperFinid_Manufact_Group: TIntegerField
      FieldName = 'id_Manufact_Group'
    end
    object cdsOperFinOperNum: TStringField
      FieldName = 'OperNum'
      Size = 255
    end
    object cdsOperFinid_Replicator: TIntegerField
      FieldName = 'id_Replicator'
    end
    object cdsOperFinVatIn: TBooleanField
      FieldName = 'VatIn'
    end
  end
  object dsOperFin: TDataSource
    DataSet = cdsOperFin
    Left = 112
    Top = 174
  end
  object pmIns: TPopupMenu
    Left = 788
    Top = 188
  end
end
