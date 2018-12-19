unit uFormAPI_Doc;


interface
uses uDoc_PayIn, windows, dbclient, foMyFunc,
     uDoc_ActCL,
     uDoc_DAcc,
     uDoc_FinalAct,
     uDoc_WBill,
     uDoc_AF,
     uDoc_Warrant,
     uDoc_Inv,
     uDocDict, uDocList, uDoc_WHOrd, uDoc_UPD;

type
  TDocProc = procedure (AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);

procedure ShowDocDict;

procedure ShowWBill(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);

procedure ShowWBill_Delta(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);

procedure ShowInv(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);

procedure ShowPayIn(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
procedure ShowActCL(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
procedure ShowDAcc(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);

procedure ShowFinalAct(AHandle : HWnd; ADocParamz : TDocParamz;
                 AcdsOper : TClientDataSet = nil;
                 AcdsWare : TClientDataSet = nil);

procedure ShowWarrant(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet = nil;
                   AcdsWare : TClientDataSet = nil);

procedure ShowAF(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet = nil;
                   AcdsWare : TClientDataSet = nil);

procedure ShowWHOrd(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet = nil;
                   AcdsWare : TClientDataSet = nil);

procedure ShowUPD(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet = nil;
                   AcdsWare : TClientDataSet = nil);

procedure ShowDocList(id_Oper, id_business : Variant);

implementation

procedure ShowUPD(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet = nil;
                   AcdsWare : TClientDataSet = nil);
begin
  uDoc_UPD.ShowUPD(AHandle, ADocParamz, AcdsOper, AcdsWare);
end;

procedure ShowWHOrd(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet = nil;
                   AcdsWare : TClientDataSet = nil);
begin
  uDoc_WHOrd.ShowWHOrd(AHandle, ADocParamz, AcdsOper, AcdsWare);
end;



procedure ShowDocList(id_Oper, id_business : Variant);
begin
  udoclist.ShowDocList(id_Oper, id_business);
end;

procedure ShowDocDict;
begin
  udocdict.ShowDocDict;
end;

procedure ShowWBill(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
begin
  uDoc_WBill.ShowWBill(AHandle, ADocParamz, AcdsOper, AcdsWare);
end;

procedure ShowWBill_Delta(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
begin
  uDoc_WBill.ShowWBill_Delta(AHandle, ADocParamz, AcdsOper, AcdsWare);
end;


procedure ShowInv(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
begin
  uDoc_Inv.ShowInv(AHandle, ADocParamz, AcdsOper, AcdsWare);
end;

procedure ShowAF(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
begin
  uDoc_AF.ShowAF(AHandle, ADocParamz, AcdsOper, AcdsWare);
end;


procedure ShowWarrant(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
begin
  uDoc_Warrant.ShowWarrant(AHandle, ADocParamz, AcdsOper, AcdsWare);
end;

procedure ShowFinalAct(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
begin
  uDoc_FinalAct.ShowFinalAct(AHandle, ADocParamz, AcdsOper, AcdsWare);
end;

procedure ShowDAcc(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
begin
  uDoc_DAcc.ShowDAcc(AHandle, ADocParamz, AcdsOper, AcdsWare);
end;

procedure ShowPayIn(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
begin
  uDoc_PayIn.ShowPayIn(AHandle, ADocParamz, AcdsOper, AcdsWare);
end;

procedure ShowActCL(AHandle : HWnd; ADocParamz : TDocParamz;
                   AcdsOper : TClientDataSet;
                   AcdsWare : TClientDataSet);
begin
  uDoc_ActCL.ShowActCL(AHandle, ADocParamz, AcdsOper, AcdsWare);
end;

end.
