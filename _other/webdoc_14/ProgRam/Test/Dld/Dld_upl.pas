unit Dld_upl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, MConnect, SConnect, StdCtrls, RXSpin;

type
  TForm1 = class(TForm)
    Button1: TButton;
    SocketConnection1: TSocketConnection;
    Memo: TMemo;
    RxSpinEdit1: TRxSpinEdit;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure DLD_File(ArraySize: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.DLD_File(ArraySize : integer);
var
  VData: Variant;
  PData: PByteArray;
  FS: TMemoryStream;
  ByteCount, FileSize: Integer;
begin
  with SocketConnection1 do
  begin
    {Allocate the string variable S to hold the number of bytes
    returned in the variant array.}
    ///SetLength(S, ArraySize);
    FS := TMemoryStream.Create;
    {Connect to the Midas server and empty the memo component.}
    if not Connected then
      Open;
    Memo.Lines.Clear;
    {Call the server's OpenFile method. This creates the TFileStream
    on the server that is used to read the file. The name of the file
    to read is passed as a parameter.}
    FileSize := AppServer.FileDLD_OpenFile('c:\prj\prg.zip');
    Memo1.Lines.Add(IntToStr(FileSize));
    {Read data from the server until the entire file has been read.}
    while True do
    begin
      {Read a block of data from the server. GetFileData returns the actual
      number of bytes read. The parameter is a variant array of bytes
      passed by reference.}
      VData := Unassigned;
      ByteCount := AppServer.FileDLD_GetFileData(VData, ArraySize);
      {If the number of bytes read is zero the end of the file has been reached.}
      if ByteCount = 0 then
        Break;
      {Lock the variant array and get a pointer to the array values.}
      PData := VarArrayLock(VData);
      try
        {The read that reaches the end of the file may return fewer bytes
     than requested. If so, resize the string variable to hold the
     number of bytes actually read.}
       // if ByteCount < ArraySize then
       //   SetLength(S, ByteCount);
       FS.Write(PData^, ByteCount);
        {Move the data from the variant array to the string variable.}
      //  Move(PData^, S[1], ByteCount);
      finally
        VarArrayUnlock(VData);
      end; //try
    end; //while
    AppServer.FileDLD_CloseFile;
      FS.SaveToFile('c:\prj\webdoc\ProgRam\Test\Dld\zzz.zip');
    //  Memo.Lines.LoadFromFile('c:\prj\webdoc\ProgRam\Test\Dld\zzz.zz');
  end; //with
end;

procedure TForm1.Button1Click(Sender: TObject);
var D : integer;
begin
  D := GetTickCount;
  DLD_File(trunc(RxSpinEdit1.value));

  Memo1.Lines.Add(Formatfloat('0', RxSpinEdit1.value) + ' - ' + IntToStr(GetTickCount - D));
end;

procedure TForm1.Button2Click(Sender: TObject);
var P,P1 : pointer;
    buff : OleVariant;
    fs : TFileStream;
    D : integer;
begin
  D := GetTickCount;
  fs := TFileStream.Create('c:\prj\prg.zip', fmOpenRead);
  GetMem(P, fs.size);
  fs.ReadBuffer(P^, fs.size); // читаем из потока в P^
  buff := VarArrayCreate([0, fs.size], varByte);
  P1 := VarArrayLock(buff);
  move(P^, P1^, fs.size); // перемещаем из P^ в массив buff
  VarArrayUnLock(buff);
  FreeMem(P, fs.size);
  fs.Free;
  SocketConnection1.Open;
  
  SocketConnection1.AppServer.FileUpl_OpenFile(-1, 'c:\prj\webdoc\ProgRam\Test\Dld\zzz22.zip');
  SocketConnection1.AppServer.FileUpl_SetFileData(buff);
  
  Memo1.Lines.Add(Formatfloat('0', RxSpinEdit1.value) + ' - ' + IntToStr(GetTickCount - D));
end;

end.
