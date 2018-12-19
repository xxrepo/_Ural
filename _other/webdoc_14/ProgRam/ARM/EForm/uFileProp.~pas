unit uFileProp;

interface

uses
  ActiveX, MapiDefs,

  Windows, sLabel, Buttons, sSpeedButton, StdCtrls, sGroupBox, Dialogs,
  sDialogs, Db, DBClient, DBCtrls, sDBMemo, Mask, sMaskEdit,
  sCustomComboEdit, sTooledit, sDBDateEdit, sDBEdit, sButton, Controls,
  ExtCtrls, sPanel, Classes, Forms, DragDrop, DropTarget, DropComboTarget, Sysutils,
  sCurrEdit, sDBCalcEdit, sDBLookupComboBox, ComCtrls, sPageControl,
    MapiTags,
  DragDropText, uDM, foMyFunc, ActnList, Menus, RXCtrls, sRichEdit, sMemo,
  ToolEdit, CurrEdit, RXDBCtrl;


  
type





  TFileProp = class(TForm)
    Panel2: TsPanel;
    btnCancel: TsButton;
    btnOk: TsButton;
    cdsFileProp: TClientDataSet;
    dsFileProp: TDataSource;
    cdsCur: TClientDataSet;
    cdsCurid_Obj: TAutoIncField;
    cdsCurid_NS: TIntegerField;
    cdsCurPID: TIntegerField;
    cdsCurid_ObjType: TIntegerField;
    cdsCurObjName: TStringField;
    cdsCurFileName: TStringField;
    cdsCurDeleted: TBooleanField;
    cdsCurDateStart: TDateTimeField;
    cdsCurDateStop: TDateTimeField;
    cdsCurisDef: TBooleanField;
    cdsCurPName: TStringField;
    dsCur: TDataSource;
    DataFormatAdapterOutlook: TDataFormatAdapter;
    dctFiles2: TDropComboTarget;
    cdsFilePropid_File: TIntegerField;
    cdsFilePropid_email: TIntegerField;
    cdsFilePropFileGUID: TStringField;
    cdsFilePropDeleted: TBooleanField;
    cdsFilePropid_DocType: TIntegerField;
    cdsFilePropid_WorkType: TIntegerField;
    cdsFilePropid_Seller: TIntegerField;
    cdsFilePropid_Bayer: TIntegerField;
    cdsFilePropid_Org3: TIntegerField;
    cdsFilePropid_Org4: TIntegerField;
    cdsFilePropDocNum: TStringField;
    cdsFilePropDocDate: TDateTimeField;
    cdsFilePropDocDateStop: TDateTimeField;
    cdsFilePropDateCreate: TDateTimeField;
    cdsFilePropisAutoLong: TBooleanField;
    cdsFilePropDocSumm: TBCDField;
    cdsFilePropid_Crn: TIntegerField;
    cdsFilePropid_State: TIntegerField;
    cdsFilePropComment: TStringField;
    cdsFilePropxVers: TIntegerField;
    cdsFilePropCalcName: TStringField;
    cdsFilePropOrigName: TStringField;
    cdsFilePropFileInfo: TStringField;
    cdsFilePropFileSize: TIntegerField;
    cdsFilePropAdv_Digit1: TBCDField;
    cdsFilePropAdv_Digit2: TBCDField;
    cdsFilePropAdv_Digit3: TBCDField;
    cdsFilePropAdv_Digit4: TBCDField;
    cdsFilePropAdv_Digit5: TBCDField;
    cdsFilePropAdv_Digit6: TBCDField;
    cdsFilePropAdv_Digit7: TBCDField;
    cdsFilePropAdv_Digit8: TBCDField;
    cdsFilePropAdv_Digit9: TBCDField;
    cdsFilePropAdv_Digit10: TBCDField;
    cdsFilePropAdv_Date1: TDateTimeField;
    cdsFilePropAdv_Date2: TDateTimeField;
    cdsFilePropAdv_Date3: TDateTimeField;
    cdsFilePropAdv_Date4: TDateTimeField;
    cdsFilePropAdv_Date5: TDateTimeField;
    cdsFilePropAdv_Date6: TDateTimeField;
    cdsFilePropAdv_Date7: TDateTimeField;
    cdsFilePropAdv_Date8: TDateTimeField;
    cdsFilePropAdv_Date9: TDateTimeField;
    cdsFilePropAdv_Date10: TDateTimeField;
    cdsFilePropid_DicFile1: TIntegerField;
    cdsFilePropid_DicFile2: TIntegerField;
    cdsFilePropid_DicFile3: TIntegerField;
    cdsFilePropid_DicFile4: TIntegerField;
    cdsFilePropid_DicFile5: TIntegerField;
    cdsFilePropid_DicFile6: TIntegerField;
    cdsFilePropid_DicFile7: TIntegerField;
    cdsFilePropid_DicFile8: TIntegerField;
    cdsFilePropid_DicFile9: TIntegerField;
    cdsFilePropid_DicFile10: TIntegerField;
    cdsFilePropID_NS: TIntegerField;
    cdsFilePropBayerName: TStringField;
    cdsFilePropBayerCAName: TStringField;
    cdsFilePropBayerID_CA: TIntegerField;
    cdsFilePropSellerName: TStringField;
    cdsFilePropSellerCAName: TStringField;
    cdsFilePropSellerID_CA: TIntegerField;
    cdsFilePropisBayer: TBooleanField;
    cdsFilePropisSeller: TBooleanField;
    cdsFilePropOrg3Name: TStringField;
    cdsFilePropOrg4Name: TStringField;
    cdsFilePropWorkTypeName: TStringField;
    cdsFilePropDocTypeName: TStringField;
    cdsFilePropStateName: TStringField;
    cdsFilePropCrnName: TStringField;
    cdsFilePropEmailDateCreate: TDateTimeField;
    cdsFilePropEmailDate: TDateTimeField;
    cdsFilePropEmailFrom: TStringField;
    cdsFilePropEmailName: TStringField;
    cdsFilePropEmailTo: TStringField;
    cdsFilePropSubj: TStringField;
    cdsFilePropAdv_Str1: TStringField;
    cdsFilePropAdv_Str2: TStringField;
    cdsFilePropAdv_Str3: TStringField;
    cdsFilePropAdv_Str4: TStringField;
    cdsFilePropAdv_Str5: TStringField;
    cdsFilePropAdv_Str6: TStringField;
    cdsFilePropAdv_Str7: TStringField;
    cdsFilePropAdv_Str8: TStringField;
    cdsFilePropAdv_Str9: TStringField;
    cdsFilePropAdv_Str10: TStringField;
    sOpenDialog1: TsOpenDialog;
    ActionList1: TActionList;
    aOpenFile: TAction;
    aSaveFile: TAction;
    sSaveDialog1: TsSaveDialog;
    pmFile: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Action1: TAction;
    pcData: TsPageControl;
    tsInfo: TsTabSheet;
    sTabSheet2: TsTabSheet;
    pnCA: TsPanel;
    sPanel122: TsPanel;
    lbAdv_Str1: TsLabel;
    sDBEdit18: TsDBEdit;
    btnAdv1: TsButton;
    sPanel11: TsPanel;
    lbAdv_Str2: TsLabel;
    sDBEdit17: TsDBEdit;
    sButton10: TsButton;
    sPanel10: TsPanel;
    lbAdv_Str3: TsLabel;
    sDBEdit16: TsDBEdit;
    sButton9: TsButton;
    sPanel9: TsPanel;
    lbAdv_Str4: TsLabel;
    sDBEdit15: TsDBEdit;
    sButton8: TsButton;
    sPanel8: TsPanel;
    lbAdv_Str5: TsLabel;
    sDBEdit14: TsDBEdit;
    sButton7: TsButton;
    sPanel3: TsPanel;
    lbAdv_Str6: TsLabel;
    sDBEdit9: TsDBEdit;
    sBtnAdv6: TsButton;
    sPanel4: TsPanel;
    lbAdv_Str7: TsLabel;
    sDBEdit11: TsDBEdit;
    sBtnAdv7: TsButton;
    sPanel5: TsPanel;
    lbAdv_Str8: TsLabel;
    sDBEdit10: TsDBEdit;
    sBtnAdv8: TsButton;
    sPanel7: TsPanel;
    lbAdv_Str9: TsLabel;
    sDBEdit13: TsDBEdit;
    sBtnAdv9: TsButton;
    sPanel6: TsPanel;
    lbAdv_Str10: TsLabel;
    sDBEdit12: TsDBEdit;
    sBtnAdv10: TsButton;
    sPanel1: TsPanel;
    lbDOCCOMMENT: TsLabel;
    lbNUM: TsLabel;
    lbDTNAME: TsLabel;
    lbDOCDATE: TsLabel;
    sLabel2: TsLabel;
    DldBtn: TsSpeedButton;
    UplBtn: TsSpeedButton;
    edDocTypeName: TsDBEdit;
    DBEdit3: TsDBEdit;
    DBDateEdit1: TsDBDateEdit;
    sDBLookupComboBox1: TsDBLookupComboBox;
    Button2: TsButton;
    sDBEdit3: TsDBEdit;
    sDBEdit4: TsDBEdit;
    sMemo1: TsMemo;
    aNote: TAction;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    aCopyData: TAction;
    aPasteData: TAction;
    btnSumm: TsButton;
    pmSellerName: TPopupMenu;
    pmBayerName: TPopupMenu;
    pmStateName: TPopupMenu;
    pmWorkTypeName: TPopupMenu;
    sSpeedButton8: TsSpeedButton;
    pmDocTypeName: TPopupMenu;
    RxDBCalcEdit1: TRxDBCalcEdit;
    cdsFilePropxID_NS: TIntegerField;
    cdsFilePropid_User_F: TIntegerField;
    cdsFilePropid_User_L: TIntegerField;
    cdsFilePropLastEdit: TDateTimeField;
    cdsFilePropid_WorkType2: TIntegerField;
    cdsFilePropid_WorkType3: TIntegerField;
    cdsFilePropid_WorkType4: TIntegerField;
    cdsFilePropid_WorkType5: TIntegerField;
    cdsFilePropBayerDeleted: TBooleanField;
    cdsFilePropSellerDeleted: TBooleanField;
    cdsFilePropFIO: TStringField;
    cdsFilePropLastFIO: TStringField;
    sPanel13: TsPanel;
    sSpeedButton7: TsSpeedButton;
    sButton1: TsButton;
    edStateName: TsDBEdit;
    sLabel3: TsLabel;
    ppW5: TsPanel;
    edWorkTypeName: TsDBEdit;
    Button5: TsButton;
    sSpeedButton6: TsSpeedButton;
    Label2: TsLabel;
    ppW1: TsPanel;
    sSpeedButton9: TsSpeedButton;
    sLabel4: TsLabel;
    sDBEdit2: TsDBEdit;
    sButton2: TsButton;
    ppW2: TsPanel;
    sSpeedButton10: TsSpeedButton;
    sLabel5: TsLabel;
    sDBEdit19: TsDBEdit;
    sButton3: TsButton;
    ppW3: TsPanel;
    sSpeedButton11: TsSpeedButton;
    sLabel6: TsLabel;
    sDBEdit20: TsDBEdit;
    sButton4: TsButton;
    ppW4: TsPanel;
    sSpeedButton12: TsSpeedButton;
    sLabel7: TsLabel;
    sDBEdit21: TsDBEdit;
    sButton5: TsButton;
    cdsFilePropWorkTypeName1: TStringField;
    cdsFilePropWorkTypeName2: TStringField;
    cdsFilePropWorkTypeName3: TStringField;
    cdsFilePropWorkTypeName4: TStringField;
    cdsFilePropWorkTypeName5: TStringField;
    pnMail2: TsGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    sDBEdit5: TsDBEdit;
    sDBEdit6: TsDBEdit;
    sDBEdit7: TsDBEdit;
    sDBEdit8: TsDBEdit;
    sPanel2: TsPanel;
    sLabel1: TsLabel;
    sDBEdit1: TsDBEdit;
    Button3: TsButton;
    sSpeedButton4: TsSpeedButton;
    sSpeedButton5: TsSpeedButton;
    Button4: TsButton;
    edBayerName: TsDBEdit;
    Label8: TsLabel;
    Label1: TsLabel;
    edSellerName: TsDBEdit;
    procedure btnOkClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure UplBtnClick(Sender: TObject);
    procedure dctFiles2Drop(Sender: TObject; ShiftState: TShiftState;
      APoint: TPoint; var Effect: Integer);
    procedure sButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAdv1Click(Sender: TObject);
    procedure sAdvv3Click(Sender: TObject);
    procedure saButton4Click(Sender: TObject);
    procedure saButton5Click(Sender: TObject);
    procedure saButton7Click(Sender: TObject);
    procedure sBtnAdv6Click(Sender: TObject);
    procedure sBtnAdv7Click(Sender: TObject);
    procedure sBtnAdv8Click(Sender: TObject);
    procedure sBtnAdv9Click(Sender: TObject);
    procedure sBtnAdv10Click(Sender: TObject);
    procedure edUnNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure aOpenFileExecute(Sender: TObject);
    procedure aSaveFileExecute(Sender: TObject);
    procedure pmFilePopup(Sender: TObject);
    procedure aNoteExecute(Sender: TObject);
    procedure aPasteDataExecute(Sender: TObject);
    procedure aCopyDataExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure btnSummClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pmSellerNamePopup(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure sButton4Click(Sender: TObject);
    procedure sButton5Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure cdsFilePropAfterPost(DataSet: TDataSet);
    procedure cdsFilePropAfterOpen(DataSet: TDataSet);
  private
    xHandle : HWnd;
    Fid_File : integer;
    AStream: TStream;
    xOrigName : String;
    procedure UnAdv(AObjType: TEObjType; ID_Field, Name_Field: TField);
    procedure miClipBrdAddClick(Sender: TObject);
    procedure GetData(M: TMenu; var ObjType: TEObjType;
      var id_Obj: integer; var ObjName: String);
    procedure ShowWorkType(Num: integer);
    procedure DoPanels;
    procedure HidePanels;
  public
    function SaveProp : boolean;
    procedure Initialize(ACopy : boolean; id_File : integer);
    constructor Create(AOwner : TComponent); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure miClipBrdClick(Sender: TObject);
  end;
                   
var
  FileProp: TFileProp;



  
function ShowDocProp(ACopy : boolean; var id_File : integer): boolean;
procedure ShowDocProp_Adv(id_File : integer; AHandle : HWnd; ACopy : boolean = false);
implementation



uses
  MapiUtil,
  ComObj,
  ShellAPI,
  Contnrs,
  DragDropFormats,
  DragDropFile,
  DragDropInternet, uUnSelector, uPrgForm, uOneItemSelector, uNote;



{$R *.DFM}
function ShowDocProp(ACopy : boolean; var id_File : integer): boolean;
var F : TFileProp;
    b : boolean;
begin
  Result := false;
  F := TFileProp.Create(nil);
  try
    F.Initialize(ACopy, id_File);
    F.ShowModal;
    if (F.ModalResult = mrOk) or (F.ModalResult = mrYes) then
    begin
      Result := F.SaveProp;
    end;
  finally
    F.Free;
  end;
end;

procedure ShowDocProp_Adv(id_File : integer; AHandle : HWnd; ACopy : boolean);
var F : TFileProp;
    b : boolean;
    i, Top, Left : integer;
begin
{  Top := 0;
  Left := 0;
  if id_File > 0 then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i] is TFileProp then
      begin
        Top := Screen.Forms[i].Top;
        Left := Screen.Forms[i].Left;
        if TFileProp(Screen.Forms[i]).Fid_File = id_File then
        begin
          Screen.Forms[i].BringToFront;
          Exit;
        end;
      end;
    end;
  end;
        }

  F := TFileProp.Create(nil);
  try
    F.xHandle := AHandle;
    F.Initialize(ACopy, id_File);


    F.Show;
 {   if (Top > 0) and (Top + 50 < Screen.Height - 100) then
      F.Top := Top + 50;
    if (Left > 0) and (Left + 50 < Screen.Width - 200) then
      F.Left := Left + 50;       }
  except
    F.Free;
  end;
end;
procedure CloseDocProp_Adv(AFileProp : TFileProp);
var b : boolean;
begin
  if (AFileProp.ModalResult = mrOk) then
  begin
    if AFileProp.SaveProp then
      PostMessage(AFileProp.xHandle, xxx_WD_RefrMsg, AFileProp.Fid_File, 0);
  end;
end;


procedure TFileProp.btnOkClick(Sender: TObject);
begin
  if cdsFileProp.State in [dsEdit, dsInsert] then cdsFileProp.Post;
  with edBayerName do
    if (cdsFilePropid_Seller.AsInteger = cdsFilePropid_Bayer.AsInteger) and (cdsFilePropid_Seller.AsInteger > 0) then
    begin
      MessageBox(Handle, 'нельзя указвать одно юрлицо и как продавца, и как покупателя.', 'Ошибка в данных', MB_OK + MB_ICONERROR);
      Windows.SetFocus(Handle);
      Exit;
    end;

  if xHandle > 0 then
  begin
    Close;
  end;
end;

procedure TFileProp.Initialize(ACopy : boolean; id_File: integer);
var i : integer;
    Cmp : TComponent;
begin

  with cdsCur do
  begin
    Close;
    Params.ParamByName('@id_NS').Value := DM.id_NS;
    Params.ParamByName('@ExtID').Value := 1000;
    Open;
  end;
          DM.cdsDDD.Close;
          DM.cdsDDD.Params.ParamByName('@id_NS').Value := DM.id_NS;
          DM.cdsDDD.Params.ParamByName('@isInt').Value := Null;
          DM.cdsDDD.Open;
{  for i := ComponentCount - 1 downto 0 do
  begin
    if Components[i] is TsDBEdit then
    begin
      if POS('Adv_Str', TsDBEdit(Components[i]).DataField) > 0 then
      begin
        if DM.cdsDDD.Locate('ColName', TsDBEdit(Components[i]).DataField, [loCaseInsensitive]) then
        begin
          if DM.cdsDDDisVisible.AsBoolean then
          begin
            Cmp := FindComponent('lb' + TsDBEdit(Components[i]).DataField);
            if Cmp is TsLabel then
              TsLabel(Cmp).Caption := DM.cdsDDDParamName.AsString;
            TsDBEdit(Components[i]).parent.Visible := true;
          end
          else
          begin
            Height := Height - TsDBEdit(Components[i]).parent.Height;
            TsDBEdit(Components[i]).parent.Free;
          end;
        end;
      end;
    end;
  end;
      }
  
  AStream := nil;
  Fid_File := id_File;
  with cdsFileProp do
  begin
    Close;
    Params.ParamByName('@id_File').Value := Fid_File;
    Params.ParamByName('@id_User').Value := DM.ID_User;
    Open;

    if ACopy then Fid_File := -1;
    Edit;
  ////  if cdsFilePropFileGUID.AsString = '' then
   //   cdsFilePropFileGUID.AsString := GetGUIDStr;
    if Fid_File = -1 then
    begin
      cdsFilePropid_File.AsInteger := -1;
      cdsFilePropOrigName.AsString := '';
    end;
    Post;
  end;
  xOrigName := cdsFilePropOrigName.AsString;
  DldBtn.Enabled := cdsFilePropOrigName.AsString > '';

  if Fid_File > 0 then Caption := Caption + ' - ' + IntToStr(Fid_File);
end;

function TFileProp.SaveProp: boolean;
var xID : integer;
   OldCursor : TCursor;
   Rez, i : integer;
   S : String;
  EmailDate, EmailFrom, EmailName, EmailTo, 
  Subj, xID_NS, id_DocType, id_WorkType, id_Seller, id_Bayer,   id_Org3, id_Org4, DocNum, DocDate, DocDateStop, isAutoLong,   DocSumm, id_Crn, id_State, Comment, xVers, OrigName,   FileInfo, FileSize, Adv_Digit1, Adv_Digit2, Adv_Digit3, Adv_Digit4,   Adv_Digit5, Adv_Digit6, Adv_Digit7, Adv_Digit8, Adv_Digit9, Adv_Digit10,   Adv_Date1, Adv_Date2, Adv_Date3, Adv_Date4, Adv_Date5, Adv_Date6,   Adv_Date7, Adv_Date8, Adv_Date9, Adv_Date10, id_DicFile1, id_DicFile2,   id_DicFile3, id_DicFile4, id_DicFile5, id_DicFile6, id_DicFile7, id_DicFile8,   id_DicFile9, id_DicFile10,
  id_WorkType2, id_WorkType3, id_WorkType4, id_WorkType5 : OleVariant;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Result := false;
  BeginTruns(DM.rsCA);
  try
    S := cdsFilePropEmailFrom.AsString;
    if POS(' (', S) > 0 then
      S := trim(COPY(S, 1, POS(' (', S)));

      EmailDate := cdsFilePropEmailDate.AsVariant;
      EmailFrom := S;
      EmailName := cdsFilePropEmailName.AsVariant;
      EmailTo := cdsFilePropEmailTo.AsVariant;
      Subj := cdsFilePropSubj.AsVariant;
      xID_NS := DM.id_NS;


      id_DocType := cdsFilePropid_DocType.AsVariant;
      id_WorkType := cdsFilePropid_WorkType.AsVariant;
      id_Seller := cdsFilePropid_Seller.AsVariant;
      id_Bayer := cdsFilePropid_Bayer.AsVariant;
      id_Org3 := cdsFilePropid_Org3.AsVariant;
      id_Org4 := cdsFilePropid_Org4.AsVariant;
      DocNum := cdsFilePropDocNum.AsVariant;
      DocDate := cdsFilePropDocDate.AsVariant;
      DocDateStop := cdsFilePropDocDateStop.AsVariant;
      isAutoLong := xOrigName <> cdsFilePropOrigName.AsString; //true;
      DocSumm := cdsFilePropDocSumm.AsVariant;
      id_Crn := cdsFilePropid_Crn.AsVariant;
      id_State := cdsFilePropid_State.AsVariant;
      Comment := cdsFilePropComment.AsVariant;
      xVers := cdsFilePropxVers.AsInteger;
      OrigName := ExtractFileName(cdsFilePropOrigName.AsString);
      FileInfo := cdsFilePropFileInfo.AsVariant;
      FileSize := cdsFilePropFileSize.AsVariant;
      Adv_Digit1 := cdsFilePropAdv_Digit1.AsVariant;
      Adv_Digit2 := cdsFilePropAdv_Digit2.AsVariant;
      Adv_Digit3 := cdsFilePropAdv_Digit3.AsVariant;
      Adv_Digit4 := cdsFilePropAdv_Digit4.AsVariant;
      Adv_Digit5 := cdsFilePropAdv_Digit5.AsVariant;
      Adv_Digit6 := cdsFilePropAdv_Digit6.AsVariant;
      Adv_Digit7 := cdsFilePropAdv_Digit7.AsVariant;
      Adv_Digit8 := cdsFilePropAdv_Digit8.AsVariant;
      Adv_Digit9 := cdsFilePropAdv_Digit9.AsVariant;
      Adv_Digit10 := cdsFilePropAdv_Digit10.AsVariant;
      Adv_Date1 := cdsFilePropAdv_Date1.AsVariant;
      Adv_Date2 := cdsFilePropAdv_Date2.AsVariant;
      Adv_Date3 := cdsFilePropAdv_Date3.AsVariant;
      Adv_Date4 := cdsFilePropAdv_Date4.AsVariant;
      Adv_Date5 := cdsFilePropAdv_Date5.AsVariant;
      Adv_Date6 := cdsFilePropAdv_Date6.AsVariant;
      Adv_Date7 := cdsFilePropAdv_Date7.AsVariant;
      Adv_Date8 := cdsFilePropAdv_Date8.AsVariant;
      Adv_Date9 := cdsFilePropAdv_Date9.AsVariant;
      Adv_Date10 := cdsFilePropAdv_Date10.AsVariant;
      id_DicFile1 := cdsFilePropid_DicFile1.AsVariant;
      id_DicFile2 := cdsFilePropid_DicFile2.AsVariant;
      id_DicFile3 := cdsFilePropid_DicFile3.AsVariant;
      id_DicFile4 := cdsFilePropid_DicFile4.AsVariant;
      id_DicFile5 := cdsFilePropid_DicFile5.AsVariant;
      id_DicFile6 := cdsFilePropid_DicFile6.AsVariant;
      id_DicFile7 := cdsFilePropid_DicFile7.AsVariant;
      id_DicFile8 := cdsFilePropid_DicFile8.AsVariant;
      id_DicFile9 := cdsFilePropid_DicFile9.AsVariant;
      id_DicFile10 := cdsFilePropid_DicFile10.AsVariant;

      id_WorkType2 := cdsFilePropid_WorkType2.AsVariant;
      id_WorkType3 := cdsFilePropid_WorkType3.AsVariant;
      id_WorkType4 := cdsFilePropid_WorkType4.AsVariant;
      id_WorkType5 := cdsFilePropid_WorkType5.AsVariant;

      Rez := DM.rsCA.AppServer.WD_File_UnEdit_v2(Fid_File, EmailDate, EmailFrom, EmailName, EmailTo,
  Subj, xID_NS, id_DocType, id_WorkType, id_WorkType2, id_WorkType3, id_WorkType4, id_WorkType5,  id_Seller, id_Bayer,   id_Org3, id_Org4, DocNum, DocDate, DocDateStop, isAutoLong,   DocSumm, id_Crn, id_State, Comment, xVers, OrigName,   FileInfo, FileSize, Adv_Digit1, Adv_Digit2, Adv_Digit3, Adv_Digit4,   Adv_Digit5, Adv_Digit6, Adv_Digit7, Adv_Digit8, Adv_Digit9, Adv_Digit10,   Adv_Date1, Adv_Date2, Adv_Date3, Adv_Date4, Adv_Date5, Adv_Date6,   Adv_Date7, Adv_Date8, Adv_Date9, Adv_Date10, id_DicFile1, id_DicFile2,   id_DicFile3, id_DicFile4, id_DicFile5, id_DicFile6, id_DicFile7, id_DicFile8,   id_DicFile9, id_DicFile10);
      if Rez = -1 then
        raise Exception.Create('Ошибка при сохранении свойств');

    if Fid_File = -1 then // Добавляется
    begin
      Fid_File := Rez; 
    end;


    //*******************************
    if xOrigName <> cdsFilePropOrigName.AsString then
      DM.UplFile(Fid_File, sDBEdit3.Text, AStream);


    // *******************************
    CommitTrans(DM.rsCA);
    Result := true;
  except
    on E : Exception do
    begin
       RollbackTrans(DM.rsCA);
         raise Exception.Create('Ошибка при заливке файла. ' + E.Message);
    end;
  end;
  Screen.Cursor := OldCursor;
end;



procedure TFileProp.Button3Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
    X : ExclList;
begin
  ASelectedObj.ID := cdsFilePropid_Seller.AsInteger;
  ASelectedObj.ObjType := eotCA;
  if ShowUnSelector(ASelectedObj, X) then
  begin
    cdsFileProp.Edit;
    cdsFilePropid_Seller.AsInteger := ASelectedObj.ID;
    cdsFilePropSellerName.AsString := ASelectedObj.Name;
    cdsFileProp.Post;

    DM.AddToClipBrd(ASelectedObj.ObjType, ASelectedObj.ID, ASelectedObj.Name, 1);

  end;
end;

procedure TFileProp.Button4Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
    X : ExclList;
begin
  ASelectedObj.ID := cdsFilePropid_Bayer.AsInteger;
  ASelectedObj.ObjType := eotCA;
  if ShowUnSelector(ASelectedObj, X) then
  begin
    cdsFileProp.Edit;
    cdsFilePropid_Bayer.AsInteger := ASelectedObj.ID;
    cdsFilePropBayerName.AsString := ASelectedObj.Name;
    cdsFileProp.Post;
    DM.AddToClipBrd(ASelectedObj.ObjType, ASelectedObj.ID, ASelectedObj.Name, 1);
  end;
end;

procedure TFileProp.Button2Click(Sender: TObject);
var ASelectedObj : TSelectedObj;
    X : ExclList;
begin
  ASelectedObj.ID := cdsFilePropid_DocType.AsInteger;
  ASelectedObj.ObjType := eotDocType;
  if ShowUnSelector(ASelectedObj, X) then
  begin
    cdsFileProp.Edit;
    cdsFilePropid_DocType.AsInteger := ASelectedObj.ID;
    cdsFilePropDocTypeName.AsString := ASelectedObj.Name;
    cdsFileProp.Post;
    DM.AddToClipBrd(ASelectedObj.ObjType, ASelectedObj.ID, ASelectedObj.Name, 1);
  end;
end;

procedure TFileProp.ShowWorkType(Num : integer);
var ASelectedObj : TSelectedObj;
    S : String;
    X : ExclList;
begin
  S := '';
  if Num > 1 then S := IntToStr(Num);
  ASelectedObj.ID := cdsFileProp.fieldbyname('id_WorkType' + S).AsInteger;
  ASelectedObj.ObjType := eotWorkType;
 // Arr := [1];
  SetLength(X, 5);
  X[0] := cdsFilePropid_WorkType.AsInteger;
  X[1] := cdsFilePropid_WorkType2.AsInteger;
  X[2] := cdsFilePropid_WorkType3.AsInteger;
  X[3] := cdsFilePropid_WorkType4.AsInteger;
  X[4] := cdsFilePropid_WorkType5.AsInteger;

  if ShowUnSelector(ASelectedObj, X) then
  begin
    cdsFileProp.Edit;
    cdsFileProp.fieldbyname('id_WorkType' + S).AsInteger := ASelectedObj.ID;
    cdsFileProp.fieldbyname('WorkTypeName' + IntToStr(Num)).AsString := ASelectedObj.Name;
    cdsFileProp.Post;
    DM.AddToClipBrd(ASelectedObj.ObjType, ASelectedObj.ID, ASelectedObj.Name, 1);
  end;
end;


procedure TFileProp.UplBtnClick(Sender: TObject);begin
  if sOpenDialog1.Execute then
  begin
    cdsFileProp.Edit;
    cdsFilePropOrigName.AsString := sOpenDialog1.FileName;
    cdsFileProp.Post;
  end;
end;

procedure TFileProp.dctFiles2Drop(Sender: TObject; ShiftState: TShiftState;  APoint: TPoint; var Effect: Integer);
var  
  zStream: TStream;
  i: integer;
  Val, S: string;
  
  OutlookDataFormat: TOutlookDataFormat;
  AMessage: IMessage;
  XXX : IUnknown;
begin
  if Assigned(AStream) then AStream.Free;
  AStream := nil;
  S := '';
  
  OutlookDataFormat := (DataFormatAdapterOutlook.DataFormat as TOutlookDataFormat);
  if (DataFormatAdapterOutlook.DataFormat <> nil) and (OutlookDataFormat.Messages.Count > 0) then
  begin
      XXX := OutlookDataFormat.Messages[0];
      if (Supports(XXX, IMessage, AMessage)) then
      begin
        try
          DM.GetAttachmentsList(AMessage);
          if (DM.FAttList.Count > 0) then
          begin
            if (DM.FAttList.Count > 1) then
            begin
              Val := DM.FAttList.Text;
              if ShowOneItemSelector(Val, Val, 'Выберите одно из вложений') then
              begin
                S := Val;
              end;
            end
            else
              S := DM.FAttList[0];
          end;

          cdsFileProp.Edit;
          cdsFilePropEmailFrom.AsString := DM.GetOneProp(AMessage, PR_SENDER_EMAIL_ADDRESS);// + ' (' + DM.GetOneProp(AMessage, PR_SENDER_NAME) + ')';
          cdsFilePropEmailTo.AsString := DM.GetAddrList(AMessage);  // получатели
          cdsFilePropSubj.AsString := DM.GetOneProp(AMessage, PR_SUBJECT);
          
          cdsFilePropEmailDate.AsDateTime := DM.GetRecTime(AMessage);

          if S <> '' then
          begin
            cdsFilePropOrigName.AsString := S;
            AStream := DM.GetAttachmentStream(S);
          end;

          cdsFileProp.Post;
          xOrigName := '';
        finally
          AMessage := nil;
        end;
      end;

  end
  else
  if dctFiles2.Files.Count > 0 then
  begin
    cdsFileProp.Edit;
    cdsFilePropOrigName.AsString := dctFiles2.Files[0];
    cdsFileProp.Post;
    xOrigName := '';
    Exit;
  end
  else
  if dctFiles2.Data.Count > 0 then
  begin
    cdsFileProp.Edit;
    cdsFilePropOrigName.AsString := dctFiles2.Data.Names[0];
    cdsFileProp.Post;

    zStream := dctFiles2.Data[0];

    zStream.Position := 0;
    AStream := TMemoryStream.Create();
    AStream.CopyFrom(zStream, zStream.Size);
    
    xOrigName := '';
    Exit;
  end  {
  else
  if dctFiles2.URL <> '' then
  begin
    lbFile.Caption := dctFiles2.Title;
    lbFileExt.Caption := 'URL: ' + dctFiles2.URL;
  end};

end;
 

procedure TFileProp.sButton1Click(Sender: TObject);var ASelectedObj : TSelectedObj;
    X : ExclList;
begin
  ASelectedObj.ID := cdsFilePropid_State.AsInteger;
  ASelectedObj.ObjType := eotDocState;
  if ShowUnSelector(ASelectedObj, X) then
  begin
    cdsFileProp.Edit;
    cdsFilePropid_State.AsInteger := ASelectedObj.ID;
    cdsFilePropStateName.AsString := ASelectedObj.Name;
    cdsFileProp.Post;
    DM.AddToClipBrd(ASelectedObj.ObjType, ASelectedObj.ID, ASelectedObj.Name, 1);
  end;
end;

procedure TFileProp.FormCreate(Sender: TObject);begin
  xHandle := 0;

  dctFiles2.Register(pnMail2);
  dctFiles2.Register(pnCA);
  dctFiles2.Register(sPanel1);
end;

procedure TFileProp.btnAdv1Click(Sender: TObject);begin
  UnAdv(eotF1, cdsFilePropid_DicFile1, cdsFilePropAdv_Str1);
end;

procedure TFileProp.UnAdv(AObjType: TEObjType; ID_Field, Name_Field : TField);
var ASelectedObj : TSelectedObj;
    X : ExclList;
begin
  ASelectedObj.ID := cdsFilePropid_State.AsInteger;
  ASelectedObj.ObjType := AObjType;
  if ShowUnSelector(ASelectedObj, X) then
  begin
    cdsFileProp.Edit;
    ID_Field.AsInteger := ASelectedObj.ID;
    Name_Field.AsString := ASelectedObj.Name;
    cdsFileProp.Post;
  end;
end;


procedure TFileProp.sAdvv3Click(Sender: TObject);begin
  UnAdv(eotF2, cdsFilePropid_DicFile2, cdsFilePropAdv_Str2);

end;

procedure TFileProp.saButton4Click(Sender: TObject);begin
  UnAdv(eotF3, cdsFilePropid_DicFile3, cdsFilePropAdv_Str3);

end;

procedure TFileProp.saButton5Click(Sender: TObject);begin
  UnAdv(eotF4, cdsFilePropid_DicFile4, cdsFilePropAdv_Str4);

end;

procedure TFileProp.saButton7Click(Sender: TObject);begin
  UnAdv(eotF5, cdsFilePropid_DicFile5, cdsFilePropAdv_Str5);

end;

procedure TFileProp.sBtnAdv6Click(Sender: TObject);begin
  UnAdv(eotF6, cdsFilePropid_DicFile6, cdsFilePropAdv_Str6);

end;

procedure TFileProp.sBtnAdv7Click(Sender: TObject);begin
  UnAdv(eotF7, cdsFilePropid_DicFile7, cdsFilePropAdv_Str7);

end;

procedure TFileProp.sBtnAdv8Click(Sender: TObject);begin
  UnAdv(eotF8, cdsFilePropid_DicFile8, cdsFilePropAdv_Str8);

end;

procedure TFileProp.sBtnAdv9Click(Sender: TObject);begin
  UnAdv(eotF9, cdsFilePropid_DicFile9, cdsFilePropAdv_Str9);

end;

procedure TFileProp.sBtnAdv10Click(Sender: TObject);begin
  UnAdv(eotF10, cdsFilePropid_DicFile10, cdsFilePropAdv_Str10);

end;

procedure TFileProp.edUnNameKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
var AField, IntField : TField;
    S : String;
begin
  if (Key = VK_BACK) or (Key = VK_DELETE) then
  begin
    IntField := nil;
    AField := TsDBEdit(Sender).Field;
    
    if AField = cdsFilePropSellerName then
      IntField := cdsFilePropid_Seller;

    if AField = cdsFilePropWorkTypeName then
      IntField := cdsFilePropid_WorkType;

    if AField = cdsFilePropWorkTypeName1 then
      IntField := cdsFilePropid_WorkType;
    if AField = cdsFilePropWorkTypeName2 then
      IntField := cdsFilePropid_WorkType2;
    if AField = cdsFilePropWorkTypeName3 then
      IntField := cdsFilePropid_WorkType3;
    if AField = cdsFilePropWorkTypeName4 then
      IntField := cdsFilePropid_WorkType4;
    if AField = cdsFilePropWorkTypeName5 then
      IntField := cdsFilePropid_WorkType5;

    if AField = cdsFilePropBayerName then
      IntField := cdsFilePropid_Bayer;

    if AField = cdsFilePropStateName then
      IntField := cdsFilePropid_State;

    S := AField.FieldName;
    if POS('Adv_Str', AField.FieldName) > 0 then
      IntField := cdsFileProp.FindField('id_DicFile' + S[length(S)]);

    if Assigned(IntField) then
    begin
      cdsFileProp.Edit;
      IntField.AsVariant := Null;
      AField.AsVariant := Null;
      cdsFileProp.Post;
      Key := 0;
    end;
  end;
end;

procedure TFileProp.FormClose(Sender: TObject; var Action: TCloseAction);begin
  if xHandle > 0 then
  begin
    Action := caFree;
    CloseDocProp_Adv(Self);
  end;
end;

procedure TFileProp.btnCancelClick(Sender: TObject);begin
  if xHandle > 0 then
  begin
    Close;
  end;

end;

constructor TFileProp.Create(AOwner: TComponent);  procedure AddMI(aMenu: TMenu);  begin    DM.AddToPopupMenu(aMenu, 'Добавить в буфер', 1, miClipBrdAddClick);     DM.AddToPopupMenu(aMenu, '-', 0, nil);   end;var MI : TMenuItem;begin
  inherited;
  SetWindowLong(Handle, GWL_HWNDPARENT, 0);
  pcData.ActivePage := tsInfo;

  pmSellerName.Tag := integer(eotCA);
  AddMI(pmSellerName);

  pmBayerName.Tag := integer(eotCA);
  AddMI(pmBayerName);

  pmStateName.Tag := integer(eotDocState);
  AddMI(pmStateName);

  pmWorkTypeName.Tag := integer(eotWorkType);
  AddMI(pmWorkTypeName);

  pmDocTypeName.Tag := integer(eotDocType);
  AddMI(pmDocTypeName);

end;

procedure TFileProp.CreateParams(var Params: TCreateParams);begin
  inherited;
  Params.ExStyle:=(Params.ExStyle or WS_EX_APPWINDOW);
end;

procedure TFileProp.aOpenFileExecute(Sender: TObject);var S : String;
begin
  S := cdsFilePropCalcName.AsString;
  if S = '' then
    S := cdsFilePropOrigName.AsString;
  DM.DLDFile(cdsFilePropid_File.AsInteger, S);
end;

procedure TFileProp.aSaveFileExecute(Sender: TObject);var SL : TStringList;
    i, X : integer;
    S, sExt : String;
begin
  S := cdsFilePropCalcName.AsString;
  if S = '' then
    S := cdsFilePropOrigName.AsString;

  sSaveDialog1.DefaultExt := ExtractFileExt(S);
  sExt := AnsiUpperCase(sSaveDialog1.DefaultExt);
  sSaveDialog1.FileName := S;

  SL := TStringList.Create;
  try
    SL.Text := xStringReplace(sSaveDialog1.Filter, ['|'], #13 + #10); 
    sSaveDialog1.Filter := 'Все файлы (*.*)|*.*';
    for i := 0 to SL.Count - 1 do
      if (POS('(', SL[i]) = 0) and (POS(sExt, AnsiUpperCase(SL[i])) > 0) then
      begin
        sSaveDialog1.Filter := sSaveDialog1.Filter + '|' + SL[i - 1] + '|' + SL[i];
        sSaveDialog1.FilterIndex := 2;
      end;
  finally
    SL.Free;
  end;

  if sSaveDialog1.Execute then
    DM.DLDFile(cdsFilePropid_File.AsInteger, sSaveDialog1.FileName);
end;

procedure TFileProp.pmFilePopup(Sender: TObject);var S : String;
begin
  S := cdsFilePropCalcName.AsString;
  if S = '' then
    S := cdsFilePropOrigName.AsString;

  aSaveFile.Caption := 'Сохранить файл ' + S;
  aOpenFile.Caption := 'Открыть файл ' + S;
end;

procedure TFileProp.aNoteExecute(Sender: TObject);begin
  ShowxNote;
end;

procedure TFileProp.aPasteDataExecute(Sender: TObject);begin
  CloneRow(DM.mdOperBuff, cdsFileProp, cdsFilePropOrigName, cdsFilePropid_File);
  cdsFileProp.Edit;
  cdsFilePropCalcName.AsVariant := Null;
  cdsFileProp.Post;
end;

procedure TFileProp.aCopyDataExecute(Sender: TObject);begin
  if cdsFileProp.State in [dsEdit, dsInsert] then cdsFileProp.Post;
  DM.mdOperBuff.Close;
  CloneCDS2(cdsFileProp, DM.mdOperBuff);
end;

procedure TFileProp.ActionList1Update(Action: TBasicAction;  var Handled: Boolean);
begin
  aPasteData.Enabled := DM.mdOperBuff.Active;
  if aPasteData.Enabled then
    aPasteData.Hint := DM.PasteDataHint;
end;

procedure TFileProp.btnSummClick(Sender: TObject);var V : Variant;
begin
  V := GetFloatFromClipBoadr;
  if V <> 0 then
  begin
    if cdsFileProp.State <> dsEdit then
      cdsFileProp.Edit;
    cdsFilePropDocSumm.AsFloat := V;
    cdsFileProp.Post;
  end;
end;

procedure TFileProp.FormDestroy(Sender: TObject);begin
  SaveFormSettingsToRegistry(Self, SRegPath + '\3' + ClassName);

end;

procedure TFileProp.FormShow(Sender: TObject);begin
  LoadFormSettingsToRegistry(Self, SRegPath + '\3' + ClassName);
  DoPanels;
end;

procedure TFileProp.pmSellerNamePopup(Sender: TObject);var M : TPopupMenu;    ObjType: TEObjType;
    id_Obj: integer;
    ObjName: String;
begin
  M := (Sender as TPopupMenu);
  GetData(M, ObjType, id_Obj, ObjName);
  M.Items[0].Enabled := id_Obj > 0;

  DM.MakeMenuFromClipBrd(TEObjType(M.Tag), M, miClipBrdClick);
end;

procedure TFileProp.miClipBrdClick(Sender: TObject);var M : TMenu;
begin        
  M := (Sender as TMenuItem).GetParentMenu;
  cdsFileProp.Edit;
  if M = pmSellerName then
  begin
    cdsFilePropid_Seller.AsInteger := (Sender as TmenuItem).Tag;
    cdsFilePropSellerName.AsString := (Sender as TmenuItem).Caption;
  end
  else
  if M = pmBayerName then
  begin
    cdsFilePropid_Bayer.AsInteger := (Sender as TmenuItem).Tag;
    cdsFilePropBayerName.AsString := (Sender as TmenuItem).Caption;
  end
  else
  if M = pmWorkTypeName then
  begin
    cdsFilePropid_WorkType.AsInteger := (Sender as TmenuItem).Tag;
    cdsFilePropWorkTypeName.AsString := (Sender as TmenuItem).Caption;
  end
  else
  if M = pmDocTypeName then
  begin
    cdsFilePropid_DocType.AsInteger := (Sender as TmenuItem).Tag;
    cdsFilePropDocTypeName.AsString := (Sender as TmenuItem).Caption;
  end 
  else
  if M = pmStateName then
  begin
    cdsFilePropid_State.AsInteger := (Sender as TmenuItem).Tag;
    cdsFilePropStateName.AsString := (Sender as TmenuItem).Caption;
  end; 
  cdsFileProp.Post;
end;
procedure TFileProp.miClipBrdAddClick(Sender: TObject);var M : TMenu;
    ObjType: TEObjType;
    id_Obj: integer;
    ObjName: String;
begin        
  M := (Sender as TMenuItem).GetParentMenu;
  GetData(M, ObjType, id_Obj, ObjName);
  DM.AddToClipBrd(ObjType, id_Obj, ObjName);
end;

procedure TFileProp.GetData(M : TMenu; var ObjType: TEObjType;
    var id_Obj: integer;
    var ObjName: String);
begin
  id_Obj := -1;
  if M = pmSellerName then
  begin
    ObjType := eotCA;
    id_Obj := cdsFilePropid_Seller.AsInteger;
    ObjName := cdsFilePropSellerName.AsString;
  end
  else
  if M = pmBayerName then
  begin
    ObjType := eotCA;
    id_Obj := cdsFilePropid_Bayer.AsInteger;
    ObjName := cdsFilePropBayerName.AsString;
  end
  else
  if M = pmWorkTypeName then
  begin
    ObjType := eotWorkType;
    id_Obj := cdsFilePropid_WorkType.AsInteger;
    ObjName := cdsFilePropWorkTypeName.AsString;
  end
  else
  if M = pmDocTypeName then
  begin
    ObjType := eotDocType;
    id_Obj := cdsFilePropid_DocType.AsInteger;
    ObjName := cdsFilePropDocTypeName.AsString;
  end 
  else
  if M = pmStateName then
  begin
    ObjType := eotDocState;
    id_Obj := cdsFilePropid_State.AsInteger;
    ObjName := cdsFilePropStateName.AsString;
  end 
end;

procedure TFileProp.sSpeedButton4Click(Sender: TObject);var M : TPopupMenu;
    ObjType: TEObjType;
    id_Obj: integer;
    ObjName: String;
begin
  DM.sSkinManager1.SkinnedPopups := false;
  M := (Sender as TsSpeedButton).DropdownMenu;
  GetData(M, ObjType, id_Obj, ObjName);
  M.Items[0].Enabled := id_Obj > 0;

  DM.MakeMenuFromClipBrd(TEObjType(M.Tag), M, miClipBrdClick);
  DM.sSkinManager1.SkinnedPopups := true;
  M.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);

end;

procedure TFileProp.sButton2Click(Sender: TObject);begin
  ShowWorkType(1);
end;

procedure TFileProp.sButton3Click(Sender: TObject);begin
  ShowWorkType(2);

end;

procedure TFileProp.sButton4Click(Sender: TObject);begin
  ShowWorkType(3);

end;

procedure TFileProp.sButton5Click(Sender: TObject);begin
  ShowWorkType(4);

end;

procedure TFileProp.Button5Click(Sender: TObject);begin
  ShowWorkType(5);

end;

procedure TFileProp.cdsFilePropAfterPost(DataSet: TDataSet);begin
  DoPanels;
end;

procedure TFileProp.cdsFilePropAfterOpen(DataSet: TDataSet);begin
  DoPanels;
end;

procedure TFileProp.HidePanels;
begin  if cdsFilePropid_WorkType.IsNull and cdsFilePropid_WorkType2.IsNull then
    ppW2.Height := 1
  else
  begin
    ppW2.Height := 29;
   // Exit;
  end;
  if cdsFilePropid_WorkType2.IsNull and cdsFilePropid_WorkType3.IsNull  then
    ppW3.Height := 1
  else
  begin
    ppW3.Height := 29;
  //  Exit;
  end;
  if cdsFilePropid_WorkType3.IsNull and cdsFilePropid_WorkType4.IsNull  then
    ppW4.Height := 1
  else
  begin
    ppW4.Height := 29;
 //   Exit;
  end;
  if cdsFilePropid_WorkType4.IsNull and cdsFilePropid_WorkType5.IsNull  then
    ppW5.Height := 1
  else
  begin
    ppW5.Height := 29;
  //  Exit;
  end;
end;
procedure TFileProp.DoPanels;var i, xHeight : integer;begin
  HidePanels;

 { ppW2.Visible := not cdsFilePropid_WorkType.IsNull;
  ppW3.Visible := not cdsFilePropid_WorkType2.IsNull;
  ppW4.Visible := not cdsFilePropid_WorkType3.IsNull;
  ppW5.Visible := not cdsFilePropid_WorkType4.IsNull;
        }
  xHeight := 0;
  for i := 0 to pnCA.ControlCount - 1 do
  begin
    if pnCA.Controls[i] is TsPanel then
      if TsPanel(pnCA.Controls[i]).Visible then
        xHeight := xHeight + TsPanel(pnCA.Controls[i]).Height;
  end;
  pnCA.Height := xHeight;
  Height := xHeight + 234;
end;
end.