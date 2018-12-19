unit uWP_Pic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, QuickRpt, QRCtrls, DB, ADODB, FileUtil, RXGif, uOrgChart,
  RxMemDS, dxTL;

type
  TWP_Pic = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRImage2: TQRImage;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1SecName: TStringField;
    RxMemoryData1CAName: TStringField;
    RxMemoryData1PName: TStringField;
    QRDBText3: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText4: TQRDBText;
    RxMemoryData1APrc: TFloatField;
    QRDBText5: TQRDBText;
    BandCA: TQRBand;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure RxMemoryData1APrcGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    procedure Init(ADWChart: TDWChart);
  end;

var
  WP_Pic: TWP_Pic;
 function ShowWP_Pic(ADWChart: TDWChart):boolean;
implementation

uses uDM, uMain, foMyFunc;

function ShowWP_Pic(ADWChart: TDWChart):boolean;
var
 F:TWP_Pic;
begin
  F:=TWP_Pic.Create(nil);
  try
    with F do
    begin
      Init(ADWChart);
    end;
  finally
    F.Free;
  end;
end;


{$R *.dfm}


{ TWP }

procedure TWP_Pic.Init(ADWChart: TDWChart);
var S : String;
    Bitmap, Bitmap2: TBitmap;
    Node, N1 : TdxTreeListNode;
    w, h, cw, ch: Integer;
    xyaspect: Double;
  procedure AddData(SecName, PName, CANAme : String; APrc : Variant);
  begin
    PName := StringReplace(PName, '(index )', '', []);
    CANAme := StringReplace(CANAme, '(index )', '', []);
    RxMemoryData1.Append;
    RxMemoryData1SecName.AsString := SecName;
    RxMemoryData1PName.AsString := PName;
    RxMemoryData1CANAme.AsString := CANAme;
    RxMemoryData1APrc.AsVariant := APrc;

    RxMemoryData1.Post;
  end;
begin
  Screen.Cursor := crSQLWait;
  RxMemoryData1.Open;
    try
      Bitmap := TBitmap.Create;

        THackOrgChart(ADWChart.ChartD).DrawTo(Bitmap);
        if (Bitmap.Height > Bitmap.Width) then
        begin
          QRImage2.Picture.Assign(Bitmap);
        end
        else
        begin
          RotateBMP(Bitmap, Bitmap2);
          QRImage2.Picture.Assign(Bitmap2);
        end;
      //  Bitmap2.SaveToFile('c:\2.bmp');
       //

       // if QRImage2.Width > QRImage2.Picture.Width then
          QRImage2.Width := QRImage2.Picture.Width;
       // if QRImage2.Height > QRImage2.Picture.Height then
          QRImage2.Height := QRImage2.Picture.Height;

          
        ColumnHeaderBand1.Height := 1050;
        QRImage2.Height :=  ColumnHeaderBand1.Height - 2 * QRImage2.Left;
        QRImage2.Width :=  ColumnHeaderBand1.Width - 2 * QRImage2.Top;
// *******************************************
        ch := QRImage2.Height;
        w := QRImage2.Picture.Width;
        h := QRImage2.Picture.Height;
        cw := QRImage2.Width - 10;// 10;

        if (QRImage2.Picture.Height/QRImage2.Height) > (QRImage2.Picture.Width/QRImage2.Width) then
        begin
          QRImage2.Width := Trunc(QRImage2.Height / QRImage2.Picture.Height * QRImage2.Picture.Width);
        end
        else
        begin
          QRImage2.Height := Trunc(QRImage2.Height / QRImage2.Picture.Height * QRImage2.Picture.Width);
        end;
        QRImage2.Left := (ColumnHeaderBand1.Width - QRImage2.Width) div 2;
        QRImage2.Top := (ColumnHeaderBand1.Height - QRImage2.Height) div 2;
// *******************************************
  AddData(' ', ' ', ' ', Null);
    QuickRep1.Prepare;
    Screen.Cursor := crDefault;
    QuickRep1.PreviewModal;
    finally
      Bitmap.Free;
      Screen.Cursor := crDefault;
    end;
end;

procedure TWP_Pic.QRLabel4Print(sender: TObject; var Value: String);
begin
  if trim(RxMemoryData1SecName.AsString) = '' then
    Value := ''
  else
    Value := QRLabel4.Caption;
end;

procedure TWP_Pic.QRLabel3Print(sender: TObject; var Value: String);
begin
  if trim(RxMemoryData1SecName.AsString) = '' then
    Value := ''
  else
  begin
    Value := RxMemoryData1SecName.AsString;//QRLabel3.Caption;
  end;
end;

procedure TWP_Pic.RxMemoryData1APrcGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.IsNull then
    Text := ''
  else
    Text := FormatFloat('0.##%', Sender.AsFloat)
end;

procedure TWP_Pic.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  if trim(RxMemoryData1SecName.AsString) = '' then
    QRShape3.Visible := trim(RxMemoryData1SecName.AsString) <> '';
    QRGroup1.Visible := trim(RxMemoryData1SecName.AsString) <> '';
end;

procedure TWP_Pic.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    QRGroup2.Visible := trim(RxMemoryData1SecName.AsString) <> '';
end;

end.
