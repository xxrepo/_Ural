unit uAPList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frBsnSelector, Db, DBClient, ExtCtrls, StdCtrls, frAPListOper, frAPList;

type
  TAPList = class(TForm)
    fBsnSelector1: TfBsnSelector;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    fApList1: TfAPList;
    GroupBox2: TGroupBox;
    fAPListOper1: TfAPListOper;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure fBsnSelector1Button1Click(Sender: TObject);
    procedure fApList1dsFltListDataChange(Sender: TObject; Field: TField);
  private
    Val : Variant;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Initialize;
  end;

  procedure ShowAPList;
var
  APList: TAPList;

implementation

uses foMyFunc, uDM;

  procedure ShowAPList;
  begin
//    DM.Rights_GetUserRights(10, Null);
    if not Assigned(APList) then
    begin
      APList := TAPList.Create(nil);
      APList.Initialize;
    end
    else
    begin
      APList.WindowState := wsMaximized;
      APList.BringToFront;
    end;
  end;
{$R *.DFM}

{ TFormalDict }

procedure TAPList.Initialize;
begin
  fApList1.Initialize(fBsnSelector1.ID);
end;

procedure TAPList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAPList.FormDestroy(Sender: TObject);
begin
  APList := nil;
end;

procedure TAPList.fBsnSelector1Button1Click(Sender: TObject);
begin
  fBsnSelector1.Button1Click(Sender);
  Initialize;
end;

constructor TAPList.Create(AOwner: TComponent);
begin
  inherited;
  fBsnSelector1.UID := 10;
  LoadValFromRegistry(Val, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  if Val <> Null then
    fBsnSelector1.ID := Val;

  LoadValFromRegistry(Val, SRegPath + '\' + Name + '\' + ClassName, 'fApList1Height');
  if Val <> null then
    GroupBox1.Height := Val;
end;

destructor TAPList.Destroy;
begin
  SaveValToRegistry(fBsnSelector1.ID, SRegPath + '\' + Name + '\' + ClassName, 'id_Bsn');
  SaveValToRegistry(GroupBox1.Height, SRegPath + '\' + Name + '\' + ClassName, 'fApList1Height');


  inherited;

end;

procedure TAPList.fApList1dsFltListDataChange(Sender: TObject;
  Field: TField);
begin
  fApList1.dsFltListDataChange(Sender, Field);
  fAPListOper1.Initialize(fApList1.cdsAPListid_AP_Obj.AsInteger, fBsnSelector1.ID);
end;

end.
