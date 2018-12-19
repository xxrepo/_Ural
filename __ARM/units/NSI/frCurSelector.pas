unit frCurSelector;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfCurSelector = class(TFrame)
    Label1: TLabel;
    ComboBox1: TComboBox;
  private
    FId:integer;
    function GetID_Curr: integer;
    procedure SetID_Curr(const Value: integer);
    { Private declarations }
  public
    property ID_Curr : integer read GetID_Curr write SetID_Curr;
  end;

implementation

{$R *.DFM}

{ TfCurSelector }

function TfCurSelector.GetID_Curr: integer;
begin
 Result:=FId;
end;

procedure TfCurSelector.SetID_Curr(const Value: integer);
begin
 FId:=Value;
end;

end.
