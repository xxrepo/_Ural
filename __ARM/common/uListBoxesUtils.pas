unit uListBoxesUtils;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Db, DBClient, Buttons;
type
  TLBItem = class(TCollectionItem)
  public
   Id:Integer;
   Name:string;
  end;

  procedure LBDragDrop(Sender, Source: TObject);
  procedure MoveItems(Source, Dest:TListBox);
  procedure MoveAllItems(Source, Dest:TListBox);
  function  GetStrFromMemo(Memo:TMemo):String;

implementation

procedure LBDragDrop(Sender, Source: TObject);
var
 i,Sel:integer;
begin
 Sel:=-1;
 if (Sender is TListBox) and (Source is TListBox) then
 begin
    with Sender as TListBox do
    begin
      for I := TListBox(Source).Items.Count - 1 downto 0 do
          if TListBox(Source).Selected[i] then
            begin
                TListBox(Sender).Items.Add(TListBox(Source).Items[i]);
                TListBox(Source).Items.Delete(i);
                if (i>=0) and (i<=TListBox(Source).Items.Count-1) then
                  begin
                    TListBox(Source).Selected[i]:=True;
                    Sel:=i;
                  end;
           end;
       if (Sel=-1) and (TListBox(Source).Items.Count>0) then
       TListBox(Source).Selected[TListBox(Source).Items.Count-1]:=True;
    end;
  end;
end;

procedure MoveItems(Source, Dest:TListBox);
 var
  i,Sel:integer;
begin
  Sel:=-1;
  for I := Source.Items.Count - 1 downto 0 do
    if Source.Selected[I] then
    begin
     Dest.Items.Add(Source.Items[i]);
     Source.Items.Delete(i);
     if (i>=0) and (i<=Source.Items.Count-1) then
      begin
       Source.Selected[i]:=True;
       Sel:=i;
      end;
    end;
    if (Sel=-1) and (Source.Items.Count>0) then
       Source.Selected[Source.Items.Count-1]:=True;

end;

procedure MoveAllItems(Source, Dest:TListBox);
 var
  i:integer;
begin
  for I := Source.Items.Count - 1 downto 0 do
    begin
     Dest.Items.Add(Source.Items[i]);
     Source.Items.Delete(i);
    end;
end;

function  GetStrFromMemo(Memo:TMemo):String;
var
 i:integer;
 Res:String;
begin
 Res:='';
 for i:=0 to Memo.Lines.Count-1 do
  Res:=Res+Memo.Lines[i]+#10;
  Res:=Copy(Res,1,Length(Res)-1);
  Result:=res;
end;

end.
