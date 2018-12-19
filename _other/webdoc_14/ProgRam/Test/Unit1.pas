unit Unit1;

interface

uses
  ActiveX,//!!!

  MapiDefs,


    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DragDrop, DropTarget, DropComboTarget;

type
  TForm1 = class(TForm)
    DataFormatAdapterOutlook: TDataFormatAdapter;
    DropComboTarget1: TDropComboTarget;
    procedure DropComboTarget1Drop(Sender: TObject;
      ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  MapiUtil,
  MapiTags,
  ComObj,
//!!!  ActiveX,
  ShellAPI,
  Contnrs,
  DragDropFormats,
  DragDropFile,
  DragDropInternet;

procedure TForm1.DropComboTarget1Drop(Sender: TObject;
  ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
var
  OutlookDataFormat: TOutlookDataFormat;
  i: integer;

  AMessage: IMessage;
begin
  // Check if we have a data format and if so...
  if (DataFormatAdapterOutlook.DataFormat <> nil) then
  begin
    // ...Extract the dropped data from it.
    OutlookDataFormat := DataFormatAdapterOutlook.DataFormat as TOutlookDataFormat;

    (*
    ** Reset everything
    *)
 {   Reset;

    CleanUp;

    OutlookDataFormat.Messages.LockSession;
    FHasMessageSession := True;
                }
    // Get all the dropped messages
    for i := 0 to OutlookDataFormat.Messages.Count-1 do
    begin
      // Get an IMessage interface
      if (Supports(OutlookDataFormat.Messages[i], IMessage, AMessage)) then
      begin
        try
           finally
          AMessage := nil;
        end;
      end;
    end;
  end;

end;

end.
