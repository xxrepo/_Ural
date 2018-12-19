unit uWP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, QuickRpt, QRCtrls, DB, ADODB, FileUtil, RXGif,
  RxMemDS;

type
  TWP = class(TForm)
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1SecName: TStringField;
    RxMemoryData1CAName: TStringField;
    RxMemoryData1PName: TStringField;
    RxMemoryData1APrc: TFloatField;
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
    procedure Init(ADWChart: TDWChart; AOwn, ACh : boolean);
  end;

var
  WP: TWP;
 function ShowWP(ADWChart: TDWChart; AOwn, ACh : boolean):boolean;
implementation

uses uDM, uMain, foMyFunc;

function ShowWP(ADWChart: TDWChart; AOwn, ACh : boolean):boolean;
var
 F:TWP;
begin
  F:=TWP.Create(nil);
  try
    with F do
    begin
      Init(ADWChart, AOwn, ACh);
    end;
  finally
    F.Free;
  end;
end;


{$R *.dfm}


{ TWP }

procedure TWP.Init(ADWChart: TDWChart; AOwn, ACh : boolean);
var S : String;
    Node, N1 : TdxTreeListNode;
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
  qTitle.Caption := ADWChart.ChartD.Title;
  RxMemoryData1.Open;
    try
      if AOwn then
      begin
        Node := ADWChart.dxOwn.TopNode;
        while Node <> nil do
        begin
          if {not Node.HasChildren and }(Node.Count = 0) and (Node.Parent <> nil) then
          begin
            if Node.Parent = nil then
               AddData('Owners', Node.Values[ADWChart.dxOwnName.index] + ' (' + IntToStr(Node.Values[ADWChart.dxOwnAINDEX.index]) + ')', '---', Null)
            else
              AddData('Owners', Node.Parent.Values[ADWChart.dxOwnName.index] + ' (' + VarToStr(Node.Parent.Values[ADWChart.dxOwnAINDEX.index]) + ')', Node.Values[ADWChart.dxOwnNAME.index] + ' (' + VarToStr(Node.Values[ADWChart.dxOwnAINDEX.index]) + ')', Node.Values[ADWChart.dxOwnAPRC.index]);
          end;
          Node := Node.GetNext;
        end;
      end;
      
      if ACh then
      begin
        Node := ADWChart.dxChild.TopNode;
        while Node <> nil do
        begin
          if {not Node.HasChildren and }(Node.Count = 0) and (Node.Parent <> nil) then
          begin
            if Node.Parent = nil then
               AddData('Dependent companies', Node.Values[ADWChart.dxChildNAME.index] + ' (' + IntToStr(Node.Values[ADWChart.dxChildAindex.index]) + ')', '---', Null)
            else
              AddData('Dependent companies', Node.Parent.Values[ADWChart.dxChildNAME.index] + ' (' + VarToStr(Node.Parent.Values[ADWChart.dxChildAindex.index]) + ')', Node.Values[ADWChart.dxChildNAME.index] + ' (' + VarToStr(Node.Values[ADWChart.dxChildAindex.index]) + ')', Node.Values[ADWChart.dxChildAPRC.index]);
          end;
          Node := Node.GetNext;
        end;
      end;
    QuickRep1.Prepare;
    Screen.Cursor := crDefault;
    QuickRep1.PreviewModal;
    finally
      Screen.Cursor := crDefault;
    end;
 {
  try
    with ADOQuery3 do
    begin
      Close;
      Parameters.ParamByName('id_Obj').Value := AID_Obj;
      Open;
      First;
      SL := TStringList.Create;
      while not eof do
      begin
        S := ExtractFileExt(ADOQuery3NAME.AsString);
        S := StringReplace(S, '.', '', [rfReplaceAll, rfIgnoreCase]);
        if SL.IndexOf(S) = -1 then
          SL.Add(S);
        Next;
      end;
    end;
    lbFormat.Caption := StringReplace(trim(SL.Text), #13 + #10, ', ', [rfReplaceAll, rfIgnoreCase]);
    SL.Free;

    with ADOQuery1 do
    begin
      Close;
      Parameters.ParamByName('id_Obj').Value := AID_Obj;
      Open;
      lbNAme.Caption := ADOQuery1NAME.AsString + ' (' + ADOQuery1WE.AsString + ' г)';
      lbCode.Caption := 'Код дизайна: ' + ADOQuery1O_CODE.AsString;
      lbTaste.Caption := ADOQuery1TASTE.AsString;
      lbLang.Caption := ADOQuery1LANGNAME.AsString;

      lbSize.Caption := ADOQuery1A_SIZE.AsString;
    //  lbFormat.Caption := '';
      lbColor.Caption := ADOQuery1A_COLOR.AsString;

      lbArcDskNum.Caption := ADOQuery1ArcDskNum.AsString;


      AwpData.Name := ADOQuery1NAME.AsString;
      AwpData.Code := ADOQuery1O_CODE.AsString;
      AwpData.Taste := ADOQuery1TASTE.AsString;
      AwpData.Size := ADOQuery1A_SIZE.AsString;
      AwpData.Format := lbFormat.Caption;
      AwpData.Lang := ADOQuery1LANGNAME.AsString;
      AwpData.Color:= ADOQuery1A_COLOR.AsString;
      AwpData.WE := ADOQuery1WE.AsString;
      AwpData.ExtInfo := ADOQuery1EXTINFO.AsString;

      Close;

    end;
    if DM.GRAND_Edit then
    begin
      if ShowWPText(AwpData) then
      begin
        TrimMT(AwpData.Name);
        TrimMT(AwpData.Code);
        TrimMT(AwpData.Taste);
        TrimMT(AwpData.Size);
        TrimMT(AwpData.Format);
        TrimMT(AwpData.Lang);
        TrimMT(AwpData.Color);
        TrimMT(AwpData.WE);
        TrimMT(AwpData.ExtInfo);




        lbNAme.Caption := AwpData.Name + ' (' + AwpData.WE + ' г)';
        lbCode.Caption := 'Код дизайна: ' + AwpData.Code;
        QuickRep1.ReportTitle := AwpData.Name + ' (' + AwpData.WE + ' г)';
        lbTaste.Caption := AwpData.Taste;
        lbLang.Caption := AwpData.Lang;

        lbSize.Caption := AwpData.Size;
        lbFormat.Caption := AwpData.Format;
        lbColor.Caption := AwpData.Color;

        lbExtInfo.Caption := AwpData.ExtInfo;
      end
      else
      begin
        Close;
        Exit;
      end;
    end;

  if trim(lbExtInfo.Caption) = '' then
  begin
    lbExtInfo.Caption := '';
    lbbbExtInfo.Caption := '';

    if Length(trim(lbColor.Caption)) > 65 then
    begin
      lbColor.WordWrap := true;
      lbColor.Height := 2 * lbColor.Height + 2;

    end
    else
    begin
      tTaste.Top := tTaste.Top + 17;
      lbTaste.Top := lbTaste.Top + 17;

      tLang.Top := tLang.Top + 17;
      lbLang.Top := lbLang.Top + 17;

      tFormat.Top := tFormat.Top + 17;
      lbFormat.Top := lbFormat.Top + 17;

      tSize.Top := tSize.Top + 17;
      lbSize.Top := lbSize.Top + 17;

      tColor.Top := tColor.Top + 17;
      lbColor.Top := lbColor.Top + 17;

      QRImage2.Height := QRImage2.Height + 17;
    end;
  end;

  if trim(lbColor.Caption) = '' then
  begin
    tTaste.Top := tTaste.Top + 17;
    lbTaste.Top := lbTaste.Top + 17;

    tLang.Top := tLang.Top + 17;
    lbLang.Top := lbLang.Top + 17;

    tFormat.Top := tFormat.Top + 17;
    lbFormat.Top := lbFormat.Top + 17;

    tSize.Top := tSize.Top + 17;
    lbSize.Top := lbSize.Top + 17;

    QRImage2.Height := QRImage2.Height + 17;
  end;

  if trim(lbExtInfo.Caption) = '' then
  begin
    lbExtInfo.Free;
    lbbbExtInfo.Free;
  end;
  
  if trim(lbTaste.Caption) = '' then
  begin
 //   tTaste.Caption := '';
    lbTaste.Free;
    tTaste.Free;
  end;
  if trim(lbLang.Caption) = '' then
  begin
   // tLang.Caption := '';
    lbLang.Free;
    tLang.Free;
  end;
  if trim(lbSize.Caption) = '' then
  begin
   // tSize.Caption := '';
    lbSize.Free;
    tSize.Free;
  end;

  if trim(lbFormat.Caption) = '' then
  begin
   // tFormat.Caption := '';
    lbFormat.Free;
    tFormat.Free;
  end;
  if trim(lbColor.Caption) = '' then
  begin
  //  tColor.Caption := '';
    lbColor.Free;
    tColor.Free;
  end;

      qMin.Close;
      qMin.Close;
      qMin.Parameters.ParamByName('id_Obj').Value := AID_Obj;
      qMin.Open;
      qMin.First;
      if qMinID_OBJPREVIEW.AsInteger > 0 then
      begin
        with ADOQuery2 do
        begin
          Close;
          ADOQuery2.Parameters.ParamByName('id_ObjPreview').Value := qMinID_OBJPREVIEW.AsInteger;
          Open;
          qMin.Close;
          if ADOQuery2PIC.IsNull then
            Main.AddToLog('Нет картинки на превью');
          if not ADOQuery2PIC.IsNull then
          begin
            S := DM.GetTmpDirName + 'WP\' + DM.GetTempName(ExtractFileExt(fieldByName('Name').AsString));
            if not DirExists(DM.GetTmpDirName + 'WP') then
              ForceDirectories(DM.GetTmpDirName + 'WP');

            if FileExists(S) then
              DeleteFile(S);
            ADOQuery2PIC.SaveToFile(S);
            Main.AddToLog('Файл сохранен '  + S);

            ch := QRImage2.Height;
            QRImage2.Picture.LoadFromFile(S);
            Main.AddToLog('Файл сзагружен '  + S);
            try
           //   DeleteFile(S);
            //  Main.AddToLog('Файл удален '  + S);
            except
            end;

            w := QRImage2.Picture.Width;
            h := QRImage2.Picture.Height;
            cw := QRImage1.Width - 10;// 10;

            if (w > 0) and (h > 0) then
            begin
              xyaspect := w / h;
              if ch * xyaspect > cw then
              begin
                ch := Trunc(cw / xyaspect);
              end
              else
              begin
                cw := Trunc(ch * xyaspect);
              end;
            end
            else
            begin
              w := cw;
              h := ch;
            end;
          end
          else
            QRImage2.Picture := nil;
          Close;

          if cw > 0 then
            QRImage2.Width := cw;
          if ch > 0 then
            QRImage2.Height := ch;

          QRImage2.Left := (QRImage1.Width - QRImage2.Width) div 2 + QRImage1.Left;
          if QRImage2.Left < 0 then
            QRImage2.Left := 0;
        end;
      end
      else
        QRImage2.Picture := nil;

 //   QuickRep1.Preview;
  finally
    
  end;
 // QuickRep1.ReportTitle  }
end;

procedure TWP.QRLabel4Print(sender: TObject; var Value: String);
begin
 { if trim(RxMemoryData1SecName.AsString) = '' then
    Value := ''
  else
    Value := QRLabel4.Caption;  }
end;

procedure TWP.QRLabel3Print(sender: TObject; var Value: String);
begin
  if trim(RxMemoryData1SecName.AsString) = '' then
    Value := ''
  else
  begin
    Value := RxMemoryData1SecName.AsString;//QRLabel3.Caption;
  end;
end;

procedure TWP.RxMemoryData1APrcGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.IsNull then
    Text := ''
  else
    Text := FormatFloat('0.##%', Sender.AsFloat)
end;

procedure TWP.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  if trim(RxMemoryData1SecName.AsString) = '' then
    QRShape3.Visible := trim(RxMemoryData1SecName.AsString) <> '';
    QRGroup1.Visible := trim(RxMemoryData1SecName.AsString) <> '';
end;

procedure TWP.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    QRGroup2.Visible := trim(RxMemoryData1SecName.AsString) <> '';
end;

end.
