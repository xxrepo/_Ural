object frmInputQuery_File: TfrmInputQuery_File
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'File'
  ClientHeight = 99
  ClientWidth = 392
  Color = clBtnFace
  Constraints.MinHeight = 100
  Constraints.MinWidth = 350
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
    Top = 0
    Width = 392
    Height = 58
    Align = alClient
    Caption = ' '
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 34
      Width = 70
      Height = 13
      Caption = 'Коммантарий'
    end
    object Label2: TLabel
      Left = 8
      Top = 10
      Width = 29
      Height = 13
      Caption = 'Файл'
    end
    object edName: TEdit
      Left = 88
      Top = 30
      Width = 296
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 0
      Text = 'edName'
    end
    object edFile: TEdit
      Left = 88
      Top = 6
      Width = 276
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 1
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 363
      Top = 6
      Width = 21
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 58
    Width = 392
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object btnOk: TButton
      Left = 213
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 301
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
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.*'
    Filter = 
      'All files (*.*)|*.*|Microsoft Word files (*.doc)|*.doc|Microsoft' +
      ' Excel files (*.xls)|*.xls|Microsoft PowerPoint files  (*.ppt)|*' +
      '.ppt|Acrobat Reader  files (*.pdf)|*.pdf|JPEG files  (*.jpg/*.jp' +
      'eg)|*.jp*g'
    Left = 24
    Top = 16
  end
end
