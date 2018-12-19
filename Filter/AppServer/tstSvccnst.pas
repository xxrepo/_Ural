
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1997,99 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit tstSvccnst;

interface

const
  //Do not localize
//  KEY_SOCKETSERVER  = '\SOFTWARE\FO\MIDAS Server';
  KEY_IE            = 'SOFTWARE\Microsoft\Internet Explorer';
//  csSettings        = 'Settings';
//  ckPort            = 'Port';
//  ckThreadCacheSize = 'ThreadCacheSize';
//  ckInterceptGUID   = 'InterceptGUID';
//  ckShowHost        = 'ShowHost';
//  ckTimeout         = 'Timeout';
  ckRegistered      = 'RegisteredOnly';
  SServiceName      = 'ural_FLT';
  SApplicationName  = 'UF Server';

resourcestring
//  SServiceOnly = 'The Socket Server can only be run as a service on NT 3.51 and prior';
//  SErrClose = 'Cannot exit when there are active connections. Kill connections?';
//  SErrChangeSettings = 'Cannot change settings when there are active connections. Kill connections?';
//  SQueryDisconnect = 'Disconnecting clients can cause application errors. Continue?';
///  SOpenError = 'Error opening port %d with error: %s';
//  SHostUnknown = '(Unknown)';
///  SNotShown = '(Not Shown)';
  SStatusline = '%d присоединенных клиентов';
  SAlreadyRunning = '—ервис уже запущен!!!';
//  SNotUntilRestart = 'This change will not take affect until the Socket Server is restarted';

implementation

end.
 