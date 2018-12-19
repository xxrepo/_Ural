unit uWP_Pic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Printers, QuickRpt, QRCtrls, DB, ADODB, FileUtil, RXGif,   RxMemDS, dxTL;

type
  TWP_Pic = class(TForm)
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1SecName: TStringField;
    RxMemoryData1CAName: TStringField;
    RxMemoryData1PName: TStringField;
    RxMemoryData1APrc: TFloatField;
    PrintDialog1: TPrintDialog;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure RxMemoryData1APrcGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
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

uses uDM, uMain, foMyFunc, uPrgForm;

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
    Bitmap, Bitmap2, Bitmap3: TBitmap;
    Node, N1 : TdxTreeListNode;
    w, h, cw, ch, i: Integer;
    X_w, X_h : Extended;
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
  RxMemoryData1.Open;
    try

   { BltTBitmapAsDib(Image1.Canvas.Handle,
      0, //TRUNC((6500 - X_h*QRImage2.Picture.Bitmap.Height) / 2),
      0, //TRUNC( (2500 - X_h*QRImage2.Picture.Bitmap.Width) / 2),
      TRUNC(X_h*QRImage2.Picture.Bitmap.Width),
      TRUNC(X_h*QRImage2.Picture.Bitmap.Height),
      QRImage2.Picture.Bitmap);
          QRImage2.Picture.Assign(Image1.Picture); }

  if PrintDialog1.Execute then
  begin
    ShowProgressForm(Handle, -1, -1, 'Printing chart...');
    Screen.Cursor := crSQLWait;

      Bitmap := TBitmap.Create;
      Bitmap2 := nil;
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
       //

       // if QRImage2.Width > QRImage2.Picture.Width then
          QRImage2.Width := QRImage2.Picture.Width;
       // if QRImage2.Height > QRImage2.Picture.Height then
          QRImage2.Height := QRImage2.Picture.Height;

          
        ColumnHeaderBand1.Height := 1083;
        QRImage2.Height :=  ColumnHeaderBand1.Height - 2 * QRImage2.Left;
        QRImage2.Width :=  ColumnHeaderBand1.Width - 2 * QRImage2.Top;
        for i := 0 to QRImage2.Picture.Width do
          SetPixel(QRImage2.Canvas.Handle, i, 0, clWhite);
 //       QRImage2.Picture.SaveToFile('c:\2.bmp');
// *******************************************
        ch := QRImage2.Height;
        w := QRImage2.Picture.Width;
        h := QRImage2.Picture.Height;
        cw := QRImage2.Width - 10;// 10;

        if (QRImage2.Picture.Height > QRImage2.Height) or (QRImage2.Picture.Width > QRImage2.Width) then
        begin
          if (QRImage2.Picture.Height/QRImage2.Height) > (QRImage2.Picture.Width/QRImage2.Width) then
          begin
            QRImage2.Width := Trunc(QRImage2.Height / QRImage2.Picture.Height * QRImage2.Picture.Width);
          end
          else
          begin
            QRImage2.Height := Trunc(QRImage2.Height / QRImage2.Picture.Height * QRImage2.Picture.Width);
          end;
        end
        else
          QRImage2.Stretch := false;
          QRImage2.Left := (ColumnHeaderBand1.Width - QRImage2.Width) div 2;
          QRImage2.Top := (ColumnHeaderBand1.Height - QRImage2.Height) div 2;
// *******************************************
  AddData(' ', ' ', ' ', Null);

    X_h := ({6300} printer.PageHeight/QRImage2.Picture.Bitmap.Height);
    X_w := ({1870} printer.PageWidth/QRImage2.Picture.Bitmap.Width);
    if X_h > X_w then
      X_h := X_w;
  //  X_h := 1;
    Bitmap3 := nil;
    CopyBMP(X_h, QRImage2.Picture.Bitmap, Bitmap3);
  //QRImage2.Picture.Bitmap.SaveToFile('c:\1.bmp');
//Bitmap3.SaveToFile('c:\11.bmp');
// exit;
    QRImage2.Picture.Assign(Bitmap3);
//    QRImage2.Picture.Bitmap.SaveToFile('c:\13.bmp');
    Printer.BeginDoc;
    BltTBitmapAsDib(Printer.Canvas.Handle,
      0, //TRUNC((6500 - X_h*QRImage2.Picture.Bitmap.Height) / 2),
      0, //TRUNC((2500 - X_h*QRImage2.Picture.Bitmap.Width) / 2),
      TRUNC(X_h*QRImage2.Picture.Bitmap.Width),
      TRUNC(X_h*QRImage2.Picture.Bitmap.Height),
      QRImage2.Picture.Bitmap); 
    Printer.EndDoc;
    CloseProgressForm;
  end;
    Screen.Cursor := crDefault;
    finally
      Bitmap.Free;
      Screen.Cursor := crDefault;
      CloseProgressForm;
    end;
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
    QRGroup1.Visible := trim(RxMemoryData1SecName.AsString) <> '';
end;

end.
