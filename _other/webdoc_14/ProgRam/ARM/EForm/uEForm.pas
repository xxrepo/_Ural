unit uEForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  foMyFunc, frEForm;

type
  TEForm = class(TForm)
    fEForm1: TfEForm;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Initialize(AEObjTypes : TEObjTypes);
    procedure Initialize2(ASelectedObj : TSelectedObj);
    constructor Create(AOwner: TComponent; ACaption : String = ''); overload;//override;
  end;

var
  EForm: TEForm;
  EFormUsers: TEForm;
  EFormNS: TEForm;
 // EForm2: TEForm;

  procedure ShowEFormNS;
  procedure ShowEFormUser;
  procedure ShowEForm(AEObjTypes : TEObjTypes = [{eotNS,} eotCrn, eotCA, eotOper, eotDocType, eotWorkType, eotDocState,
                {eotUsers,} eotExtNames,

                eotD1, eotD2, eotD3, eotD4, eotD5, eotD6, eotD7, eotD8, eotD9, eotD10,

                eotF1, eotF2, eotF3, eotF4, eotF5, eotF6, eotF7, eotF8, eotF9, eotF10] );
                
 
implementation

uses uDM;

{$R *.DFM}

 

 

procedure ShowEForm(AEObjTypes : TEObjTypes);
begin
  try
    if not Assigned(EForm) then
    begin
      EForm := TEForm.Create(nil);
      EForm.WindowState := wsMaximized;
      EForm.Initialize(AEObjTypes);
    end
    else
    begin
      EForm.WindowState := wsMaximized;
      EForm.BringToFront;
    end;
  except
    if Assigned(EForm) then EForm.Free;
    EForm := nil;
  end;
end;

procedure ShowEFormUser;
begin
  try
    if not Assigned(EFormUsers) then
    begin
      EFormUsers := TEForm.Create(nil);
      EFormUsers.Caption := 'Пользователи';
      EFormUsers.WindowState := wsMaximized;
      EFormUsers.Initialize([eotUsers]);
    end
    else
    begin
      EFormUsers.WindowState := wsMaximized;
      EFormUsers.BringToFront;
    end;
  except
    if Assigned(EFormUsers) then EFormUsers.Free;
    EFormUsers := nil;
  end;
end;

procedure ShowEFormNS;
begin
  try
    if not Assigned(EFormNS) then
    begin
      EFormNS := TEForm.Create(nil);
      EFormNS.Caption := 'Бизнесы';
      EFormNS.WindowState := wsMaximized;
      EFormNS.Initialize([eotNS]);
    end
    else
    begin
      EFormNS.WindowState := wsMaximized;
      EFormNS.BringToFront;
    end;
  except
    if Assigned(EFormUsers) then EFormNS.Free;
    EFormNS := nil;
  end;
end;

 

constructor TEForm.Create(AOwner: TComponent; ACaption : String);
begin
  inherited Create(AOwner);
  if ACaption <> '' then
    Caption := ACaption;

end;

procedure TEForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TEForm.FormDestroy(Sender: TObject);
begin
  if Self = EForm then
    EForm := nil
  else
  if Self = EFormUsers then
    EFormUsers := nil
  else
  if Self = EFormNS then
    EFormNS := nil;
end;

procedure TEForm.Initialize(AEObjTypes : TEObjTypes);
var ASelectedObj : TSelectedObj;
begin
  fEForm1.Initialize(ASelectedObj, AEObjTypes);//[eotHotelType, eotFin, eotAvia, eotGO, eotCrn, eotUsers, eotUsersGroup]);
end;

procedure TEForm.Initialize2(ASelectedObj: TSelectedObj);
begin
  fEForm1.Initialize(ASelectedObj, [ASelectedObj.ObjType]);//[eotHotelType, eotFin, eotAvia, eotGO, eotCrn, eotUsers, eotUsersGroup]);
end;

procedure TEForm.FormActivate(Sender: TObject);
begin
  tag := 0;
end;

end.
