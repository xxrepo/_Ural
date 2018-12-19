unit uValListDistinct;



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, db,
  Grids, DBGrids, RXDBCtrl, StdCtrls, ExtCtrls, uDataSetFilter,
  uBaseGridFilter, uDBGridFilter, ToolWin, ComCtrls, RxMemDS, DBClient,
  Provider, DBGridEh, GridsEh, EhLibCDS, uEhGridFilter, Buttons;

type
  TValListDistinct = class(TForm)
    RxDBGrid1: TDBGridEh;
    Panel2: TPanel;
    btnCancel: TButton;
    ToolBar1: TToolBar;
    RxMemoryData: TRxMemoryData;
    DataSource1: TDataSource;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    EhGridFilter1: TEhGridFilter;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid1CheckButton(Sender: TObject; ACol: Integer;
      Field: TField; var Enabled: Boolean);
    procedure RxDBGrid1GetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
      IsDown: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure ShowValListDistinct(AField : TField; ACaption : String = '');

var
  ValListDistinct: TValListDistinct;

implementation

uses foMyFunc, foMyFuncEhExcel;

{$R *.DFM}
procedure ShowValListDistinct(AField : TField; ACaption : String);
  function GetFieldValue_Adv : Variant;
  begin
    if AField.IsNull then
      Result := 'пусто'
    else
    begin
      if AField is TFloatField then
      begin
       if TFloatField(AField).DisplayFormat <> '' then
         Result := StrToFloat(FormatFloat('0.00', TFloatField(AField).AsFloat));
      end
      else
   //   if AField is TDateTimeField then
   //   begin
   //    if TDateTimeField(AField).DisplayFormat <> '' then
   //      Result := StrToDateTime(FormatDateTime(TDateTimeField(AField).DisplayFormat, TDateTimeField(AField).AsDateTime));
   //   end
   //   else
        Result := AField.Value;
    end;
  end;
var F : TValListDistinct;
    OldRecNo : integer;
    ATmpField : TField;
    V : Variant;
begin
  if (AField <> nil) and (AField.DataSet <> nil) then
  begin
    F := TValListDistinct.Create(nil);
    try
      F.Caption := ACaption;
      F.RxMemoryData.Close;
      F.ClientDataSet1.Close;
      F.RxMemoryData.FieldDefs.Clear;
      F.ClientDataSet1.FieldDefs.Clear;
      F.RxMemoryData.FieldDefs.Add(AField.FieldName, AField.DataType, AField.Size, AField.Required);
      F.RxDBGrid1.Columns[0].FieldName := AField.FieldName;
      F.EhGridFilter1.DBGrid := F.RxDBGrid1;
      F.ClientDataSet1.Open;

      F.ClientDataSet1.IndexDefs.Add('xxx', AField.FieldName, []);
      F.ClientDataSet1.IndexName := 'xxx';

      ATmpField := F.ClientDataSet1.FieldByName(AField.FieldName);

      if ATmpField is TFloatField then
        TFloatField(ATmpField).DisplayFormat := TFloatField(AField).DisplayFormat
      else
        if ATmpField is TDateTimeField then
          TDateTimeField(ATmpField).DisplayFormat := TDateTimeField(AField).DisplayFormat;

      with AField.DataSet do
      begin
        OldRecNo := RecNo;
        try
          DisableControls;
          First;

          while not Eof do
          begin
            V := GetFieldValue_Adv;
            if not F.ClientDataSet1.Locate(AField.FieldName, V, [loCaseInsensitive, loPartialKey]) then
            begin
              F.ClientDataSet1.Append;
              ATmpField.Value := V;
              F.ClientDataSet1.Post;
            end;
            Next;
          end;
        finally
          EnableControls;
          RecNo := OldRecNo;
        end;
      end;
      F.Show;
    except
      F.Free;
    end;
  end;
end;

{ TValListDistinct }

constructor TValListDistinct.Create(AOwner: TComponent);
begin
  inherited;
  SetGridProps(RxDBGrid1, true, true, true);
   SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TValListDistinct.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TValListDistinct.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TValListDistinct.RxDBGrid1CheckButton(Sender: TObject;
  ACol: Integer; Field: TField; var Enabled: Boolean);
begin
  Enabled := (Field <> nil) and not (Field is TBlobField);
  ReOrderCDS(Field);
end;

procedure TValListDistinct.RxDBGrid1GetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var SortMarker: TSortMarker; IsDown: Boolean);
begin
  SortMarker := GetBtnSortMarker(Field);
end;

procedure TValListDistinct.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TValListDistinct.SpeedButton1Click(Sender: TObject);
begin
  GreedToExcel(RxDBGrid1, '');
end;

end.
