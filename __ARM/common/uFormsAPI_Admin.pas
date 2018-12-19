unit uFormsAPI_Admin;

interface
  uses Forms,Dialogs, Controls, DB, Classes, uMainForm, StdCtrls,
       uMeasuresForm, uBusinessesForm,
       uReplicatorsForm,
       uDM;

  function GetBusinessForm(var AID:Variant; var AName:string; ReadOnly:boolean=false; ShowToolBar:boolean=false; IsModal:boolean=false):boolean;
  function GetMeasuresForm(id_Business: Variant; var AID:Variant; var AName:string; ReadOnly:boolean=false; ShowToolBar:boolean=false; IsModal:boolean=false;OnlyBase:boolean=false):boolean;
  function GetReplicatorsForm(id_Business: Variant; var AID:Variant; var AName:string; ReadOnly:boolean=false; ShowToolBar:boolean=false; IsModal:boolean=false):boolean;

implementation

procedure SetFormStyle(F : TForm; IsModal : boolean);
begin
  if  IsModal then
  begin
    with F do
     begin
      FormStyle:=fsNormal;
      WindowState:=wsNormal;
     end;
    end
     else
    begin
    with F do
     begin
      FormStyle:=fsMDIChild;
      WindowState:=wsMaximized;
     end;
  end;
end;


function GetMeasuresForm(id_Business: Variant; var AID:Variant; var AName:string; ReadOnly:boolean=false; ShowToolBar:boolean=false; IsModal:boolean=false; OnlyBase:boolean=false):boolean;
begin
   Result:=False;
   DM.Rights_GetUserRights(10, Null);
//   if Assigned(MeasuresForm)then
   if (Assigned(MeasuresForm)) and (not IsModal) then
     begin
      MeasuresForm.WindowState:=wsMaximized;
      MeasuresForm.BringToFront;
     end
     else
     begin
     // ¬опрос по авторизации дл€ работы с даной формой
       MeasuresForm:=TMeasuresForm.Create(MainForm);
       With MeasuresForm do
        begin
         SetFormStyle(MeasuresForm, IsModal);
         Init(id_Business, ReadOnly, ShowToolBar, OnlyBase);
          if VarToStr(AID)<>'' then
           if AID<>NULL then
            MeasuresFrame1.cdsMeasures.Locate('id_Measure',AID,[loCaseInsensitive]);
          if  IsModal then
           begin
             ShowModal;
             if ModalResult=mrOk then
              begin
               AID:=MeasuresFrame1.cdsMeasures.FieldByName('id_Measure').AsInteger;
               AName:=MeasuresFrame1.cdsMeasures.FieldByName('Name').AsString;
               Result:=True;
              end;
              Free;
           end;
        end;
     end;
end;

function GetBusinessForm( var AID:Variant; var AName:string; ReadOnly:boolean=false; ShowToolBar:boolean=false; IsModal:boolean=false):boolean;
begin
   Result:=False;
   if (Assigned(BusinessesForm)) and (not IsModal) then
     begin
      BusinessesForm.WindowState := wsMaximized;
      BusinessesForm.BringToFront;
     end
     else
     begin
     // ¬опрос по авторизации дл€ работы с даной формой
       BusinessesForm:=TBusinessesForm.Create(nil);
       With BusinessesForm do
        begin
         Position := poScreenCenter;

         SetFormStyle(BusinessesForm, IsModal);
         Init(ReadOnly, ShowToolBar);
          if VarToStr(AID)<>'' then
           if AID<>NULL then
            BusinessesFrame1.DataSource2.DataSet.Locate('id_Business',AID,[loCaseInsensitive]);
          if  IsModal then
           begin
             ShowModal;
             if ModalResult=mrOk then
              begin
               AID:=BusinessesFrame1.DataSource2.Dataset.FieldByName('id_Business').AsInteger;
               AName:=BusinessesFrame1.DataSource2.Dataset.FieldByName('Name').AsString;
               Result:=True;
              end;
              Free;
           end;
        end;
     end;
end;

function GetReplicatorsForm(id_Business: Variant; var AID:Variant; var AName:string; ReadOnly:boolean=false; ShowToolBar:boolean=false; IsModal:boolean=false):boolean;
//ReplicatorsForm
begin
  DM.Rights_GetUserRights(14, Null);
   Result:=False;
   if (Assigned(ReplicatorsForm)) and (not IsModal) then
     begin
      ReplicatorsForm.WindowState:=wsMaximized;
      ReplicatorsForm.BringToFront;
     end
     else
     begin
       ReplicatorsForm:=TReplicatorsForm.Create(MainForm);
       With ReplicatorsForm do
        begin
         Position:=poScreenCenter;
         SetFormStyle(ReplicatorsForm, IsModal);
         Init(id_Business, ReadOnly, ShowToolBar);
          if VarToStr(AID)<>'' then
           if AID<>NULL then
            ReplicatorsFrame1.cdsReplicators.Locate('id_Replicator',AID,[loCaseInsensitive]);
          if  IsModal then
           begin
             ShowModal;
             if ModalResult=mrOk then
              begin
               AID:=ReplicatorsFrame1.cdsReplicators.FieldByName('id_Replicator').AsInteger;
               AName:=ReplicatorsFrame1.cdsReplicators.FieldByName('Name').AsString;
               Result:=True;
              end;
              Free;
           end;
        end;
     end;
end;


end.
