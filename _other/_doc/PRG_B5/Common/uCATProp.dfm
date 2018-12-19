object CATProp: TCATProp
  Left = 239
  Top = 109
  BorderStyle = bsDialog
  Caption = 'CATProp'
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
      Top = 32
      Width = 53
      Height = 13
      Caption = 'Категория'
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 88
      Height = 13
      Caption = 'Родит. категория'
    end
    object DBEdit1: TDBEdit
      Left = 101
      Top = 27
      Width = 287
      Height = 21
      DataField = 'NAME'
      DataSource = dsCAProp
      TabOrder = 0
    end
    object Button1: TButton
      Left = 362
      Top = 3
      Width = 25
      Height = 22
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 1
      OnClick = Button1Click
    end
    object DBEdit2: TDBEdit
      Left = 101
      Top = 3
      Width = 262
      Height = 21
      DataField = 'PARENTNAME'
      DataSource = dsCAProp
      ReadOnly = True
      TabOrder = 2
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
    object btnCancel: TButton
      Left = 301
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 0
    end
    object btnOk: TButton
      Left = 213
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
  object qDTProp: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_DocType'
        Attributes = [paSigned]
        DataType = ftBCD
        Precision = 38
        Size = 19
        Value = Null
      end>
    SQL.Strings = (
      ''
      'select DT.*, DT2.NAme AS ParentName'
      'from DW_DocType DT '
      'LEFT JOIN DW_DocType DT2 ON DT.PID = DT2.id_DocType'
      'where DT.id_DocType = :id_DocType'
      ' ')
    Left = 40
    Top = 64
  end
  object dsCAProp: TDataSource
    DataSet = cdsDTProp
    Left = 80
    Top = 64
  end
  object cdsDTProp: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'id_DocType'
        ParamType = ptInput
      end>
    ProviderName = 'dspDTProp'
    Left = 64
    Top = 32
  end
  object dspDTProp: TDataSetProvider
    DataSet = qDTProp
    Constraints = True
    Left = 24
    Top = 40
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'Name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'PID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'atype'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'id_BSN'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO DW_DocType'
      '   (is_GRP, Name, PID, atype, id_BSN)'
      'VALUES'
      '(1, :Name, :PID, :atype, :id_BSN)'
      ' '
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 144
    Top = 24
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <
      item
        Name = 'Name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'PID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'id_BSN'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'id_DocType'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'update DW_DocType'
      '  SET Name = :Name,'
      '  PID = :PID, id_BSN = :id_BSN'
      'where id_DocType = :id_DocType'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 184
    Top = 24
  end
end
