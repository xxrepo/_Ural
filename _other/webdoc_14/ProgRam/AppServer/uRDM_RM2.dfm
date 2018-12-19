object RDM_RM2: TRDM_RM2
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 8
  Top = 68
  Height = 672
  Width = 974
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDAORA.1;Password=rm2;User ID=rm2;Data Source=orcl;Per' +
      'sist Security Info=True'
    LoginPrompt = False
    Provider = 'MSDAORA.1'
    Left = 26
    Top = 20
  end
  object dsUsers: TDataSetProvider
    DataSet = spUser
    Constraints = True
    Left = 23
    Top = 152
  end
  object spUser: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 24
    Top = 112
  end
  object spWhoIAm: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Login'
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = 'Password'
        DataType = ftString
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  *'
      'FROM rm_User U '
      'WHERE :Login = Login AND :Password = psw')
    Left = 24
    Top = 64
    object spWhoIAmID_USER: TBCDField
      FieldName = 'ID_USER'
      Precision = 32
      Size = 0
    end
    object spWhoIAmFIO: TWideStringField
      FieldName = 'FIO'
      Size = 255
    end
    object spWhoIAmDELETED: TBCDField
      FieldName = 'DELETED'
      Precision = 32
      Size = 0
    end
    object spWhoIAmISADMIN: TBCDField
      FieldName = 'ISADMIN'
      Precision = 32
      Size = 0
    end
    object spWhoIAmLOGIN: TWideStringField
      FieldName = 'LOGIN'
      Size = 255
    end
    object spWhoIAmPSW: TWideStringField
      FieldName = 'PSW'
      Size = 255
    end
  end
end
