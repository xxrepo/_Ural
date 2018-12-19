unit uStr;

interface

uses  classes, ActiveX, Comobj;

type
  TxOleStream = class(TStream)
  private
    FStream: IStream;
  protected
    function GetIStream: IStream;
  public
    constructor Create(const Stream: IStream);
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
  end;

  
implementation

{ TOleStream }

constructor TxOleStream.Create(const Stream: IStream);
begin
  FStream := Stream;
end;

function TxOleStream.GetIStream: IStream;
begin
  Result := FStream;
end;

function TxOleStream.Read(var Buffer; Count: Integer): Longint;
begin
  OleCheck(FStream.Read(@Buffer, Count, @Result));
end;

function TxOleStream.Seek(Offset: Integer; Origin: Word): Longint;
var
  Pos: Largeint;
begin
  OleCheck(FStream.Seek(Offset, Origin, Pos));
  Result := Longint(Pos);
end;

function TxOleStream.Write(const Buffer; Count: Integer): Longint;
begin
  OleCheck(FStream.Write(@Buffer, Count, @Result));
end;

end.
 