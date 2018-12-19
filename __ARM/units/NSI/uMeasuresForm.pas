unit uMeasuresForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uMeasuresFrame, StdCtrls, ExtCtrls, DB, Registry, Menus, frBsnSelector;

type
  TMeasuresForm = class(TForm)
    MeasuresFrame1: TMeasuresFrame;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Splitter1: TSplitter;
    MeasuresFrame2: TMeasuresFrame;
    fBsnSelector1: TfBsnSelector;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure MeasuresFrame1ToolButton1Click(Sender: TObject);
    procedure MeasuresFrame2ToolButton1Click(Sender: TObject);
    procedure MeasuresFrame1DataSourceDataChange(Sender: TObject;
      Field: TField);
    procedure fBsnSelector1Button1Click(Sender: TObject);
  private
    { Private declarations }
  protected
    vId_Business:Variant;
    procedure LoadSplitterSettingsFromRegistry(const ASplitter : TSplitter; APath : String);
    procedure SaveSplitterSettingsFromRegistry(const ASplitter : TSplitter; APath : String);
  public
    { Public declarations }
    procedure Init(AId_Business:Variant;ReadOnly:boolean=false; ShowToolBar:boolean=false; OnlyBase:boolean=false);
  end;

var
  MeasuresForm: TMeasuresForm;

implementation
     uses uDM;

{$R *.DFM}

procedure TMeasuresForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle=fsMDIChild then
 Action:=caFree;
end;

procedure TMeasuresForm.Init(AId_Business:Variant;ReadOnly:boolean=false; ShowToolBar:boolean=false; OnlyBase:boolean=false);
begin
  MeasuresFrame1.ReadOnly:=ReadOnly;
  with MeasuresFrame1 do
   begin
    ToolBar.Visible:=ShowToolBar;
    if FormStyle=fsNormal then
     Panel1.Visible:=True
    else
     Panel1.Visible:=False;
     Id_BaseMeasure:=-1;
     if AId_Business<>NULL then
      vId_Business:=AId_Business
     else
      vId_Business:=-1;

     Init(AId_Business);

    if OnlyBase then
     begin
      MeasuresFrame2.Visible:=False;
     end;
  end;
end;

procedure TMeasuresForm.FormDestroy(Sender: TObject);
begin
 SaveSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + Name + '\' + ClassName);
 MeasuresForm:=nil;
end;

procedure TMeasuresForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then ModalResult:=mrOk;
 if Key=27 then ModalResult:=mrCancel;
end;

procedure TMeasuresForm.LoadSplitterSettingsFromRegistry(const ASplitter : TSplitter; APath : String);
var Reg : TRegistry;
    NewOptions : TIndexOptions;
    S : String;
begin
  try
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey(APath, false) then
          if Reg.ValueExists(ASplitter.Name+'_Top') then
            MeasuresFrame1.Height:= Reg.ReadInteger(ASplitter.Name+'_Top');
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  except
  end;
end;


procedure TMeasuresForm.SaveSplitterSettingsFromRegistry(const ASplitter : TSplitter; APath : String);
var Reg : TRegistry;
    NewOptions : TIndexOptions;
    S : String;
begin
  try
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(APath, true) then
            Reg.WriteInteger(ASplitter.Name+'_Top',MeasuresFrame1.Height);
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
  except
  end;
end;

procedure TMeasuresForm.FormCreate(Sender: TObject);
begin
 LoadSplitterSettingsFromRegistry(Splitter1, SRegPath + '\' + Name + '\' + ClassName);
end;

procedure TMeasuresForm.MeasuresFrame1ToolButton1Click(Sender: TObject);
begin
  MeasuresFrame1.aAddExecute(Sender);

end;

procedure TMeasuresForm.MeasuresFrame2ToolButton1Click(Sender: TObject);
begin
  MeasuresFrame2.aAddExecute(Sender);

end;

procedure TMeasuresForm.MeasuresFrame1DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  MeasuresFrame1.DataSourceDataChange(Sender, Field);

  if MeasuresFrame1.cdsMeasures.IsEmpty then
  begin
    MeasuresFrame2.Id_BaseMeasure:= -13;
  end
  else
  begin
    MeasuresFrame2.Id_BaseMeasure:=MeasuresFrame1.cdsMeasures.FieldByname('id_Measure').Value;
    MeasuresFrame2.BaseName:=MeasuresFrame1.cdsMeasures.FieldByname('Name').Value;
  end;
  MeasuresFrame2.Init(vId_Business);
end;

procedure TMeasuresForm.fBsnSelector1Button1Click(Sender: TObject);
begin
  fBsnSelector1.Button1Click(Sender);
  MeasuresFrame1.Init(fBsnSelector1.ID);
end;

end.
