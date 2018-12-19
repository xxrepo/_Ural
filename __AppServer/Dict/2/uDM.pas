unit uDM;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, KmMngSvc_TLB, StdVcl, Db, ADODB, Provider,
  tstSvccnst, MtUPDPrv,
  inifiles;

type
  TEventLogger = class(TObject)
  private
    FName: String;
    FEventLog: Integer;          
  public
    constructor Create(Name: String);
    destructor Destroy; override;
    procedure LogMessage(Message: String; EventType: DWord = 1; Category: Word = 0; ID: DWord = 0);
  end;


  TDMKM = class(TRemoteDataModule, IDMKM)
    ADOConnection1: TADOConnection;
    spGetCountryList: TADOStoredProc;
    dsGetCountryList: TDataSetProvider;
    spGetCityListByCountry: TADOStoredProc;
    dsGetCityListByCountry: TDataSetProvider;
    spWhoIAm: TADOStoredProc;
    dsWhoIAm: TDataSetProvider;
    spWhoIAmFirstName: TStringField;
    spWhoIAmSurName: TStringField;
    spWhoIAmLastName: TStringField;
    spGetHotelListByCity: TADOStoredProc;
    dsGetHotelListByCity: TDataSetProvider;
    spGetCountryProp: TADOStoredProc;
    spGetCityProp: TADOStoredProc;
    spGetHotelProp: TADOStoredProc;
    spGetCityPicList: TADOStoredProc;
    spGetCountryPicList: TADOStoredProc;
    spGetHotelPicList: TADOStoredProc;
    spCountrySetState: TADOStoredProc;
    spCitySetState: TADOStoredProc;
    spHotelSetState: TADOStoredProc;
    spGetCountryListID_Country: TAutoIncField;
    spGetCountryListName: TStringField;
    spGetCountryListName_Eng: TStringField;
    spGetCountryListDeleted: TBooleanField;
    spGetCountryListLastUpdated: TBytesField;
    spGetCityListByCountryID_City: TAutoIncField;
    spGetCityListByCountryID_Country: TIntegerField;
    spGetCityListByCountryID_CityType: TIntegerField;
    spGetCityListByCountryName: TStringField;
    spGetCityListByCountryName_Eng: TStringField;
    spGetCityListByCountryDeleted: TBooleanField;
    spGetCityListByCountryLastUpdated: TBytesField;
    spGetCityListByCountryTypeName: TStringField;
    spGetHotelListByCityID_Hotel: TAutoIncField;
    spGetHotelListByCityID_City: TIntegerField;
    spGetHotelListByCityID_HotelType: TIntegerField;
    spGetHotelListByCityName: TStringField;
    spGetHotelListByCityName_Eng: TStringField;
    spGetHotelListByCityDeleted: TBooleanField;
    spGetHotelListByCityLastUpdated: TBytesField;
    spGetHotelListByCityTypeName: TStringField;
    spGetCountryPropID_Country: TAutoIncField;
    spGetCountryPropName: TStringField;
    spGetCountryPropName_Eng: TStringField;
    spGetCountryPropDeleted: TBooleanField;
    spGetCountryPropDescr: TMemoField;
    spGetCityPropID_City: TAutoIncField;
    spGetCityPropName: TStringField;
    spGetCityPropName_Eng: TStringField;
    spGetCityPropDeleted: TBooleanField;
    spGetCityPropCN_NAME: TStringField;
    spGetCityPropCN_Name_Eng: TStringField;
    spGetCityPropCN_Deleted: TBooleanField;
    spGetCityPropDescr: TMemoField;
    spGetCountryPropCode3: TStringField;
    spGetCountryListatSite: TBooleanField;
    spGetCountryListatKP: TBooleanField;
    spGetCityListByCountryatSite: TBooleanField;
    spGetCityListByCountryatKP: TBooleanField;
    spGetHotelListByCityatSite: TBooleanField;
    spGetHotelListByCityatKP: TBooleanField;
    spGetCountryPropatSite: TBooleanField;
    spGetCountryPropatKP: TBooleanField;
    spGetCityPropatSite: TBooleanField;
    spGetCityPropatKP: TBooleanField;
    spGetCountryComments: TADOStoredProc;
    spGetCityComments: TADOStoredProc;
    spGetHotelComments: TADOStoredProc;
    spAddComment: TADOStoredProc;
    dsFindGO: TDataSetProvider;
    spFind: TADOStoredProc;
    spFindType: TIntegerField;
    spFindPATH: TStringField;
    spFindID_Country: TIntegerField;
    spFindID_City: TIntegerField;
    spFindID_Hotel: TIntegerField;
    spFindName: TStringField;
    spFindName_Eng: TStringField;
    spFindDeleted: TBooleanField;
    spFindatKP: TBooleanField;
    spFindatSite: TBooleanField;
    spGetComment: TADOStoredProc;
    spCountryAdd: TADOStoredProc;
    spCityAdd: TADOStoredProc;
    spHotelAdd: TADOStoredProc;
    spCityTypeList: TADOStoredProc;
    spCityTypeListid_CityType: TAutoIncField;
    spCityTypeListName: TStringField;
    spCityTypeListShortName: TStringField;
    dsCityTypeList: TDataSetProvider;
    spGetCityPropID_CityType: TIntegerField;
    spGetCityPropCode3: TStringField;
    spGetCityPropTypeName: TStringField;
    spHotelTypeList: TADOStoredProc;
    dsHotelTypeList: TDataSetProvider;
    spHotelTypeListID_HotelType: TAutoIncField;
    spHotelTypeListName: TStringField;
    spHotelTypeListShortName: TStringField;
    spHotelTypeListLastUpdated: TBytesField;
    spHotelTypeListDeleted: TBooleanField;
    spCityTypeListDeleted: TBooleanField;
    spGetHotelPropID_Hotel: TAutoIncField;
    spGetHotelPropName: TStringField;
    spGetHotelPropName_Eng: TStringField;
    spGetHotelPropDeleted: TBooleanField;
    spGetHotelPropatSite: TBooleanField;
    spGetHotelPropatKP: TBooleanField;
    spGetHotelPropCN_NAME: TStringField;
    spGetHotelPropCN_Name_Eng: TStringField;
    spGetHotelPropCN_Deleted: TBooleanField;
    spGetHotelPropCT_NAME: TStringField;
    spGetHotelPropCT_Name_Eng: TStringField;
    spGetHotelPropCT_Deleted: TBooleanField;
    spGetHotelPropID_HotelType: TIntegerField;
    spGetHotelPropTypeName: TStringField;
    spGetHotelPropDescr: TMemoField;
    dsGetCountryComments: TSQLUpdateDSProvider;
    dsGetCountryPicList: TSQLUpdateDSProvider;
    dsGetCountryProp: TSQLUpdateDSProvider;
    dsGetCityProp: TSQLUpdateDSProvider;
    dsGetHotelProp: TSQLUpdateDSProvider;
    dsGetCityComments: TSQLUpdateDSProvider;
    dsGetHotelComments: TSQLUpdateDSProvider;
    dsGetCityPicList: TSQLUpdateDSProvider;
    dsGetHotelPicList: TSQLUpdateDSProvider;
    spGetMsgList: TADOStoredProc;
    spGetMsgListID_Message: TAutoIncField;
    spGetMsgListSubj: TStringField;
    spGetMsgListBody: TStringField;
    spGetMsgListID_Parent: TIntegerField;
    spGetMsgListReaded: TBooleanField;
    spGetMsgListMarked: TBooleanField;
    spGetMsgListDeleted: TBooleanField;
    spGetMsgListMsgDate: TDateTimeField;
    spGetMsgListID_Client: TIntegerField;
    spGetMsgListID_User: TIntegerField;
    spGetMsgListAuthor: TStringField;
    dsGetMsgList: TSQLUpdateDSProvider;
    spWhoIAmLogin: TWideStringField;
    spWhoIAmId_User: TAutoIncField;
    spGetMessage: TADOStoredProc;
    dsGetMessage: TSQLUpdateDSProvider;
    spGetMessageID_Message: TAutoIncField;
    spGetMessageSubj: TStringField;
    spGetMessageBody: TStringField;
    spGetMessageID_Parent: TIntegerField;
    spGetMessageReaded: TBooleanField;
    spGetMessageMarked: TBooleanField;
    spGetMessageDeleted: TBooleanField;
    spGetMessageMsgDate: TDateTimeField;
    spGetMessageID_Client: TIntegerField;
    spGetMessageID_User: TIntegerField;
    spGetMessageAuthor: TStringField;
    spMessageAdd: TADOStoredProc;
    spMessageEdit: TADOStoredProc;
    spGetCountryPicListID_CountryPic: TAutoIncField;
    spGetCountryPicListID_Country: TIntegerField;
    spGetCountryPicListName: TStringField;
    spGetCountryPicListDeleted: TBooleanField;
    spGetCountryPicListPic: TBlobField;
    spGetCityPicListID_CityPic: TAutoIncField;
    spGetCityPicListID_City: TIntegerField;
    spGetCityPicListName: TStringField;
    spGetCityPicListDeleted: TBooleanField;
    spGetCityPicListPic: TBlobField;
    spGetHotelPicListID_HotelPic: TAutoIncField;
    spGetHotelPicListID_Hotel: TIntegerField;
    spGetHotelPicListName: TStringField;
    spGetHotelPicListDeleted: TBooleanField;
    spGetHotelPicListPic: TBlobField;
    spGetCountryCommentsID_Country: TIntegerField;
    spGetCountryCommentsID_CountryComment: TAutoIncField;
    spGetCountryCommentsComment: TStringField;
    spGetCountryCommentsCommentType: TIntegerField;
    spGetCountryCommentsDeleted: TBooleanField;
    spGetCityCommentsID_City: TIntegerField;
    spGetCityCommentsID_CityComment: TAutoIncField;
    spGetCityCommentsComment: TStringField;
    spGetCityCommentsCommentType: TIntegerField;
    spGetCityCommentsDeleted: TBooleanField;
    spGetHotelCommentsID_Hotel: TIntegerField;
    spGetHotelCommentsID_HotelComment: TAutoIncField;
    spGetHotelCommentsComment: TStringField;
    spGetHotelCommentsCommentType: TIntegerField;
    spGetHotelCommentsDeleted: TBooleanField;
    spGetAdvice: TADOStoredProc;
    dsGetAdvice: TSQLUpdateDSProvider;
    spAdviceAdd: TADOStoredProc;
    spAdviceEdit: TADOStoredProc;
    spGetAdviceList: TADOStoredProc;
    dsGetAdviceList: TSQLUpdateDSProvider;
    spGetAdviceListID_Advice: TAutoIncField;
    spGetAdviceListSubj: TStringField;
    spGetAdviceListBody: TMemoField;
    spGetAdviceListReaded: TBooleanField;
    spGetAdviceListMarked: TBooleanField;
    spGetAdviceListDeleted: TBooleanField;
    spGetAdviceListAdvDate: TDateTimeField;
    spGetAdviceID_Advice: TAutoIncField;
    spGetAdviceSubj: TStringField;
    spGetAdviceBody: TMemoField;
    spGetAdviceReaded: TBooleanField;
    spGetAdviceMarked: TBooleanField;
    spGetAdviceDeleted: TBooleanField;
    spGetAdviceAdvDate: TDateTimeField;
    spAdviceFind: TADOStoredProc;
    dsAdviceFind: TSQLUpdateDSProvider;
    spMessageFind: TADOStoredProc;
    AutoIncField2: TAutoIncField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    BooleanField4: TBooleanField;
    BooleanField5: TBooleanField;
    BooleanField6: TBooleanField;
    DateTimeField2: TDateTimeField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField4: TStringField;
    dsMessageFind: TSQLUpdateDSProvider;
    spGetNewz: TADOStoredProc;
    dsGetNewz: TSQLUpdateDSProvider;
    spNewzAdd: TADOStoredProc;
    spNewzEdit: TADOStoredProc;
    spGetNewzList: TADOStoredProc;
    dsGetNewzList: TSQLUpdateDSProvider;
    spNewsFind: TADOStoredProc;
    dsNewsFind: TSQLUpdateDSProvider;
    spGetNewzID_Newz: TAutoIncField;
    spGetNewzSubj: TStringField;
    spGetNewzBody: TMemoField;
    spGetNewzReaded: TBooleanField;
    spGetNewzMarked: TBooleanField;
    spGetNewzDeleted: TBooleanField;
    spGetNewzNWDate: TDateTimeField;
    spGetNewzListID_Newz: TAutoIncField;
    spGetNewzListSubj: TStringField;
    spGetNewzListBody: TMemoField;
    spGetNewzListReaded: TBooleanField;
    spGetNewzListMarked: TBooleanField;
    spGetNewzListDeleted: TBooleanField;
    spGetNewzListNWDate: TDateTimeField;
    spAdviceFindID_Advice: TAutoIncField;
    spAdviceFindSubj: TStringField;
    spAdviceFindBody: TMemoField;
    spAdviceFindReaded: TBooleanField;
    spAdviceFindMarked: TBooleanField;
    spAdviceFindDeleted: TBooleanField;
    spAdviceFindAdvDate: TDateTimeField;
    spNewsFindID_Newz: TAutoIncField;
    spNewsFindSubj: TStringField;
    spNewsFindBody: TMemoField;
    spNewsFindReaded: TBooleanField;
    spNewsFindMarked: TBooleanField;
    spNewsFindDeleted: TBooleanField;
    spNewsFindNWDate: TDateTimeField;
    dsTourGetProp: TSQLUpdateDSProvider;
    spTourCommentsGetList: TADOStoredProc;
    dsTourCommentsGetList: TSQLUpdateDSProvider;
    spTourPicGetList: TADOStoredProc;
    dsTourPicGetList: TSQLUpdateDSProvider;
    spTourPicGetListID_TourPic: TAutoIncField;
    spTourPicGetListID_Tour: TIntegerField;
    spTourPicGetListName: TStringField;
    spTourPicGetListDeleted: TBooleanField;
    spTourPicGetListPic: TBlobField;
    spTourCommentsGetListID_Tour: TIntegerField;
    spTourCommentsGetListID_TourComment: TAutoIncField;
    spTourCommentsGetListComment: TStringField;
    spTourCommentsGetListCommentType: TIntegerField;
    spTourCommentsGetListDeleted: TBooleanField;
    spTourAdd: TADOStoredProc;
    spFoodTypeGetList: TADOStoredProc;
    spFoodTypeGetListid_FoodType: TAutoIncField;
    spFoodTypeGetListShortName: TStringField;
    spFoodTypeGetListName: TStringField;
    spFoodTypeGetListDeleted: TBooleanField;
    dsFoodTypeGetList: TDataSetProvider;
    spPriceGetList: TADOStoredProc;
    spPriceGetListid_TourPriceValue: TAutoIncField;
    spPriceGetListid_Tour: TIntegerField;
    spPriceGetListid_TourPriceType: TIntegerField;
    spPriceGetListPrice: TFloatField;
    spPriceGetListPriceName: TStringField;
    spPriceGetListPriceShortName: TStringField;
    dsPriceGetList: TSQLUpdateDSProvider;
    spPriceTypeGetList: TADOStoredProc;
    dsPriceTypeGetList: TDataSetProvider;
    spPriceTypeGetListid_TourPriceType: TAutoIncField;
    spPriceTypeGetListName: TStringField;
    spPriceTypeGetListShortName: TStringField;
    spPriceTypeGetListHide: TBooleanField;
    spHotelGetList: TADOStoredProc;
    dsHotelGetList: TSQLUpdateDSProvider;
    spGetCityListByCountryCN_NAME: TStringField;
    spGetCityListByCountryCN_Name_Eng: TStringField;
    spGetHotelListByCityCN_NAME: TStringField;
    spGetHotelListByCityCN_Name_Eng: TStringField;
    spGetHotelListByCityCT_NAME: TStringField;
    spGetHotelListByCityCT_Name_Eng: TStringField;
    spGetHotelListByCityID_Country: TIntegerField;
    spGetHotelPropID_Country: TIntegerField;
    spGetHotelPropID_City: TIntegerField;
    spTourEdit: TADOStoredProc;
    spTourTypeGetList: TADOStoredProc;
    dsTourTypeGetList: TDataSetProvider;
    spTourTypeGetListid_TourType: TAutoIncField;
    spTourTypeGetListShortName: TStringField;
    spTourTypeGetListName: TStringField;
    spTourTypeGetListlast_updated: TBytesField;
    spTourTypeGetListHide: TBooleanField;
    spTourTypeGetListDeleted: TBooleanField;
    spTourTypeGetListForOrder: TIntegerField;
    spTourTypeGetListMultiHotel: TBooleanField;
    spTourGetProp: TADOStoredProc;
    spTourGetPropid_Tour: TAutoIncField;
    spTourGetPropid_TourType: TIntegerField;
    spTourGetPropDateFrom: TDateTimeField;
    spTourGetPropDateTo: TDateTimeField;
    spTourGetPropoffer_num: TStringField;
    spTourGetPropsngl: TFloatField;
    spTourGetPropdbl: TFloatField;
    spTourGetProptrpl: TFloatField;
    spTourGetPropchld: TFloatField;
    spTourGetPropchld2: TFloatField;
    spTourGetPropadult3: TFloatField;
    spTourGetPropadult4: TFloatField;
    spTourGetPropinfant: TFloatField;
    spTourGetPropLastUpdated: TBytesField;
    spTourGetPropDeleted: TBooleanField;
    spTourGetPropatKP: TBooleanField;
    spTourGetPropatSite: TBooleanField;
    spTourGetPropTourTypeShortName: TStringField;
    spTourGetPropTourTypeName: TStringField;
    spTourGetPropDescr: TMemoField;
    spMessageGetListForUser: TADOStoredProc;
    dsMessageGetListForUser: TDataSetProvider;
    spMessageGetListForUserid_Message: TAutoIncField;
    spMessageGetListForUserid_UserFrom: TIntegerField;
    spMessageGetListForUserid_UserTo: TIntegerField;
    spMessageGetListForUserSubj: TStringField;
    spMessageGetListForUserBody: TStringField;
    spMessageGetListForUserReaded: TBooleanField;
    spMessageGetListForUserMarked: TBooleanField;
    spMessageGetListForUserDeleted: TBooleanField;
    spMessageGetListForUserMessageDate: TDateTimeField;
    spMessageGetListForUserUserFromFirstName: TStringField;
    spMessageGetListForUserUserFromSurName: TStringField;
    spMessageGetListForUserUserFromLastName: TStringField;
    ADOStoredProc1: TADOStoredProc;
    spMessageGetProp: TADOStoredProc;
    AutoIncField1: TAutoIncField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField1: TStringField;
    StringField5: TStringField;
    BooleanField1: TBooleanField;
    BooleanField2: TBooleanField;
    BooleanField3: TBooleanField;
    DateTimeField1: TDateTimeField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    dsMessageGetProp: TDataSetProvider;
    spUserGetList: TADOStoredProc;
    dsUserGetList: TSQLUpdateDSProvider;
    spUserGetListId_User: TAutoIncField;
    spUserGetListFirstName: TStringField;
    spUserGetListSurName: TStringField;
    spUserGetListLastName: TStringField;
    spUserGetListTel: TStringField;
    spUserGetListEMail: TStringField;
    spUserGetListDescription: TStringField;
    dsServiseTypeGetList: TDataSetProvider;
    spServiseGetList: TADOStoredProc;
    dsServiseGetList: TSQLUpdateDSProvider;
    spServiseGetListid_Service: TAutoIncField;
    spServiseGetListid_Provider: TIntegerField;
    spServiseGetListName: TStringField;
    spServiseGetListShortName: TStringField;
    spServiseGetListPrice: TFloatField;
    spServiseGetListDeleted: TBooleanField;
    spServiseGetListHide: TBooleanField;
    spServiseGetListProviderName: TStringField;
    spServiceBofTaskGetList: TADOStoredProc;
    dsServiceBofTaskGetList: TSQLUpdateDSProvider;
    spServiceBofTaskGetListid_Service: TIntegerField;
    spServiceBofTaskGetListid_BofTask: TIntegerField;
    spServiceBofTaskGetListName: TStringField;
    spServiceGOGetList: TADOStoredProc;
    dsServiceGOGetList: TSQLUpdateDSProvider;
    spServiceGOGetListid_Service: TIntegerField;
    spServiceGOGetListid_Country: TIntegerField;
    spServiceGOGetListid_City: TIntegerField;
    spServiceGOGetListCountryName: TStringField;
    spServiceGOGetListCityCountryName: TStringField;
    spServiceGOGetListCityName: TStringField;
    spServiceGOGetListGO_Name: TStringField;
    spServiceGetProp: TADOStoredProc;
    dsServiceGetProp: TSQLUpdateDSProvider;
    spServiceGetPropid_Service: TAutoIncField;
    spServiceGetPropid_Provider: TIntegerField;
    spServiceGetPropName: TStringField;
    spServiceGetPropShortName: TStringField;
    spServiceGetPropPrice: TFloatField;
    spServiceGetPropDeleted: TBooleanField;
    spServiceGetPropHide: TBooleanField;
    spServiceGetPropProviderName: TStringField;
    spServiceGetPropid_ServiceType: TIntegerField;
    spServiceGetPropatKP: TBooleanField;
    spServiceGetPropatSite: TBooleanField;
    spServiseGetListid_ServiceType: TIntegerField;
    spServiseGetListatKP: TBooleanField;
    spServiseGetListatSite: TBooleanField;
    spServiceTypeBofTaskGetList: TADOStoredProc;
    dsServiceTypeBofTaskGetList: TSQLUpdateDSProvider;
    spServiceTypeBofTaskGetListid_ServiceType: TIntegerField;
    spServiceTypeBofTaskGetListid_BofTask: TIntegerField;
    spServiceTypeBofTaskGetListName: TStringField;
    spServiceTypeBofTaskGetListDefDateStep: TIntegerField;
    spServiceBofTaskGetListDateStep: TIntegerField;
    spServiseTypeGetList: TADOStoredProc;
    spServiseTypeGetListid_ServiceType: TAutoIncField;
    spServiseTypeGetListid_ServiceTypeParent: TIntegerField;
    spServiseTypeGetListName: TStringField;
    spServiseTypeGetListShortName: TStringField;
    spServiseTypeGetListLastUpdated: TBytesField;
    spServiseTypeGetListDeleted: TBooleanField;
    spServiseTypeGetListHide: TBooleanField;
    spServiseTypeGetListatKP: TBooleanField;
    spServiseTypeGetListatSite: TBooleanField;
    spServiceBofTaskGetListDescr: TStringField;
    spTourFind: TADOStoredProc;
    dsTourFind: TDataSetProvider;
    spCurrencyGetList: TADOStoredProc;
    dsCurrencyGetList: TDataSetProvider;
    spServiseGetListId_Currency: TIntegerField;
    spServiseGetListCurrencyName: TStringField;
    spServiceGetPropId_Currency: TIntegerField;
    spServiceGetPropCurrencyName: TStringField;
    spServiseGetListUSDPrice: TFloatField;
    spCurrencyGetListId_Currency: TAutoIncField;
    spCurrencyGetListaName: TStringField;
    spCurrencyGetListISO: TStringField;
    spCurrencyGetListDeleted: TBooleanField;
    spCurrencyGetListBase: TBooleanField;
    spTourGetPropId_Currency: TIntegerField;
    spTourGetPropCurrencyName: TStringField;
    dsProviderGetList: TDataSetProvider;
    spProviderGetList: TADOStoredProc;
    spProviderGetListid_Provider: TAutoIncField;
    spProviderGetListName: TStringField;
    spProviderGetListShortName: TStringField;
    spProviderGetListDeleted: TBooleanField;
    spProviderGetListDateCreate: TDateTimeField;
    spServiceAdd: TADOStoredProc;
    spServiceEdit: TADOStoredProc;
    spServiceGOGetListid_ServiceGeogr: TAutoIncField;
    spServiceBofTaskGetListid_ServiceTask: TAutoIncField;
    spHotelGetListID_HotelList: TAutoIncField;
    spHotelGetListid_Tour: TIntegerField;
    spHotelGetListid_Hotel: TIntegerField;
    spHotelGetListDateFrom: TDateTimeField;
    spHotelGetListDateTo: TDateTimeField;
    spHotelGetListID_FoodType: TIntegerField;
    spHotelGetListFT_Name: TStringField;
    spHotelGetListFT_ShortName: TStringField;
    spHotelGetListName: TStringField;
    spHotelGetListID_HotelType: TIntegerField;
    spHotelGetListHotelTypeName: TStringField;
    spHotelGetListHotelTypeShortName: TStringField;
    spHotelGetListID_Country: TIntegerField;
    spHotelGetListCN_NAME: TStringField;
    spHotelGetListCN_Name_Eng: TStringField;
    spHotelGetListID_City: TIntegerField;
    spHotelGetListCT_NAME: TStringField;
    spHotelGetListCT_Name_Eng: TStringField;
    spCurrencyGetListaValue: TFloatField;
    spGetCityPropID_Country: TIntegerField;
    spTourFindid_Tour: TIntegerField;
    spTourFindName: TStringField;
    spTourFindid_TourType: TIntegerField;
    spTourFindDateFrom: TDateTimeField;
    spTourFindDateTo: TDateTimeField;
    spTourFindDays: TIntegerField;
    spTourFindoffer_num: TStringField;
    spTourFindId_Currency: TIntegerField;
    spTourFindCurrencyName: TStringField;
    spTourFindsngl: TFloatField;
    spTourFinddbl: TFloatField;
    spTourFindtrpl: TFloatField;
    spTourFindchld: TFloatField;
    spTourFindchld2: TFloatField;
    spTourFindadult3: TFloatField;
    spTourFindadult4: TFloatField;
    spTourFindinfant: TFloatField;
    spTourFindLastUpdated: TBytesField;
    spTourFindDeleted: TBooleanField;
    spTourFindatKP: TBooleanField;
    spTourFindatSite: TBooleanField;
    spTourFindTourTypeShortName: TStringField;
    spTourFindTourTypeName: TStringField;
    spTourFindMultiHotel: TBooleanField;
    spTourFindHotelName: TStringField;
    spTourFindid_Hotel: TIntegerField;
    spTourFindid_HotelType: TIntegerField;
    spTourFindHotelTypeName: TStringField;
    spTourFindid_City: TIntegerField;
    spTourFindCityName: TStringField;
    spTourFindid_Country: TIntegerField;
    spTourFindCountryName: TStringField;
    spGetCountryPropForeignPassport: TBooleanField;
    spTourGetPropName: TStringField;
    spTransportGetList: TADOStoredProc;
    dsTransportGetList: TSQLUpdateDSProvider;
    spTransportGetListid_TransportList: TAutoIncField;
    spTransportGetListid_Tour: TIntegerField;
    spTransportGetListTrn: TStringField;
    spTransportGetListTrnNum: TIntegerField;
    spTransportGetListId_Provider: TIntegerField;
    spTransportGetListRaceName: TStringField;
    spTransportGetListRegular: TBooleanField;
    spTransportGetListId_CityFrom: TIntegerField;
    spTransportGetListTimeFrom: TDateTimeField;
    spTransportGetListPortFrom: TStringField;
    spTransportGetListId_CityTo: TIntegerField;
    spTransportGetListTimeTo: TDateTimeField;
    spTransportGetListPortTo: TStringField;
    spTransportGetListTimeInPassing: TIntegerField;
    spTransportGetListLastUpdated: TBytesField;
    spTransportGetListDeleted: TBooleanField;
    spTransportGetListCityFromName: TStringField;
    spTransportGetListCountryFromName: TStringField;
    spTransportGetListCityToName: TStringField;
    spTransportGetListCountryToName: TStringField;
    spTransportGetListCountryFromID: TAutoIncField;
    spTransportGetListCountryToID: TAutoIncField;
    spTransportGetListProviderName: TStringField;
    spTransportGetListPlaceFrom: TStringField;
    spTransportGetListPlaceTo: TStringField;
    spTransportGetListTrnName: TStringField;
    spTransportGetListTrnID: TIntegerField;
    spTransportGetListTrnClassName: TStringField;
    spTransportGetListTrnClassID: TIntegerField;
    spTransportGetListTrnType: TStringField;
    spTransportGetListTrnTypeID: TIntegerField;
    spTransportGetAvia: TADOStoredProc;
    spTransportGetAviaId_Avia: TAutoIncField;
    spTransportGetAviaName: TStringField;
    spTransportGetAviaShortName: TStringField;
    spTransportGetAviaPlaces: TSmallintField;
    dsTransportGetAvia: TDataSetProvider;
    spClassHelper: TADOStoredProc;
    dsClassHelper: TDataSetProvider;
    spClassHelperID_AviaClassHelper: TAutoIncField;
    spClassHelperName: TStringField;
    spClassHelperLastUpdated: TBytesField;
    spTransportGetTrain: TADOStoredProc;
    dsTransportGetTrain: TDataSetProvider;
    spGetTrainClass: TADOStoredProc;
    dsGetTrainClass: TDataSetProvider;
    spTransportGetTrainID_Train: TAutoIncField;
    spTransportGetTrainNum: TIntegerField;
    spTransportGetTrainExtIdType: TIntegerField;
    spTransportGetTrainDeleted: TBooleanField;
    spTransportGetTrainTrainType: TStringField;
    spGetTrainClassId_RefValue: TAutoIncField;
    spGetTrainClassName: TStringField;
    spTransportGetBus: TADOStoredProc;
    dsTransportGetBus: TDataSetProvider;
    spGetBussClass: TADOStoredProc;
    dsGetBussClass: TDataSetProvider;
    spTransportGetBusID_Bus: TAutoIncField;
    spTransportGetBusBrand: TStringField;
    spTransportGetBusLevels: TBooleanField;
    spTransportGetBusExtIdClass: TIntegerField;
    spTransportGetBusPlaces1: TIntegerField;
    spTransportGetBusPlaces2: TIntegerField;
    spTransportGetBusDeleted: TBooleanField;
    spTransportGetBusClass: TStringField;
    spGetBussClassId_RefValue: TAutoIncField;
    spGetBussClassName: TStringField;
    spTransportGetWater: TADOStoredProc;
    dsTransportGetWater: TDataSetProvider;
    spGetWaterClass: TADOStoredProc;
    AutoIncField4: TAutoIncField;
    StringField11: TStringField;
    dsGetWaterClass: TDataSetProvider;
    spTransportGetWaterID_Water: TAutoIncField;
    spTransportGetWaterExtIdType: TIntegerField;
    spTransportGetWaterName: TStringField;
    spTransportGetWaterDecks: TSmallintField;
    spTransportGetWaterComfort: TStringField;
    spTransportGetWaterId_Yacht: TIntegerField;
    spTransportGetWaterDeleted: TBooleanField;
    spTransportGetWaterType: TStringField;
    spTransportGetListDescr: TStringField;
    spServiseGetListRBLPrice: TFloatField;
    spCurrencyGetListCode: TStringField;
    spCurrencyGetListRateUSD: TFloatField;
    spCurrencyGetListExchPercent: TFloatField;
    spCurrencyGetListAvForPay: TBooleanField;
    spTourGetPropid_Provider: TIntegerField;
    spTourGetPropProviderName: TStringField;
    spServiceTypeGetProp: TADOStoredProc;
    dsServiceTypeGetProp: TSQLUpdateDSProvider;
    spServiceTypeGetPropid_ServiceType: TAutoIncField;
    spServiceTypeGetPropid_ServiceTypeParent: TIntegerField;
    spServiceTypeGetPropName: TStringField;
    spServiceTypeGetPropShortName: TStringField;
    spServiceTypeGetPropLastUpdated: TBytesField;
    spServiceTypeGetPropDeleted: TBooleanField;
    spServiceTypeGetPropHide: TBooleanField;
    spServiceTypeGetPropatKP: TBooleanField;
    spServiceTypeGetPropatSite: TBooleanField;
    spServiceTypeGetPropMustHave: TBooleanField;
    spServiceTypeGetPropParentName: TStringField;
    spServiceTypeAdd: TADOStoredProc;
    dsBofTaskGetList: TDataSetProvider;
    spBofTaskGetList: TADOStoredProc;
    spBofTaskGetListName: TStringField;
    spBofTaskGetListDefDateStep: TIntegerField;
    spBofTaskGetListid_BofTask: TAutoIncField;
    spServiceTypeBofTaskGetListid_ServiceTypeBofTask: TAutoIncField;
    spTourGetPropSnglUDS: TFloatField;
    spTourGetPropDblUDS: TFloatField;
    spTourGetPropTrplUDS: TFloatField;
    spTourGetPropchldUDS: TFloatField;
    spTourGetPropchld2UDS: TFloatField;
    spTourGetPropadult3UDS: TFloatField;
    spTourGetPropadult4UDS: TFloatField;
    spTourGetPropinfantUDS: TFloatField;
    spTourFindid_Provider: TIntegerField;
    spTourFindProviderName: TStringField;
    spAdvTypes: TADOStoredProc;
    dsAdvTypes: TDataSetProvider;
    spAdvTypesid_Advice_Type: TAutoIncField;
    spAdvTypesName: TStringField;
    spAdvTypesLastUpdated: TBytesField;
    spAdvTypesDeleted: TBooleanField;
    spGetAdviceListid_Advice_Type: TIntegerField;
    spGetAdviceid_Advice_Type: TIntegerField;
    spGetAdviceName: TStringField;
    spAdviceFindid_Advice_Type: TIntegerField;
    spAdviceFindName: TStringField;
    stTrCnt: TADOStoredProc;
    dsTrCnt: TDataSetProvider;
    spTrCity: TADOStoredProc;
    dsTrCity: TDataSetProvider;
    stTrCntID: TIntegerField;
    stTrCntName: TStringField;
    spTrCityID: TIntegerField;
    spTrCityName: TStringField;
    dsTrHotel: TDataSetProvider;
    spTrHotel: TADOStoredProc;
    IntegerField6: TIntegerField;
    StringField9: TStringField;
    spProviderGetListAvia: TBooleanField;
    spProviderGetListBus: TBooleanField;
    spProviderGetListTrain: TBooleanField;
    spProviderGetListWater: TBooleanField;
    spProviderGetListTour: TBooleanField;
    spProviderGetListPrvPercent: TFloatField;
    spTourFindDateCreate: TDateTimeField;
    spMsgGetList: TADOStoredProc;
    dsMsgGetList: TDataSetProvider;
    spMsgGetListid_Message: TAutoIncField;
    spMsgGetListid_UserFrom: TIntegerField;
    spMsgGetListid_UserTo: TIntegerField;
    spMsgGetListSubj: TStringField;
    spMsgGetListBody: TStringField;
    spMsgGetListReaded: TBooleanField;
    spMsgGetListMarked: TBooleanField;
    spMsgGetListDeleted: TBooleanField;
    spMsgGetListMessageDate: TDateTimeField;
    spMsgGetListSender: TStringField;
    spMsgGetListReceiver: TStringField;
    spGetCountryPropNeed: TIntegerField;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
    procedure SQLUpdateDSUpdateError(Sender: TObject;
      DataSet: TClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure spWhoIAmAfterOpen(DataSet: TDataSet);
  private
    FDate : TDateTime;
    FUserName, FPassword: String;
    FFullFIO : String;
    FBaseName : String;
    procedure LogMessage(Message: String; EventType: DWord = 1; Category: Word = 0; ID: DWord = 0);
    function AddObjComment(APrcName : String; CmntSign: Integer; Comment: OleVariant; ID: Integer): Integer;
    function GetObjComment(APrcName : String; ID_Comment: Integer; out Sign: Integer) : String;
    function SetTourDeletedState(ID: Integer; AState: boolean): Integer;
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function DoLogin(UserName, Password: OleVariant): Integer; safecall;

    function SetCountryState(ID_Country: Integer; Deleted, atSite,
      atKP: WordBool): Integer; safecall;
    function SetCityState(ID_City: Integer; Deleted, atSite,
      atKP: WordBool): Integer; safecall;
    function SetHotelState(ID_Hotel: Integer; Deleted, atSite,
      atKP: WordBool): Integer; safecall;
    function BeginTruns: Integer; safecall;
    procedure CommitTrans; safecall;
    procedure RollbackTrans; safecall;
    function InTransaction: WordBool; safecall;
    function AddCountryComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer; safecall;
    function AddCityComment(ID, CmntSign: Integer;
      Comment: OleVariant): Integer; safecall;
    function AddHotelComment(ID, CmntSign: Integer;
      Comment: OleVariant): Integer; safecall;
    function AddTourComment(ID, CmntSign: Integer;
      Comment: OleVariant): Integer; safecall;
    function AddClientComment(ID, CmntSign: Integer;
      Comment: OleVariant): Integer; safecall;
    function AddContragentComment(ID, CmntSign: Integer;
      Comment: OleVariant): Integer; safecall;
    function AddServiceComment(ID, CmntSign: Integer;
      Comment: OleVariant): Integer; safecall;
    function GetCountryComment(ID_Comment: Integer;
      out Sign: Integer): OleVariant; safecall;
    function GetCityComment(ID_Comment: Integer;
      out Sign: Integer): OleVariant; safecall;
    function GetTourComment(ID_Comment: Integer;
      out Sign: Integer): OleVariant; safecall;
    function GetHotelComment(ID_Comment: Integer;
      out Sign: Integer): OleVariant; safecall;
    function GetContragentComment(ID_Comment: Integer;
      out Sign: Integer): OleVariant; safecall;
    function GetServiceComment(ID_Comment: Integer;
      out Sign: Integer): OleVariant; safecall;
    function CountryAdd(AName, Name_Eng, Code3: OleVariant; atKP, atSite,
      Deleted, ForeignPassport: WordBool; Descr: OleVariant): Integer;
      safecall;
    function CityAdd(ID_Country: Integer; id_CityType, AName, Name_Eng,
      Code3: OleVariant; atKP, atSite, Deleted: WordBool;
      Descr: OleVariant): Integer; safecall;
    function HotelAdd(id_City: Integer; ID_HotelType, AName,
      Name_Eng: OleVariant; atKP, atSite, Deleted: WordBool;
      Descr: OleVariant): Integer; safecall;
    procedure MessageEdit(ID: Integer; Subj, Body, ID_Parent: OleVariant;
      Deleted, Readed, Marked: WordBool); safecall;
    function MessageAdd(Subj, Body, ID_Parent: OleVariant): Integer; safecall;
    procedure AdviceEdit(ID: Integer; Subj, Body: OleVariant; Deleted, Readed,
      Marked: WordBool; ID_Type: OleVariant); safecall;
    function AdviceAdd(Subj, Body, ID_Type: OleVariant): Integer; safecall;
    function NewzAdd(Subj, Body: OleVariant): Integer; safecall;
    procedure NewzEdit(ID: Integer; Subj, Body: OleVariant; Deleted, Readed,
      Marked: WordBool); safecall;
    function TourAdd(AName, id_TourType: OleVariant; DateFrom,
      DateTo: TDateTime; offer_num: OleVariant; id_Currency: Integer; sngl,
      dbl, trpl, chld, chld2, adult3, adult4, infant: Single; atKP, atSite,
      Deleted: WordBool; id_Provider, Descr: OleVariant): Integer;
      safecall;
    function TourEdit(id_tour: Integer; AName, id_TourType: OleVariant;
      DateFrom, DateTo: TDateTime; offer_num: OleVariant;
      id_Currency: Integer; sngl, dbl, trpl, chld, chld2, adult3, adult4,
      infant: Single; atKP, atSite, Deleted: WordBool; id_Provider,
      Descr: OleVariant): Integer; safecall;
    function VKSMessageAdd(id_UserTo: Integer; Subj,
      Body: OleVariant): Integer; safecall;
    function VKSMessageEdit(id_Message: Integer; Subj, Body: OleVariant;
      Readed, Marked: WordBool): Integer; safecall;
    function VKSMessageDel(id_Message: Integer): Integer; safecall;
    function ServiceAdd(id_ServiceType, id_Provider: Integer;
      AName: OleVariant; Price: Single; Id_Currency: Integer; Deleted,
      Hide, atSite, atKP: WordBool): Integer; safecall;
    function ServiceEdit(id_Service, id_ServiceType, id_Provider: Integer;
      AName: OleVariant; Price: Single; Id_Currency: Integer; Deleted,
      Hide, atSite, atKP: WordBool): Integer; safecall;
    procedure UpdateTourName(IdTour: Integer); safecall;
    function DelTour(ID: Integer): Integer; safecall;
    function RestoreTour(ID: Integer): Integer; safecall;
    procedure AddTransportItem(id_Tour: Integer; ID_AviaItem, ID_TrainItem,
      ID_WaterItem, ID_BusItem, ID_OtherItem: OleVariant); safecall;
    function ServiceTypeAdd(id_ServiceTypeParent, AName: OleVariant; Deleted,
      Hide, AtSite, AtKP, MustHave: WordBool): Integer; safecall;
    function Advice_TypeAdd(AName: OleVariant): Integer; safecall;
    function Advice_TypeEdit(ID: Integer; AName: OleVariant;
      Deleted: WordBool): Integer; safecall;
    function  KPMsgAdd(Body: OleVariant): Integer; safecall;
    function  KPMsgGet: OleVariant; safecall;
  public
    property CreateDate : TDateTime read FDate;
    property UserName : String read FUserName;
    property Password : String read FPassword;
    property FullFIO : String read FFullFIO;
  end;

var
     FEventLogger : TEventLogger;

implementation

uses tstSvcForm;

{$R *.DFM}


{ TEventLogger }

constructor TEventLogger.Create(Name: String);
begin
  inherited Create;
  FName := Name;
  FEventLog := 0;
end;

destructor TEventLogger.Destroy;
begin
  if FEventLog <> 0 then
    DeregisterEventSource(FEventLog);
  inherited Destroy;
end;

procedure TEventLogger.LogMessage(Message: String; EventType: DWord;
  Category: Word; ID: DWord);
var
  P: Pointer;
begin
  P := PChar(Message);
  if FEventLog = 0 then
    FEventLog := RegisterEventSource(nil, PChar(FName));
  ReportEvent(FEventLog, EventType, Category, ID, nil, 1, 0, @P, nil);
end;

class procedure TDMKM.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

{ TDM }
procedure TDMKM.RemoteDataModuleCreate(Sender: TObject);
var Buffer : PChar;
    Len : DWORD;
    CmpName : String;
    i : integer;
    
    IniFile : TIniFile;
    S : String;
begin 
  FDate := Now;
  SvcForm.AddRDM(Self);

  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TSQLUpdateDSProvider) and (Assigned(TSQLUpdateDSProvider(Components[i]))) then
      TSQLUpdateDSProvider(Components[i]).OnUpdateError := SQLUpdateDSUpdateError;
  end;

  try
    Len := 256;
    Buffer := AllocMem(Len);
    GetComputerName(Buffer, Len);
    CmpName := StrPas(Buffer);
  finally
    FreeMem(Buffer, Len);
  end;
// ****************************************************************************
  S := ParamStr(0);
  S := ExpandFileName(S);
  Delete(S, Length(S) - 2, 3);
  S := S + 'ini';
  if  FileExists(S) then
  begin
    IniFile := TIniFile.Create(S);
    with IniFile do
    begin
      FBaseName := ReadString('Base', 'DB', 'OVK\TESTSQL');
    end;
    IniFile.Free;
  end;
// ****************************************************************************
end;

procedure TDMKM.RemoteDataModuleDestroy(Sender: TObject);
begin
  SvcForm.RemoveRDM(Self);
end;

function TDMKM.DoLogin(UserName, Password: OleVariant): Integer;
begin
  with ADOConnection1 do
  begin
   FUserName := UserName;
   FPassword := Password;
   Connected := false;
   ConnectionString := 'Provider=SQLOLEDB.1;Password="' +
     String(Password) + '";Persist Security Info=True;User ID=' +
     String(UserName) + ';Initial Catalog=FOBase;Data Source=' + FBaseName + 
                        ';Use Procedure for Prepare=1;Auto Translate=True;Application Name=' + SServiceName + '4.0;Packet Size=4096;';
   try                
     Connected := true;
     Result := 1;
     with spWhoIAm do
     begin
       Open;
       FFullFio := FieldByName('LastName').AsString + ' ' + FieldByName('FirstName').AsString + ' ' + FieldByName('SurName').AsString;
       Close;
     end;
   except
     on E : Exception do
     begin
       Result := 26;
       FEventLogger.LogMessage('DoLogin, ' + E.Message, EVENTLOG_ERROR_TYPE, 1, 1);
 //     raise Exception.Create(E.Message);
     end;
   end;
end;

end;

function TDMKM.SetCountryState(ID_Country: Integer; Deleted, atSite, atKP: WordBool): Integer;
begin
  Result := 0;
  with spCountrySetState do
  begin
    Parameters.ParamByName('@ID_Country').Value := ID_Country;
    Parameters.ParamByName('@Deleted').Value := Deleted;
    Parameters.ParamByName('@atSite').Value := atSite;
    Parameters.ParamByName('@atKP').Value := atKP;
    ExecProc;
    Result := 1;
  end;
end;

function TDMKM.SetCityState(ID_City: Integer; Deleted, atSite, atKP: WordBool): Integer;
begin
  Result := 0;
  with spCitySetState do
  begin
    Parameters.ParamByName('@ID_City').Value := ID_City;
    Parameters.ParamByName('@Deleted').Value := Deleted;
    Parameters.ParamByName('@atSite').Value := atSite;
    Parameters.ParamByName('@atKP').Value := atKP;
    ExecProc;
    Result := 1;
  end;
end;

function TDMKM.SetHotelState(ID_Hotel: Integer; Deleted, atSite, atKP: WordBool): Integer;
begin
  Result := 0;
  with spHotelSetState do
  begin
    Parameters.ParamByName('@ID_Hotel').Value := ID_Hotel;
    Parameters.ParamByName('@Deleted').Value := Deleted;
    Parameters.ParamByName('@atSite').Value := atSite;
    Parameters.ParamByName('@atKP').Value := atKP;
    ExecProc;
    Result := 1;
  end;
end;

function TDMKM.BeginTruns: Integer;
begin
  Result := ADOConnection1.BeginTrans;
end;

procedure TDMKM.CommitTrans;
begin
  ADOConnection1.CommitTrans;
end;

procedure TDMKM.RollbackTrans;
begin
  ADOConnection1.RollbackTrans;
end;

function TDMKM.InTransaction: WordBool;
begin
  Result := ADOConnection1.InTransaction;
end;

function TDMKM.AddCountryComment(ID: Integer; CmntSign: Integer; Comment: OleVariant): Integer;
begin
  Result := AddObjComment('GO_AddCommentCountry', CmntSign, Comment, ID);
end;

function TDMKM.AddCityComment(ID, CmntSign: Integer;
  Comment: OleVariant): Integer;
begin
  Result := AddObjComment('GO_AddCommentCity', CmntSign, Comment, ID);
end;

function TDMKM.AddHotelComment(ID, CmntSign: Integer;
  Comment: OleVariant): Integer;
begin
  Result := AddObjComment('GO_AddCommentHotel', CmntSign, Comment, ID);
end;

function TDMKM.AddTourComment(ID, CmntSign: Integer;
  Comment: OleVariant): Integer;
begin
  Result := AddObjComment('TR_CommentAdd', CmntSign, Comment, ID);
end;

function TDMKM.AddClientComment(ID, CmntSign: Integer;
  Comment: OleVariant): Integer;
begin

end;

function TDMKM.AddContragentComment(ID, CmntSign: Integer;
  Comment: OleVariant): Integer;
begin

end;

function TDMKM.AddServiceComment(ID, CmntSign: Integer;
  Comment: OleVariant): Integer;
begin

end;

function TDMKM.AddObjComment(APrcName: String; CmntSign: Integer;
  Comment: OleVariant; ID: Integer): Integer;
begin
  Result := 0;
  with spAddComment do
  begin
    ProcedureName := APrcName;
    Parameters.Refresh;
        
    Parameters.ParamByName('@ID').Value := ID;
    Parameters.ParamByName('@CmntSign').Value := CmntSign;
    Parameters.ParamByName('@Comment').Value := Comment;
    ExecProc;
    Result := 1;
  end;
end;

function TDMKM.GetCountryComment(ID_Comment: Integer;
  out Sign: Integer): OleVariant;
var ASgn : integer;
begin
  Result := GetObjComment('GO_GetCommentCountry', ID_Comment, ASgn);
  Sign := ASgn;
end;

function TDMKM.GetCityComment(ID_Comment: Integer;
  out Sign: Integer): OleVariant;
var ASgn : integer;
begin
  Result := GetObjComment('GO_GetCommentCity', ID_Comment, ASgn);
  Sign := ASgn;
end;

function TDMKM.GetTourComment(ID_Comment: Integer;
  out Sign: Integer): OleVariant;
var ASgn : integer;
begin
  Result := GetObjComment('TR_CommentGet', ID_Comment, ASgn);
  Sign := ASgn;
end;

function TDMKM.GetHotelComment(ID_Comment: Integer;
  out Sign: Integer): OleVariant;
begin

end;

function TDMKM.GetContragentComment(ID_Comment: Integer;
  out Sign: Integer): OleVariant;
begin

end;

function TDMKM.GetServiceComment(ID_Comment: Integer;
  out Sign: Integer): OleVariant;
begin

end;

function TDMKM.GetObjComment(APrcName : String; ID_Comment: Integer; out Sign: Integer) : String;
begin
  Result := '';
  Sign := 0;
  with spGetComment do
  begin
    Close;
    ProcedureName := APrcName;
    Parameters.Refresh;
    Parameters.ParamByName('@ID_Comment').Value := ID_Comment;
    try
      Open;
      Result := FieldByName('Comment').AsString;
      Sign := FieldByName('CommentType').AsInteger;
    finally
      Close;
    end;
  end;
end;

procedure TDMKM.LogMessage(Message: String; EventType: DWord; Category: Word;
  ID: DWord);
begin
  FEventLogger.LogMessage(Message, EventType, Category, ID);
end;

function TDMKM.CountryAdd(AName, Name_Eng, Code3: OleVariant; atKP, atSite,
  Deleted, ForeignPassport: WordBool; Descr: OleVariant): Integer;
begin
  try
    with spCountryAdd do
    begin
      Close;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@Name_Eng').Value := Name_Eng;
      Parameters.ParamByName('@Code3').Value := Code3;
      Parameters.ParamByName('@atKP').Value := atKP;
      Parameters.ParamByName('@atSite').Value := atSite;
      Parameters.ParamByName('@atSite').Value := atSite;
      Parameters.ParamByName('@Deleted').Value := Deleted;
      Parameters.ParamByName('@ForeignPassport').Value := ForeignPassport;
      Parameters.ParamByName('@Descr').Value := Descr;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    end;
  except
    on E : Exception do
    begin
      spCountryAdd.Close;
      LogMessage('CountryAdd ' + E.Message);
      Result := -1;
    end;
  end;
end;

function TDMKM.CityAdd(ID_Country: Integer; id_CityType, AName, Name_Eng,
  Code3: OleVariant; atKP, atSite, Deleted: WordBool;
  Descr: OleVariant): Integer;
begin
  try
    with spCityAdd do
    begin
      Close;
      Parameters.ParamByName('@ID_Country').Value := ID_Country;
      Parameters.ParamByName('@id_CityType').Value := id_CityType;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@Name_Eng').Value := Name_Eng;
      Parameters.ParamByName('@Code3').Value := Code3;
      Parameters.ParamByName('@atKP').Value := atKP;
      Parameters.ParamByName('@atSite').Value := atSite;
      Parameters.ParamByName('@Deleted').Value := Deleted;
      Parameters.ParamByName('@Descr').Value := Descr;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    end;
  except
    on E : Exception do
    begin
      spCityAdd.Close;
      LogMessage('CityAdd ' + E.Message);
      Result := -1;
    end;
  end;
end;

function TDMKM.HotelAdd(id_City: Integer; ID_HotelType, AName,
  Name_Eng: OleVariant; atKP, atSite, Deleted: WordBool;
  Descr: OleVariant): Integer;
begin
  try
    with spHotelAdd do
    begin
      Close;
      Parameters.ParamByName('@id_City').Value := id_City;
      Parameters.ParamByName('@ID_HotelType').Value := ID_HotelType;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@Name_Eng').Value := Name_Eng;
      Parameters.ParamByName('@atKP').Value := atKP;
      Parameters.ParamByName('@atSite').Value := atSite;
      Parameters.ParamByName('@Deleted').Value := Deleted;
      Parameters.ParamByName('@Descr').Value := Descr;
      
      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    end;
  except
    on E : Exception do
    begin
      spHotelAdd.Close;
      LogMessage('HotelAdd ' + E.Message);
      Result := -1;
    end;
  end;
end;

procedure TDMKM.SQLUpdateDSUpdateError(Sender: TObject;
  DataSet: TClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
var S : String;
begin
  if Sender is TComponent then
    S := TComponent(Sender).Name
  else
    S := 'компонент неизвестен';
  case UpdateKind of
    ukModify : S := S + ' Modify ';
    ukInsert : S := S + ' Insert ';
    ukDelete : S := S + ' Delete ';
  end;
  LogMessage(S + ' - ' + E.Message);
end;


procedure TDMKM.MessageEdit(ID: Integer; Subj, Body, ID_Parent: OleVariant;
  Deleted, Readed, Marked: WordBool);
begin
  try
    with spMessageEdit do
    begin
      Close;
      Parameters.ParamByName('@ID_Message').Value := ID;
      Parameters.ParamByName('@Subj').Value := Subj;
      Parameters.ParamByName('@Body').Value := Body;
      Parameters.ParamByName('@ID_Parent').Value := ID_Parent;
      Parameters.ParamByName('@Deleted').Value := Deleted;
      Parameters.ParamByName('@Readed').Value := Readed;
      Parameters.ParamByName('@Marked').Value := Marked;

      ExecProc;
      Close;
    end;
  except
    on E : Exception do
    begin
      spMessageAdd.Close;
      LogMessage('MessageEdit ' + E.Message);
    end;
  end;
end;

function TDMKM.MessageAdd(Subj, Body, ID_Parent: OleVariant): Integer;
begin
  try
    with spMessageAdd do
    begin
      Close;
      Parameters.ParamByName('@Subj').Value := Subj;
      Parameters.ParamByName('@Body').Value := Body;
      Parameters.ParamByName('@ID_Parent').Value := ID_Parent;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    end;
  except
    on E : Exception do
    begin
      spMessageAdd.Close;
      LogMessage('MessageAdd ' + E.Message);
      Result := -1;
    end;
  end;
end;

procedure TDMKM.AdviceEdit(ID: Integer; Subj, Body: OleVariant; Deleted,
  Readed, Marked: WordBool; ID_Type: OleVariant);
begin
  with spAdviceEdit do
  begin
    try
      Close;
      Parameters.ParamByName('@ID_Advice').Value := ID;
      Parameters.ParamByName('@Subj').Value := Subj;
      Parameters.ParamByName('@Body').Value := Body;
      Parameters.ParamByName('@Deleted').Value := Deleted;
      Parameters.ParamByName('@Readed').Value := Readed;
      Parameters.ParamByName('@Marked').Value := Marked;
      Parameters.ParamByName('@id_Advice_Type').Value := ID_Type;

      ExecProc;
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('AdviceEdit ' + E.Message);
      end;
    end;
  end;
end;

function TDMKM.AdviceAdd(Subj, Body, ID_Type: OleVariant): Integer;
begin
  with spAdviceAdd do
  begin
    try
      Close;
      Parameters.ParamByName('@Subj').Value := Subj;
      Parameters.ParamByName('@Body').Value := Body;
      Parameters.ParamByName('@id_Advice_Type').Value := ID_Type;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('AdviceAdd ' + E.Message);
      end;
    end;
  end;
end;

function TDMKM.NewzAdd(Subj, Body: OleVariant): Integer;
begin
  with spNewzAdd do
  begin
    try
      Close;
      Parameters.ParamByName('@Subj').Value := Subj;
      Parameters.ParamByName('@Body').Value := Body;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('NewzAdd ' + E.Message);
      end;
    end;
  end;
end;

procedure TDMKM.NewzEdit(ID: Integer; Subj, Body: OleVariant; Deleted,
  Readed, Marked: WordBool);
begin
  with spNewzEdit do
  begin
    try
      Close;
      Parameters.ParamByName('@ID_Newz').Value := ID;
      Parameters.ParamByName('@Subj').Value := Subj;
      Parameters.ParamByName('@Body').Value := Body;
      Parameters.ParamByName('@Deleted').Value := Deleted;
      Parameters.ParamByName('@Readed').Value := Readed;
      Parameters.ParamByName('@Marked').Value := Marked;

      ExecProc;
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('NewzEdit ' + E.Message);
      end;
    end;
  end;
end;

function TDMKM.TourAdd(AName, id_TourType: OleVariant; DateFrom,
  DateTo: TDateTime; offer_num: OleVariant; id_Currency: Integer; sngl,
  dbl, trpl, chld, chld2, adult3, adult4, infant: Single; atKP, atSite,
  Deleted: WordBool; id_Provider, Descr: OleVariant): Integer;
begin
  try
    with spTourAdd do
    begin
      Close;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@id_TourType').Value := id_TourType;
      Parameters.ParamByName('@DateFrom').Value := DateFrom;
      Parameters.ParamByName('@DateTo').Value := DateTo;
      Parameters.ParamByName('@offer_num').Value := offer_num;
      Parameters.ParamByName('@id_Currency').Value := id_Currency;
      Parameters.ParamByName('@sngl').Value := sngl;
      Parameters.ParamByName('@dbl').Value := dbl;
      Parameters.ParamByName('@trpl').Value := trpl;
      Parameters.ParamByName('@chld').Value := chld;
      Parameters.ParamByName('@chld2').Value := chld2;
      Parameters.ParamByName('@adult3').Value := adult3;
      Parameters.ParamByName('@adult4').Value := adult4;
      Parameters.ParamByName('@infant').Value := infant;
      
      Parameters.ParamByName('@atKP').Value := atKP;
      Parameters.ParamByName('@atSite').Value := atSite;
      Parameters.ParamByName('@Deleted').Value := Deleted;
      Parameters.ParamByName('@id_Provider').Value := id_Provider;
      Parameters.ParamByName('@Descr').Value := Descr;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    end;
  except
    on E : Exception do
    begin
      spTourAdd.Close;
      LogMessage('NewTour ' + E.Message);
      Result := -1;
    end;
  end;
end;

function TDMKM.TourEdit(id_tour: Integer; AName, id_TourType: OleVariant;
  DateFrom, DateTo: TDateTime; offer_num: OleVariant; id_Currency: Integer;
  sngl, dbl, trpl, chld, chld2, adult3, adult4, infant: Single; atKP,
  atSite, Deleted: WordBool; id_Provider, Descr: OleVariant): Integer;
begin
  Result := -1;
  with spTourEdit do
  begin
    try
      Close;
      Parameters.ParamByName('@id_tour').Value := id_tour;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@id_TourType').Value := id_TourType;
      Parameters.ParamByName('@DateFrom').Value := DateFrom;
      Parameters.ParamByName('@DateTo').Value := DateTo;
      Parameters.ParamByName('@offer_num').Value := offer_num;
      Parameters.ParamByName('@id_Currency').Value := id_Currency;
      Parameters.ParamByName('@sngl').Value := sngl;
      Parameters.ParamByName('@dbl').Value := dbl;
      Parameters.ParamByName('@trpl').Value := trpl;
      Parameters.ParamByName('@chld').Value := chld;
      Parameters.ParamByName('@chld2').Value := chld2;
      Parameters.ParamByName('@adult3').Value := adult3;
      Parameters.ParamByName('@adult4').Value := adult4;
      Parameters.ParamByName('@infant').Value := infant;
      
      Parameters.ParamByName('@atKP').Value := atKP;
      Parameters.ParamByName('@atSite').Value := atSite;
      Parameters.ParamByName('@Deleted').Value := Deleted;
      Parameters.ParamByName('@id_Provider').Value := id_Provider;
      Parameters.ParamByName('@Descr').Value := Descr;

      ExecProc;
      Result := 1;
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('TourEdit ' + E.Message);
      end;
    end;
  end;
end;

function TDMKM.VKSMessageAdd(id_UserTo: Integer; Subj,
  Body: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;

      ProcedureName := 'MSG_MessageAdd';
      Parameters.Refresh;

      Parameters.ParamByName('@id_UserTo').Value := id_UserTo;
      Parameters.ParamByName('@Subj').Value := Subj;
      Parameters.ParamByName('@Body').Value := Body;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('VKSMessageAdd ' + E.Message);
      end;
    end;
  end;
end;

function TDMKM.VKSMessageEdit(id_Message: Integer; Subj, Body: OleVariant;
  Readed, Marked: WordBool): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;

      ProcedureName := 'MSG_MessageEdit';
      Parameters.Refresh;

      Parameters.ParamByName('@id_Message').Value := id_Message;
      Parameters.ParamByName('@Subj').Value := Subj;
      Parameters.ParamByName('@Body').Value := Body;
      Parameters.ParamByName('@Readed').Value := Readed;
      Parameters.ParamByName('@Marked').Value := Marked;

      ExecProc;
      Result := -1;
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('VKSMessageEdit ' + E.Message);
      end;
    end;
  end;
end;

function TDMKM.VKSMessageDel(id_Message: Integer): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;

      ProcedureName := 'MSG_MessageDel';
      Parameters.Refresh;

      Parameters.ParamByName('@id_Message').Value := id_Message;

      ExecProc;
      Result := 1;
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('VKSMessageDel ' + E.Message);
      end;
    end;
  end;
end;

function TDMKM.ServiceAdd(id_ServiceType, id_Provider: Integer;
  AName: OleVariant; Price: Single; Id_Currency: Integer; Deleted, Hide,
  atSite, atKP: WordBool): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'SVC_ServiceAdd';
      Parameters.Refresh;

      Parameters.ParamByName('@id_ServiceType').Value := id_ServiceType;
      Parameters.ParamByName('@id_Provider').Value := id_Provider;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@Price').Value := Price;
      Parameters.ParamByName('@Id_Currency').Value := Id_Currency;
      Parameters.ParamByName('@Deleted').Value := Deleted;
      Parameters.ParamByName('@Hide').Value := Hide;
      Parameters.ParamByName('@atSite').Value := atSite;
      Parameters.ParamByName('@atKP').Value := atKP;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('ServiceAdd ' + E.Message);
      end;
    end;
  end;
end;

function TDMKM.ServiceEdit(id_Service, id_ServiceType,
  id_Provider: Integer; AName: OleVariant; Price: Single;
  Id_Currency: Integer; Deleted, Hide, atSite, atKP: WordBool): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;
      ProcedureName := 'SVC_ServiceEdit';
      Parameters.Refresh;

      Parameters.ParamByName('@id_Service').Value := id_Service;
      Parameters.ParamByName('@id_ServiceType').Value := id_ServiceType;
      Parameters.ParamByName('@id_Provider').Value := id_Provider;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@Price').Value := Price;
      Parameters.ParamByName('@Id_Currency').Value := Id_Currency;
      Parameters.ParamByName('@Deleted').Value := Deleted;
      Parameters.ParamByName('@Hide').Value := Hide;
      Parameters.ParamByName('@atSite').Value := atSite;
      Parameters.ParamByName('@atKP').Value := atKP;

      ExecProc;
      Result := 1;
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('ServiceAdd ' + E.Message);
      end;
    end;
  end;
end;


procedure TDMKM.spWhoIAmAfterOpen(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
    LogMessage('НЕт прав на запуск программы', EVENTLOG_ERROR_TYPE, 1, 2);
end;

procedure TDMKM.UpdateTourName(IdTour: Integer);
begin
  with spAddComment do
  begin
    ProcedureName := 'TR_TourUpdateName';
    Parameters.Refresh;
        
    Parameters.ParamByName('@ID_Tour').Value := IdTour;
    ExecProc;
  end;
end;


function TDMKM.SetTourDeletedState(ID: Integer; AState : boolean): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;

      ProcedureName := 'TR_TourSetDeletedState';
      Parameters.Refresh;

      Parameters.ParamByName('@id_Tour').Value := ID;
      Parameters.ParamByName('@Del').Value := AState;

      ExecProc;
      Close;
      Result := 1;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('SetTourDeletedState ' + E.Message);
      end;
    end;
  end;
end;

function TDMKM.DelTour(ID: Integer): Integer;
begin
  Result := SetTourDeletedState(ID, true);
end;

function TDMKM.RestoreTour(ID: Integer): Integer;
begin
  Result := SetTourDeletedState(ID, false);
end;

procedure TDMKM.AddTransportItem(id_Tour: Integer; ID_AviaItem,
  ID_TrainItem, ID_WaterItem, ID_BusItem, ID_OtherItem: OleVariant);
begin

end;

function TDMKM.ServiceTypeAdd(id_ServiceTypeParent, AName: OleVariant;
  Deleted, Hide, AtSite, AtKP, MustHave: WordBool): Integer;
begin
  Result := -1;
  with spServiceTypeAdd do
  begin
    try
      Close;
      Parameters.ParamByName('@id_ServiceTypeParent').Value := id_ServiceTypeParent;
      Parameters.ParamByName('@Name').Value := AName;

      Parameters.ParamByName('@Deleted').Value := Deleted;
      Parameters.ParamByName('@Hide').Value := Hide;
      Parameters.ParamByName('@atSite').Value := atSite;
      Parameters.ParamByName('@atKP').Value := atKP;
      Parameters.ParamByName('@MustHave').Value := MustHave;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('ServiceTypeAdd ' + E.Message);
      end;
    end;
  end;
end;

function TDMKM.Advice_TypeAdd(AName: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;

      ProcedureName := 'ADV_Advice_TypeAdd';
      Parameters.Refresh;

      Parameters.ParamByName('@Name').Value := AName;

      ExecProc;
      Result := Parameters.ParamValues['@RETURN_VALUE'];
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('Advice_TypeAdd ' + E.Message);
      end;
    end;
  end;
end;

function TDMKM.Advice_TypeEdit(ID: Integer; AName: OleVariant;
  Deleted: WordBool): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;

      ProcedureName := 'ADV_Advice_TypeEdit';
      Parameters.Refresh;

      Parameters.ParamByName('@id_Advice_Type').Value := ID;
      Parameters.ParamByName('@Name').Value := AName;
      Parameters.ParamByName('@Deleted').Value := Deleted;

      ExecProc;
      Result := 1;
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('Advice_TypeEdit ' + E.Message);
      end;
    end;
  end;
end;

function TDMKM.KPMsgAdd(Body: OleVariant): Integer;
begin
  Result := -1;
  with ADOStoredProc1 do
  begin
    try
      Close;

      ProcedureName := 'KP_MsgAdd';
      Parameters.Refresh;

      Parameters.ParamByName('@Body').Value := Body;

      ExecProc;
      Result := 1;
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('KPMsgAdd ' + E.Message);
      end;
    end;
  end;
end;

function TDMKM.KPMsgGet: OleVariant;
begin
  Result := '';
  with ADOStoredProc1 do
  begin
    try
      Close;

      ProcedureName := 'KP_MsgGet';
      Parameters.Refresh;

      Open;
      Result := FieldByName('Body').AsString;
      Close;
    except
      on E : Exception do
      begin
        Close;
        LogMessage('KPMsgGet ' + E.Message);
      end;
    end;
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TDMKM, Class_DMKM, ciMultiInstance, tmApartment);

  FEventLogger := TEventLogger.Create(SServiceName);
  FEventLogger.LogMessage('Сервис ' + SServiceName + ' запущен', EVENTLOG_INFORMATION_TYPE);

finalization
  FEventLogger.LogMessage('Сервис ' + SServiceName + ' остановлен', EVENTLOG_INFORMATION_TYPE);
 // if FEventLogger <> nil then
 //   FEventLogger.Free;
end.
