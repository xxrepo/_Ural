unit uBJTree;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, foMyFunc, Buttons, Db, DBClient, frBJTree, Menus,
  ComCtrls;

type
  TBJTree = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    Panel4: TPanel;
    fBJTree1: TfBJTree;
    Label4: TLabel;
    dtDFrom: TDateTimePicker;
    Label3: TLabel;
    dtTFrom: TDateTimePicker;
    Label1: TLabel;
    dtDTo: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    edName: TEdit;
    Label5: TLabel;
    cdsBJProp: TClientDataSet;
    cdsBJPropid_BJ_Obj: TAutoIncField;
    cdsBJPropid_business: TIntegerField;
    cdsBJPropName: TStringField;
    cdsBJPropDateCreate: TDateTimeField;
    cdsBJPropid_Creator: TIntegerField;
    cdsBJPropDateCheck: TDateTimeField;
    cdsBJPropid_Checker: TIntegerField;
    cdsBJPropDisabled: TBooleanField;
    cdsBJPropStartDate: TDateTimeField;
    cdsBJPropStopDate: TDateTimeField;
    cdsBJPropid_ClosedBy: TIntegerField;
    cdsBJPropCloseDate: TDateTimeField;
    cdsBJPropCreatorFIO: TStringField;
    cdsBJPropCheckerFIO: TStringField;
    cdsBJPropClosedByFIO: TStringField;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FHandle : HWnd;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;
    function SaveProp: boolean;
    procedure Initialize(const AHandle : HWnd; id_BJ_Obj : integer; AReadOnly, ACopy : boolean);
  end;

var
  BJTree: TBJTree;

procedure ShowBJTree(const AHandle : HWnd; id_BJ_Obj : integer; AReadOnly, ACopy : boolean);

implementation

uses uDM;


procedure ShowBJTree(const AHandle : HWnd; id_BJ_Obj : integer; AReadOnly, ACopy : boolean);
var F : TBJTree;
begin
  F := TBJTree.Create(nil);
  try
//    if AOwner is TWinControl then
//      SetWindowLong(F.Handle, GWL_HWNDPARENT, TWinControl(AOwner).Handle);
    F.Initialize(AHandle, id_BJ_Obj, AReadOnly, ACopy);
    F.Show;
  except
    F.Free;
  end;
end;

{$R *.DFM}

procedure TBJTree.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
  Close;
end;


procedure TBJTree.Initialize(const AHandle : HWnd; id_BJ_Obj : integer; AReadOnly, ACopy : boolean);
var DD : Variant;
begin
  FHandle := AHandle;
//  fBJTree1.Initialize(-1, bjtNone, id_BJ_Obj, AReadOnly, Null, Null, Null);
  with cdsBJProp do
  begin
    Close;
    Params.ParamByName('@id_BJ_Obj').Value := id_BJ_Obj;
    Open;
    try
      edName.Text := cdsBJPropName.AsString;
      dtDFrom.DateTime := cdsBJPropStartDate.AsDateTime;
      dtDTo.DateTime := cdsBJPropStopDate.AsDateTime;
    finally
      Close;
    end;
  end;
end;

function TBJTree.SaveProp: boolean;
begin
 // Result := fAPCond1.SaveProp;
end;

procedure TBJTree.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\2' + ClassName);
end;

procedure TBJTree.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\2' + ClassName);
end;

constructor TBJTree.Create(AOwner: TComponent);
begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
//  LoadSplitterSettingsFromRegistry(Splitter1, SRegPath + '\Splitter1' + ClassName);
end;

procedure TBJTree.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TBJTree.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TBJTree.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 { if (ModalResult = mrCancel) or (ModalResult = mrNone) then
  begin
    case MessageBox(Handle, 'Сохранить данные?', 'Данные не были сохранены', MB_YESNOCANCEL + MB_DEFBUTTON3 + MB_ICONQUESTION) of
      id_Yes :
        begin
          CanClose := false;
          btnOk.Click;
        end;
      ID_CANCEL : CanClose := false;
      else
        CanClose := true;
      end
  end;   }
end;

procedure TBJTree.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
 { if ModalResult = mrOk then
    if SaveProp then
      SendMessage(FHandle, xxx_RefrMsg, fAPCond1.id_AP_Obj, 0); }
end;

destructor TBJTree.Destroy;
begin
//  SaveSplitterSettingsFromRegistry(Splitter1, SRegPath + '\Splitter1' + ClassName);
  inherited;

end;

end.
