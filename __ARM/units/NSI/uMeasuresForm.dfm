object MeasuresForm: TMeasuresForm
  Left = 192
  Top = 107
  Width = 594
  Height = 432
  Caption = 'Единицы измерения'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 225
    Width = 586
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    Visible = False
  end
  inline MeasuresFrame1: TMeasuresFrame
    Top = 29
    Width = 586
    Height = 196
    Align = alClient
    inherited ToolBar: TToolBar
      Width = 586
    end
    inherited RxDBGrid1: TRxDBGrid
      Width = 586
      Height = 131
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          PickList.Strings = ()
          Title.Caption = 'Наименование'
          Width = 198
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ShortName'
          PickList.Strings = ()
          Title.Caption = 'Краткое наименование'
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Koef'
          PickList.Strings = ()
          Title.Caption = 'Коэфф-т'
          Visible = False
        end>
    end
    inherited FilterPanel: TPanel
      Width = 586
    end
    inherited DataSource: TDataSource
      OnDataChange = MeasuresFrame1DataSourceDataChange
    end
    inherited cdsMeasures: TClientDataSet
      Params = <
        item
          DataType = ftString
          Name = 'id_Business'
          ParamType = ptUnknown
          Value = '-1'
        end
        item
          DataType = ftInteger
          Name = 'Id_base'
          ParamType = ptUnknown
          Value = '-1'
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 367
    Width = 586
    Height = 38
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 408
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 504
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  inline MeasuresFrame2: TMeasuresFrame
    Top = 228
    Width = 586
    Height = 139
    Align = alBottom
    TabOrder = 2
    Visible = False
    inherited ToolBar: TToolBar
      Width = 586
    end
    inherited RxDBGrid1: TRxDBGrid
      Width = 586
      Height = 74
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          PickList.Strings = ()
          Title.Caption = 'Наименование'
          Width = 202
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ShortName'
          PickList.Strings = ()
          Title.Caption = 'Краткое наименование'
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Koef'
          PickList.Strings = ()
          Title.Caption = 'Коэфф-т'
          Visible = True
        end>
    end
    inherited FilterPanel: TPanel
      Width = 586
    end
  end
  inline fBsnSelector1: TfBsnSelector
    Width = 586
    Height = 29
    Align = alTop
    TabOrder = 3
    inherited edName: TEdit
      Width = 209
    end
    inherited Button1: TButton
      Left = 265
      OnClick = fBsnSelector1Button1Click
    end
  end
end
