unit uCardProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBGridEh, Buttons, CheckLst, RXCtrls, Registry,
  RXSpin, AdvCGrid;

type
  TCardProp = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    ListBox1: TRxCheckListBox;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    N : integer;
    FAdvColumnGrid: TAdvColumnGrid;
   
  public
    procedure Initialize(AdvColumnGrid: TAdvColumnGrid);
  end;

var
  CardProp: TCardProp;

  function ShowCardProp(AdvColumnGrid: TAdvColumnGrid;
                       ACaption : String = '') : boolean;
implementation

uses foMyFunc, foMyFuncEh, uDM;

{$R *.DFM}

function ShowCardProp(AdvColumnGrid: TAdvColumnGrid;
                       ACaption : String) : boolean;
var F : TCardProp;
    i : integer;
begin
  Result := false;
  F := TCardProp.Create(nil);
  try
    if Screen.ActiveForm <> nil then
      SetWindowLong(F.Handle, GWL_HWNDPARENT, Screen.ActiveForm.Handle);
    if ACaption <> '' then
      F.Caption := ACaption;
    F.Initialize(AdvColumnGrid);

    F.ShowModal;
    Result := F.ModalResult = mrOk;
    if Result then
    begin
      try
  //      OldFrozenCols := ADBGrid1.FrozenCols;
        for i := 0 to F.ListBox1.Items.Count - 1 do
          if not F.ListBox1.Checked[i] then
          begin
            TGridColumnItem(F.ListBox1.Items.Objects[i]).Width := 1;
          //  TAdvColumnGrid(TGridColumnCollection(TGridColumnItem(F.ListBox1.Items.Objects[i]).Collection).GetOwner).HideColumn(i);
          end
          else
          begin
            if TGridColumnItem(F.ListBox1.Items.Objects[i]).Width = 1 then
              TGridColumnItem(F.ListBox1.Items.Objects[i]).Width := 64;
          end;

      finally
      end;
    end;
  finally
    F.Free;
  end;
end;

{ TArcProp }

procedure TCardProp.Initialize(AdvColumnGrid: TAdvColumnGrid);
var i : integer;
  function GetStr(Index : integer) : String;
  var j : integer;
  begin
    Result := '';
    for j := 0 to FAdvColumnGrid.FixedRows - 1 do
    begin
      if (FAdvColumnGrid.IsBaseCell(Index, j) or not FAdvColumnGrid.IsYMergedCell(Index, j)) then
      begin
        if Result <> '' then Result := Result + '/';
        Result := Result + FAdvColumnGrid.Cells[Index, j];
      end;

    end;
  end;
begin
  FAdvColumnGrid := AdvColumnGrid;
  ListBox1.Items.Clear;
  for i := 1 to AdvColumnGrid.Columns.Count -1 do
  begin
    ListBox1.Items.AddObject(GetStr(i), AdvColumnGrid.Columns[i]);
    ListBox1.Checked[ListBox1.Items.Count - 1] := AdvColumnGrid.Columns[i].Width > 1;
  end;
end;

procedure TCardProp.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TCardProp.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

end.
