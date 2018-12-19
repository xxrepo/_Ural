//******************************************************************************
// (С) Игорь Ковалевский, Владикавказ, 1997-1999 г.
// www.geocities.com/SiliconValley/Sector/7819/
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Автор не возражает против использования Вами программы без изменения ее
// оригинального текста и с указанием авторства и года изготовления.
//
// Программа используется в крупной кредитной организации с 1997 года по сей день
// в неизменном виде и скоро собирается стать счастливой пра-пра-пра-бабушкой.
// Однако это не дает Вам никаких гарантий со стороны Автора, поскольку она
// распространяется безвозмездно, то есть даром.
//
// Библиотечка содержит
// ~~~~~~~~~~~~~~~~~~~~
//    o  функцию для вывода числительных прописью
//       от 0 до 999 септиллионов (X*10^25);
//
//       Пример:
//               NumeralToPhrase('456')   -->   'Четыреста пятьдесят шесть'
//
//    o  Функцию для перевода слова, связанного с числительным (или единицы
//       изменения) в соответствующий падеж.
//
//       Пример:
//               GeniCase('10', 'штука','штуки','штук')   -->   'штук'
//               GeniCase('1', 'штука','штуки','штук')    -->   'штука'
//               GeniCase('11', 'штука','штуки','штук')   -->   'штук'
//               GeniCase('21', 'штука','штуки','штук')   -->   'штука'
//
//    o  Функцию для отсечения лидирующих и завершающих пробелов,
//       эмулирующую поведение аналогичной функции FoxPro.
//
//       Пример:
//               Trim(#10+'  Игорь Ковалевский  '+#13)  -->  'Игорь Ковалевский'
//
// Все параметры в функции должны передаваться в виде строк, поскольку
// целочисленное представление в Dельфи по-прежнему имеет меньшую разрядность,
// чем именованный числовой ряд.   ;))
// (все же,  '2147483647' < '999999999999999999999999999').
//******************************************************************************
// ...Говоря точнее:
unit NumTools;

interface
uses SysUtils;

function GeniCase(const S : String; C1,C2,C3 : String): String;
function NumeralToPhrase(const S : String): String;
function Trim(const  S : String): String;
function NumeralToPhraseAdv(SSS : Extended) : String;

implementation

const
     Space = [#0..#32];

//******************************************************************************
// Функция для перевода слова, связанного с числительным в соответствующий падеж
function GeniCase(const S : String; C1,C2,C3 : String): String;
var
    Det1,Det2:Integer;
begin
     Det2:=StrToIntDef(Copy(S,Length(S)-1,2),0);
     Det1:=Det2 mod 10;
     if (Det1=1) and not(Det2=11) then
        GeniCase:=C1
     else
         if (Det1>1) and (Det1<5) and not( (Det2>11) and (Det2<15) ) then
            GeniCase:=C2
         else
            GeniCase:=C3;
end;

//******************************************************************************
// Функция для представления числа прописью.
// Вывод числительных прописью от 0 до 999 септиллионов.
function NumeralToPhraseAdv(SSS : Extended) : String;
begin
  Result := NumeralToPhrase('0' + IntToStr(Trunc(SSS))) +
           ' рублей ' +
           FormatFloat('00', Frac(SSS) * 100) +
           ' копеек';
  Result := StringReplace(Result, '  ', ' ', [rfReplaceAll, rfIgnoreCase]);
end;

function NumeralToPhrase(const S : String) : String;
const
     DigitsF: array[1..10] of String = (
                                        '',
                                        'одна ',
                                        'две ',
                                        'три ',
                                        'четыре ',
                                        'пять ',
                                        'шесть ',
                                        'семь ',
                                        'восемь ',
                                        'девять '
                                       );
     DigitsM: array[1..3] of String = (
                                       '',
                                       'один ',
                                       'два '
                                      );
     Teens: array[1..10] of String = (
                                      'десять ',
                                      'одиннадцать ',
                                      'двенадцать ',
                                      'тринадцать ',
                                      'четырнадцать ',
                                      'пятнадцать ',
                                      'шестнадцать ',
                                      'семнадцать ',
                                      'восемнадцать ',
                                      'девятнадцать '
                                     );
     Tens: array[1..10] of String = (
                                     '',
                                     '',
                                     'двадцать ',
                                     'тридцать ',
                                     'сорок ',
                                     'пятьдесят ',
                                     'шестьдесят ',
                                     'семьдесят ',
                                     'восемьдесят ',
                                     'девяносто '
                                    );
     Hundreds: array[1..10] of String = (
                                         '',
                                         'сто ',
                                         'двести ',
                                         'триста ',
                                         'четыреста ',
                                         'пятьсот ',
                                         'шестьсот ',
                                         'семьсот ',
                                         'восемьсот ',
                                         'девятьсот '
                                        );
var
   I,
   L,
   R,
   V,
   P :Integer;
   C, tmpS : String;
begin
     C:=S;
     L:=Length(C);
     P:=0;
     Result:='';
     for I:=1 to L do
         begin
              R:=(L - I + 1) mod 3;
              tmpS := Copy(C, I, 1);
              V:=StrToIntDef(tmpS, 0);
              case R of
                   0:
                     begin
                          Result:=Result + Hundreds[V+1];
                          if (V>0) then
                             Inc(P);
                     end;
                   1:
                     begin
                          if (V>0) then
                             Inc(P);
                          if (V > 2) then
                             Result := Result + DigitsF[V+1]
                          else
                              if ((L - i) = 3) then
                                 Result := Result + DigitsF[V+1]
                              else
                                  Result := Result + DigitsM[V+1];
                          if P > 0 then
                             case (L - I + 1) of
                                   4: Result:= Result +
                                               GeniCase( C[I],
                                                             'тысяча ',
                                                             'тысячи ',
                                                             'тысяч ');
                                   7: Result:= Result +
                                               GeniCase( C[I],
                                                             'миллион ',
                                                             'миллиона ',
                                                             'миллионов ');
                                  10: Result:= Result +
                                               GeniCase( C[I],
                                                             'миллиард ',
                                                             'миллиарда ',
                                                             'миллиардов ');
                                  13: Result:= Result +
                                               GeniCase( C[I],
                                                             'триллион ',
                                                             'триллиона ',
                                                             'триллионов ');
                                  16: Result:= Result +
                                               GeniCase( C[I],
                                                             'квадриллион ',
                                                             'квадриллиона ',
                                                             'квадриллионов ');
                                  19: Result:= Result +
                                               GeniCase( C[I],
                                                             'квинтиллион ',
                                                             'квинтиллиона ',
                                                             'квинтиллинов ');
                                  22: Result:= Result +
                                               GeniCase( C[I],
                                                             'секстиллион ',
                                                             'секстиллиона ',
                                                             'секстиллионов ');
                                  25: Result:= Result +
                                               GeniCase( C[I],
                                                             'септиллион ',
                                                             'септиллиона ',
                                                             'септиллионов ');
                             end;
                          P:=0;
                     end;
                   2:
                     begin
                          if (V <> 1) then
                             Result:= Result + Tens[V+1]
                          else
                              begin
                                   Result:= Result +
                                            Teens[StrToIntDef(Copy(C,I+1,1),0)+1];
                                   Delete(C,I+1,1);
                                   Insert('0',C,I+1);
                              end;
                          if (V>0) then
                             Inc(P);
                     end;
              end;
         end;
     Result:=Trim(Result);
     if (Result='') then
        Result:='ноль';
     Result:=AnsiUpperCase(Result[1])+Copy(Result,2,Length(Result)-1);
end;

//******************************************************************************
// Результат работы функции - ИМЕННО такой, как в FoxPro.
//
function Trim(const S: string): string;
var
   Index: Integer;
begin
     Index:=1;
     while (Index <= Length(S)) and (S[Index] in Space) do
           Index:=Index + 1;
     Result:=Copy(S, Index, Length(S));
     Index:=Length(Result);
     while (Index > 0) and not (Result[Index] in Space) do
           Index:=Index - 1;
     Result:=Copy(Result, 1, Index);
end;

end.
