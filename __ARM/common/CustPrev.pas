unit CustPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, PrViewEh, StdCtrls, ExtCtrls, PrnDbgeh;

type
  TfCustomPreview = class(TForm)
    Panel1: TPanel;
    bPrint: TButton;
    bPrinterSetupDialog: TButton;
    bPrevPage: TButton;
    bNextPage: TButton;
    bStop: TButton;
    bClose: TButton;
    PreviewEh1: TPreviewBox;
    StatusBar1: TStatusBar;
    PrintDBGridEh1: TPrintDBGridEh;
    Button1: TButton;
    procedure bPrintClick(Sender: TObject);
    procedure bPrinterSetupDialogClick(Sender: TObject);
    procedure bPrevPageClick(Sender: TObject);
    procedure bNextPageClick(Sender: TObject);
    procedure PreviewEh1PrinterPreviewChanged(Sender: TObject);
    procedure PreviewEh1OpenPreviewer(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCustomPreview: TfCustomPreview;

implementation

{$R *.DFM}

procedure TfCustomPreview.bPrintClick(Sender: TObject);
begin
  PreviewEh1.PrintDialog;
end;

procedure TfCustomPreview.bPrinterSetupDialogClick(Sender: TObject);
begin
  PreviewEh1.PrinterSetupDialog;
end;

procedure TfCustomPreview.bPrevPageClick(Sender: TObject);
begin
  PreviewEh1.PageIndex := Pred(PreviewEh1.PageIndex);
end;

procedure TfCustomPreview.bNextPageClick(Sender: TObject);
begin
  PreviewEh1.PageIndex:=Succ(PreviewEh1.PageIndex);
end;

procedure TfCustomPreview.PreviewEh1PrinterPreviewChanged(
  Sender: TObject);
begin
  bStop.Enabled := PreviewEh1.Printer.Printing;
  bClose.Enabled := not PreviewEh1.Printer.Printing;
  bPrint.Enabled := not PreviewEh1.Printer.Printing;
  bPrinterSetupDialog.Enabled := not PreviewEh1.Printer.Printing and
    (Assigned(PreviewEh1.OnPrinterSetupDialog) or Assigned(PreviewEh1.OnPrinterSetupChanged)) and
    Assigned(PreviewEh1.PrinterSetupOwner);
  bPrevPage.Enabled:=PreviewEh1.PageIndex>1;
  bNextPage.Enabled:=PreviewEh1.PageIndex<PreviewEh1.PageCount;
  StatusBar1.SimpleText:='Page '+IntToStr(PreviewEh1.PageIndex)+' of '+IntToStr(PreviewEh1.PageCount);
  Caption := 'Custom preview form - ' + PreviewEh1.Printer.Title;
end;

procedure TfCustomPreview.PreviewEh1OpenPreviewer(Sender: TObject);
begin
 { if IsIconic(Handle) then ShowWindow(Handle,sw_Restore);
  BringWindowToTop(Handle);
  if not Visible then Show;   }
end;

procedure TfCustomPreview.bCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfCustomPreview.Button1Click(Sender: TObject);
begin
  PreviewEh1.ViewMode := vm200;//TViewMode(Ord(PreviewEh1.ViewMode) + 1);
end;

end.
