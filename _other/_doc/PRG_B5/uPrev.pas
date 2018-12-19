unit uPrev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ActnList, RXCtrls;

type

  TPrevPic = class(TForm)
    Panel2: TPanel;
    btnCancel: TButton;
    pTop: TPanel;
    BitBtn5: TRxSpeedButton;
    BitBtn6: TRxSpeedButton;
    BitBtn4: TRxSpeedButton;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    bSave: TRxSpeedButton;
    SavePic: TSaveDialog;
    Button1: TButton;
    Action3: TAction;
    Button2: TButton;
    Button3: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bSaveClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pTopMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
  private
    Fid_ObjPic, xxx_X, xxx_Y : integer;
    PicFileName : String;
    FisPrev : boolean;
    FOldWindowProc : TWndMethod;
    procedure CaclSize;
    procedure DecImage;
    procedure IncImage;
    procedure SetRealSize;
    { Private declarations }
  public
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure CreateParams(var Params: TCreateParams); override;

    procedure CMMouseWheel(var Message: TCMMouseWheel); message CM_MOUSEWHEEL;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;

    procedure SubClassWndProc(var Message: TMessage);
  end;


var
  PrevPic: TPrevPic;

implementation

uses uDM, uMain, foMyFunc;

{$R *.dfm}


procedure TPrevPic.btnCancelClick(Sender: TObject);
begin
  Close;
end;

constructor TPrevPic.Create(AOwner: TCOmponent);
var i : integer;
begin
  inherited;
  Image1.Cursor := Cur_Def;
  FOldWindowProc := WindowProc;
  WindowProc := SubClassWndProc;
 // SetWindowLong(Handle, GWL_HWNDPARENT, 0);
end;

procedure TPrevPic.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

destructor TPrevPic.Destroy;
begin

  inherited;
end;

procedure TPrevPic.CaclSize;
begin
        if Left + Image1.Picture.Width + 30 < Screen.Width then
          Width := Image1.Picture.Width + 30
        else
          Width := Screen.Width - 10 - Left;

        if Top + Image1.Picture.Height + Panel2.Height + 40 + pTop.Height < Screen.Height then
          Height := Image1.Picture.Height + 40 + Panel2.Height + pTop.Height
        else
          Height := Screen.Height - 40  - Top;
  BringToFront;
end;

procedure TPrevPic.DecImage;
begin
  if (Image1.Width <= trunc(Image1.Picture.Width/10)) or
  (Image1.Width <= 70) then
    Exit;
 // ScrollBox1.Width := ScrollBox1.Width - trunc(ScrollBox1.Width/10);
//  ScrollBox1.Height := ScrollBox1.Height - trunc(ScrollBox1.Height/10);

  Image1.Width := Image1.Width - trunc(Image1.Picture.Width/10);
  Image1.Height := Image1.Height - trunc(Image1.Picture.Height/10);
//1013  CaclSize;
  BringToFront;
end;

procedure TPrevPic.IncImage;
begin
//  ScrollBox1.Width := ScrollBox1.Width + trunc(ScrollBox1.Width/10);
//  ScrollBox1.Height := ScrollBox1.Height + trunc(ScrollBox1.Height/10);
  Image1.Width := Image1.Width + trunc(Image1.Picture.Width/10);
  Image1.Height := Image1.Height + trunc(Image1.Picture.Height/10);
//1013 CaclSize;
  BringToFront;  
end;

procedure TPrevPic.BitBtn5Click(Sender: TObject);
begin
  DecImage;
end;

procedure TPrevPic.BitBtn4Click(Sender: TObject);
begin
  IncImage;
end;

procedure TPrevPic.SetRealSize;
begin
  Image1.Width := Image1.Picture.Width;
  Image1.Height := Image1.Picture.Height;
  CaclSize;
end;


procedure TPrevPic.BitBtn6Click(Sender: TObject);
begin
  SetRealSize;
end;

procedure TPrevPic.Action1Execute(Sender: TObject);
begin
  DecImage
end;

procedure TPrevPic.Action2Execute(Sender: TObject);
begin
   IncImage
end;

procedure TPrevPic.CMMouseWheel(var Message: TCMMouseWheel);
begin
  with Message do
  begin
    Message.Result := 1;
    if ssCtrl in Message.ShiftState then
    begin
      if Message.WheelDelta < 0 then
        IncImage
      else
        DecImage;
    end
    else
    begin
      if Message.WheelDelta < 0 then
        ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.ScrollPos + ScrollBox1.VertScrollBar.Increment
      //  ScrollBy(0, -1)
      else
        ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.ScrollPos - ScrollBox1.VertScrollBar.Increment;
     //   ScrollBy(0, 1);
    end;
  end;
end;

procedure TPrevPic.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
  begin
    Close;
    Exit;
  end;
  if ssCtrl in Shift then
  begin
    if Key = 107 then
      IncImage
    else
      if Key = 109 then
        DecImage;

  end
  else
  begin
    //  if Message.WheelDelta < 0 then
   //    ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.ScrollPos + ScrollBox1.VertScrollBar.Increment
    //  else
//        ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.ScrollPos - ScrollBox1.VertScrollBar.Increment;
  end;
  tag := 0;
end;


procedure TPrevPic.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if ScrollBox1.VertScrollBar.IsScrollBarVisible or
     ScrollBox1.HorzScrollBar.IsScrollBarVisible then
  begin
    xxx_X := X;
    xxx_Y := Y;
    //Image1.
    Screen.Cursor := Cur;
  end;
end;

procedure TPrevPic.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var D_X, D_Y, P1, P2 : integer;
    P : TPoint;
begin
  if (ssLeft in Shift) and (xxx_X > 0) and (xxx_Y > 0) then
  begin
    tag := 0;
    D_X := X - xxx_X;
    D_Y := Y - xxx_Y;

    P1 := ScrollBox1.VertScrollBar.Position;
    P2 := ScrollBox1.HorzScrollBar.Position;

 //   SendMessage(ScrollBox1.Handle, WM_SETREDRAW, 0, 0);
    try
      ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.ScrollPos - D_Y;// * ScrollBox1.VertScrollBar.Increment;
      ScrollBox1.HorzScrollBar.Position := ScrollBox1.HorzScrollBar.ScrollPos - D_X;// * ScrollBox1.HorzScrollBar.Increment ;
    finally
   //   SendMessage(ScrollBox1.Handle, WM_SETREDRAW, 1, 0);
     // ScrollBox1.Repaint;
    end;
   // if (P1 <> ScrollBox1.VertScrollBar.Position) or (P2 <> ScrollBox1.HorzScrollBar.Position) then
     // Image1.
     // Repaint;
  end;
{  P := Image1.ScreenToClient(Point(X, Y));
  if P.X - ScrollBox1.width > 8 then
    Screen.Cursor := crDefault;  }
end;

procedure TPrevPic.WMKeyDown(var Message: TWMKeyDown);
begin

end;

procedure TPrevPic.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var D_X, D_Y : integer;
begin
  xxx_X := -1;
  xxx_Y := -1;
  //Image1.Cursor := Cur_Def;
  Screen.Cursor := crDefault;
{  tag := 0;
  Screen.Cursor := crDefault;
  D_X := X - xxx_X;
  D_Y := Y - xxx_Y;

  ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.ScrollPos - D_Y;// * ScrollBox1.VertScrollBar.Increment;
  ScrollBox1.HorzScrollBar.Position := ScrollBox1.HorzScrollBar.ScrollPos - D_X;// * ScrollBox1.HorzScrollBar.Increment ;
     }
end;

procedure TPrevPic.SubClassWndProc(var Message: TMessage);
begin
  if Message.Msg = 45061 then
  begin
 //   Main.Memo1.Lines.Add(IntToStr(Message.LParamHi));
    Message.Result := 1;
    if (Message.LParamHi = 328) or (Message.LParamHi = 16712) then
      ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.ScrollPos - ScrollBox1.VertScrollBar.Increment
    else
      if (Message.LParamHi = 336) or (Message.LParamHi = 16720) then
        ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.ScrollPos + ScrollBox1.VertScrollBar.Increment
      else
        if (Message.LParamHi = 331) or (Message.LParamHi = 16715) then
          ScrollBox1.HorzScrollBar.Position := ScrollBox1.HorzScrollBar.ScrollPos - ScrollBox1.HorzScrollBar.Increment
        else
          if (Message.LParamHi = 333) or (Message.LParamHi = 16717) then
            ScrollBox1.HorzScrollBar.Position := ScrollBox1.HorzScrollBar.ScrollPos + ScrollBox1.HorzScrollBar.Increment
  end
  else
    FOldWindowProc(Message);
end;

procedure TPrevPic.FormKeyPress(Sender: TObject; var Key: Char);
begin
  tag := 0;
end;


procedure TPrevPic.bSaveClick(Sender: TObject);
begin
  SavePic.FileName := '';
  if SavePic.Execute then
  begin
    Image1.Picture.Bitmap.SaveToFile(SavePic.FileName);

  end;
end;

procedure TPrevPic.FormDeactivate(Sender: TObject);
begin
  tag := 0;

end;

procedure TPrevPic.FormHide(Sender: TObject);
begin
  tag := 0;
end;

procedure TPrevPic.FormDestroy(Sender: TObject);
begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);
end;

procedure TPrevPic.FormShow(Sender: TObject);
begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\' + ClassName);

{  BitBtn4.Enabled := true;
  BitBtn5.Enabled := true;
  BitBtn6.Enabled := true;
  bSave.Enabled := true;
  DBNavigator1.Enabled := true;  }
end;

procedure TPrevPic.pTopMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  tag := 0;
end;

procedure TPrevPic.BitBtn5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  tag := 0;
end;

procedure TPrevPic.FormActivate(Sender: TObject);
begin
  SetCapture(0);
end;

procedure TPrevPic.Action3Execute(Sender: TObject);
begin
  close;
end;

end.
