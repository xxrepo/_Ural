object UserProp: TUserProp
  Left = 196
  Top = 125
  Width = 608
  Height = 439
  Caption = 'UserProp'
  Color = clBtnFace
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 105
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 11
      Width = 30
      Height = 13
      Caption = 'ФИО:'
    end
    object Label9: TLabel
      Left = 8
      Top = 37
      Width = 34
      Height = 13
      Caption = 'Логин:'
    end
    object Label10: TLabel
      Left = 8
      Top = 61
      Width = 41
      Height = 13
      Caption = 'Пароль:'
    end
    object Label1: TLabel
      Left = 201
      Top = 53
      Width = 57
      Height = 26
      Caption = 'Пароль (проверка):'
      WordWrap = True
    end
    object edFIO: TEdit
      Left = 64
      Top = 8
      Width = 409
      Height = 21
      MaxLength = 50
      TabOrder = 0
    end
    object LoginEdit: TEdit
      Left = 64
      Top = 34
      Width = 121
      Height = 21
      MaxLength = 20
      TabOrder = 1
    end
    object PasswordEdit: TEdit
      Left = 65
      Top = 58
      Width = 121
      Height = 21
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 2
    end
    object PasswordEdit2: TEdit
      Left = 263
      Top = 56
      Width = 121
      Height = 21
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 3
    end
    object cbAdm: TCheckBox
      Left = 64
      Top = 83
      Width = 233
      Height = 17
      Caption = 'Админские права'
      TabOrder = 4
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 374
    Width = 600
    Height = 38
    Align = alBottom
    TabOrder = 1
    object OkButton: TButton
      Left = 426
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = OkButtonClick
    end
    object CancelButton: TButton
      Left = 514
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 105
    Width = 600
    Height = 269
    Align = alClient
    Caption = 'Бизнесы'
    TabOrder = 2
    inline fDualList1: TfDualList
      Left = 2
      Top = 15
      Width = 596
      Height = 252
      inherited Splitter1: TAdvSplitter
        Height = 252
      end
      inherited SrcPanel: TPanel
        Height = 252
        inherited SrcList: TTextListBox
          Height = 226
        end
      end
      inherited DestPanel: TPanel
        Width = 272
        Height = 252
        inherited Panel4: TPanel
          Width = 270
        end
        inherited DstList: TTextListBox
          Width = 270
          Height = 226
        end
      end
      inherited BtnPanel: TPanel
        Height = 252
      end
    end
  end
  object qryUsers: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_User'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM  dw_User'
      'WHERE id_User = :id_User')
    Left = 120
    Top = 80
  end
  object qryUserAdd: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'FIO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'Login'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'PSW'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'isAdmin'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 38
        Size = 19
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO DW_USER'
      '(FIO, Login, PSW, isAdmin)'
      'VALUES'
      '(:FIO, :Login, :PSW, :isAdmin)'
      ' ')
    Left = 416
    Top = 16
  end
  object qryUserEdit: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'FIO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'Login'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'Psw'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'isAdmin'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 38
        Size = 19
        Value = Null
      end
      item
        Name = 'id_User'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE DW_USER SET'
      'FIO = :FIO,'
      'Login = :Login,'
      'Psw = :Psw,'
      'isAdmin = :isAdmin'
      'WHERE id_USer = :id_User'
      ''
      ' '
      ' ')
    Left = 416
    Top = 56
  end
  object qryChLogin: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Login'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM dw_User'
      'WHERE Login = :Login  AND id_User <> :id  AND AccDisabled = 0'
      ' ')
    Left = 368
    Top = 24
  end
end
