unit uFltEng;

interface

uses controls, Windows, Messages, classes,
     StrUtils, Sysutils, DB, dbclient, ADOdb;

function MakeSQLText(ADOConnection: TADOConnection; AID: integer; var ASQLText : String) : boolean;


implementation

function MakeSQLText(ADOConnection: TADOConnection; AID: integer; var ASQLText : String) : boolean;
begin

end;


end.
