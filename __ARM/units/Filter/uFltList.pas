unit uFltList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frFltList, UniverseFilter;

type
  TFltList = class(TForm)
    fFltList1: TfFltList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Initialize(ASelectObjEvent : TSelectObjEvent);

  end;

procedure ShowFltList(ASelectObjEvent : TSelectObjEvent);

var
  FltList: TFltList;

implementation

uses uDM;
  procedure ShowFltList(ASelectObjEvent : TSelectObjEvent);
  begin
    if not Assigned(FltList) then
    begin
      FltList := TFltList.Create(nil);
      FltList.Initialize(ASelectObjEvent);
    end
    else
    begin
      FltList.WindowState := wsMaximized;
      FltList.BringToFront;
    end;
  end;

{$R *.DFM}

procedure TFltList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFltList.FormDestroy(Sender: TObject);
begin
  FltList := nil;
end;

procedure TFltList.Initialize(ASelectObjEvent : TSelectObjEvent);
begin
  fFltList1.Initialize(DM.rsFlt, DM.IDUser, ASelectObjEvent);
end;

end.
