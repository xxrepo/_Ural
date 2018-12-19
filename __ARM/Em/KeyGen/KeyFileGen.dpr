program KeyFileGen;

uses
  Forms, classes, Windows, Sysutils,
  Unit1 in 'Unit1.pas' {Form1},
  uMeCrpt in '..\..\common\uMeCrpt.pas';

{$R *.RES}

var S, S2, ABaseName, AUserName, APassword, AIC, APath : String;
    FS : TMemoryStream;
    Buffer : PChar;
    Len : DWORD;
    Apos : integer;
begin
  if ParamCount >= 4 then
  begin
    ABaseName := ParamStr(1);
    AUserName := ParamStr(2);
    APassword := ParamStr(3);

    S := CmdLine;
    S2 := ABaseName + ' ' + AUserName + ' ' + APassword;
    APos := pos(S2, S);
    APath := Copy(S, APos + Length(S2) + 1, Length(S) - APos - Length(S2) + 1);
    if ABaseName = '-1' then
    begin
      try
        Len := 256;
        Buffer := AllocMem(Len);
        GetComputerName(Buffer, Len);
        ABaseName := StrPas(Buffer);
      finally
        FreeMem(Buffer, Len);
      end;
    end;
    try
      FS := MakeFS(ABaseName, AUserName, APassword, AIC );
      CreateDir(APath);
      FS.SaveToFile(APath + '\Key.ack');
    finally
      FS.Free;
    end;
  end
  else
  begin
    Application.Initialize;
    Application.Title := 'Генератор ключей';
    Application.CreateForm(TForm1, Form1);
    Application.Run;
  end;
end.
