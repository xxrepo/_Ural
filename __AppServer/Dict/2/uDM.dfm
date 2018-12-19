object DMKM: TDMKM
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 65532
  Top = 65532
  Height = 748
  Width = 1032
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=1;Persist Security Info=True;User I' +
      'D=sa;Initial Catalog=FOBase;Data Source=OVK;Use Procedure for Pr' +
      'epare=1;Auto Translate=True;Packet Size=4096;Workstation ID=OVK;' +
      'Use Encryption for Data=False;Tag with column collation when pos' +
      'sible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object spGetCountryList: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'GO_GetCountryList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 24
    Top = 64
    object spGetCountryListID_Country: TAutoIncField
      FieldName = 'ID_Country'
      ReadOnly = True
    end
    object spGetCountryListName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spGetCountryListName_Eng: TStringField
      FieldName = 'Name_Eng'
      Size = 50
    end
    object spGetCountryListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetCountryListLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spGetCountryListatSite: TBooleanField
      FieldName = 'atSite'
    end
    object spGetCountryListatKP: TBooleanField
      FieldName = 'atKP'
    end
  end
  object dsGetCountryList: TDataSetProvider
    DataSet = spGetCountryList
    Constraints = True
    Left = 24
    Top = 112
  end
  object spGetCityListByCountry: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_GetCityListByCountry;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_Country'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 121
    Top = 56
    object spGetCityListByCountryID_City: TAutoIncField
      FieldName = 'ID_City'
      ReadOnly = True
    end
    object spGetCityListByCountryID_Country: TIntegerField
      FieldName = 'ID_Country'
    end
    object spGetCityListByCountryID_CityType: TIntegerField
      FieldName = 'ID_CityType'
    end
    object spGetCityListByCountryName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spGetCityListByCountryName_Eng: TStringField
      FieldName = 'Name_Eng'
      Size = 50
    end
    object spGetCityListByCountryDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetCityListByCountryLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spGetCityListByCountryTypeName: TStringField
      FieldName = 'TypeName'
      Size = 50
    end
    object spGetCityListByCountryatSite: TBooleanField
      FieldName = 'atSite'
    end
    object spGetCityListByCountryatKP: TBooleanField
      FieldName = 'atKP'
    end
    object spGetCityListByCountryCN_NAME: TStringField
      FieldName = 'CN_NAME'
      Size = 50
    end
    object spGetCityListByCountryCN_Name_Eng: TStringField
      FieldName = 'CN_Name_Eng'
      Size = 50
    end
  end
  object dsGetCityListByCountry: TDataSetProvider
    DataSet = spGetCityListByCountry
    Constraints = True
    Left = 120
    Top = 104
  end
  object spWhoIAm: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterOpen = spWhoIAmAfterOpen
    ProcedureName = 'UN_WhoIAm;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 104
    Top = 8
    object spWhoIAmFirstName: TStringField
      FieldName = 'FirstName'
    end
    object spWhoIAmSurName: TStringField
      FieldName = 'SurName'
    end
    object spWhoIAmLastName: TStringField
      FieldName = 'LastName'
      Size = 30
    end
    object spWhoIAmLogin: TWideStringField
      FieldName = 'Login'
      Size = 128
    end
    object spWhoIAmId_User: TAutoIncField
      FieldName = 'Id_User'
      ReadOnly = True
    end
  end
  object dsWhoIAm: TDataSetProvider
    DataSet = spWhoIAm
    Constraints = True
    Left = 144
    Top = 8
  end
  object spGetHotelListByCity: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_GetHotelListByCity;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_City'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 216
    Top = 72
    object spGetHotelListByCityID_Hotel: TAutoIncField
      FieldName = 'ID_Hotel'
      ReadOnly = True
    end
    object spGetHotelListByCityID_City: TIntegerField
      FieldName = 'ID_City'
    end
    object spGetHotelListByCityID_HotelType: TIntegerField
      FieldName = 'ID_HotelType'
    end
    object spGetHotelListByCityName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spGetHotelListByCityName_Eng: TStringField
      FieldName = 'Name_Eng'
      Size = 50
    end
    object spGetHotelListByCityDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetHotelListByCityLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spGetHotelListByCityTypeName: TStringField
      FieldName = 'TypeName'
    end
    object spGetHotelListByCityatSite: TBooleanField
      FieldName = 'atSite'
    end
    object spGetHotelListByCityatKP: TBooleanField
      FieldName = 'atKP'
    end
    object spGetHotelListByCityCN_NAME: TStringField
      FieldName = 'CN_NAME'
      Size = 50
    end
    object spGetHotelListByCityCN_Name_Eng: TStringField
      FieldName = 'CN_Name_Eng'
      Size = 50
    end
    object spGetHotelListByCityCT_NAME: TStringField
      FieldName = 'CT_NAME'
      Size = 50
    end
    object spGetHotelListByCityCT_Name_Eng: TStringField
      FieldName = 'CT_Name_Eng'
      Size = 50
    end
    object spGetHotelListByCityID_Country: TIntegerField
      FieldName = 'ID_Country'
    end
  end
  object dsGetHotelListByCity: TDataSetProvider
    DataSet = spGetHotelListByCity
    Constraints = True
    Left = 224
    Top = 120
  end
  object spGetCountryProp: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_GetCountryProp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_Country'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 391
    Top = 56
    object spGetCountryPropID_Country: TAutoIncField
      FieldName = 'ID_Country'
    end
    object spGetCountryPropName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spGetCountryPropName_Eng: TStringField
      FieldName = 'Name_Eng'
      Size = 50
    end
    object spGetCountryPropDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetCountryPropCode3: TStringField
      FieldName = 'Code3'
      Size = 3
    end
    object spGetCountryPropatSite: TBooleanField
      FieldName = 'atSite'
    end
    object spGetCountryPropatKP: TBooleanField
      FieldName = 'atKP'
    end
    object spGetCountryPropForeignPassport: TBooleanField
      FieldName = 'ForeignPassport'
    end
    object spGetCountryPropDescr: TMemoField
      FieldName = 'Descr'
      BlobType = ftMemo
    end
    object spGetCountryPropNeed: TIntegerField
      FieldName = 'Need'
    end
  end
  object spGetCityProp: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_GetCityProp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_City'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 487
    Top = 55
    object spGetCityPropID_City: TAutoIncField
      FieldName = 'ID_City'
      ReadOnly = True
    end
    object spGetCityPropName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spGetCityPropName_Eng: TStringField
      FieldName = 'Name_Eng'
      Size = 50
    end
    object spGetCityPropDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetCityPropCN_NAME: TStringField
      FieldName = 'CN_NAME'
      Size = 50
    end
    object spGetCityPropCN_Name_Eng: TStringField
      FieldName = 'CN_Name_Eng'
      Size = 50
    end
    object spGetCityPropCN_Deleted: TBooleanField
      FieldName = 'CN_Deleted'
    end
    object spGetCityPropatSite: TBooleanField
      FieldName = 'atSite'
    end
    object spGetCityPropatKP: TBooleanField
      FieldName = 'atKP'
    end
    object spGetCityPropID_CityType: TIntegerField
      FieldName = 'ID_CityType'
    end
    object spGetCityPropCode3: TStringField
      FieldName = 'Code3'
      Size = 3
    end
    object spGetCityPropTypeName: TStringField
      FieldName = 'TypeName'
      Size = 50
    end
    object spGetCityPropID_Country: TIntegerField
      FieldName = 'ID_Country'
    end
    object spGetCityPropDescr: TMemoField
      FieldName = 'Descr'
      BlobType = ftMemo
    end
  end
  object spGetHotelProp: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_GetHotelProp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_Hotel'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 579
    Top = 80
    object spGetHotelPropID_Hotel: TAutoIncField
      FieldName = 'ID_Hotel'
      ReadOnly = True
    end
    object spGetHotelPropName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spGetHotelPropName_Eng: TStringField
      FieldName = 'Name_Eng'
      Size = 50
    end
    object spGetHotelPropDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetHotelPropatSite: TBooleanField
      FieldName = 'atSite'
    end
    object spGetHotelPropatKP: TBooleanField
      FieldName = 'atKP'
    end
    object spGetHotelPropCN_NAME: TStringField
      FieldName = 'CN_NAME'
      Size = 50
    end
    object spGetHotelPropCN_Name_Eng: TStringField
      FieldName = 'CN_Name_Eng'
      Size = 50
    end
    object spGetHotelPropCN_Deleted: TBooleanField
      FieldName = 'CN_Deleted'
    end
    object spGetHotelPropCT_NAME: TStringField
      FieldName = 'CT_NAME'
      Size = 50
    end
    object spGetHotelPropCT_Name_Eng: TStringField
      FieldName = 'CT_Name_Eng'
      Size = 50
    end
    object spGetHotelPropCT_Deleted: TBooleanField
      FieldName = 'CT_Deleted'
    end
    object spGetHotelPropID_HotelType: TIntegerField
      FieldName = 'ID_HotelType'
    end
    object spGetHotelPropTypeName: TStringField
      FieldName = 'TypeName'
    end
    object spGetHotelPropID_Country: TIntegerField
      FieldName = 'ID_Country'
    end
    object spGetHotelPropID_City: TIntegerField
      FieldName = 'ID_City'
    end
    object spGetHotelPropDescr: TMemoField
      FieldName = 'Descr'
      BlobType = ftMemo
    end
  end
  object spGetCityPicList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_GetCityPicList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_City'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 487
    Top = 143
    object spGetCityPicListID_CityPic: TAutoIncField
      FieldName = 'ID_CityPic'
      ReadOnly = True
    end
    object spGetCityPicListID_City: TIntegerField
      FieldName = 'ID_City'
    end
    object spGetCityPicListName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object spGetCityPicListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetCityPicListPic: TBlobField
      FieldName = 'Pic'
      BlobType = ftBlob
    end
  end
  object spGetCountryPicList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_GetCountryPicList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_Country'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 398
    Top = 151
    object spGetCountryPicListID_CountryPic: TAutoIncField
      FieldName = 'ID_CountryPic'
      ReadOnly = True
    end
    object spGetCountryPicListID_Country: TIntegerField
      FieldName = 'ID_Country'
    end
    object spGetCountryPicListName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object spGetCountryPicListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetCountryPicListPic: TBlobField
      FieldName = 'Pic'
      BlobType = ftBlob
    end
  end
  object spGetHotelPicList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_GetHotelPicList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_Hotel'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 575
    Top = 191
    object spGetHotelPicListID_HotelPic: TAutoIncField
      FieldName = 'ID_HotelPic'
      ReadOnly = True
    end
    object spGetHotelPicListID_Hotel: TIntegerField
      FieldName = 'ID_Hotel'
    end
    object spGetHotelPicListName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object spGetHotelPicListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetHotelPicListPic: TBlobField
      FieldName = 'Pic'
      BlobType = ftBlob
    end
  end
  object spCountrySetState: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'GO_CountrySetState;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Country'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@atSite'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@atKP'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 400
    Top = 240
  end
  object spCitySetState: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'GO_CitySetState;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_City'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@atSite'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@atKP'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 488
    Top = 232
  end
  object spHotelSetState: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'GO_HotelSetState;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Hotel'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@atSite'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@atKP'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 576
    Top = 296
  end
  object spGetCountryComments: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_GetCountryComments;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_Country'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 398
    Top = 287
    object spGetCountryCommentsID_Country: TIntegerField
      FieldName = 'ID_Country'
    end
    object spGetCountryCommentsID_CountryComment: TAutoIncField
      FieldName = 'ID_CountryComment'
      ReadOnly = True
    end
    object spGetCountryCommentsComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object spGetCountryCommentsCommentType: TIntegerField
      FieldName = 'CommentType'
    end
    object spGetCountryCommentsDeleted: TBooleanField
      FieldName = 'Deleted'
    end
  end
  object spGetCityComments: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_GetCityComments;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_City'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 487
    Top = 279
    object spGetCityCommentsID_City: TIntegerField
      FieldName = 'ID_City'
    end
    object spGetCityCommentsID_CityComment: TAutoIncField
      FieldName = 'ID_CityComment'
      ReadOnly = True
    end
    object spGetCityCommentsComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object spGetCityCommentsCommentType: TIntegerField
      FieldName = 'CommentType'
    end
    object spGetCityCommentsDeleted: TBooleanField
      FieldName = 'Deleted'
    end
  end
  object spGetHotelComments: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_GetHotelComments;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_Hotel'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 575
    Top = 343
    object spGetHotelCommentsID_Hotel: TIntegerField
      FieldName = 'ID_Hotel'
    end
    object spGetHotelCommentsID_HotelComment: TAutoIncField
      FieldName = 'ID_HotelComment'
      ReadOnly = True
    end
    object spGetHotelCommentsComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object spGetHotelCommentsCommentType: TIntegerField
      FieldName = 'CommentType'
    end
    object spGetHotelCommentsDeleted: TBooleanField
      FieldName = 'Deleted'
    end
  end
  object spAddComment: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_AddCommentCity;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@CmntSign'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@Comment'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = '0'
      end>
    Left = 391
    Top = 8
  end
  object dsFindGO: TDataSetProvider
    DataSet = spFind
    Constraints = True
    Left = 656
    Top = 8
  end
  object spFind: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_FIND;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@CntName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = 'aa'
      end
      item
        Name = '@CtName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = 'aa'
      end
      item
        Name = '@HtlName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = 'aa'
      end
      item
        Name = '@DESCR'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = 'aa'
      end>
    Left = 607
    Top = 8
    object spFindType: TIntegerField
      FieldName = 'Type'
      ReadOnly = True
    end
    object spFindPATH: TStringField
      FieldName = 'PATH'
      ReadOnly = True
      Size = 255
    end
    object spFindID_Country: TIntegerField
      FieldName = 'ID_Country'
    end
    object spFindID_City: TIntegerField
      FieldName = 'ID_City'
      ReadOnly = True
    end
    object spFindID_Hotel: TIntegerField
      FieldName = 'ID_Hotel'
      ReadOnly = True
    end
    object spFindName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spFindName_Eng: TStringField
      FieldName = 'Name_Eng'
      Size = 50
    end
    object spFindDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spFindatKP: TBooleanField
      FieldName = 'atKP'
    end
    object spFindatSite: TBooleanField
      FieldName = 'atSite'
    end
  end
  object spGetComment: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_GetCommentCountry;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_Comment'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 471
    Top = 8
  end
  object spCountryAdd: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_CountryAdd;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Name_Eng'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Code3'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@atKP'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@atSite'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@ForeignPassport'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Descr'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 1073741823
        Value = Null
      end>
    Left = 399
    Top = 376
  end
  object spCityAdd: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_CityAdd;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Country'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Name_Eng'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Code3'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@id_CityType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@atKP'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@atSite'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Descr'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 1073741823
        Value = Null
      end>
    Left = 487
    Top = 368
  end
  object spHotelAdd: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_HotelAdd;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_City'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Name_Eng'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@ID_HotelType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@atKP'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@atSite'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Descr'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 1073741823
        Value = Null
      end>
    Left = 575
    Top = 440
  end
  object spCityTypeList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_CityTypeList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 31
    Top = 160
    object spCityTypeListid_CityType: TAutoIncField
      FieldName = 'id_CityType'
      ReadOnly = True
    end
    object spCityTypeListName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spCityTypeListShortName: TStringField
      FieldName = 'ShortName'
      Size = 10
    end
    object spCityTypeListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
  end
  object dsCityTypeList: TDataSetProvider
    DataSet = spCityTypeList
    Constraints = True
    Left = 32
    Top = 208
  end
  object spHotelTypeList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_HotelTypeList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 119
    Top = 152
    object spHotelTypeListID_HotelType: TAutoIncField
      FieldName = 'ID_HotelType'
      ReadOnly = True
    end
    object spHotelTypeListName: TStringField
      FieldName = 'Name'
    end
    object spHotelTypeListShortName: TStringField
      FieldName = 'ShortName'
      Size = 5
    end
    object spHotelTypeListLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spHotelTypeListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
  end
  object dsHotelTypeList: TDataSetProvider
    DataSet = spHotelTypeList
    Constraints = True
    Left = 120
    Top = 200
  end
  object dsGetCountryComments: TSQLUpdateDSProvider
    DataSet = spGetCountryComments
    Constraints = True
    OnUpdateError = SQLUpdateDSUpdateError
    ModifySQL.Strings = (
      'EXEC GO_EditCommentCountry'
      '  @ID_Comment = :ID_CountryComment,'
      '  @CmntSign = :CommentType,'
      '  @Deleted = :Deleted,'
      '  @Comment = :Comment')
    InsertSQL.Strings = (
      'EXEC GO_AddCommentCountry'
      '  @ID = :ID_Country,'
      '  @CmntSign = :CommentType,'
      '  @Deleted = :Deleted,'
      '  @Comment = :Comment')
    Left = 400
    Top = 332
  end
  object dsGetCountryPicList: TSQLUpdateDSProvider
    DataSet = spGetCountryPicList
    Constraints = True
    OnUpdateError = SQLUpdateDSUpdateError
    ModifySQL.Strings = (
      'EXEC GO_EditCountryPic'
      '  @ID_Pic = :ID_CountryPic,'
      '  @Name = :Name,'
      '  @Deleted = :Deleted,'
      '  @Pic = :Pic'
      ' ')
    InsertSQL.Strings = (
      'EXEC GO_AddCountryPic'
      '  @ID = :ID_Country,'
      '  @Name = :Name,'
      '  @Deleted = :Deleted,'
      '  @Pic = :Pic')
    Left = 400
    Top = 196
  end
  object dsGetCountryProp: TSQLUpdateDSProvider
    DataSet = spGetCountryProp
    Constraints = True
    OnUpdateError = SQLUpdateDSUpdateError
    ModifySQL.Strings = (
      'EXEC GO_CountryEdit'
      '  @ID = :ID_Country,'
      '  @Name = :Name,'
      '  @Name_Eng = :Name_Eng,'
      '  @Code3 = :Code3,'
      '  @atKP = :atKP, '
      '  @atSite = :atSite,'
      '  @Deleted = :Deleted,'
      '  @ForeignPassport = :ForeignPassport,'
      '  @Descr = :Descr'
      ' ')
    Left = 392
    Top = 101
  end
  object dsGetCityProp: TSQLUpdateDSProvider
    DataSet = spGetCityProp
    Constraints = True
    ModifySQL.Strings = (
      'EXEC GO_CityEdit'
      '  @ID = :ID_City,'
      '  @ID_Country = :ID_Country,'
      '  @id_CityType = :id_CityType,'
      '  @Name = :Name,'
      '  @Name_Eng = :Name_Eng,'
      '  @Code3 = :Code3,'
      '  @atKP = :atKP,'
      '  @atSite = :atSite,'
      '  @Deleted = :Deleted,'
      '  @Descr = :Descr'
      '')
    Left = 488
    Top = 99
  end
  object dsGetHotelProp: TSQLUpdateDSProvider
    DataSet = spGetHotelProp
    Constraints = True
    ModifySQL.Strings = (
      'EXEC GO_HotelEdit'
      '  @ID = :ID_Hotel,'
      '  @ID_City = :ID_City,'
      '  @ID_HotelType = :ID_HotelType,'
      '  @Name = :Name,'
      '  @Name_Eng = :Name_Eng,'
      '  @atKP = :atKP,'
      '  @atSite = :atSite,'
      '  @Deleted = :Deleted,'
      '  @Descr = :Descr'
      ' ')
    Left = 584
    Top = 136
  end
  object dsGetCityComments: TSQLUpdateDSProvider
    DataSet = spGetCityComments
    Constraints = True
    ModifySQL.Strings = (
      'EXEC GO_EditCommentCity'
      '  @ID_Comment = :ID_CityComment,'
      '  @CmntSign = :CommentType,'
      '  @Deleted = :Deleted,'
      '  @Comment = :Comment'
      ' ')
    InsertSQL.Strings = (
      'EXEC GO_AddCommentCity'
      '  @ID = :ID_City,'
      '  @CmntSign = :CommentType,'
      '  @Deleted = :Deleted,'
      '  @Comment = :Comment')
    Left = 488
    Top = 325
  end
  object dsGetHotelComments: TSQLUpdateDSProvider
    DataSet = spGetHotelComments
    Constraints = True
    ModifySQL.Strings = (
      'EXEC GO_EditCommentHotel'
      '  @ID_Comment = :ID_HotelComment,'
      '  @CmntSign = :CommentType,'
      '  @Deleted = :Deleted,'
      '  @Comment = :Comment'
      ' ')
    InsertSQL.Strings = (
      'EXEC GO_AddCommentHotel'
      '  @ID = :ID_Hotel,'
      '  @CmntSign = :CommentType,'
      '  @Deleted = :Deleted,'
      '  @Comment = :Comment')
    Left = 576
    Top = 392
  end
  object dsGetCityPicList: TSQLUpdateDSProvider
    DataSet = spGetCityPicList
    Constraints = True
    OnUpdateError = SQLUpdateDSUpdateError
    ModifySQL.Strings = (
      'EXEC GO_EditCityPic'
      '  @ID_Pic = :ID_CityPic,'
      '  @Name = :Name,'
      '  @Deleted = :Deleted,'
      '  @Pic = :Pic'
      ' ')
    InsertSQL.Strings = (
      'EXEC GO_AddCityPic'
      '  @ID = :ID_City,'
      '  @Name = :Name,'
      '  @Deleted = :Deleted,'
      '  @Pic = :Pic')
    Left = 488
    Top = 188
  end
  object dsGetHotelPicList: TSQLUpdateDSProvider
    DataSet = spGetHotelPicList
    Constraints = True
    OnUpdateError = SQLUpdateDSUpdateError
    ModifySQL.Strings = (
      'EXEC GO_EditHotelPic'
      '  @ID_Pic = :ID_HotelPic,'
      '  @Name = :Name,'
      '  @Deleted = :Deleted,'
      '  @Pic = :Pic'
      ' ')
    InsertSQL.Strings = (
      'EXEC GO_AddHotelPic'
      '  @ID = :ID_Hotel,'
      '  @Name = :Name,'
      '  @Deleted = :Deleted,'
      '  @Pic = :Pic')
    Left = 576
    Top = 240
  end
  object spGetMsgList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FRM_GetMsgList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 32
    Top = 438
    object spGetMsgListID_Message: TAutoIncField
      FieldName = 'ID_Message'
      ReadOnly = True
    end
    object spGetMsgListSubj: TStringField
      FieldName = 'Subj'
      Size = 50
    end
    object spGetMsgListBody: TStringField
      FieldName = 'Body'
      Size = 255
    end
    object spGetMsgListID_Parent: TIntegerField
      FieldName = 'ID_Parent'
    end
    object spGetMsgListReaded: TBooleanField
      FieldName = 'Readed'
    end
    object spGetMsgListMarked: TBooleanField
      FieldName = 'Marked'
    end
    object spGetMsgListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetMsgListMsgDate: TDateTimeField
      FieldName = 'MsgDate'
    end
    object spGetMsgListID_Client: TIntegerField
      FieldName = 'ID_Client'
    end
    object spGetMsgListID_User: TIntegerField
      FieldName = 'ID_User'
    end
    object spGetMsgListAuthor: TStringField
      FieldName = 'Author'
      Size = 72
    end
  end
  object dsGetMsgList: TSQLUpdateDSProvider
    DataSet = spGetMsgList
    Constraints = True
    Left = 32
    Top = 485
  end
  object spGetMessage: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FRM_GetMessage;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_Message'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 32
    Top = 256
    object spGetMessageID_Message: TAutoIncField
      FieldName = 'ID_Message'
      ReadOnly = True
    end
    object spGetMessageSubj: TStringField
      FieldName = 'Subj'
      Size = 50
    end
    object spGetMessageBody: TStringField
      FieldName = 'Body'
      Size = 255
    end
    object spGetMessageID_Parent: TIntegerField
      FieldName = 'ID_Parent'
    end
    object spGetMessageReaded: TBooleanField
      FieldName = 'Readed'
    end
    object spGetMessageMarked: TBooleanField
      FieldName = 'Marked'
    end
    object spGetMessageDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetMessageMsgDate: TDateTimeField
      FieldName = 'MsgDate'
    end
    object spGetMessageID_Client: TIntegerField
      FieldName = 'ID_Client'
    end
    object spGetMessageID_User: TIntegerField
      FieldName = 'ID_User'
    end
    object spGetMessageAuthor: TStringField
      FieldName = 'Author'
      ReadOnly = True
      Size = 72
    end
  end
  object dsGetMessage: TSQLUpdateDSProvider
    DataSet = spGetMessage
    Constraints = True
    Left = 32
    Top = 301
  end
  object spMessageAdd: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FRM_MessageAdd;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Subj'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Body'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1000
        Value = Null
      end
      item
        Name = '@ID_Parent'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 31
    Top = 346
  end
  object spMessageEdit: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FRM_MessageEdit;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Message'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Subj'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Body'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1000
        Value = Null
      end
      item
        Name = '@ID_Parent'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Readed'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Marked'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 31
    Top = 392
  end
  object spGetAdvice: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'Adv_GetAdvice;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 90
    Top = 273
    object spGetAdviceID_Advice: TAutoIncField
      FieldName = 'ID_Advice'
      ReadOnly = True
    end
    object spGetAdviceSubj: TStringField
      FieldName = 'Subj'
      Size = 50
    end
    object spGetAdviceBody: TMemoField
      FieldName = 'Body'
      BlobType = ftMemo
    end
    object spGetAdviceReaded: TBooleanField
      FieldName = 'Readed'
    end
    object spGetAdviceMarked: TBooleanField
      FieldName = 'Marked'
    end
    object spGetAdviceDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetAdviceAdvDate: TDateTimeField
      FieldName = 'AdvDate'
    end
    object spGetAdviceid_Advice_Type: TIntegerField
      FieldName = 'id_Advice_Type'
    end
    object spGetAdviceName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object dsGetAdvice: TSQLUpdateDSProvider
    DataSet = spGetAdvice
    Constraints = True
    ModifySQL.Strings = (
      'EXEC'
      '  Adv_AdviceEdit'
      '  @ID_Advice = :ID_Advice,'
      '  @Subj = :Subj,'
      '  @id_Advice_Type = :id_Advice_Type,'
      '  @Body = :Body,'
      '  @Deleted = :Deleted,'
      '  @Readed = :Readed,'
      '  @Marked = :Marked')
    InsertSQL.Strings = (
      'EXEC'
      '  Adv_AdviceAdd'
      '  @Subj = :Subj,'
      '  @id_Advice_Type = :id_Advice_Type,'
      '  @Body = :Body')
    Left = 90
    Top = 318
  end
  object spAdviceAdd: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'Adv_AdviceAdd;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Subj'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_Advice_Type'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Body'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 1073741823
        Value = Null
      end>
    Left = 89
    Top = 363
  end
  object spAdviceEdit: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'Adv_AdviceEdit;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Advice'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Subj'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_Advice_Type'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Readed'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Marked'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Body'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 1073741823
        Value = Null
      end>
    Left = 89
    Top = 409
  end
  object spGetAdviceList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'Adv_GetAdviceList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end
      item
        Name = '@id_Advice_Type'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 90
    Top = 454
    object spGetAdviceListID_Advice: TAutoIncField
      FieldName = 'ID_Advice'
      ReadOnly = True
    end
    object spGetAdviceListSubj: TStringField
      FieldName = 'Subj'
      Size = 50
    end
    object spGetAdviceListBody: TMemoField
      FieldName = 'Body'
      BlobType = ftMemo
    end
    object spGetAdviceListReaded: TBooleanField
      FieldName = 'Readed'
    end
    object spGetAdviceListMarked: TBooleanField
      FieldName = 'Marked'
    end
    object spGetAdviceListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetAdviceListAdvDate: TDateTimeField
      FieldName = 'AdvDate'
    end
    object spGetAdviceListid_Advice_Type: TIntegerField
      FieldName = 'id_Advice_Type'
    end
  end
  object dsGetAdviceList: TSQLUpdateDSProvider
    DataSet = spGetAdviceList
    Constraints = True
    Left = 90
    Top = 501
  end
  object spAdviceFind: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'ADV_AdviceFind;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Subj'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = 'hndf'
      end
      item
        Name = '@Body'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = 'hndf'
      end
      item
        Name = '@Readed'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end
      item
        Name = '@Marked'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end
      item
        Name = '@DateFrom'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@DateTo'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end>
    Left = 90
    Top = 548
    object spAdviceFindID_Advice: TAutoIncField
      FieldName = 'ID_Advice'
      ReadOnly = True
    end
    object spAdviceFindSubj: TStringField
      FieldName = 'Subj'
      Size = 50
    end
    object spAdviceFindBody: TMemoField
      FieldName = 'Body'
      BlobType = ftMemo
    end
    object spAdviceFindReaded: TBooleanField
      FieldName = 'Readed'
    end
    object spAdviceFindMarked: TBooleanField
      FieldName = 'Marked'
    end
    object spAdviceFindDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spAdviceFindAdvDate: TDateTimeField
      FieldName = 'AdvDate'
    end
    object spAdviceFindid_Advice_Type: TIntegerField
      FieldName = 'id_Advice_Type'
    end
    object spAdviceFindName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object dsAdviceFind: TSQLUpdateDSProvider
    DataSet = spAdviceFind
    Constraints = True
    Left = 90
    Top = 596
  end
  object spMessageFind: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'FRM_MessageFind;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Subj'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = 'tfhdf'
      end
      item
        Name = '@Body'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = 'tfhdf'
      end
      item
        Name = '@Readed'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = True
      end
      item
        Name = '@Marked'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = True
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = True
      end
      item
        Name = '@DateFrom'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@DateTo'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end>
    Left = 32
    Top = 534
    object AutoIncField2: TAutoIncField
      FieldName = 'ID_Message'
      ReadOnly = True
    end
    object StringField2: TStringField
      FieldName = 'Subj'
      Size = 50
    end
    object StringField3: TStringField
      FieldName = 'Body'
      Size = 255
    end
    object IntegerField1: TIntegerField
      FieldName = 'ID_Parent'
    end
    object BooleanField4: TBooleanField
      FieldName = 'Readed'
    end
    object BooleanField5: TBooleanField
      FieldName = 'Marked'
    end
    object BooleanField6: TBooleanField
      FieldName = 'Deleted'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'MsgDate'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_Client'
    end
    object IntegerField3: TIntegerField
      FieldName = 'ID_User'
    end
    object StringField4: TStringField
      FieldName = 'Author'
      Size = 72
    end
  end
  object dsMessageFind: TSQLUpdateDSProvider
    DataSet = spMessageFind
    Constraints = True
    Left = 32
    Top = 581
  end
  object spGetNewz: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'NW_GetNewz;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 138
    Top = 249
    object spGetNewzID_Newz: TAutoIncField
      FieldName = 'ID_Newz'
      ReadOnly = True
    end
    object spGetNewzSubj: TStringField
      FieldName = 'Subj'
      Size = 50
    end
    object spGetNewzBody: TMemoField
      FieldName = 'Body'
      BlobType = ftMemo
    end
    object spGetNewzReaded: TBooleanField
      FieldName = 'Readed'
    end
    object spGetNewzMarked: TBooleanField
      FieldName = 'Marked'
    end
    object spGetNewzDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetNewzNWDate: TDateTimeField
      FieldName = 'NWDate'
    end
  end
  object dsGetNewz: TSQLUpdateDSProvider
    DataSet = spGetNewz
    Constraints = True
    Left = 138
    Top = 294
  end
  object spNewzAdd: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'NW_NewzAdd;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Subj'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Body'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 1073741823
        Value = Null
      end>
    Left = 137
    Top = 339
  end
  object spNewzEdit: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'NW_NewzEdit;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Newz'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Subj'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Body'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1000
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Readed'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Marked'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 137
    Top = 385
  end
  object spGetNewzList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'NW_GetNewzList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 138
    Top = 430
    object spGetNewzListID_Newz: TAutoIncField
      FieldName = 'ID_Newz'
      ReadOnly = True
    end
    object spGetNewzListSubj: TStringField
      FieldName = 'Subj'
      Size = 50
    end
    object spGetNewzListBody: TMemoField
      FieldName = 'Body'
      BlobType = ftMemo
    end
    object spGetNewzListReaded: TBooleanField
      FieldName = 'Readed'
    end
    object spGetNewzListMarked: TBooleanField
      FieldName = 'Marked'
    end
    object spGetNewzListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spGetNewzListNWDate: TDateTimeField
      FieldName = 'NWDate'
    end
  end
  object dsGetNewzList: TSQLUpdateDSProvider
    DataSet = spGetNewzList
    Constraints = True
    Left = 138
    Top = 477
  end
  object spNewsFind: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'NW_NewzFind;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Subj'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = '0'
      end
      item
        Name = '@Body'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = '0'
      end
      item
        Name = '@Readed'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end
      item
        Name = '@Marked'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end
      item
        Name = '@DateFrom'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@DateTo'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end>
    Left = 138
    Top = 524
    object spNewsFindID_Newz: TAutoIncField
      FieldName = 'ID_Newz'
      ReadOnly = True
    end
    object spNewsFindSubj: TStringField
      FieldName = 'Subj'
      Size = 50
    end
    object spNewsFindBody: TMemoField
      FieldName = 'Body'
      BlobType = ftMemo
    end
    object spNewsFindReaded: TBooleanField
      FieldName = 'Readed'
    end
    object spNewsFindMarked: TBooleanField
      FieldName = 'Marked'
    end
    object spNewsFindDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spNewsFindNWDate: TDateTimeField
      FieldName = 'NWDate'
    end
  end
  object dsNewsFind: TSQLUpdateDSProvider
    DataSet = spNewsFind
    Constraints = True
    Left = 138
    Top = 572
  end
  object dsTourGetProp: TSQLUpdateDSProvider
    DataSet = spTourGetProp
    Constraints = True
    OnUpdateError = SQLUpdateDSUpdateError
    ModifySQL.Strings = (
      '/*'
      'EXEC TR_TourEdit'
      '  @ID_Tour = :ID_Tour,'
      '  @Name = :Name,'
      '  @id_FoodType = :id_FoodType,'
      '  @id_hotel = :id_hotel,'
      '  @DateFrom = :DateFrom,'
      '  @DateTo = :DateTo,'
      '  @offer_num = :offer_num,'
      '  @sngl = :sngl,'
      '  @dbl = :dbl,'
      '  @trpl = :trpl,'
      '  @chld = :chld,'
      '  @chld2 = :chld2,'
      '  @adult3 = :adult3,'
      '  @adult4 = :adult4,'
      '  @infant = :infant,'
      '  @atKP = :atKP, '
      '  @atSite = :atSite,'
      '  @Deleted = :Deleted,'
      '  @Descr = :Descr'
      ' '
      ' */')
    Left = 680
    Top = 104
  end
  object spTourCommentsGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'TR_CommentsGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_Tour'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 687
    Top = 351
    object spTourCommentsGetListID_Tour: TIntegerField
      FieldName = 'ID_Tour'
    end
    object spTourCommentsGetListID_TourComment: TAutoIncField
      FieldName = 'ID_TourComment'
      ReadOnly = True
    end
    object spTourCommentsGetListComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object spTourCommentsGetListCommentType: TIntegerField
      FieldName = 'CommentType'
    end
    object spTourCommentsGetListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
  end
  object dsTourCommentsGetList: TSQLUpdateDSProvider
    DataSet = spTourCommentsGetList
    Constraints = True
    ModifySQL.Strings = (
      'EXEC TR_CommentEdit'
      '  @ID_Comment = :ID_TourComment,'
      '  @CmntSign = :CommentType,'
      '  @Deleted = :Deleted,'
      '  @Comment = :Comment'
      ' ')
    InsertSQL.Strings = (
      'EXEC TR_CommentAdd'
      '  @ID = :ID_Tour,'
      '  @CmntSign = :CommentType,'
      '  @Deleted = :Deleted,'
      '  @Comment = :Comment')
    Left = 688
    Top = 400
  end
  object spTourPicGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'TR_PicGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_Tour'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 682
    Top = 151
    object spTourPicGetListID_TourPic: TAutoIncField
      FieldName = 'ID_TourPic'
      ReadOnly = True
    end
    object spTourPicGetListID_Tour: TIntegerField
      FieldName = 'ID_Tour'
    end
    object spTourPicGetListName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object spTourPicGetListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spTourPicGetListPic: TBlobField
      FieldName = 'Pic'
      BlobType = ftBlob
    end
  end
  object dsTourPicGetList: TSQLUpdateDSProvider
    DataSet = spTourPicGetList
    Constraints = True
    OnUpdateError = SQLUpdateDSUpdateError
    ModifySQL.Strings = (
      'EXEC TR_PicEdit'
      '  @ID_Pic = :ID_TourPic,'
      '  @Name = :Name,'
      '  @Deleted = :Deleted,'
      '  @Pic = :Pic'
      ' ')
    InsertSQL.Strings = (
      'EXEC TR_PicAdd'
      '  @ID = :ID_Tour,'
      '  @Name = :Name,'
      '  @Deleted = :Deleted,'
      '  @Pic = :Pic')
    Left = 683
    Top = 198
  end
  object spTourAdd: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'TR_TourAdd;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_TourType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@DateFrom'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@DateTo'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@offer_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Id_Currency'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@sngl'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@dbl'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@trpl'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@chld'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@chld2'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@adult3'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@adult4'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@infant'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@atKP'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@atSite'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@id_Provider'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Descr'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 1073741823
        Value = Null
      end>
    Left = 695
    Top = 448
  end
  object spFoodTypeGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'TR_FoodTypeGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 695
    Top = 504
    object spFoodTypeGetListid_FoodType: TAutoIncField
      FieldName = 'id_FoodType'
      ReadOnly = True
    end
    object spFoodTypeGetListShortName: TStringField
      FieldName = 'ShortName'
      Size = 50
    end
    object spFoodTypeGetListName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object spFoodTypeGetListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
  end
  object dsFoodTypeGetList: TDataSetProvider
    DataSet = spFoodTypeGetList
    Constraints = True
    Left = 696
    Top = 552
  end
  object spPriceGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'TR_PriceGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 607
    Top = 544
    object spPriceGetListid_TourPriceValue: TAutoIncField
      FieldName = 'id_TourPriceValue'
      ReadOnly = True
    end
    object spPriceGetListid_Tour: TIntegerField
      FieldName = 'id_Tour'
    end
    object spPriceGetListid_TourPriceType: TIntegerField
      FieldName = 'id_TourPriceType'
    end
    object spPriceGetListPrice: TFloatField
      FieldName = 'Price'
    end
    object spPriceGetListPriceName: TStringField
      FieldName = 'PriceName'
      Size = 50
    end
    object spPriceGetListPriceShortName: TStringField
      FieldName = 'PriceShortName'
    end
  end
  object dsPriceGetList: TSQLUpdateDSProvider
    DataSet = spPriceGetList
    Constraints = True
    OnUpdateError = SQLUpdateDSUpdateError
    ModifySQL.Strings = (
      'EXEC TR_PriceEdit'
      '  @id_TourPriceValue = :id_TourPriceValue,'
      '  @id_TourPriceType = :id_TourPriceType,'
      '  @Price = :Price'
      ' '
      ' ')
    InsertSQL.Strings = (
      'EXEC TR_PriceAdd'
      '  @id_Tour = :id_Tour,'
      '  @id_TourPriceType = :id_TourPriceType,'
      '  @Price = :Price'
      ' ')
    DeleteSQL.Strings = (
      'EXEC TR_PriceDel'
      '  @id_TourPriceValue = :id_TourPriceValue')
    Left = 608
    Top = 592
  end
  object spPriceTypeGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'TR_PriceTypeGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Hide'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 543
    Top = 544
    object spPriceTypeGetListid_TourPriceType: TAutoIncField
      FieldName = 'id_TourPriceType'
      ReadOnly = True
    end
    object spPriceTypeGetListName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spPriceTypeGetListShortName: TStringField
      FieldName = 'ShortName'
    end
    object spPriceTypeGetListHide: TBooleanField
      FieldName = 'Hide'
    end
  end
  object dsPriceTypeGetList: TDataSetProvider
    DataSet = spPriceTypeGetList
    Constraints = True
    Left = 544
    Top = 600
  end
  object spHotelGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'TR_HotelGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 495
    Top = 528
    object spHotelGetListID_HotelList: TAutoIncField
      FieldName = 'ID_HotelList'
      ReadOnly = True
    end
    object spHotelGetListid_Tour: TIntegerField
      FieldName = 'id_Tour'
    end
    object spHotelGetListid_Hotel: TIntegerField
      FieldName = 'id_Hotel'
    end
    object spHotelGetListDateFrom: TDateTimeField
      FieldName = 'DateFrom'
    end
    object spHotelGetListDateTo: TDateTimeField
      FieldName = 'DateTo'
    end
    object spHotelGetListID_FoodType: TIntegerField
      FieldName = 'ID_FoodType'
    end
    object spHotelGetListFT_Name: TStringField
      FieldName = 'FT_Name'
      Size = 30
    end
    object spHotelGetListFT_ShortName: TStringField
      FieldName = 'FT_ShortName'
      Size = 50
    end
    object spHotelGetListName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spHotelGetListID_HotelType: TIntegerField
      FieldName = 'ID_HotelType'
    end
    object spHotelGetListHotelTypeName: TStringField
      FieldName = 'HotelTypeName'
    end
    object spHotelGetListHotelTypeShortName: TStringField
      FieldName = 'HotelTypeShortName'
      Size = 5
    end
    object spHotelGetListID_Country: TIntegerField
      FieldName = 'ID_Country'
    end
    object spHotelGetListCN_NAME: TStringField
      FieldName = 'CN_NAME'
      Size = 50
    end
    object spHotelGetListCN_Name_Eng: TStringField
      FieldName = 'CN_Name_Eng'
      Size = 50
    end
    object spHotelGetListID_City: TIntegerField
      FieldName = 'ID_City'
    end
    object spHotelGetListCT_NAME: TStringField
      FieldName = 'CT_NAME'
      Size = 50
    end
    object spHotelGetListCT_Name_Eng: TStringField
      FieldName = 'CT_Name_Eng'
      Size = 50
    end
  end
  object dsHotelGetList: TSQLUpdateDSProvider
    DataSet = spHotelGetList
    Constraints = True
    OnUpdateError = SQLUpdateDSUpdateError
    ModifySQL.Strings = (
      'EXEC TR_HotelEdit'
      '  @ID_HotelList = :ID_HotelList,'
      '  @id_Tour = :id_Tour,'
      '  @id_Hotel = :id_Hotel,'
      '  @ID_FoodType = :ID_FoodType,'
      '  @DateFrom = :DateFrom,'
      '  @DateTo = :DateTo'
      ' '
      ' ')
    InsertSQL.Strings = (
      'EXEC TR_HotelAdd'
      '  @id_Tour = :id_Tour,'
      '  @id_Hotel = :id_Hotel,'
      '  @ID_FoodType = :ID_FoodType,'
      '  @DateFrom = :DateFrom,'
      '  @DateTo = :DateTo'
      ''
      ' ')
    DeleteSQL.Strings = (
      'EXEC TR_HotelDel'
      '  @ID_HotelList = :ID_HotelList'
      ' ')
    Left = 496
    Top = 584
  end
  object spTourEdit: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'TR_TourEdit;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@ID_Tour'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@id_TourType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@DateFrom'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@DateTo'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@offer_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Id_Currency'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@sngl'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@dbl'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@trpl'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@chld'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@chld2'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@adult3'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@adult4'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@infant'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@atKP'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@atSite'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@id_Provider'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Descr'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 1073741823
        Value = Null
      end>
    Left = 743
    Top = 456
  end
  object spTourTypeGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'TR_TourTypeGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 783
    Top = 592
    object spTourTypeGetListid_TourType: TAutoIncField
      FieldName = 'id_TourType'
      ReadOnly = True
    end
    object spTourTypeGetListShortName: TStringField
      FieldName = 'ShortName'
      Size = 50
    end
    object spTourTypeGetListName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object spTourTypeGetListlast_updated: TBytesField
      FieldName = 'last_updated'
      ReadOnly = True
      Size = 8
    end
    object spTourTypeGetListHide: TBooleanField
      FieldName = 'Hide'
    end
    object spTourTypeGetListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spTourTypeGetListForOrder: TIntegerField
      FieldName = 'ForOrder'
    end
    object spTourTypeGetListMultiHotel: TBooleanField
      FieldName = 'MultiHotel'
    end
  end
  object dsTourTypeGetList: TDataSetProvider
    DataSet = spTourTypeGetList
    Constraints = True
    Left = 784
    Top = 640
  end
  object spTourGetProp: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'TR_TourGetProp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 679
    Top = 56
    object spTourGetPropid_Tour: TAutoIncField
      FieldName = 'id_Tour'
      ReadOnly = True
    end
    object spTourGetPropid_TourType: TIntegerField
      FieldName = 'id_TourType'
    end
    object spTourGetPropDateFrom: TDateTimeField
      FieldName = 'DateFrom'
    end
    object spTourGetPropDateTo: TDateTimeField
      FieldName = 'DateTo'
    end
    object spTourGetPropoffer_num: TStringField
      FieldName = 'offer_num'
      Size = 50
    end
    object spTourGetPropsngl: TFloatField
      FieldName = 'sngl'
    end
    object spTourGetPropdbl: TFloatField
      FieldName = 'dbl'
    end
    object spTourGetProptrpl: TFloatField
      FieldName = 'trpl'
    end
    object spTourGetPropchld: TFloatField
      FieldName = 'chld'
    end
    object spTourGetPropchld2: TFloatField
      FieldName = 'chld2'
    end
    object spTourGetPropadult3: TFloatField
      FieldName = 'adult3'
    end
    object spTourGetPropadult4: TFloatField
      FieldName = 'adult4'
    end
    object spTourGetPropinfant: TFloatField
      FieldName = 'infant'
    end
    object spTourGetPropLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spTourGetPropDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spTourGetPropatKP: TBooleanField
      FieldName = 'atKP'
    end
    object spTourGetPropatSite: TBooleanField
      FieldName = 'atSite'
    end
    object spTourGetPropTourTypeShortName: TStringField
      FieldName = 'TourTypeShortName'
      Size = 50
    end
    object spTourGetPropTourTypeName: TStringField
      FieldName = 'TourTypeName'
      Size = 30
    end
    object spTourGetPropDescr: TMemoField
      FieldName = 'Descr'
      BlobType = ftMemo
    end
    object spTourGetPropId_Currency: TIntegerField
      FieldName = 'Id_Currency'
    end
    object spTourGetPropCurrencyName: TStringField
      FieldName = 'CurrencyName'
      Size = 30
    end
    object spTourGetPropName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object spTourGetPropid_Provider: TIntegerField
      FieldName = 'id_Provider'
    end
    object spTourGetPropProviderName: TStringField
      FieldName = 'ProviderName'
      Size = 50
    end
    object spTourGetPropSnglUDS: TFloatField
      FieldName = 'SnglUDS'
      ReadOnly = True
    end
    object spTourGetPropDblUDS: TFloatField
      FieldName = 'DblUDS'
      ReadOnly = True
    end
    object spTourGetPropTrplUDS: TFloatField
      FieldName = 'TrplUDS'
      ReadOnly = True
    end
    object spTourGetPropchldUDS: TFloatField
      FieldName = 'chldUDS'
      ReadOnly = True
    end
    object spTourGetPropchld2UDS: TFloatField
      FieldName = 'chld2UDS'
      ReadOnly = True
    end
    object spTourGetPropadult3UDS: TFloatField
      FieldName = 'adult3UDS'
      ReadOnly = True
    end
    object spTourGetPropadult4UDS: TFloatField
      FieldName = 'adult4UDS'
      ReadOnly = True
    end
    object spTourGetPropinfantUDS: TFloatField
      FieldName = 'infantUDS'
      ReadOnly = True
    end
  end
  object spMessageGetListForUser: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'MSG_MessageGetListForUser;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 383
    Top = 432
    object spMessageGetListForUserid_Message: TAutoIncField
      FieldName = 'id_Message'
      ReadOnly = True
    end
    object spMessageGetListForUserid_UserFrom: TIntegerField
      FieldName = 'id_UserFrom'
    end
    object spMessageGetListForUserid_UserTo: TIntegerField
      FieldName = 'id_UserTo'
    end
    object spMessageGetListForUserSubj: TStringField
      FieldName = 'Subj'
      Size = 50
    end
    object spMessageGetListForUserBody: TStringField
      FieldName = 'Body'
      Size = 5000
    end
    object spMessageGetListForUserReaded: TBooleanField
      FieldName = 'Readed'
    end
    object spMessageGetListForUserMarked: TBooleanField
      FieldName = 'Marked'
    end
    object spMessageGetListForUserDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spMessageGetListForUserMessageDate: TDateTimeField
      FieldName = 'MessageDate'
    end
    object spMessageGetListForUserUserFromFirstName: TStringField
      FieldName = 'UserFromFirstName'
    end
    object spMessageGetListForUserUserFromSurName: TStringField
      FieldName = 'UserFromSurName'
    end
    object spMessageGetListForUserUserFromLastName: TStringField
      FieldName = 'UserFromLastName'
      Size = 30
    end
  end
  object dsMessageGetListForUser: TDataSetProvider
    DataSet = spMessageGetListForUser
    Constraints = True
    Left = 376
    Top = 472
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'GO_AddCommentCity;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@CmntSign'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@Comment'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = '0'
      end>
    Left = 315
    Top = 24
  end
  object spMessageGetProp: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'MSG_MessageGetProp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Id_Message'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 487
    Top = 424
    object AutoIncField1: TAutoIncField
      FieldName = 'id_Message'
      ReadOnly = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'id_UserFrom'
    end
    object IntegerField5: TIntegerField
      FieldName = 'id_UserTo'
    end
    object StringField1: TStringField
      FieldName = 'Subj'
      Size = 50
    end
    object StringField5: TStringField
      FieldName = 'Body'
      Size = 5000
    end
    object BooleanField1: TBooleanField
      FieldName = 'Readed'
    end
    object BooleanField2: TBooleanField
      FieldName = 'Marked'
    end
    object BooleanField3: TBooleanField
      FieldName = 'Deleted'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'MessageDate'
    end
    object StringField6: TStringField
      FieldName = 'UserFromFirstName'
    end
    object StringField7: TStringField
      FieldName = 'UserFromSurName'
    end
    object StringField8: TStringField
      FieldName = 'UserFromLastName'
      Size = 30
    end
  end
  object dsMessageGetProp: TDataSetProvider
    DataSet = spMessageGetProp
    Constraints = True
    Left = 488
    Top = 472
  end
  object spUserGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'MSG_UserGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 447
    Top = 594
    object spUserGetListId_User: TAutoIncField
      FieldName = 'Id_User'
      ReadOnly = True
    end
    object spUserGetListFirstName: TStringField
      FieldName = 'FirstName'
    end
    object spUserGetListSurName: TStringField
      FieldName = 'SurName'
    end
    object spUserGetListLastName: TStringField
      FieldName = 'LastName'
      Size = 30
    end
    object spUserGetListTel: TStringField
      FieldName = 'Tel'
    end
    object spUserGetListEMail: TStringField
      FieldName = 'EMail'
    end
    object spUserGetListDescription: TStringField
      FieldName = 'Description'
      Size = 100
    end
  end
  object dsUserGetList: TSQLUpdateDSProvider
    DataSet = spUserGetList
    Constraints = True
    OnUpdateError = SQLUpdateDSUpdateError
    ModifySQL.Strings = (
      'EXEC TR_HotelEdit'
      '  @ID_HotelList = :ID_HotelList,'
      '  @id_Tour = :id_Tour,'
      '  @id_Hotel = :id_Hotel,'
      '  @ID_FoodType = :ID_FoodType,'
      '  @DateFrom = :DateFrom,'
      '  @DateTo = :DateTo'
      ' '
      ' ')
    InsertSQL.Strings = (
      'EXEC TR_HotelAdd'
      '  @id_Tour = :id_Tour,'
      '  @id_Hotel = :id_Hotel,'
      '  @ID_FoodType = :ID_FoodType,'
      '  @DateFrom = :DateFrom,'
      '  @DateTo = :DateTo'
      ''
      ' ')
    DeleteSQL.Strings = (
      'EXEC TR_HotelDel'
      '  @ID_HotelList = :ID_HotelList'
      ' ')
    Left = 448
    Top = 642
  end
  object dsServiseTypeGetList: TDataSetProvider
    DataSet = spServiseTypeGetList
    Constraints = True
    Left = 784
    Top = 64
  end
  object spServiseGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'SVC_ServiseGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_ServiceType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 783
    Top = 112
    object spServiseGetListid_Service: TAutoIncField
      FieldName = 'id_Service'
      ReadOnly = True
    end
    object spServiseGetListid_Provider: TIntegerField
      FieldName = 'id_Provider'
    end
    object spServiseGetListName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spServiseGetListShortName: TStringField
      FieldName = 'ShortName'
      Size = 30
    end
    object spServiseGetListPrice: TFloatField
      FieldName = 'Price'
    end
    object spServiseGetListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spServiseGetListHide: TBooleanField
      FieldName = 'Hide'
    end
    object spServiseGetListProviderName: TStringField
      FieldName = 'ProviderName'
      Size = 50
    end
    object spServiseGetListid_ServiceType: TIntegerField
      FieldName = 'id_ServiceType'
    end
    object spServiseGetListatKP: TBooleanField
      FieldName = 'atKP'
    end
    object spServiseGetListatSite: TBooleanField
      FieldName = 'atSite'
    end
    object spServiseGetListId_Currency: TIntegerField
      FieldName = 'Id_Currency'
    end
    object spServiseGetListCurrencyName: TStringField
      FieldName = 'CurrencyName'
      Size = 30
    end
    object spServiseGetListUSDPrice: TFloatField
      FieldName = 'USDPrice'
      ReadOnly = True
    end
    object spServiseGetListRBLPrice: TFloatField
      FieldName = 'RBLPrice'
      ReadOnly = True
    end
  end
  object dsServiseGetList: TSQLUpdateDSProvider
    DataSet = spServiseGetList
    Constraints = True
    Left = 784
    Top = 160
  end
  object spServiceBofTaskGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'SVC_ServiseBofTaskGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_Service'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@GetStandart'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end
      item
        Name = '@GetCustom'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 783
    Top = 208
    object spServiceBofTaskGetListid_Service: TIntegerField
      FieldName = 'id_Service'
    end
    object spServiceBofTaskGetListid_BofTask: TIntegerField
      FieldName = 'id_BofTask'
    end
    object spServiceBofTaskGetListName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spServiceBofTaskGetListDateStep: TIntegerField
      FieldName = 'DateStep'
    end
    object spServiceBofTaskGetListDescr: TStringField
      FieldName = 'Descr'
      Size = 5000
    end
    object spServiceBofTaskGetListid_ServiceTask: TAutoIncField
      FieldName = 'id_ServiceTask'
      ReadOnly = True
    end
  end
  object dsServiceBofTaskGetList: TSQLUpdateDSProvider
    DataSet = spServiceBofTaskGetList
    Constraints = True
    OnUpdateError = SQLUpdateDSUpdateError
    ModifySQL.Strings = (
      'IF :id_BofTask IS NOT NULL'
      'EXEC SVC_ServiceBofTaskEdit'
      '  @id_ServiceBofTask = :id_ServiceTask,'
      '  @id_BofTask = :id_BofTask,'
      '  @id_Service = :id_Service,'
      '  @DateStep = :DateStep')
    InsertSQL.Strings = (
      'IF :id_BofTask IS NOT NULL'
      'EXEC SVC_ServiceBofTaskAdd'
      '  @id_BofTask = :id_BofTask,'
      '  @id_Service = :id_Service,'
      '  @DateStep = :DateStep')
    DeleteSQL.Strings = (
      'IF :id_BofTask IS NOT NULL'
      'EXEC SVC_ServiceBofTaskDel'
      '  @id_ServiceBofTask = :id_ServiceTask')
    Left = 784
    Top = 256
  end
  object spServiceGOGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'SVC_ServiceGOGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_Service'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 783
    Top = 304
    object spServiceGOGetListid_Service: TIntegerField
      FieldName = 'id_Service'
    end
    object spServiceGOGetListid_Country: TIntegerField
      FieldName = 'id_Country'
    end
    object spServiceGOGetListid_City: TIntegerField
      FieldName = 'id_City'
    end
    object spServiceGOGetListCountryName: TStringField
      FieldName = 'CountryName'
      Size = 50
    end
    object spServiceGOGetListCityCountryName: TStringField
      FieldName = 'CityCountryName'
      Size = 50
    end
    object spServiceGOGetListCityName: TStringField
      FieldName = 'CityName'
      Size = 50
    end
    object spServiceGOGetListGO_Name: TStringField
      FieldName = 'GO_Name'
      Size = 101
    end
    object spServiceGOGetListid_ServiceGeogr: TAutoIncField
      FieldName = 'id_ServiceGeogr'
      ReadOnly = True
    end
  end
  object dsServiceGOGetList: TSQLUpdateDSProvider
    DataSet = spServiceGOGetList
    Constraints = True
    OnUpdateError = SQLUpdateDSUpdateError
    ModifySQL.Strings = (
      'EXEC SVC_ServiceGeogrEdit'
      '  @id_ServiceGeogr = :id_ServiceGeogr,'
      '  @id_Service = :id_Service, '
      '  @id_City = :id_City, '
      '  @id_Country = :id_Country'
      ''
      '   ')
    InsertSQL.Strings = (
      'EXEC SVC_ServiceGeogrAdd'
      '  @id_Service = :id_Service, '
      '  @id_City = :id_City, '
      '  @id_Country = :id_Country'
      ''
      '  ')
    DeleteSQL.Strings = (
      'EXEC SVC_ServiceGeogrDel '
      '  @id_ServiceGeogr = :id_ServiceGeogr')
    Left = 784
    Top = 352
  end
  object spServiceGetProp: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'SVC_ServiceGetProp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_Service'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 823
    Top = 400
    object spServiceGetPropid_Service: TAutoIncField
      FieldName = 'id_Service'
      ReadOnly = True
    end
    object spServiceGetPropid_Provider: TIntegerField
      FieldName = 'id_Provider'
    end
    object spServiceGetPropName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spServiceGetPropShortName: TStringField
      FieldName = 'ShortName'
      Size = 30
    end
    object spServiceGetPropPrice: TFloatField
      FieldName = 'Price'
    end
    object spServiceGetPropDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spServiceGetPropHide: TBooleanField
      FieldName = 'Hide'
    end
    object spServiceGetPropProviderName: TStringField
      FieldName = 'ProviderName'
      Size = 50
    end
    object spServiceGetPropid_ServiceType: TIntegerField
      FieldName = 'id_ServiceType'
    end
    object spServiceGetPropatKP: TBooleanField
      FieldName = 'atKP'
    end
    object spServiceGetPropatSite: TBooleanField
      FieldName = 'atSite'
    end
    object spServiceGetPropId_Currency: TIntegerField
      FieldName = 'Id_Currency'
    end
    object spServiceGetPropCurrencyName: TStringField
      FieldName = 'CurrencyName'
      Size = 30
    end
  end
  object dsServiceGetProp: TSQLUpdateDSProvider
    DataSet = spServiceGetProp
    Constraints = True
    Left = 824
    Top = 448
  end
  object spServiceTypeBofTaskGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'SVC_ServiceTypeBofTaskGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_ServiceType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 823
    Top = 496
    object spServiceTypeBofTaskGetListid_ServiceType: TIntegerField
      FieldName = 'id_ServiceType'
    end
    object spServiceTypeBofTaskGetListid_BofTask: TIntegerField
      FieldName = 'id_BofTask'
    end
    object spServiceTypeBofTaskGetListName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spServiceTypeBofTaskGetListDefDateStep: TIntegerField
      FieldName = 'DefDateStep'
    end
    object spServiceTypeBofTaskGetListid_ServiceTypeBofTask: TAutoIncField
      FieldName = 'id_ServiceTypeBofTask'
      ReadOnly = True
    end
  end
  object dsServiceTypeBofTaskGetList: TSQLUpdateDSProvider
    DataSet = spServiceTypeBofTaskGetList
    Constraints = False
    ModifySQL.Strings = (
      'EXEC SVC_ServiceTypeBofTaskEdit'
      '  @id_ServiceTypeBofTask = :id_ServiceTypeBofTask,'
      '  @id_BofTask = :id_BofTask,'
      '  @id_ServiceType = :id_ServiceType,'
      '  @DefDateStep = :DefDateStep'
      ''
      '')
    InsertSQL.Strings = (
      'EXEC SVC_ServiceTypeBofTaskAdd'
      '  @id_BofTask = :id_BofTask,'
      '  @id_ServiceType = :id_ServiceType,'
      '  @DefDateStep = :DefDateStep')
    DeleteSQL.Strings = (
      'EXEC SVC_ServiceTypeBofTaskDel'
      '  @id_ServiceTypeBofTask = :id_ServiceTypeBofTask ')
    Left = 824
    Top = 544
  end
  object spServiseTypeGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'SVC_ServiseTypeGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@ID_P'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@Hide'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 783
    Top = 16
    object spServiseTypeGetListid_ServiceType: TAutoIncField
      FieldName = 'id_ServiceType'
      ReadOnly = True
    end
    object spServiseTypeGetListid_ServiceTypeParent: TIntegerField
      FieldName = 'id_ServiceTypeParent'
    end
    object spServiseTypeGetListName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spServiseTypeGetListShortName: TStringField
      FieldName = 'ShortName'
    end
    object spServiseTypeGetListLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spServiseTypeGetListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spServiseTypeGetListHide: TBooleanField
      FieldName = 'Hide'
    end
    object spServiseTypeGetListatKP: TBooleanField
      FieldName = 'atKP'
    end
    object spServiseTypeGetListatSite: TBooleanField
      FieldName = 'atSite'
    end
  end
  object spTourFind: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'TR_Find;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@WhereCond'
        Attributes = [paNullable]
        DataType = ftFixedChar
        Size = 4000
        Value = '1=1'
      end>
    Left = 887
    Top = 592
    object spTourFindid_Tour: TIntegerField
      FieldName = 'id_Tour'
    end
    object spTourFindName: TStringField
      DisplayWidth = 255
      FieldName = 'Name'
      Size = 255
    end
    object spTourFindid_TourType: TIntegerField
      FieldName = 'id_TourType'
    end
    object spTourFindDateFrom: TDateTimeField
      FieldName = 'DateFrom'
    end
    object spTourFindDateTo: TDateTimeField
      FieldName = 'DateTo'
    end
    object spTourFindDays: TIntegerField
      FieldName = 'Days'
    end
    object spTourFindoffer_num: TStringField
      FieldName = 'offer_num'
      Size = 50
    end
    object spTourFindId_Currency: TIntegerField
      FieldName = 'Id_Currency'
    end
    object spTourFindCurrencyName: TStringField
      FieldName = 'CurrencyName'
      Size = 30
    end
    object spTourFindsngl: TFloatField
      FieldName = 'sngl'
    end
    object spTourFinddbl: TFloatField
      FieldName = 'dbl'
    end
    object spTourFindtrpl: TFloatField
      FieldName = 'trpl'
    end
    object spTourFindchld: TFloatField
      FieldName = 'chld'
    end
    object spTourFindchld2: TFloatField
      FieldName = 'chld2'
    end
    object spTourFindadult3: TFloatField
      FieldName = 'adult3'
    end
    object spTourFindadult4: TFloatField
      FieldName = 'adult4'
    end
    object spTourFindinfant: TFloatField
      FieldName = 'infant'
    end
    object spTourFindLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spTourFindDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spTourFindatKP: TBooleanField
      FieldName = 'atKP'
    end
    object spTourFindatSite: TBooleanField
      FieldName = 'atSite'
    end
    object spTourFindTourTypeShortName: TStringField
      FieldName = 'TourTypeShortName'
      Size = 50
    end
    object spTourFindTourTypeName: TStringField
      FieldName = 'TourTypeName'
      Size = 30
    end
    object spTourFindMultiHotel: TBooleanField
      FieldName = 'MultiHotel'
    end
    object spTourFindHotelName: TStringField
      FieldName = 'HotelName'
      Size = 255
    end
    object spTourFindid_Hotel: TIntegerField
      FieldName = 'id_Hotel'
    end
    object spTourFindid_HotelType: TIntegerField
      FieldName = 'id_HotelType'
    end
    object spTourFindHotelTypeName: TStringField
      FieldName = 'HotelTypeName'
    end
    object spTourFindid_City: TIntegerField
      FieldName = 'id_City'
    end
    object spTourFindCityName: TStringField
      FieldName = 'CityName'
      Size = 255
    end
    object spTourFindid_Country: TIntegerField
      FieldName = 'id_Country'
    end
    object spTourFindCountryName: TStringField
      FieldName = 'CountryName'
      Size = 255
    end
    object spTourFindid_Provider: TIntegerField
      FieldName = 'id_Provider'
    end
    object spTourFindProviderName: TStringField
      FieldName = 'ProviderName'
      Size = 50
    end
    object spTourFindDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
  end
  object dsTourFind: TDataSetProvider
    DataSet = spTourFind
    Constraints = True
    Left = 888
    Top = 640
  end
  object spCurrencyGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'CR_GetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end
      item
        Name = '@AvForPay'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 911
    Top = 16
    object spCurrencyGetListId_Currency: TAutoIncField
      FieldName = 'Id_Currency'
      ReadOnly = True
    end
    object spCurrencyGetListaName: TStringField
      FieldName = 'aName'
      Size = 30
    end
    object spCurrencyGetListISO: TStringField
      FieldName = 'ISO'
      FixedChar = True
      Size = 3
    end
    object spCurrencyGetListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spCurrencyGetListBase: TBooleanField
      FieldName = 'Base'
    end
    object spCurrencyGetListaValue: TFloatField
      FieldName = 'aValue'
    end
    object spCurrencyGetListCode: TStringField
      FieldName = 'Code'
      FixedChar = True
      Size = 3
    end
    object spCurrencyGetListRateUSD: TFloatField
      FieldName = 'RateUSD'
      ReadOnly = True
    end
    object spCurrencyGetListExchPercent: TFloatField
      FieldName = 'ExchPercent'
      ReadOnly = True
    end
    object spCurrencyGetListAvForPay: TBooleanField
      FieldName = 'AvForPay'
    end
  end
  object dsCurrencyGetList: TDataSetProvider
    DataSet = spCurrencyGetList
    Constraints = True
    Left = 912
    Top = 64
  end
  object dsProviderGetList: TDataSetProvider
    DataSet = spProviderGetList
    Constraints = True
    Left = 864
    Top = 176
  end
  object spProviderGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'PRV_ProviderGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Avia'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Bus'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Train'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Water'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Tour'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 855
    Top = 128
    object spProviderGetListid_Provider: TAutoIncField
      FieldName = 'id_Provider'
      ReadOnly = True
    end
    object spProviderGetListName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spProviderGetListShortName: TStringField
      FieldName = 'ShortName'
      Size = 15
    end
    object spProviderGetListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spProviderGetListDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object spProviderGetListAvia: TBooleanField
      FieldName = 'Avia'
    end
    object spProviderGetListBus: TBooleanField
      FieldName = 'Bus'
    end
    object spProviderGetListTrain: TBooleanField
      FieldName = 'Train'
    end
    object spProviderGetListWater: TBooleanField
      FieldName = 'Water'
    end
    object spProviderGetListTour: TBooleanField
      FieldName = 'Tour'
    end
    object spProviderGetListPrvPercent: TFloatField
      FieldName = 'PrvPercent'
    end
  end
  object spServiceAdd: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'SVC_ServiceAdd;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_ServiceType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_Provider'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = '0'
      end
      item
        Name = '@Price'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = 0
      end
      item
        Name = '@Id_Currency'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end
      item
        Name = '@Hide'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end
      item
        Name = '@atKP'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end
      item
        Name = '@atSite'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 623
    Top = 648
  end
  object spServiceEdit: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'SVC_ServiceEdit;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Service'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_ServiceType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_Provider'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Price'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@Id_Currency'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Hide'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@atKP'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@atSite'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 551
    Top = 649
  end
  object spTransportGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'TR_TransportGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_Tour'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 684
    Top = 240
    object spTransportGetListid_TransportList: TAutoIncField
      FieldName = 'id_TransportList'
    end
    object spTransportGetListid_Tour: TIntegerField
      FieldName = 'id_Tour'
    end
    object spTransportGetListTrn: TStringField
      FieldName = 'Trn'
      Size = 50
    end
    object spTransportGetListTrnNum: TIntegerField
      FieldName = 'TrnNum'
    end
    object spTransportGetListId_Provider: TIntegerField
      FieldName = 'Id_Provider'
    end
    object spTransportGetListRaceName: TStringField
      FieldName = 'RaceName'
      Size = 10
    end
    object spTransportGetListRegular: TBooleanField
      FieldName = 'Regular'
    end
    object spTransportGetListId_CityFrom: TIntegerField
      FieldName = 'Id_CityFrom'
    end
    object spTransportGetListTimeFrom: TDateTimeField
      FieldName = 'TimeFrom'
    end
    object spTransportGetListPortFrom: TStringField
      FieldName = 'PortFrom'
      Size = 100
    end
    object spTransportGetListId_CityTo: TIntegerField
      FieldName = 'Id_CityTo'
    end
    object spTransportGetListTimeTo: TDateTimeField
      FieldName = 'TimeTo'
    end
    object spTransportGetListPortTo: TStringField
      FieldName = 'PortTo'
      Size = 100
    end
    object spTransportGetListTimeInPassing: TIntegerField
      FieldName = 'TimeInPassing'
    end
    object spTransportGetListLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      Size = 8
    end
    object spTransportGetListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spTransportGetListCityFromName: TStringField
      FieldName = 'CityFromName'
      Size = 50
    end
    object spTransportGetListCountryFromName: TStringField
      FieldName = 'CountryFromName'
      Size = 50
    end
    object spTransportGetListCityToName: TStringField
      FieldName = 'CityToName'
      Size = 50
    end
    object spTransportGetListCountryToName: TStringField
      FieldName = 'CountryToName'
      Size = 50
    end
    object spTransportGetListCountryFromID: TAutoIncField
      FieldName = 'CountryFromID'
    end
    object spTransportGetListCountryToID: TAutoIncField
      FieldName = 'CountryToID'
    end
    object spTransportGetListProviderName: TStringField
      FieldName = 'ProviderName'
      Size = 50
    end
    object spTransportGetListPlaceFrom: TStringField
      FieldName = 'PlaceFrom'
      Size = 202
    end
    object spTransportGetListPlaceTo: TStringField
      FieldName = 'PlaceTo'
      Size = 202
    end
    object spTransportGetListTrnName: TStringField
      FieldName = 'TrnName'
      Size = 50
    end
    object spTransportGetListTrnID: TIntegerField
      FieldName = 'TrnID'
    end
    object spTransportGetListTrnClassName: TStringField
      FieldName = 'TrnClassName'
      Size = 50
    end
    object spTransportGetListTrnClassID: TIntegerField
      FieldName = 'TrnClassID'
    end
    object spTransportGetListTrnType: TStringField
      FieldName = 'TrnType'
      Size = 50
    end
    object spTransportGetListTrnTypeID: TIntegerField
      FieldName = 'TrnTypeID'
    end
    object spTransportGetListDescr: TStringField
      FieldName = 'Descr'
      Size = 255
    end
  end
  object dsTransportGetList: TSQLUpdateDSProvider
    DataSet = spTransportGetList
    Constraints = True
    ModifySQL.Strings = (
      'EXEC TR_TransportListEdit'
      '  @id_TransportList = :id_TransportList,'
      '  @id_Tour = :id_Tour,'
      '  @Id_Provider = :Id_Provider,'
      '  @RaceName = :RaceName,'
      '  @Regular = :Regular,'
      '  @Id_CityFrom = :Id_CityFrom,'
      '  @TimeFrom = :TimeFrom,'
      '  @PortFrom = :PortFrom,'
      '  @Id_CityTo = :Id_CityTo,'
      '  @TimeTo = :TimeTo,'
      '  @PortTo = :PortTo,'
      '  @TimeInPassing = :TimeInPassing,'
      '  @Deleted = :Deleted, '
      '  @Descr = :Descr,'
      '  @TrnNum = :TrnNum,'
      '  @TrnID = :TrnID,'
      '  @TrnClassID = :TrnClassID'
      ' ')
    InsertSQL.Strings = (
      'EXEC TR_TransportListAdd'
      '  @id_Tour = :id_Tour,'
      '  @Id_Provider = :Id_Provider,'
      '  @RaceName = :RaceName,'
      '  @Regular = :Regular,'
      '  @Id_CityFrom = :Id_CityFrom,'
      '  @TimeFrom = :TimeFrom,'
      '  @PortFrom = :PortFrom,'
      '  @Id_CityTo = :Id_CityTo,'
      '  @TimeTo = :TimeTo,'
      '  @PortTo = :PortTo,'
      '  @TimeInPassing = :TimeInPassing,'
      '  @Deleted = :Deleted,'
      '  @Descr = :Descr,'
      '  @TrnNum = :TrnNum,'
      '  @TrnID = :TrnID,'
      '  @TrnClassID = :TrnClassID'
      ''
      ' ')
    Left = 688
    Top = 288
  end
  object spTransportGetAvia: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'TR_TransportGetAvia;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 208
    Top = 176
    object spTransportGetAviaId_Avia: TAutoIncField
      FieldName = 'Id_Avia'
      ReadOnly = True
    end
    object spTransportGetAviaName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spTransportGetAviaShortName: TStringField
      FieldName = 'ShortName'
    end
    object spTransportGetAviaPlaces: TSmallintField
      FieldName = 'Places'
    end
  end
  object dsTransportGetAvia: TDataSetProvider
    DataSet = spTransportGetAvia
    Constraints = True
    Left = 208
    Top = 224
  end
  object spClassHelper: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'TR_TransportGetAviaClassHelper;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 304
    Top = 160
    object spClassHelperID_AviaClassHelper: TAutoIncField
      FieldName = 'ID_AviaClassHelper'
      ReadOnly = True
    end
    object spClassHelperName: TStringField
      FieldName = 'Name'
    end
    object spClassHelperLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
  end
  object dsClassHelper: TDataSetProvider
    DataSet = spClassHelper
    Constraints = True
    Left = 304
    Top = 200
  end
  object spTransportGetTrain: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'TR_TransportGetTrain;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 208
    Top = 272
    object spTransportGetTrainID_Train: TAutoIncField
      FieldName = 'ID_Train'
      ReadOnly = True
    end
    object spTransportGetTrainNum: TIntegerField
      FieldName = 'Num'
    end
    object spTransportGetTrainExtIdType: TIntegerField
      FieldName = 'ExtIdType'
    end
    object spTransportGetTrainDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spTransportGetTrainTrainType: TStringField
      FieldName = 'TrainType'
      Size = 50
    end
  end
  object dsTransportGetTrain: TDataSetProvider
    DataSet = spTransportGetTrain
    Constraints = True
    Left = 208
    Top = 320
  end
  object spGetTrainClass: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'TR_TransportGetTrainClass;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 304
    Top = 248
    object spGetTrainClassId_RefValue: TAutoIncField
      FieldName = 'Id_RefValue'
      ReadOnly = True
    end
    object spGetTrainClassName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 50
    end
  end
  object dsGetTrainClass: TDataSetProvider
    DataSet = spGetTrainClass
    Constraints = True
    Left = 304
    Top = 288
  end
  object spTransportGetBus: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'TR_TransportGetBus;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 208
    Top = 368
    object spTransportGetBusID_Bus: TAutoIncField
      FieldName = 'ID_Bus'
      ReadOnly = True
    end
    object spTransportGetBusBrand: TStringField
      FieldName = 'Brand'
    end
    object spTransportGetBusLevels: TBooleanField
      FieldName = 'Levels'
    end
    object spTransportGetBusExtIdClass: TIntegerField
      FieldName = 'ExtIdClass'
    end
    object spTransportGetBusPlaces1: TIntegerField
      FieldName = 'Places1'
    end
    object spTransportGetBusPlaces2: TIntegerField
      FieldName = 'Places2'
    end
    object spTransportGetBusDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spTransportGetBusClass: TStringField
      FieldName = 'Class'
      Size = 50
    end
  end
  object dsTransportGetBus: TDataSetProvider
    DataSet = spTransportGetBus
    Constraints = True
    Left = 208
    Top = 416
  end
  object spGetBussClass: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'TR_TransportGetBussClass;1'
    Parameters = <>
    Left = 304
    Top = 334
    object spGetBussClassId_RefValue: TAutoIncField
      FieldName = 'Id_RefValue'
      ReadOnly = True
    end
    object spGetBussClassName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 50
    end
  end
  object dsGetBussClass: TDataSetProvider
    DataSet = spGetBussClass
    Constraints = True
    Left = 304
    Top = 376
  end
  object spTransportGetWater: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'TR_TransportGetWater;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 208
    Top = 464
    object spTransportGetWaterID_Water: TAutoIncField
      FieldName = 'ID_Water'
      ReadOnly = True
    end
    object spTransportGetWaterExtIdType: TIntegerField
      FieldName = 'ExtIdType'
    end
    object spTransportGetWaterName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spTransportGetWaterDecks: TSmallintField
      FieldName = 'Decks'
    end
    object spTransportGetWaterComfort: TStringField
      FieldName = 'Comfort'
      Size = 255
    end
    object spTransportGetWaterId_Yacht: TIntegerField
      FieldName = 'Id_Yacht'
    end
    object spTransportGetWaterDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spTransportGetWaterType: TStringField
      FieldName = 'Type'
      Size = 50
    end
  end
  object dsTransportGetWater: TDataSetProvider
    DataSet = spTransportGetWater
    Constraints = True
    Left = 208
    Top = 512
  end
  object spGetWaterClass: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'TR_TransportGetWaterClass;1'
    Parameters = <>
    Left = 304
    Top = 424
    object AutoIncField4: TAutoIncField
      FieldName = 'Id_RefValue'
      ReadOnly = True
    end
    object StringField11: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 50
    end
  end
  object dsGetWaterClass: TDataSetProvider
    DataSet = spGetWaterClass
    Constraints = True
    Left = 304
    Top = 472
  end
  object spServiceTypeGetProp: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'SVC_ServiceTypeGetProp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_ServiceType'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 306
    Top = 68
    object spServiceTypeGetPropid_ServiceType: TAutoIncField
      FieldName = 'id_ServiceType'
      ReadOnly = True
    end
    object spServiceTypeGetPropid_ServiceTypeParent: TIntegerField
      FieldName = 'id_ServiceTypeParent'
    end
    object spServiceTypeGetPropName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spServiceTypeGetPropShortName: TStringField
      FieldName = 'ShortName'
    end
    object spServiceTypeGetPropLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spServiceTypeGetPropDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spServiceTypeGetPropHide: TBooleanField
      FieldName = 'Hide'
    end
    object spServiceTypeGetPropatKP: TBooleanField
      FieldName = 'atKP'
    end
    object spServiceTypeGetPropatSite: TBooleanField
      FieldName = 'atSite'
    end
    object spServiceTypeGetPropMustHave: TBooleanField
      FieldName = 'MustHave'
    end
    object spServiceTypeGetPropParentName: TStringField
      FieldName = 'ParentName'
      Size = 50
    end
  end
  object dsServiceTypeGetProp: TSQLUpdateDSProvider
    DataSet = spServiceTypeGetProp
    Constraints = True
    ModifySQL.Strings = (
      'EXEC SVC_ServiceTypeEdit'
      '  @id_ServiceType =:id_ServiceType,'
      '  @id_ServiceTypeParent =:id_ServiceTypeParent,'
      '  @Name =:Name,'
      '  @Deleted =:Deleted,'
      '  @Hide =:Hide,'
      '  @AtSite =:AtSite,'
      '  @AtKP =:AtKP,'
      '  @MustHave =:MustHave')
    Left = 306
    Top = 116
  end
  object spServiceTypeAdd: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'SVC_ServiceTypeAdd;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@id_ServiceTypeParent'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@Hide'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@AtSite'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@AtKP'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@MustHave'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end>
    Left = 219
    Top = 16
  end
  object dsBofTaskGetList: TDataSetProvider
    DataSet = spBofTaskGetList
    Constraints = True
    Left = 216
    Top = 604
  end
  object spBofTaskGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'SVC_BofTaskGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end>
    Left = 216
    Top = 560
    object spBofTaskGetListName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spBofTaskGetListDefDateStep: TIntegerField
      FieldName = 'DefDateStep'
    end
    object spBofTaskGetListid_BofTask: TAutoIncField
      FieldName = 'id_BofTask'
      ReadOnly = True
    end
  end
  object spAdvTypes: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'ADV_Advice_TypeGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Deleted'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = False
      end>
    Left = 295
    Top = 520
    object spAdvTypesid_Advice_Type: TAutoIncField
      FieldName = 'id_Advice_Type'
      ReadOnly = True
    end
    object spAdvTypesName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object spAdvTypesLastUpdated: TBytesField
      FieldName = 'LastUpdated'
      ReadOnly = True
      Size = 8
    end
    object spAdvTypesDeleted: TBooleanField
      FieldName = 'Deleted'
    end
  end
  object dsAdvTypes: TDataSetProvider
    DataSet = spAdvTypes
    Constraints = True
    Left = 292
    Top = 565
  end
  object stTrCnt: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'TR_TourGetCountryList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_Tour'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 303
    Top = 612
    object stTrCntID: TIntegerField
      FieldName = 'ID'
    end
    object stTrCntName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 100
    end
  end
  object dsTrCnt: TDataSetProvider
    DataSet = stTrCnt
    Constraints = True
    Left = 303
    Top = 656
  end
  object spTrCity: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'TR_TourGetCityList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@id_Tour'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 351
    Top = 612
    object spTrCityID: TIntegerField
      FieldName = 'ID'
    end
    object spTrCityName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 100
    end
  end
  object dsTrCity: TDataSetProvider
    DataSet = spTrCity
    Constraints = True
    Left = 351
    Top = 656
  end
  object dsTrHotel: TDataSetProvider
    DataSet = spTrHotel
    Constraints = True
    Left = 391
    Top = 656
  end
  object spTrHotel: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'TR_TourGetHotelList;1'
    Parameters = <>
    Left = 391
    Top = 612
    object IntegerField6: TIntegerField
      FieldName = 'ID'
    end
    object StringField9: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 100
    end
  end
  object spMsgGetList: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'MSG_MsgGetList;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Id_UserTo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Id_UserFrom'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@DateFrom'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@DateTo'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 383
    Top = 520
    object spMsgGetListid_Message: TAutoIncField
      FieldName = 'id_Message'
      ReadOnly = True
    end
    object spMsgGetListid_UserFrom: TIntegerField
      FieldName = 'id_UserFrom'
    end
    object spMsgGetListid_UserTo: TIntegerField
      FieldName = 'id_UserTo'
    end
    object spMsgGetListSubj: TStringField
      FieldName = 'Subj'
      Size = 50
    end
    object spMsgGetListBody: TStringField
      FieldName = 'Body'
      Size = 5000
    end
    object spMsgGetListReaded: TBooleanField
      FieldName = 'Readed'
    end
    object spMsgGetListMarked: TBooleanField
      FieldName = 'Marked'
    end
    object spMsgGetListDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object spMsgGetListMessageDate: TDateTimeField
      FieldName = 'MessageDate'
    end
    object spMsgGetListSender: TStringField
      FieldName = 'Sender'
      ReadOnly = True
      Size = 72
    end
    object spMsgGetListReceiver: TStringField
      FieldName = 'Receiver'
      ReadOnly = True
      Size = 72
    end
  end
  object dsMsgGetList: TDataSetProvider
    DataSet = spMsgGetList
    Constraints = True
    Left = 384
    Top = 568
  end
end
