object SearchResult: TSearchResult
  Left = 181
  Top = 106
  Width = 783
  Height = 540
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Результат поиска'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline fArc1: TfArc
    Width = 775
    Align = alClient
    inherited ToolBar1: TToolBar
      Width = 775
    end
    inherited pnDate: TPanel
      Width = 775
      inherited Panel3: TPanel
        Width = 501
      end
    end
    inherited RxDBGrid1: TDBGridEh
      Width = 775
    end
    inherited StatusBar1: TStatusBar
      Width = 775
    end
    inherited ToolBar2: TToolBar
      Width = 775
      inherited EhGridFilter1: TEhGridFilter
        Width = 66
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 472
    Width = 775
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object btnCancel: TButton
      Left = 689
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
  object cdsSQLStr: TClientDataSet
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
        Name = '@id_Filter'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsSQLStr'
    Left = 416
    Top = 153
  end
  object cdsData: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 297
  end
  object ActionList1: TActionList
    Left = 104
    Top = 208
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 49264
      OnExecute = Action1Execute
    end
  end
  object cdsCondList2: TClientDataSet
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
        Name = '@id_Filter'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsCondList'
    Left = 424
    Top = 192
    object cdsCondList2CondNum: TIntegerField
      FieldName = 'CondNum'
    end
    object cdsCondList2RNum: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RNum'
    end
  end
end
