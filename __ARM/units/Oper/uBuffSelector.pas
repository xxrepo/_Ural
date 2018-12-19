unit uBuffSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frBuffSelector, DB;

type
  TBuffSelector = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    fBuffSelector1: TfBuffSelector;
    procedure fBuffSelector1DataSource1DataChange(Sender: TObject;
      Field: TField);
    procedure fBuffSelector1RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SelectBuff(var AID : integer; var AName : String) : boolean;

var
  BuffSelector: TBuffSelector;

implementation

uses foMyFunc;

function SelectBuff(var AID : integer; var AName : String) : boolean;
var F : TBuffSelector;
begin
  Result := False;
  
  F := TBuffSelector.Create(nil);
  try
    F.fBuffSelector1.Initialize;
    F.fBuffSelector1.cdsBuffList.Locate('id_Buff', AID, []);
    F.ShowModal;
    if (F.ModalResult = mrOk) {and (not F.fBuffSelector1.cdsBuffListid_Buff.IsNull)} then
    begin
      if not F.fBuffSelector1.cdsBuffListid_Buff.IsNull then
        AID := F.fBuffSelector1.cdsBuffListid_Buff.AsInteger
      else
        AID := -13;
      AName := F.fBuffSelector1.cdsBuffListName.AsString;
      Result := True;
    end;
  finally
    F.Free;
  end;
end;


{$R *.DFM}

procedure TBuffSelector.fBuffSelector1DataSource1DataChange(
  Sender: TObject; Field: TField);
begin
  fBuffSelector1.DataSource1DataChange(Sender, Field);

  btnOk.Enabled := not fBuffSelector1.cdsBuffList.IsEmpty;
end;

procedure TBuffSelector.fBuffSelector1RxDBGrid1DblClick(Sender: TObject);
var P : TPoint;
begin
  P := Mouse.CursorPos;
  P := THackGrid(Sender).ScreenToClient(P);
  if P.y <= THackGrid(Sender).RowHeights[0] then
    Exit;
  btnOk.Click;
end;

end.
