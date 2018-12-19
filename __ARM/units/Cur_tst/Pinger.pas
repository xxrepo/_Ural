unit Pinger;

interface

uses Windows, WinSock, Sysutils;

function Ping(Address : string) : DWORD;

implementation

type

  ip_option_information = packed record  // Информация заголовка IP (Наполнение
                          // этой структуры и формат полей описан в RFC791.
    Ttl : byte;		  // Время жизни (используется traceroute-ом)
    Tos : byte;		  // Тип обслуживания, обычно 0
    Flags : byte;	  // Флаги заголовка IP, обычно 0
    OptionsSize : byte;	  // Размер данных в заголовке, обычно 0, максимум 40
    OptionsData : Pointer;// Указатель на данные
  end;

  icmp_echo_reply = packed record
    Address : u_long;     // Адрес отвечающего
    Status : u_long;	  // IP_STATUS (см. ниже)
    RTTime : u_long;	  // Время между эхо-запросом и эхо-ответом в миллисекундах
    DataSize : u_short;   // Размер возвращенных данных
    Reserved : u_short;   // Зарезервировано
    Data : Pointer; 	  // Указатель на возвращенные данные
    Options : ip_option_information; // Информация из заголовка IP
  end;

  PIPINFO = ^ip_option_information;
  PVOID = Pointer;

  function IcmpCreateFile() : THandle; stdcall; external 'ICMP.DLL' name 'IcmpCreateFile';
  function IcmpCloseHandle(IcmpHandle : THandle) : BOOL; stdcall; external 'ICMP.DLL'  name 'IcmpCloseHandle';
  function IcmpSendEcho(
    IcmpHandle : THandle;    // handle, возвращенный IcmpCreateFile()
    DestAddress : u_long;    // Адрес получателя (в сетевом порядке)
    RequestData : PVOID;     // Указатель на посылаемые данные
    RequestSize : Word;      // Размер посылаемых данных
    RequestOptns : PIPINFO;  // Указатель на посылаемую структуру
                             // ip_option_information (может быть nil)
    ReplyBuffer : PVOID;     // Указатель на буфер, содержащий ответы.
    ReplySize : DWORD;       // Размер буфера ответов
    Timeout : DWORD          // Время ожидания ответа в миллисекундах
   ) : DWORD; stdcall; external 'ICMP.DLL' name 'IcmpSendEcho';

function GetURLOnly (AURL : String) : String;
  function AAA(S : String; var Res : String) : boolean;
  var i : integer;
  begin
    Res := '';
    Result := false;
    i := Pos(UpperCase(S), UpperCase(AURL));
    if i > 0 then
    begin
      Res := Copy(AURL, 1, i + Length(S) - 1);
      Result := true;
    end;
  end;
begin
  if not AAA('.ru', Result) then
    if not AAA('.com', Result) then

end;

function Ping(Address : string) : DWORD;
var
  hIP : THandle;
  PingBuffer : array [0..31] of Char;
  pIpe : ^icmp_echo_reply;
  pHostEn : PHostEnt;
  wVersionRequested : WORD;
  lwsaData : WSAData;
  DestAddress : In_Addr;
begin
//  Address := GetURLOnly(Address);
  // Создаем handle
  hIP := IcmpCreateFile();

  GetMem(pIpe, sizeof(icmp_echo_reply) + sizeof(PingBuffer));
  pIpe.Data := @PingBuffer;
  pIpe.DataSize := SizeOf(PingBuffer);

  wVersionRequested := MakeWord(1,1);
  Result := WSAStartup(wVersionRequested,lwsaData);
  if Result = 0 then
    begin
    pHostEn := GetHostByName(PChar(Address));
    Result := GetLastError();

    if (Result = 0) then
      begin
      DestAddress := PInAddr(pHostEn^.h_addr_list^)^;

      // Посылаем ping-пакет
    {  Memo1.Lines.Add('Pinging ' +
                      pHostEn^.h_name+' ['+
                      inet_ntoa(DestAddress)+'] '+
                      ' with '+
                      IntToStr(sizeof(PingBuffer)) +
                      ' bytes of data:');}

      IcmpSendEcho(hIP,
                   DestAddress.S_addr,
                   @PingBuffer,
                   sizeof(PingBuffer),
                   Nil,
                   pIpe,
                   sizeof(icmp_echo_reply) + sizeof(PingBuffer),
                   5000);

      Result := GetLastError();
      end;
    end;


  IcmpCloseHandle(hIP);
  WSACleanup();
  FreeMem(pIpe);
end;

end.
