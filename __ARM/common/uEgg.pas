unit uEgg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RXCtrls, ImgList, ShellAPI;

type
  TEgg = class(TForm)
    asf: TSecretPanel;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    i : integer;
  end;

var
  Egg: TEgg;

implementation

uses uMainForm;

{$R *.DFM}

procedure TEgg.FormCreate(Sender: TObject);

begin
  i := -1;
  Caption := 'И'+'нф'+'ор'+'м'+'а'+'ц'+'и'+'я'+' о '+'ра'+'зр'+'аб'+'о'+'тч'+'ик'+'ах'+' п'+'р'+'ог'+'ра'+'м'+'мы';

  Label1.Caption := 'С'+'вя'+'за'+'т'+'ь'+'с'+'я '+'с '+'ра'+'з'+'ра'+'б'+'от'+'чи'+'к'+'ом'+':';
  Label2.Caption := 'o'+'v'+'k'+'@m'+'ai'+'l'+'3'+'3'+'3'+'.c'+'o'+'m';

  with asf do
  begin
    Lines.Clear;
    Lines.Add('Э'+'та'+' п'+'р'+'о'+'гр'+'а'+'м'+'м'+'а'+' '+'б'+'ы'+'л'+'а'+' '+'р'+'а'+'з'+'р'+'а'+'б'+'о'+'т'+'а'+'н'+'а'+' и '+'н'+'а'+'пи'+'с'+'ан'+'а');
    Lines.Add('К'+'у'+'л'+'ю'+'к'+'и'+'н'+'ы'+'м '+'Ол'+'е'+'г'+'ом'+' В'+'л'+'а'+'д'+'и'+'м'+'ир'+'о'+'ви'+'ч'+'ем.');
    Lines.Add('');
    Lines.Add('Ав'+'т'+'ор'+' с'+'пе'+'ци'+'ал'+'из'+'иру'+'ет'+'с'+'я н'+'а а'+'вто'+'ма'+'ти'+'за'+'ци'+'и д'+'оку'+'ме'+'нт'+'оо'+'бо'+'рот'+'а'+',');
    Lines.Add('т'+'ор'+'г'+'ов'+'о'+'й '+'и'+' фи'+'нан'+'со'+'во'+'й '+'де'+'ят'+'ел'+'ь'+'но'+'ст'+'и '+'и '+'уп'+'ра'+'вл'+'ен'+'че'+'ск'+'ог'+'о '+'уч'+'ет'+'а'+'.');
    Lines.Add('');
    Lines.Add('С'+'в'+'яз'+'ат'+'ьс'+'я'+' с'+' '+'а'+'вт'+'о'+'ром '+'мо'+'ж'+'но '+'по '+'e'+'-'+'ma'+'il'+': o'+'v'+'k'+'@'+'m'+'a'+'il'+'3'+'3'+'3'+'.com');

    Active := true;
  end;

end;

procedure TEgg.Timer1Timer(Sender: TObject);
begin
  inc(i);
 // if i > RMain.ImageList2.Count - 1 then
 //   i := 0;
  Image1.Picture.Assign(nil);
//  RMain.ImageList2.GetBitmap(i, Image1.Picture.Bitmap);
//  edit1.Text := Inttostr(AllocMemSize);
end;

procedure TEgg.Label2Click(Sender: TObject);
var S : String;
begin
  S := 'm'+'a'+'i'+'l'+'t'+'o'+':'+'o'+'v'+'k'+'@'+'m'+'a'+'i'+'l'+'r'+'u'+'3'+'3'+'3'+'.'+'c'+'o'+'m';
  ShellExecute(Application.Handle, 'open', PChar(S), nil, nil, 0); 
//* --
end;

end.
