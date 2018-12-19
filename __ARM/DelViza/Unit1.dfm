object Form1: TForm1
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Снятие визы'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 34
    Height = 13
    Caption = 'Номер'
  end
  object ceOper: TEdit
    Left = 85
    Top = 29
    Width = 305
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 152
    Top = 96
    Width = 201
    Height = 65
    Caption = 'Снять визу'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=iwanttobelive;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=ACS_MBase;Data Source=SERVER'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 72
    Top = 96
  end
  object qRez: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'id_Oper'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select id_rez FROM BLN_Oper_v2 '
      'where id_Oper = :id_Oper')
    Left = 72
    Top = 160
    object qRezid_rez: TIntegerField
      FieldName = 'id_rez'
    end
  end
  object ADOQueryTmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 168
    Top = 232
  end
  object qOper: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'id_Oper'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select id_Oper, id_business, OperVid, OperTypeIn, Id_CurrencyOpe' +
        'r, Id_CurrencySys, id_Warehouse, Koeff, CheckDate'
      'from op_Oper2 where id_Oper= :id_Oper')
    Left = 72
    Top = 224
    object qOperid_Oper: TAutoIncField
      FieldName = 'id_Oper'
      ReadOnly = True
    end
    object qOperid_business: TIntegerField
      FieldName = 'id_business'
    end
    object qOperOperVid: TIntegerField
      FieldName = 'OperVid'
    end
    object qOperOperTypeIn: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object qOperId_CurrencyOper: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object qOperId_CurrencySys: TIntegerField
      FieldName = 'Id_CurrencySys'
    end
    object qOperid_Warehouse: TIntegerField
      FieldName = 'id_Warehouse'
    end
    object qOperKoeff: TIntegerField
      FieldName = 'Koeff'
    end
    object qOperCheckDate: TDateTimeField
      FieldName = 'CheckDate'
    end
  end
  object qDelV: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'id_Oper'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'update op_Oper2 set CheckDate = NULL, Blocked = 0 where id_Oper=' +
        ' :id_Oper'
      ' ')
    Left = 112
    Top = 312
    object AutoIncField1: TAutoIncField
      FieldName = 'id_Oper'
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'id_business'
    end
    object IntegerField2: TIntegerField
      FieldName = 'OperVid'
    end
    object BooleanField1: TBooleanField
      FieldName = 'OperTypeIn'
    end
    object IntegerField3: TIntegerField
      FieldName = 'Id_CurrencyOper'
    end
    object IntegerField4: TIntegerField
      FieldName = 'Id_CurrencySys'
    end
    object IntegerField5: TIntegerField
      FieldName = 'id_Warehouse'
    end
    object IntegerField6: TIntegerField
      FieldName = 'Koeff'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'CheckDate'
    end
  end
  object qChWH: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'id_Oper'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select COUNT(* ) as CNT'
      'from VW_Oper_WArc_WW_New Op1 (NOLOCK)'
      
        'JOIN VW_Oper_WArc_WW_New Op2 (NOLOCK) ON OP1.id_Warehouse = OP2.' +
        'id_Warehouse'
      
        'AND OP1.id_Goods = OP2.id_Goods AND OP1.CheckDate <= OP2.CheckDa' +
        'te'
      'AND OP1.OperTypeIn <> OP2.OperTypeIn'
      'where op1.id_Oper =  :id_Oper'
      'AND    OP1.CheckDate IS NOT NULL'
      'AND    OP2.CheckDate IS NOT NULL'
      'AND    OP1.deleted = 0'
      'AND    OP2.deleted = 0'
      '')
    Left = 296
    Top = 208
    object qChWHCNT: TIntegerField
      FieldName = 'CNT'
      ReadOnly = True
    end
  end
end
