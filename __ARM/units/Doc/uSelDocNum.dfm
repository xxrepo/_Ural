object SelDocNum: TSelDocNum
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Выберита номер документа'
  ClientHeight = 255
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 214
    Width = 695
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnOk: TButton
      Left = 519
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 609
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 695
    Height = 214
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    MultiSelect = True
    TitleButtons = True
    Columns = <
      item
        Expanded = False
        FieldName = 'DocName'
        Title.Caption = 'Документ'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Doc_Num'
        Title.Caption = '№№'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Doc_Date'
        Title.Caption = 'Дата'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OrgName'
        Title.Caption = 'Организация'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ExtInfo'
        Title.Caption = 'Информация'
        Width = 100
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM.cdsDocByOper
    Left = 160
    Top = 144
  end
end
