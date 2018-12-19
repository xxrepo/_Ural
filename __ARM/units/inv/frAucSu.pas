unit frAucSu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, RxMemDS, Grids, DBGrids, RXDBCtrl, StdCtrls, ExtCtrls;

type
  TfAucSu = class(TFrame)
    mtData: TRxMemoryData;
    dsData: TDataSource;
    dbgIzd: TRxDBGrid;
    Panel1: TPanel;
    Button98: TButton;
    lbProgress: TLabel;
    lbProgressGlobal: TLabel;
    lbProgressMegaGlobal: TLabel;
    lbProgressExt: TLabel;
    mtDataHotelName: TStringField;
    mtDatatoSea: TStringField;
    mtDatatoCentre: TStringField;
    mtDataParking: TStringField;
    mtDataFood: TStringField;
    mtDataPh1: TStringField;
    mtDataFIO1: TStringField;
    mtDataPh2: TStringField;
    mtDataFIO2: TStringField;
    mtDataemail: TStringField;
    mtDataAdr: TStringField;
    mtDataCity: TStringField;
    mtDataURL: TStringField;
    Button1: TButton;
    mtDataWebSite: TStringField;
    procedure Button98Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses HyperParse, Unit1, unFunc;

{$R *.dfm}

procedure TfAucSu.Button98Click(Sender: TObject);

    procedure GetOneMM(AUrl, WebSite : String);
    var AParser : THyperParse;
        i, j : integer;
        S, S2, City : String;
        X : integer;
    begin

      AParser := THyperParse.Create;
      try
        ParseText(AUrl, AParser, true, false );

        for i := 0 to AParser.Count - 1 do
        begin
          if (POS('/h1', AParser[i].Text) > 0) then
          begin
            if mtData.State = dsInsert then mtData.Post;

            mtData.Append;

            if (POS('kabardinka', AUrl) > 0)  then City := 'Кабардинка';
            if (POS('gelendzhic', AUrl) > 0)  then City := 'Геленджик';
            if (POS('arkhipo-osipovka', AUrl) > 0)  then City := 'Архипо-Осиповка';
            if (POS('yevpatoria', AUrl) > 0)  then City := 'Евпатория';
            if (POS('sudak', AUrl) > 0)  then City := 'Судак';
            if (POS('olginka', AUrl) > 0)  then City := 'ольгинка';

            mtDataWebSite.AsString := WebSite;
            mtDataCity.AsString := City;
            mtDataURL.AsString := AUrl;

            mtDataHotelName.AsString := AParser[i - 1].Text;
          end;

          if (POS('span id="to-map"', AParser[i].Text) > 0)  then
          begin
            mtDataAdr.AsString := AParser[i + 1].Text;
          end;
          if (POS('img alt="tel.png"', AParser[i].Text) > 0)  then
          begin
            mtDataPh1.AsString := trim(AParser[i + 5].Text);
            mtDataFIO1.AsString := AParser[i + 8].Text;
          end;
          if (POS('E-mail', AParser[i].Text) > 0)  then
          begin
            mtDataemail.AsString := AParser[i + 2].Text;
            mtDataemail.AsString := StringReplace(mtDataemail.AsString, ': ', '', [rfReplaceAll, rfIgnoreCase]);
          end;
        end;
      finally
        AParser.Free;
        if mtData.State = dsInsert then mtData.Post;
      end;
    end;

    
    procedure GetOneKY(AUrl, WebSite : String);
    var AParser : THyperParse;
        i, j : integer;
        S, S2, City : String;
        X : integer;
    begin

      AParser := THyperParse.Create;
      try
        ParseText(AUrl, AParser, false, false );

        for i := 0 to AParser.Count - 1 do
        begin
          if (POS('Главная', AParser[i].Text) > 0) then City := AParser[i + 3].Text;
          if (POS('div class="clear mb20"', AParser[i].Text) > 0) and (AParser[i + 2].Text <> 'Предприятия') then
          begin
            if mtData.State = dsInsert then mtData.Post;

            mtData.Append;

            mtDataWebSite.AsString := WebSite;
            mtDataCity.AsString := City;
            mtDataURL.AsString := AParser[i + 2].Text;
            mtDataURL.AsString := StringReplace(mtDataURL.AsString, 'a href="', '', [rfReplaceAll, rfIgnoreCase]);
            mtDataURL.AsString := StringReplace(mtDataURL.AsString, '"', '', [rfReplaceAll, rfIgnoreCase]);
            X := POS('title=', mtDataURL.AsString);
            if X > 0 then  mtDataURL.AsString := Copy(mtDataURL.AsString, 1, X - 1);

            mtDataHotelName.AsString := AParser[i + 3].Text;
          end;

          if (POS('Адрес', AParser[i].Text) > 0)  then
          begin
            mtDataAdr.AsString := AParser[i + 2].Text;
            mtDataAdr.AsString := StringReplace(mtDataAdr.AsString, ': ', '', [rfReplaceAll, rfIgnoreCase]);
          end;
          if (POS('Телефоны', AParser[i].Text) > 0)  then
          begin
            mtDataPh1.AsString := AParser[i + 2].Text;
            mtDataPh1.AsString := StringReplace(mtDataPh1.AsString, ': ', '', [rfReplaceAll, rfIgnoreCase]);
          end;
          if (POS('E-mail', AParser[i].Text) > 0)  then
          begin
            mtDataemail.AsString := AParser[i + 2].Text;
            mtDataemail.AsString := StringReplace(mtDataemail.AsString, ': ', '', [rfReplaceAll, rfIgnoreCase]);
          end;
        end;
      finally
        AParser.Free;
        if mtData.State = dsInsert then mtData.Post;
      end;
    end;

    procedure GetOne(AUrl, WebSite : String);
    var AParser : THyperParse;
        i, j : integer;
        S, S2, City : String;
        X : integer;
    begin
      AParser := THyperParse.Create;
      try
        ParseText(AUrl, AParser, false, false );

        for i := 0 to AParser.Count - 1 do
        begin
          if (POS('Гостиницы в', AParser[i].Text) > 0) then City := AParser[i].Text;
          if (POS('A href=db.php?owner=', AParser[i].Text) > 0) and (POS('class=title', AParser[i].Text) > 0)  then
          begin
            if mtData.State = dsInsert then mtData.Post;

            mtData.Append;

            mtDataWebSite.AsString := WebSite;
            mtDataCity.AsString := City;
            mtDataURL.AsString := AParser[i].Text;
            mtDataURL.AsString := StringReplace(mtDataURL.AsString, 'A href=', '', [rfReplaceAll, rfIgnoreCase]);
            mtDataURL.AsString := StringReplace(mtDataURL.AsString, ' class=title', '', [rfReplaceAll, rfIgnoreCase]);
            mtDataURL.AsString := StringReplace(AUrl, 'hotels.php?search=1', mtDataURL.AsString, [rfReplaceAll, rfIgnoreCase]);
            mtDataHotelName.AsString := AParser[i + 1].Text;
          end;

          if (POS('до моря:', AParser[i].Text) > 0)  then
          begin
            mtDataToSea.AsString := AParser[i + 2].Text;
          end;   

          if (POS('до центра:', AParser[i].Text) > 0)  then
          begin
            mtDatatoCentre.AsString := AParser[i + 2].Text;
          end;   

          if (POS('Автостоянка:', AParser[i].Text) > 0)  then
          begin
            mtDataParking.AsString := AParser[i + 2].Text;
          end;   

          if (POS('Питание:', AParser[i].Text) > 0)  then
          begin
            mtDataFood.AsString := AParser[i + 2].Text;
          end;   

          if (POS('TABLE border=0 cellspacing=3 cellpadding=0', AParser[i].Text) > 0)  then
          begin
            mtDataAdr.AsString := AParser[i + 4].Text;
            mtDataFIO1.AsString := AParser[i + 8].Text;

            for j := i + 1 to i + 20 do
            begin
              if (POS('+7 (', AParser[j].Text) > 0)  then
              begin
                if mtDataPh1.AsString = '' then mtDataPh1.AsString := AParser[j].Text;
                if mtDataPh2.AsString = '' then mtDataPh2.AsString := AParser[j].Text;
              end;
            end;
          end;

          if (POS('SCRIPT language=JavaScript', AParser[i].Text) > 0)  then
          begin
            mtDataemail.AsString := AParser[i + 2].Text;
            mtDataemail.AsString := StringReplace(StringReplace(mtDataemail.AsString, '+''@''+', '@', [rfReplaceAll, rfIgnoreCase]), '''', '', [rfReplaceAll, rfIgnoreCase]);
          end;   
        end;
      finally
        AParser.Free;
        if mtData.State = dsInsert then mtData.Post;
      end;
    end;

    procedure GetOneGK(AUrl, WebSite : String);
    var AParser : THyperParse;
        i, j : integer;
        S, S2, City : String;
        X : integer;
    begin
      AParser := THyperParse.Create;
      try
        ParseText(AUrl, AParser, false, false );

        for i := 0 to AParser.Count - 1 do
        begin
          if (POS('h1 class="h1_zagolovok"', AParser[i].Text) > 0) then City := AParser[i + 1].Text;
          if (POS('span class="spa"', AParser[i].Text) > 0) and (POS('a href="/gelendzhik/', AParser[i + 1].Text) > 0)  then
          begin
            if mtData.State = dsInsert then mtData.Post;

            mtData.Append;

            mtDataWebSite.AsString := WebSite;
            mtDataCity.AsString := City;
            mtDataURL.AsString := AParser[i + 1].Text;
            mtDataURL.AsString := StringReplace(mtDataURL.AsString, 'a href="/gelendzhik/', 'http://gelendzhik-kurort.ru/gelendzhik/', [rfReplaceAll, rfIgnoreCase]);
            mtDataURL.AsString := StringReplace(mtDataURL.AsString, '"', '', [rfReplaceAll, rfIgnoreCase]);
            mtDataHotelName.AsString := AParser[i + 2].Text;
          end;

          if (POS('до моря:', AParser[i].Text) > 0)  then
          begin
            mtDataToSea.AsString := AParser[i + 2].Text;
          end;   

          if (POS('бронирование', AParser[i].Text) > 0)  then
          begin
            mtDatatoCentre.AsString := AParser[i + 2].Text;
          end;   

          if (POS('автостоянка:', AParser[i].Text) > 0)  then
          begin
            mtDataParking.AsString := AParser[i + 2].Text;
          end;   

          if (POS('питание:', AParser[i].Text) > 0)  then
          begin
            mtDataFood.AsString := AParser[i + 2].Text;
          end;   

          if (POS('Адрес:', AParser[i].Text) > 0)  then
          begin
            mtDataAdr.AsString := AParser[i + 2].Text;
          end;   

          if (POS('телефоны', AParser[i].Text) > 0)  then
          begin
            if mtData.State = dsInsert then mtDataPh1.AsString := AParser[i + 2].Text;
          end;
        end;
      finally
        AParser.Free;
        if mtData.State = dsInsert then mtData.Post;
      end;
    end;



    procedure GetOneLT(AUrl, WebSite : String);
    var AParser : THyperParse;
        i, j : integer;
        S, S2, City : String;
        X : integer;
    begin
      AParser := THyperParse.Create;
      try
        ParseText(AUrl, AParser, true, false, 500);

        for i := 0 to AParser.Count - 1 do
        begin
          City := 'Геленджик';
          if (POS('/h1', AParser[i].Text) > 0) then
          begin
            if (POS('class', AParser[i - 1].Text) > 0) then Exit;
            if mtData.State = dsInsert then mtData.Post;

            mtData.Append;

            mtDataWebSite.AsString := WebSite;
            mtDataCity.AsString := City;
            mtDataURL.AsString := AURL;
            mtDataHotelName.AsString := trim(AParser[i - 1].Text);
          end;

          if (POS('до моря:', AParser[i].Text) > 0)  then
          begin
            mtDataToSea.AsString := AParser[i + 2].Text;
          end;   

          if (POS('бронирование3', AParser[i].Text) > 0)  then
          begin
            mtDatatoCentre.AsString := AParser[i + 2].Text;
          end;   

          if (POS('автостоянка3:', AParser[i].Text) > 0)  then
          begin
            mtDataParking.AsString := AParser[i + 2].Text;
          end;   

          if (POS('питание3:', AParser[i].Text) > 0)  then
          begin
            mtDataFood.AsString := AParser[i + 2].Text;
          end;   

          if (POS('Адрес2:', AParser[i].Text) > 0)  then
          begin
            mtDataAdr.AsString := AParser[i + 2].Text;
          end;   

          if (POS('h4 style="font-size:170%"', AParser[i].Text) > 0)  then
          begin
            mtDataPh1.AsString := trim(AParser[i + 1].Text);
            mtDataPh1.AsString := StringReplace(mtDataPh1.AsString, '&mdash;', ', ', [rfReplaceAll, rfIgnoreCase]);
          end;
        end;
      finally
        AParser.Free;
        if mtData.State = dsInsert then mtData.Post;
      end;
    end;
var i, j : integer;
    SL, SL2 : TStringList;

begin
  SL := TStringList.Create;
  SL2 := TStringList.Create;
  try
SL.Add('http://azur.ru/yalta/hotels.php?search=1');
SL.Add('http://azur.ru/balaklava/hotels.php?search=1');
SL.Add('http://azur.ru/alushta/hotels.php?search=1');
SL.Add('http://azur.ru/foros/hotels.php?search=1');
SL.Add('http://azur.ru/evpatoriya/hotels.php?search=1');
SL.Add('http://azur.ru/simeiz/hotels.php?search=1');
SL.Add('http://azur.ru/feodosia/hotels.php?search=1');
SL.Add('http://azur.ru/alupka/hotels.php?search=1');
SL.Add('http://azur.ru/gurzuf/hotels.php?search=1');
SL.Add('http://azur.ru/partenit/hotels.php?search=1');
SL.Add('http://azur.ru/malorechka/hotels.php?search=1');
SL.Add('http://azur.ru/newsvet/hotels.php?search=1');
SL.Add('http://azur.ru/sudak/hotels.php?search=1');
SL.Add('http://azur.ru/koktebel/hotels.php?search=1');
SL.Add('http://azur.ru/kurortnoe/hotels.php?search=1');
SL.Add('http://azur.ru/ordjo/hotels.php?search=1');
SL.Add('http://azur.ru/kerch/hotels.php?search=1');
SL.Add('http://azur.ru/chernomor/hotels.php?search=1');
SL.Add('http://azur.ru/peschanoe/hotels.php?search=1');
SL.Add('http://azur.ru/mirnuy/hotels.php?search=1');
SL.Add('http://azur.ru/nikolaevka/hotels.php?search=1');
SL.Add('http://azur.ru/morskoe/hotels.php?search=1');
SL.Add('http://azur.ru/adler/hotels.php?search=1');
SL.Add('http://azur.ru/sochi/hotels.php?search=1');
SL.Add('http://azur.ru/lazarevsk/hotels.php?search=1');
SL.Add('http://azur.ru/ashe/hotels.php?search=1');
SL.Add('http://azur.ru/yakornaya/hotels.php?search=1');
SL.Add('http://azur.ru/loo/hotels.php?search=1');
SL.Add('http://azur.ru/dagomys/hotels.php?search=1');
SL.Add('http://azur.ru/vishnevka/hotels.php?search=1');
SL.Add('http://azur.ru/soloniki/hotels.php?search=1');
SL.Add('http://azur.ru/golovinka/hotels.php?search=1');
SL.Add('http://azur.ru/vardane/hotels.php?search=1');
SL.Add('http://azur.ru/veseloe/hotels.php?search=1');
SL.Add('http://azur.ru/hosta/hotels.php?search=1');
SL.Add('http://azur.ru/krasnya/hotels.php?search=1');
SL.Add('http://azur.ru/gelendzhik/hotels.php?search=1');
SL.Add('http://azur.ru/buhta/hotels.php?search=1');
SL.Add('http://azur.ru/kabardinka/hotels.php?search=1');
SL.Add('http://azur.ru/divnomorsk/hotels.php?search=1');
SL.Add('http://azur.ru/dzhanxot/hotels.php?search=1');
SL.Add('http://azur.ru/betta/hotels.php?search=1');
SL.Add('http://azur.ru/arxipka/hotels.php?search=1');
SL.Add('http://azur.ru/anapa/hotels.php?search=1');
SL.Add('http://azur.ru/vitazevo/hotels.php?search=1');
SL.Add('http://azur.ru/dzhemete/hotels.php?search=1');
SL.Add('http://azur.ru/sykko/hotels.php?search=1');
SL.Add('http://azur.ru/ytrish/hotels.php?search=1');
SL.Add('http://azur.ru/blago/hotels.php?search=1');
SL.Add('http://azur.ru/tyapse/hotels.php?search=1');
SL.Add('http://azur.ru/dgybga/hotels.php?search=1');
SL.Add('http://azur.ru/lermontovo/hotels.php?search=1');
SL.Add('http://azur.ru/newmih/hotels.php?search=1');
SL.Add('http://azur.ru/olginka/hotels.php?search=1');
SL.Add('http://azur.ru/agoi/hotels.php?search=1');
SL.Add('http://azur.ru/nebug/hotels.php?search=1');
SL.Add('http://azur.ru/dederkoy/hotels.php?search=1');
SL.Add('http://azur.ru/shepsi/hotels.php?search=1');
SL.Add('http://azur.ru/inal/hotels.php?search=1');
SL.Add('http://azur.ru/nvrsk/hotels.php?search=1');
SL.Add('http://azur.ru/abrau/hotels.php?search=1');
SL.Add('http://azur.ru/ozereika/hotels.php?search=1');
SL.Add('http://azur.ru/balka/hotels.php?search=1');
SL.Add('http://azur.ru/mishako/hotels.php?search=1');
SL.Add('http://azur.ru/tamane/hotels.php?search=1');
SL.Add('http://azur.ru/golubickay/hotels.php?search=1');
SL.Add('http://azur.ru/kuchugury/hotels.php?search=1');
SL.Add('http://azur.ru/peresyp/hotels.php?search=1');
SL.Add('http://azur.ru/veselovka/hotels.php?search=1');
SL.Add('http://azur.ru/temryuk/hotels.php?search=1');
SL.Add('http://azur.ru/suhumi/hotels.php?search=1');
SL.Add('http://azur.ru/gagra/hotels.php?search=1');
SL.Add('http://azur.ru/picunda/hotels.php?search=1');
SL.Add('http://azur.ru/afon/hotels.php?search=1');
SL.Add('http://azur.ru/gudauta/hotels.php?search=1');
SL.Add('http://azur.ru/ochamchira/hotels.php?search=1');
SL.Add('http://azur.ru/tsandripsh/hotels.php?search=1');
SL.Add('http://azur.ru/barcelona/hotels.php?search=1');
SL.Add('http://azur.ru/lloretdemar/hotels.php?search=1');
SL.Add('http://azur.ru/tossademar/hotels.php?search=1');
SL.Add('http://azur.ru/blanes/hotels.php?search=1');
SL.Add('http://azur.ru/platjadaro/hotels.php?search=1');
SL.Add('http://azur.ru/roses/hotels.php?search=1');
SL.Add('http://azur.ru/empuriabrava/hotels.php?search=1');
SL.Add('http://azur.ru/palafrugell/hotels.php?search=1');
SL.Add('http://azur.ru/cadaques/hotels.php?search=1');
SL.Add('http://azur.ru/palamos/hotels.php?search=1');
SL.Add('http://azur.ru/sanfeliu/hotels.php?search=1');
SL.Add('http://azur.ru/llanca/1');

 
     mtData.Open;
     for i := 0 to SL.Count - 1 do
     begin
       GetOne(SL[i], 'azur.ru');
       lbProgressMegaGlobal.Caption := FormatFloat('0.00', i/SL.count*100 ) + ' - ' + FormatFloat('0', SL.count);
       Application.ProcessMessages;
     end;
SL.Clear;
SL.Add('http://kurort.yuga.ru/abrau-durso/hotels/');
SL.Add('http://kurort.yuga.ru/anapa/hotels/');
SL.Add('http://kurort.yuga.ru/arhipo-osipovka/hotels/');
SL.Add('http://kurort.yuga.ru/betta/hotels/');
SL.Add('http://kurort.yuga.ru/bolshoi_utrish/hotels/');
SL.Add('http://kurort.yuga.ru/inal/hotels/');
SL.Add('http://kurort.yuga.ru/vityazevo/hotels/');
SL.Add('http://kurort.yuga.ru/gelendzhik/hotels/');
SL.Add('http://kurort.yuga.ru/golubickaya/hotels/');
SL.Add('http://kurort.yuga.ru/dagomys/hotels/');
SL.Add('http://kurort.yuga.ru/djanhot/hotels/');
SL.Add('http://kurort.yuga.ru/djemete/hotels/');
SL.Add('http://kurort.yuga.ru/djubga/hotels/');
SL.Add('http://kurort.yuga.ru/divnomorskoe/hotels/');
SL.Add('http://kurort.yuga.ru/essentuki/hotels/');
SL.Add('http://kurort.yuga.ru/jeleznovodsk/hotels/');
SL.Add('http://kurort.yuga.ru/kislovodsk/hotels/');
SL.Add('http://kurort.yuga.ru/krasnodar/hotels/');
SL.Add('http://kurort.yuga.ru/krinica/hotels/');
SL.Add('http://kurort.yuga.ru/lagonaki/hotels/');
SL.Add('http://kurort.yuga.ru/lazarevskoe/hotels/');
SL.Add('http://kurort.yuga.ru/loo/hotels/');
SL.Add('http://kurort.yuga.ru/macesta/hotels/');
SL.Add('http://kurort.yuga.ru/mezmai/hotels/');
SL.Add('http://kurort.yuga.ru/min-vody/hotels/');
SL.Add('http://kurort.yuga.ru/nebug/hotels/');
SL.Add('http://kurort.yuga.ru/olginka/hotels/');
SL.Add('http://kurort.yuga.ru/sochi/hotels/');
SL.Add('http://kurort.yuga.ru/tuapse/hotels/');

     for i := 0 to SL.Count - 1 do
     begin
       for j := 0 to 16 do
       begin
         GetOneKY(SL[i] + '?page=' + IntToStr(j), 'kurort.yuga.ru');
         lbProgressMegaGlobal.Caption := FormatFloat('0.00', i/SL.count*100 ) + ' - ' + FormatFloat('0', SL.count);
         Application.ProcessMessages;
       end;
     end;

     SL.Clear;
     SL.Add('http://www.moremest.com/kabardinka/guesthouses/');
     SL.Add('http://www.moremest.com/gelendzhic/guesthouses/');
     SL.Add('http://www.moremest.com/arkhipo-osipovka/guesthouses/');
     SL.Add('http://www.moremest.com/yevpatoria/guesthouses/');
     SL.Add('http://www.moremest.com/sudak/guesthouses/');
     SL.Add('http://www.moremest.com/olginka/guesthouses/');
 

     for i := 0 to SL.Count - 1 do
     begin
       for j := 1 to 120 do
       begin
         GetOneMM(SL[i] + '' + IntToStr(j), 'moremest.com');
         lbProgressMegaGlobal.Caption := FormatFloat('0.00', i/SL.count*100 ) + ' - ' + FormatFloat('0', SL.count);
         Application.ProcessMessages;
       end;
     end;


     SL.Clear;
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/565/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/782/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/566/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/567/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/569/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/570/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/573/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/572/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/571/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/575/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/576/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/578/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/795/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/580/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/581/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/797/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/582/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/785/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/583/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/781/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/798/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/586/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/780/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/587/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/588/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/589/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/800/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/591/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/593/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/592/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/783/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/595/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/799/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/596/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/602/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/792/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/598/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/794/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/600/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/791/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/788/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/606/');
     SL.Add('http://gelendzhik-kurort.ru/gelendzhik/802/');
 

     for i := 0 to SL.Count - 1 do
     begin
         GetOneGK(SL[i], 'gelendzhik-kurort.ru');
         lbProgressMegaGlobal.Caption := FormatFloat('0.00', i/SL.count*100 ) + ' - ' + FormatFloat('0', SL.count);
         Application.ProcessMessages;
     end;

     SL.Clear;
     SL.Add('http://letonamore.ru/sections/1-%D0%A7%D0%B0%D1%81%D1%82%D0%BD%D1%8B%D0%B9_%D1%81%D0%B5%D0%BA%D1%82%D0%BE%D1%80');
     SL.Add('http://letonamore.ru/sections/2-%D0%A7%D0%B0%D1%81%D1%82%D0%BD%D1%8B%D0%B5_%D0%B3%D0%BE%D1%81%D1%82%D0%B8%D0%BD%D0%B8%D1%86%D1%8B');
     SL.Add('http://letonamore.ru/sections/3-%D0%9A%D0%B2%D0%B0%D1%80%D1%82%D0%B8%D1%80%D1%8B');
     SL.Add('http://letonamore.ru/sections/5-%D0%9C%D0%B8%D0%BD%D0%B8_%D0%B3%D0%BE%D1%81%D1%82%D0%B8%D0%BD%D0%B8%D1%86%D1%8B');
     SL.Add('http://letonamore.ru/sections/6-%D0%9D%D0%BE%D0%BC%D0%B5%D1%80%D0%B0_%D1%8D%D0%BA%D0%BE%D0%BD%D0%BE%D0%BC');

     for i := 0 to SL.Count - 1 do
     begin
       GetLinks(SL[i], SL2, 'a href="/sections/', 'a href="/sections/', 'http://letonamore.ru/sections/', 'class=hotel');
       for j := 0 to SL2.Count - 1 do
       begin
         if POS('html=', SL2[j]) > 0 then
           GetOneLT(SL2[ j - 1], 'letonamore.ru');
         lbProgressMegaGlobal.Caption := FormatFloat('0.00', i/SL.count*100 ) + ' - ' + FormatFloat('0', SL.count);
         Application.ProcessMessages;
       end;
     end;

  finally
    SL.Free;
    SL2.Free;
  end;
end;

procedure TfAucSu.Button1Click(Sender: TObject);
begin
  GreedToExcel(dbgIzd, '');
end;

end.
