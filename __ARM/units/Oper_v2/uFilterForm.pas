unit uFilterForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, UniverseFilterFrame, db, UniverseFilter, UniverseFilterForm;

type
  TfShowFlt = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    Button1: TButton;
    UFFrame1: TUFFrame;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function initialize(AConnection : TCustomConnection;
                        AUniverseID : integer; id_user : integer;
                        Aid_business : integer;
                        ASelectObjEvent : TSelectObjEvent;
                        AOwner : TComponent = nil;
                        ATaskMaster : TTaskMasterClass = nil): boolean;
  end;

var
  fShowFlt: TfShowFlt;


function ShowFlt(AConnection : TCustomConnection;
                 AUniverseID : integer; id_user : integer;
                 ACondNum : integer;
                 ASelectObjEvent : TSelectObjEvent;
                 AOwner : TComponent;
                 ATaskMaster : TTaskMasterClass): boolean;
implementation

uses foMyFunc, UniverseFilterUnit2;


{$R *.DFM}

function ShowFlt(AConnection : TCustomConnection;
                 AUniverseID : integer; id_user : integer;
                 ACondNum : integer;
                 ASelectObjEvent : TSelectObjEvent;
                 AOwner : TComponent;
                 ATaskMaster : TTaskMasterClass): boolean;
var F : TfShowFlt;
    i : integer;
    FilterData : TFilterData;
begin
  Screen.Cursor := crSQLWait;
  Result := false;
  F := TfShowFlt.Create(AOwner);
  try
    if AOwner is TWinControl then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, TWinControl(AOwner).Handle);
    F.initialize(AConnection, AUniverseID, id_user, ACondNum, ASelectObjEvent, AOwner, ATaskMaster);
    Screen.Cursor := crDefault;
    F.ShowModal;
    if F.ModalResult = mrOk then
    begin
      Result := true;
      ATaskMaster.ClearFilterList;
      for I := 0 to F.UFFrame1.FTaskMaster.FilterDataCount - 1 do
        if not CreateFilterItem(ATaskMaster, F.UFFrame1.FTaskMaster.FilterData[i]) then
          raise Exception.Create('Ошибка при чтении условий фильтра');
    end;
  finally
    Screen.Cursor := crDefault;
    F.Free;
  end;
end;

procedure TfShowFlt.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, xxxSRegPath + '\' + Name);
end;

procedure TfShowFlt.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, xxxSRegPath + '\' + Name);
end;


function TfShowFlt.initialize(AConnection: TCustomConnection; AUniverseID,
  id_user, Aid_business: integer; ASelectObjEvent: TSelectObjEvent;
  AOwner: TComponent; ATaskMaster: TTaskMasterClass): boolean;
begin
  UFFrame1.initialize(AConnection, AUniverseID, id_user, Aid_business, ATaskMaster, ASelectObjEvent);
end;

procedure TfShowFlt.Button1Click(Sender: TObject);
begin
  UFFrame1.ChechFilter;
  UFFrame1.aOkExecute(Sender);

end;

end.
