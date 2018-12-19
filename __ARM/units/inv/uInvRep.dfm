object InvRep: TInvRep
  Left = 371
  Top = 259
  BorderStyle = bsDialog
  Caption = 'Отчет по убыточным заказам'
  ClientHeight = 174
  ClientWidth = 301
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 301
    Height = 133
    Align = alClient
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 0
    object Label2: TLabel
      Left = 149
      Top = 5
      Width = 12
      Height = 13
      Caption = 'по'
    end
    object Label1: TLabel
      Left = 13
      Top = 5
      Width = 35
      Height = 13
      Caption = 'Дата с'
    end
    object Label3: TLabel
      Left = 11
      Top = 40
      Width = 145
      Height = 13
      Caption = 'Сумма убыточных по пленке'
    end
    object Label4: TLabel
      Left = 11
      Top = 64
      Width = 141
      Height = 13
      Caption = 'Сумма убыточных по клише'
    end
    object Label5: TLabel
      Left = 11
      Top = 96
      Width = 93
      Height = 13
      Caption = 'Сумма убытков'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtTo: TDateTimePicker
      Left = 168
      Top = 2
      Width = 85
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
    object dtFrom: TDateTimePicker
      Left = 56
      Top = 2
      Width = 85
      Height = 21
      CalAlignment = dtaLeft
      Date = 37604.576338125
      Time = 37604.576338125
      Checked = False
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object BitBtn2: TBitBtn
      Left = 257
      Top = 1
      Width = 28
      Height = 25
      TabOrder = 2
      OnClick = BitBtn2Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000CED6D600FF00FF00CED6D6008484
        8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00009C31009CFFFF00FFFF
        FF009CFFFF00FFFFFF00FF00FF0000000000CED6D600FF00FF00CED6D6008484
        8400FFFFFF009CFFFF00FFFFFF009CFFFF00009C3100009C3100FFFFFF009CFF
        FF00FFFFFF009CFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF009CFFFF00009C3100009C3100009C3100009C3100009C
        31009CFFFF00FFFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF009CFFFF00FFFFFF009CFFFF00009C3100009C3100FFFFFF00639C
        0000636300009CFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00009C31009CFFFF00FFFF
        FF0063630000FFFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF009CFFFF00636300009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
        FF00636300009CFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF0063630000FFFFFF009CFFFF00009C31009CFFFF00FFFF
        FF009CFFFF00FFFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF009CFFFF0063630000639C0000FFFFFF00009C3100009C31009CFF
        FF00FFFFFF009CFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF009CFFFF00009C3100009C3100009C3100009C3100009C
        31009CFFFF00FFFFFF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00009C3100009C31009CFF
        FF00FFFFFF00FF00FF00FF00FF0000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00009C31009CFFFF00FFFF
        FF0000000000000000000000000000000000CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFF
        FF0084848400FFFFFF0000000000CED6D600CED6D600FF00FF00FF00FF008484
        8400FFFFFF00FFFFFF00FFFFFF00CED6D600FFFFFF00FFFFFF00FFFFFF00FFFF
        FF008484840000000000FF00FF00CED6D600FF00FF00CED6D600FF00FF008484
        8400848484008484840084848400848484008484840084848400848484008484
        840084848400CED6D600CED6D600FF00FF00CED6D600FF00FF00}
    end
    object edV1: TEdit
      Left = 168
      Top = 37
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object edV2: TEdit
      Left = 168
      Top = 61
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object edSSS: TEdit
      Left = 168
      Top = 93
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 133
    Width = 301
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object btnCancel: TButton
      Left = 215
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Закрыть'
      ModalResult = 2
      TabOrder = 0
      OnClick = btnCancelClick
    end
  end
  object cdsInv_Rep: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
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
        DataType = ftInteger
        Name = '@id_Project'
        ParamType = ptInput
      end>
    ProviderName = 'dsInv_Rep'
    RemoteServer = DM.rsCA
    OnCalcFields = cdsInv_RepCalcFields
    Left = 88
    Top = 40
    object cdsInv_RepPrjNum: TIntegerField
      FieldName = 'PrjNum'
    end
    object cdsInv_RepName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsInv_RepAmount1: TFloatField
      FieldName = 'Amount1'
    end
    object cdsInv_RepAmount2: TFloatField
      FieldName = 'Amount2'
    end
    object cdsInv_RepInv1: TFloatField
      FieldName = 'Inv1'
    end
    object cdsInv_RepInv2: TFloatField
      FieldName = 'Inv2'
    end
    object cdsInv_RepPrice: TFloatField
      FieldName = 'Price'
    end
    object cdsInv_RepKlishe_Inv1: TFloatField
      FieldName = 'Klishe_Inv1'
    end
    object cdsInv_RepKlishe_Inv2: TFloatField
      FieldName = 'Klishe_Inv2'
    end
    object cdsInv_RepKlishe_Price: TFloatField
      FieldName = 'Klishe_Price'
    end
    object cdsInv_RepTime_Form1: TDateTimeField
      FieldName = 'Time_Form1'
    end
    object cdsInv_RepTime_Form2: TDateTimeField
      FieldName = 'Time_Form2'
    end
    object cdsInv_RepTime_FormDelta: TDateTimeField
      FieldName = 'Time_FormDelta'
    end
    object cdsInv_RepTime_Print1: TDateTimeField
      FieldName = 'Time_Print1'
    end
    object cdsInv_RepTime_Print2: TDateTimeField
      FieldName = 'Time_Print2'
    end
    object cdsInv_RepTime_PrintDelta: TDateTimeField
      FieldName = 'Time_PrintDelta'
    end
    object cdsInv_RepTime_Lam1: TDateTimeField
      FieldName = 'Time_Lam1'
    end
    object cdsInv_RepTime_Lam2: TDateTimeField
      FieldName = 'Time_Lam2'
    end
    object cdsInv_RepTime_LamDelta: TDateTimeField
      FieldName = 'Time_LamDelta'
    end
    object cdsInv_RepTime_Rez1: TDateTimeField
      FieldName = 'Time_Rez1'
    end
    object cdsInv_RepTime_Rez2: TDateTimeField
      FieldName = 'Time_Rez2'
    end
    object cdsInv_RepTime_RezDelta: TDateTimeField
      FieldName = 'Time_RezDelta'
    end
    object cdsInv_RepRaw_Form1: TFloatField
      FieldName = 'Raw_Form1'
    end
    object cdsInv_RepRaw_Form2: TFloatField
      FieldName = 'Raw_Form2'
    end
    object cdsInv_RepRaw_FormDelta: TFloatField
      FieldName = 'Raw_FormDelta'
    end
    object cdsInv_RepRaw_Print1: TFloatField
      FieldName = 'Raw_Print1'
    end
    object cdsInv_RepRaw_Print2: TFloatField
      FieldName = 'Raw_Print2'
    end
    object cdsInv_RepRaw_PrintDelta: TFloatField
      FieldName = 'Raw_PrintDelta'
    end
    object cdsInv_RepRaw_Lam1: TFloatField
      FieldName = 'Raw_Lam1'
    end
    object cdsInv_RepRaw_Lam2: TFloatField
      FieldName = 'Raw_Lam2'
    end
    object cdsInv_RepRaw_LamDelta: TFloatField
      FieldName = 'Raw_LamDelta'
    end
    object cdsInv_RepRaw_Rez1: TFloatField
      FieldName = 'Raw_Rez1'
    end
    object cdsInv_RepRaw_Rez2: TFloatField
      FieldName = 'Raw_Rez2'
    end
    object cdsInv_RepRaw_RezDelta: TFloatField
      FieldName = 'Raw_RezDelta'
    end
    object cdsInv_Repxxx: TIntegerField
      FieldName = 'xxx'
    end
    object cdsInv_RepRecNum: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RecNum'
    end
    object cdsInv_RepCalcDate: TDateTimeField
      FieldName = 'CalcDate'
    end
    object cdsInv_RepCheckDate: TDateTimeField
      FieldName = 'CheckDate'
    end
    object cdsInv_RepID_Main: TIntegerField
      FieldName = 'ID_Main'
    end
    object cdsInv_Repid_Project: TIntegerField
      FieldName = 'id_Project'
    end
    object cdsInv_RepKL_Delta: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'KL_Delta'
      DisplayFormat = '0.00'
    end
    object cdsInv_RepINV_Delta: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'INV_Delta'
      DisplayFormat = '0.00'
    end
    object cdsInv_RepINV_DeltaVal: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'INV_DeltaVal'
      DisplayFormat = '0.00'
    end
  end
end
