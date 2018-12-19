object BlnDetail_2: TBlnDetail_2
  Left = 173
  Top = 190
  Width = 837
  Height = 540
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Детализация баланса'
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
  object Panel1: TPanel
    Left = 0
    Top = 472
    Width = 829
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 743
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
  object Panel3: TPanel
    Left = 0
    Top = 61
    Width = 829
    Height = 31
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Итого:'
    end
    object edSum: TEdit
      Left = 54
      Top = 5
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = ' '
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 829
    Height = 61
    Align = alTop
    Caption = ' '
    TabOrder = 2
    object Button1: TButton
      Left = 328
      Top = 14
      Width = 131
      Height = 33
      Caption = 'Перечитать'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 310
      Height = 59
      Align = alLeft
      Caption = ' '
      TabOrder = 1
      inline fBsnSelector1: TfBsnSelector
        Left = 1
        Top = 1
        Width = 308
        Height = 33
        Align = alTop
        inherited edName: TEdit
          Width = 222
        end
        inherited Button1: TButton
          Left = 277
        end
      end
      object Panel4: TPanel
        Left = 1
        Top = 34
        Width = 308
        Height = 24
        Align = alClient
        BevelOuter = bvNone
        Caption = ' '
        TabOrder = 1
        object Label2: TLabel
          Left = 8
          Top = 3
          Width = 26
          Height = 13
          Caption = 'Дата'
        end
        object Label3: TLabel
          Left = 168
          Top = 3
          Width = 33
          Height = 13
          Caption = 'Время'
        end
        object dtTo: TDateTimePicker
          Left = 56
          Top = -1
          Width = 105
          Height = 21
          CalAlignment = dtaLeft
          Date = 37604.576338125
          Time = 37604.576338125
          ShowCheckbox = True
          Checked = False
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
          OnChange = dtToChange
        end
        object dtTimeTo: TDateTimePicker
          Left = 203
          Top = -1
          Width = 105
          Height = 21
          CalAlignment = dtaLeft
          Date = 37604.576338125
          Time = 37604.576338125
          ShowCheckbox = True
          Checked = False
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkTime
          ParseInput = False
          TabOrder = 1
        end
      end
    end
  end
  inline fArcLite1: TfArcLite
    Top = 92
    Width = 829
    Height = 380
    Align = alClient
    TabOrder = 3
    inherited ToolBar1: TToolBar
      Width = 829
    end
    inherited RxDBGrid1: TDBGridEh
      Width = 829
      Height = 264
    end
    inherited ToolBar2: TToolBar
      Width = 829
    end
    inherited Panel3: TPanel
      Width = 829
    end
    inherited StatusBar1: TStatusBar
      Top = 361
      Width = 829
    end
    inherited cdsArcLite: TClientDataSet
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
        end
        item
          DataType = ftDateTime
          Name = '@Date'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isRawZ'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isNotRawZ'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isCRN'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isUp'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isDown'
          ParamType = ptInput
        end
        item
          DataType = ftBoolean
          Name = '@isInFromManuf'
          ParamType = ptInput
        end
        item
          DataType = ftInteger
          Name = '@id_Manufact'
          ParamType = ptInput
        end>
      ProviderName = 'dsBlnDet2'
    end
  end
  object cdsArcLite_v2: TClientDataSet
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
      end
      item
        DataType = ftDateTime
        Name = '@Date'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@isRawZ'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@isNotRawZ'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@isCRN'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@isUp'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@isDown'
        ParamType = ptInput
      end
      item
        DataType = ftBoolean
        Name = '@isInFromManuf'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@id_Manufact'
        ParamType = ptInput
      end>
    ProviderName = 'dsBlnDet2'
    RemoteServer = DM.rsCA
    Left = 392
    Top = 296
  end
  object cdsCRep: TClientDataSet
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
        Name = '@id_Rep'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@V'
        ParamType = ptInput
        Value = '2'
      end
      item
        DataType = ftInteger
        Name = '@id_X'
        ParamType = ptInput
        Value = '500'
      end>
    ProviderName = 'dsCRep'
    RemoteServer = DM.rsCA
    Left = 504
    Top = 112
  end
end
