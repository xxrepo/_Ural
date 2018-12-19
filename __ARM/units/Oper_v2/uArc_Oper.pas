unit uArc_Oper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frArc_Oper, frBsnSelector, StdCtrls, Buttons;

type
  TArc_Oper = class(TForm)
    fArc_Oper1: TfArc_Oper;
    fBsnSelector1: TfBsnSelector;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    Val : Variant;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Initialize;
  end;

  procedure ShowArc_Oper;
var
  Arc_Oper: TArc_Oper;

implementation

uses foMyFunc, uDM;

  procedure ShowArc_Oper;
  begin
    DM.Rights_GetUserRights(10, Null);
    if not Assigned(Arc_Oper) then
    begin
      Arc_Oper := TArc_Oper.Create(nil);
      Arc_Oper.Initialize;
    end
    else
    begin
      Arc_Oper.WindowState := wsMaximized;
      Arc_Oper.BringToFront;
    end;
  end;
{$R *.DFM}

{ TFormalDict }

procedure TArc_Oper.Initialize;
begin
  fArc_Oper1.Initialize(fBsnSelector1.ID);
end;

procedure TArc_Oper.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TArc_Oper.FormDestroy(Sender: TObject);
begin
  Arc_Oper := nil;
end;

procedure TArc_Oper.fBsnSelector1Button1Click(Sender: TObject);
begin
  fBsnSelector1.Button1Click(Sender);
  Initialize;
end;

constructor TArc_Oper.Create(AOwner: TComponent);
begin
  inherited;
  fBsnSelector1.UID := 10;
  LoadValFromRegistry(Val, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  if Val <> Null then
    fBsnSelector1.ID := Val;
end;

destructor TArc_Oper.Destroy;
begin
  SaveValToRegistry(fBsnSelector1.ID, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  inherited;

end;

procedure TArc_Oper.BitBtn4Click(Sender: TObject);
begin
  fArc_Oper1.aShowArcImpExecute(Sender);

end;

procedure TArc_Oper.BitBtn1Click(Sender: TObject);
begin
  fArc_Oper1.aAddExecute(Sender);

end;

end.
