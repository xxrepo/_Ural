unit frFLT;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, extctrls, Db, ADODB, sLabel, sComboBox, sButton, DBClient;

type
  TfFlt = class(TFrame)
    Label1: TsLabel;
    cbVal: TsComboBox;
    sButton1: TsButton;
    procedure Button1Click(Sender: TObject);
    procedure cbValChange(Sender: TObject);
  private
    FSL : TStrings;
  public
    xNextFrame : TfFlt;
    constructor Create(AOwner: TComponent);  override;
    destructor Destroy; override;
  end;
function GetFrame(aLabel : String; AList : TPanel; SL : TStrings; ASP : TClientDataSet; ChEvent : TNotifyEvent) :  TfFlt;

implementation

uses foMyFunc;

{$R *.DFM}

function GetFrame(aLabel : String; AList : TPanel; SL : TStrings; ASP : TClientDataSet; ChEvent : TNotifyEvent) :  TfFlt;
var i : integer;
begin
  Result := nil;
  for i := 0 to AList.ControlCount - 1 do
  begin
    if (AList.Controls[i] is TfFlt) then
      if TfFlt(AList.Controls[i]).Label1.Caption = aLabel then
      begin
        Result := TfFlt(AList.Controls[i]);
        Break;
      end;
  end;
  if not Assigned(Result) then
  begin
    Result := TfFlt.Create(GetControlOwner(AList));
    Result.Name := 'fFlt' + IntToStr(GetTickCount);
    Result.Label1.Caption := aLabel;
    Result.Parent := AList;
    Result.FSL := SL;
    Result.cbVal.OnChange := ChEvent;


  end;
  Result.Visible := true;
  Result.Top := 1000;
  Result.Align := alTop;

  Result.cbVal.Items.Clear;
  
  with ASP do
  begin
    Open;
    while not Eof do
    begin
      Result.cbVal.Items.Add(ASP.fieldByName('Val').AsString);
      Next;
    end;
  end;


end;

procedure TfFlt.Button1Click(Sender: TObject);
begin

  try
    Hide;
    FSL.Add(Label1.Caption);
    cbVal.OnChange(nil);
  //  SendMessage(GetControlOwner(Self).Handle, xxx_DelMeMsg, integer(Self), 0);
  except
  end;
end;

destructor TfFlt.Destroy;
begin
  inherited;

end;

procedure TfFlt.cbValChange(Sender: TObject);
begin
//*
end;

constructor TfFlt.Create(AOwner: TComponent);
begin
  inherited;
  xNextFrame := nil;
end;

end.
