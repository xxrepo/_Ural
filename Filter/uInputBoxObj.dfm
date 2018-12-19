object FrmInputBoxObj: TFrmInputBoxObj
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Выбор объекта'
  ClientHeight = 293
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 443
    Height = 252
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Наименование'
        Width = 391
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 252
    Width = 443
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object btnOk: TButton
      Left = 261
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 354
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object cdsObj: TClientDataSet
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
        Name = '@id_Obj'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dsObj'
    Left = 40
    Top = 48
    object cdsObjID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object cdsObjName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsObj
    Left = 56
    Top = 88
  end
end
