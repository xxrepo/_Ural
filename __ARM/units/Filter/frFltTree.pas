unit frFltTree;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ExtCtrls, ToolWin, StdCtrls, Grids, RXGrids, RXCtrls,
  Db, dbclient, mconnect, StrUtils, ToolEdit, CurrEdit,
  Menus,
  UniverseFilter, ActnList, Mask, Buttons,
  contnrs, frArc, registry, frBsnSelector, DBGrids,
  RXDBCtrl, inifiles, DBGridEh, RxMemDS, Provider, dxCntner, dxTL,
  dxDBCtrl, dxDBGrid, dxGrClms, dxTLClms, dxDBTLCl, dxDBTL, foMyFunc;

const cnstEmp = '<пусто>';

type
  THackTreeList = class(TdxTreeList)
    procedure BeginLayout;
    procedure EndLayout;
  end;

  GetFtlDateProc = procedure (ATreeDetail : boolean) of object;

  TfFltTree = class(TFrame)
    ActionList2: TActionList;
    aPrint: TAction;
    aPreview: TAction;
    aExpandNode: TAction;
    aExpandAll: TAction;
    aCollapseNode: TAction;
    aCollapseAll: TAction;
    aExport: TAction;
    aNodeExp: TAction;
    aGetArc: TAction;
    ToolBar5: TToolBar;
    ToolButton8: TToolButton;
    RxSpeedButton3: TRxSpeedButton;
    dxTreeList: TdxTreeList;
    Splitter2: TSplitter;
    pmTree: TPopupMenu;
    N3: TMenuItem;
    N5: TMenuItem;
    N4: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N6: TMenuItem;
    Excel1: TMenuItem;
    N7: TMenuItem;
    ilEM: TImageList;
    fArc1: TfArc;
    procedure aExportExecute(Sender: TObject);
    procedure aExpandNodeExecute(Sender: TObject);
    procedure aExpandAllExecute(Sender: TObject);
    procedure aCollapseNodeExecute(Sender: TObject);
    procedure aCollapseAllExecute(Sender: TObject);
    procedure dxTreeListChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure dxTreeListDeletion(Sender: TObject; Node: TdxTreeListNode);
    procedure dxTreeListGetImageIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure dxTreeListGetSelectedIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure aGetArcExecute(Sender: TObject);
    procedure pmTreePopup(Sender: TObject);
    procedure aNodeExpExecute(Sender: TObject);
  private
    FFFNode : TdxTreeListNode;
    procedure CalcNode(ANode: TdxTreeListNode; Index: Integer;
      AUFAggs: TUFAggs; AUFType: TUFType);
    procedure CalcNode2(S: String; AUFAggs: TUFAggs; AUFType: TUFType;
      var Cnt: integer; var D1, D2, F1, F2: Variant);
    procedure SetNodeVal(ANode: TdxTreeListNode; Index: Integer;
      AUFAggs: TUFAggs; AUFType: TUFType; var Cnt: integer; var D1, D2, F1,
      F2: Variant);
  public
    FGetFtlDateProc : GetFtlDateProc;
//    cdsGetDataTree : TClientDataSet;
    constructor Create(AOwner : TCOmponent); override;
    destructor Destroy; override;
    procedure MakeTreeFlt(AObjectList: TList; cdsGrp : TDataSet; cdsGetDataTree : TClientDataSet);
    procedure GetDataTree(cdsAggs : TClientDataSet; cdsGrp : TDataSet; cdsGetDataTree : TClientDataSet);
    procedure MakeTree(index: integer; cdsGrp : TDataSet; cdsGetDataTree : TClientDataSet);
    procedure CalcAggsNodes(AdxTreeList: TdxTreeList; cdsAggs : TClientDataSet; cdsGrp : TDataSet; cdsGetDataTree : TClientDataSet);
  end;

implementation

uses uDM, foMyFuncDXTreeExcel, uPrgForm, foMyFuncEh;

{$R *.DFM}

procedure TfFltTree.aExportExecute(Sender: TObject);
begin
  DBTreeListToExcel(dxTreeList);
end;

procedure TfFltTree.aExpandNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Expand(true);
end;

procedure TfFltTree.aExpandAllExecute(Sender: TObject);
begin
  dxTreeList.FullExpand;
end;

procedure TfFltTree.aCollapseNodeExecute(Sender: TObject);
begin
  if FFFNode <> nil then
    FFFNode.Collapse(true);
end;

procedure TfFltTree.aCollapseAllExecute(Sender: TObject);
begin
  dxTreeList.FullCollapse;
end;

procedure TfFltTree.dxTreeListChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin
  FFFNode := Node;
end;

procedure TfFltTree.dxTreeListDeletion(Sender: TObject;
  Node: TdxTreeListNode);
begin
  if FFFNode = Node then
    FFFNode := nil;
end;

procedure TfFltTree.dxTreeListGetImageIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  if Node <> dxTreeList.LastNode then
  begin
    if Node.Expanded then
      index := 1
    else
      Index := 0;
  end
  else
    Index := -1;
end;

procedure TfFltTree.dxTreeListGetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  index := Node.ImageIndex;
end;

procedure TfFltTree.aGetArcExecute(Sender: TObject);
begin
  if Assigned(FGetFtlDateProc) then
    FGetFtlDateProc(true);
end;

procedure TfFltTree.pmTreePopup(Sender: TObject);
begin
  aExpandNode.Enabled := (FFFNode <> Nil) and (FFFNode.HasChildren);
  aCollapseNode.Enabled := (FFFNode <> Nil) and (FFFNode.Expanded) and (FFFNode.HasChildren);
  aNodeExp.Enabled := (FFFNode <> Nil);
end;

constructor TfFltTree.Create(AOwner: TCOmponent);
var Reg : TRegistry;
    FullRegPathName : String;
begin
  inherited;
  fArc1.aRefreshe.Visible := false;
  fArc1.pnDate.Visible := false;
  fArc1.MayRefreshe := false;
  
  FFFNode := nil;
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, false) then
    begin
      if Reg.ValueExists('dxTreeListHeight') then
        dxTreeList.Height := Reg.ReadInteger('dxTreeListHeight');
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

destructor TfFltTree.Destroy;
var Reg : TRegistry;
    FullRegPathName : String;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;

    FullRegPathName := SRegPath + '\' + ClassName;
    if Reg.OpenKey(FullRegPathName, true) then
    begin
      Reg.WriteInteger('dxTreeListHeight', dxTreeList.Height);
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  inherited;
end;

procedure TfFltTree.aNodeExpExecute(Sender: TObject);
begin
  DBTreeListToExcel(dxTreeList, '', FFFNode);
end;

procedure TfFltTree.MakeTreeFlt(AObjectList : TList; cdsGrp : TDataSet; cdsGetDataTree : TClientDataSet);
var Node : TdxTreeListNode;
    AField : TField;
    OldRecNo : integer;
    GrpObj : TFltList;
begin
  Node := FFFNode;
  if (Node <> nil) and (dxTreeList.LastNode <> Node) then
  begin
    with cdsGrp do
    begin
      OldRecNo := cdsGrp.RecNo;
      DisableControls;
      cdsGrp.RecNo := Node.Level + 1;
      AField := cdsGetDataTree.Fields[Node.Level];
      try
        while Node <> nil do
        begin
          GrpObj := TFltList.Create;
          AObjectList.Add(GrpObj);
          GrpObj.id_Prop := FieldByName('id_Prop').Value;
          GrpObj.id_Rel := FieldByName('id_Rel').Value;
          GrpObj.id_RelParent := FieldByName('id_RelParent').Value;
          GrpObj.TableName := FieldByName('TableName').AsString;
          GrpObj.RelField := FieldByName('RelField').AsString;
          GrpObj.FieldName := FieldByName('FieldName').AsString;
          GrpObj.KeyField := FieldByName('KeyField').AsString;
          GrpObj.ObjNameField := FieldByName('ObjNameField').Value;

          if GrpObj.id_Prop = Null then
          begin
            GrpObj.FieldName := GrpObj.ObjNameField;
            GrpObj.id_Prop := -1;
            GrpObj.DType := uftStr;
        //    GrpObj.KeyField := GrpObj.ObjNameField;
          end
          else
          begin
            if AField is TNumericField then
              GrpObj.DType := uftFloat
            else
              if AField is TDateTimeField then
                GrpObj.DType := uftDate
              else
                if AField is TBooleanField then
                  GrpObj.DType := uftBit
                else
                  GrpObj.DType := uftStr;
          end;

          if Node.Strings[0] <> cnstEmp then
          begin
            GrpObj.CondCode := uctEq;
            GrpObj.Par1 := Node.Strings[0];
          end
          else
            GrpObj.CondCode := uctEmpty;

          Prior;
          Node := Node.Parent;
        end;
      finally
        EnableControls;
        cdsGrp.RecNo := OldRecNo;
      end;
    end;
  end;
end;

procedure TfFltTree.GetDataTree(cdsAggs : TClientDataSet; cdsGrp : TDataSet; cdsGetDataTree : TClientDataSet);
var i : integer;
    S : String;
    AField : TField;
    ACol : TdxTreeListColumn;
    AColumnClass: TdxTreeListColumnClass;
begin
  Screen.Cursor := crSQLWait;
  THackTreeList(dxTreeList).BeginLayout;
  try
    with dxTreeList do
    begin
      BeginUpdate;
      DestroyColumns;
      Bands.Clear;
      Bands.Add;
      ClearNodes; 

      ACol := CreateColumn(TdxTreeListColumn);
      ACol.Caption := '';

  {    cdsGrp.First;
      i := 0;
      while not cdsGrp.Eof do
      begin
        AField := cdsGetDataTree.Fields[i];
        if AField is TbooleanField then
          AColumnClass := TdxTreeListCheckColumn
        else
          if AField is TDateTimeField then
          begin
            AColumnClass := TdxTreeListDateColumn;
            TDateTimeField(AField).DisplayFormat := 'dd.mm.yyyy hh.mm';
          end
          else
            if AField is TFloatField then
            begin
              AColumnClass := TdxTreeListCalcColumn;
              TFloatField(AField).DisplayFormat := '0.00';
            end
            else
              AColumnClass := TdxTreeListColumn;

        ACol := CreateColumn(AColumnClass);
        ACol.Caption := cdsGrp.FieldByName('GrpText').AsString;
        ACol.Tag := Integer(AField);
        
        cdsGrp.Next;
        inc(i);
      end;  }

      cdsAggs.First;
      i := cdsGrp.RecordCount;
      while not cdsAggs.Eof do
      begin
        ShowProgressForm(Handle, cdsAggs.RecNo, cdsAggs.RecordCount, 'Получение данных');
        AField := cdsGetDataTree.Fields[i];
        if AField is TbooleanField then
          AColumnClass := TdxTreeListCheckColumn
        else
          if AField is TDateTimeField then
          begin
            AColumnClass := TdxTreeListDateColumn;
            TDateTimeField(AField).DisplayFormat := 'dd.mm.yyyy hh.mm';
          end
          else
            if AField is TFloatField then
            begin
              AColumnClass := TdxTreeListCalcColumn;
              TFloatField(AField).DisplayFormat := '0.00';
            end
            else
              AColumnClass := TdxTreeListColumn;


          ACol := CreateColumn(AColumnClass);
          ACol.Caption := cdsAggs.FieldByName('AggText').AsString + ' (' + cdsAggs.FieldByName('CondName').DisplayText + ')';
          ACol.Tag := Integer(AField);
          
          cdsAggs.Next;
          inc(i);
        end;   

    //  ShowRowFooter := true;
    //  ShowFooter := true;
    end;
  finally
    CloseProgressForm;
    dxTreeList.EndUpdate;

    Screen.Cursor := crDefault;
    THackTreeList(dxTreeList).EndLayout;
  end;
end;

procedure TfFltTree.MakeTree(index : integer; cdsGrp : TDataSet; cdsGetDataTree : TClientDataSet);
  function FindNodeByText(ANode : TdxTreeListNode; AText : Variant) : TdxTreeListNode;
  var tmpNode : TdxTreeListNode;
  begin
    Result := nil;
    if ANode <> nil then
    begin
      tmpNode := ANode.GetFirstChild;
    end
    else
    begin
      tmpNode := dxTreeList.TopNode;
    end; 
    while (tmpNode <> nil) and (Result = nil) do
    begin
      if tmpNode.Values[0] = AText then
        Result := tmpNode
      else
        tmpNode := tmpNode.GetNextSibling
    end;
  end;
var i, Cnt, j : integer;
    S : String;
    AField : TField;
    ACol : TdxTreeListColumn;
    LastNode, N : TdxTreeListNode;
    V : Variant;
    Hour, Min, Sec, MSec: Word;
    Year, Month, Day: Word;
    D : TDateTime;
begin
  LastNode := nil;
  Screen.Cursor := crSQLWait;
  THackTreeList(dxTreeList).BeginLayout;
  try
    with cdsGetDataTree do
    begin
      dxTreeList.BeginUpdate;
      Cnt := cdsGrp.RecordCount - 1;

      First;
      while not Eof do
      begin
        ShowProgressForm(Handle, RecNo, RecordCount + 1, 'Получение данных');
        for i := 0 to Cnt do
        begin
          if Fields[i].IsNull then
            V := cnstEmp
          else
            V := Fields[i].Value;
          N := FindNodeByText(LastNode, V);
          if N = nil then
          begin
            if LastNode = nil then
            begin
              N := dxTreeList.Add;  
            end
            else
              N := LastNode.AddChild;
            N.Values[0] := V; 
          end;
          if i = Cnt then
          begin
            for j := 1 to dxTreeList.ColumnCount - 1 do
            begin
              AField := TField(dxTreeList.Columns[j].Tag);
              if AField.IsNull then
                V := cnstEmp
              else
              begin
                if AField is TNumericField then
                begin
                  V := Round(AField.AsFloat*100 + 0.001)/100;
                  N.Values[j] := V;
                end
                else
                  if AField is TDateTimeField then
                  begin
                    N.Values[j] := DateToStr(AField.AsDateTime);
        //            N.Values[j] := FormatDateTime('yyyy-mm-dd', AField.AsDateTime);
                  end;
              end;

            end;
          end;
          LastNode := N;
        end;
        Next;
        LastNode := nil;
      end;
    end;
    N := dxTreeList.Add;
    N.Values[0] := 'Все операции';
    if cdsGrp.RecordCount = 0 then
    begin
      with cdsGetDataTree do
      begin
        First;
        for j := 1 to dxTreeList.ColumnCount - 1 do
        begin
          AField := TField(dxTreeList.Columns[j].Tag);
          if AField.IsNull then
            V := cnstEmp
          else
          begin
            if AField is TNumericField then
            begin
              V := Round(AField.AsFloat*100 + 0.001)/100;
              N.Values[j] := V;
            end
            else
              if AField is TDateTimeField then
                N.Values[j] := DateToStr(AField.AsDateTime);
          end;

        end;
      end;
    end;
  finally
    CloseProgressForm;
    Screen.Cursor := crDefault;
    for i := 0 to dxTreeList.ColumnCount - 1 do
      if dxTreeList.Columns[i].Width > 180 then
        dxTreeList.Columns[i].Width := 180;
    if dxTreeList.Columns[0].Width > 200 then
      dxTreeList.Columns[0].Width := 200;
    THackTreeList(dxTreeList).EndLayout;
    dxTreeList.EndUpdate;
  end;
end;

procedure TfFltTree.CalcAggsNodes(AdxTreeList: TdxTreeList; cdsAggs : TClientDataSet; cdsGrp : TDataSet; cdsGetDataTree : TClientDataSet);
var i, j : integer;
    AField : TField;
    AUFAggs: TUFAggs;
    AUFType : TUFType;
    Cnt : integer;
    D1, D2 : Variant;
    F1, F2 : Variant;
    S : String;
    tmpNode : TdxTreeListNode;
begin
  j := 0;
  cdsAggs.First;
  while not cdsAggs.Eof do
  begin
    ShowProgressForm(Handle, cdsAggs.RecNo, cdsAggs.RecordCount, 'Форматирование данных');
    AField := cdsGetDataTree.Fields[cdsGrp.RecordCount + j];   
    AUFAggs := TUFAggs(cdsAggs.FieldByName('AggCode').AsInteger);
    if AField is TDateTimeField then
    begin
      AUFType := uftDate;
    end
    else
    begin
      AUFType := uftFloat;
    end;

  Cnt := 0;
  D1 := Null;
  F1 := Null;

    for i := 0 to AdxTreeList.Count - 1 do
    begin
      tmpNode := AdxTreeList.Items[i];
      CalcNode(tmpNode, j + 1, AUFAggs, AUFType);
      S := tmpNode.Strings[j + 1];
      CalcNode2(S, AUFAggs, AUFType, Cnt, D1, D2, F1, F2);
    end;

   // if AdxTreeList.Count > 0 then
    begin
      tmpNode := AdxTreeList.Items[AdxTreeList.Count - 1];
      SetNodeVal(tmpNode, j + 1, AUFAggs, AUFType, Cnt, D1, D2, F1, F2);
      cdsAggs.Next;
      inc(j);
    end;
  end;
  CloseProgressForm;
end;

procedure TfFltTree.CalcNode2(S : String;
                   AUFAggs: TUFAggs; AUFType : TUFType;
                   var Cnt : integer;
                   var D1, D2, F1, F2 : Variant);
var i : integer;
    N : integer;
    tmpNode : TdxTreeListNode;
begin
  case AUFAggs of
    uagSum :
    begin
      if AUFType in [uftInt, uftFloat] then
      begin
        if F1 = Null then F1 := 0;
        F1 := F1 + StrToFloatAdv(S);
      end
      else raise Exception.Create('Ошибка типов!');
    end;
    uagAvg :
    begin
      if AUFType in [uftInt, uftFloat] then
      begin
        if F1 = Null then F1 := 0;
        F1 := F1 + StrToFloatAdv(S);
        inc(Cnt);
      end
      else raise Exception.Create('Ошибка типов!');
    end;
    uagCount :
    begin
      inc(Cnt);
    end;
    uagMax :
    begin
      if AUFType in [uftInt, uftFloat] then
      begin
        F2 := StrToFloatAdv(S);
        if ((F1 = Null) or (F1 < F2)) and (S <> '') then
          F1 := F2;
      end
      else
      if (AUFType = uftDate) and (S <> '') then
      begin
        D2 := StrToDate(S);
        if (D1 = Null) or (D1 < D2) then
          D1 := D2;
      end
    end;
    uagMin :
    begin
      if AUFType in [uftInt, uftFloat] then
      begin
        F2 := StrToFloatAdv(S);
        if ((F1 = Null) or (F1 > F2)) and (S <> '') then
          F1 := F2;
      end
      else
      if (AUFType = uftDate) and (S <> '') then
      begin
        D2 := StrToDate(S);
        if (D1 = Null) or (D1 > D2) then
          D1 := D2;
      end
    end;
  end;
end;

procedure TfFltTree.SetNodeVal(ANode : TdxTreeListNode; Index : Integer;
                     AUFAggs: TUFAggs; AUFType : TUFType;
                     var Cnt : integer;
                    var D1, D2, F1, F2 : Variant);
begin
  case AUFAggs of
    uagSum : ANode.Values[Index] := VarToStr(F1);
    uagMax, uagMin :
      if AUFType = uftDate then
      begin
        if D1 <> Null then
          ANode.Values[Index] := D1
        else
          ANode.Values[Index] := ''
      end
      else
        ANode.Values[Index] := VarToStr(F1);
    uagAvg : if (Cnt > 0) and (F1 <> Null) then ANode.Values[Index] := F1/Cnt else ANode.Values[Index] := '';
    uagCount : ANode.Values[Index] := Cnt;
  end;
end;

procedure TfFltTree.CalcNode(ANode : TdxTreeListNode; Index : Integer; AUFAggs: TUFAggs; AUFType : TUFType);
var i : integer;
    Cnt, N : integer;
    D1, D2 : Variant;
    F1, F2 : Variant;
    tmpNode : TdxTreeListNode;
    S : String;
begin
  Cnt := 0;
  D1 := Null;
  F1 := Null;
  N := ANode.Count;
  for i := 0 to N - 1 do
  begin
    tmpNode := ANode.Items[i];

    CalcNode(tmpNode, Index, AUFAggs, AUFType);
    S := tmpNode.Strings[Index];
    CalcNode2(S, AUFAggs, AUFType, Cnt, D1, D2, F1, F2);
  end;

  if ANode.Count > 0 then
  begin
    SetNodeVal(ANode, Index, AUFAggs, AUFType, Cnt, D1, D2, F1, F2);
  end;
end;


{ THackTreeList }

procedure THackTreeList.BeginLayout;
begin
  inherited;
end;

procedure THackTreeList.EndLayout;
begin
  inherited;
end;

end.
