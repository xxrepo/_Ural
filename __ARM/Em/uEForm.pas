unit uEForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frEForm, foMyFunc;

type
  TEForm = class(TForm)
    fEForm1: TfEForm;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Fid_Bsn : Variant;
    FDisabled : Variant;
  public
    procedure Initialize(ASelectedObj : TSelectedObj; id_Bsn : Variant; AEObjTypes: TEObjTypes);
  end;

var
  EForm: TEForm;

  procedure ShowEForm(ASelectedObj : TSelectedObj; id_Bsn: Variant; AEObjTypes: TEObjTypes);

implementation

uses uMainForm, uDM;

procedure ShowEForm(ASelectedObj : TSelectedObj; id_Bsn: Variant; AEObjTypes: TEObjTypes);
begin
 // DM.Rights_GetUserRights(10, Null);
  if not Assigned(EForm) then
  begin
    EForm := TEForm.Create(MainForm);
    EForm.Initialize(ASelectedObj, id_Bsn, AEObjTypes);
  end
  else
  begin
    EForm.WindowState := wsMaximized;
    if ASelectedObj.ID <> Null then
      EForm.Initialize(ASelectedObj, id_Bsn, AEObjTypes);
    EForm.BringToFront;
  end;
end;

{$R *.DFM}

{ TEForm }

procedure TEForm.Initialize(ASelectedObj : TSelectedObj; id_Bsn: Variant; AEObjTypes: TEObjTypes);
begin
  Fid_Bsn := id_Bsn;
  fEForm1.Initialize(ASelectedObj, Fid_Bsn, false);
end;

procedure TEForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TEForm.FormDestroy(Sender: TObject);
begin
  EForm := nil;
end;

procedure TEForm.FormCreate(Sender: TObject);
begin
  fEForm1.PageControl1.ActivePage := fEForm1.tsEmpty;
end;

end.

