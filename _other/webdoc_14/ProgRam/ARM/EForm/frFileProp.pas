unit frFileProp;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, sButton, DBCtrls, sDBLookupComboBox, sCurrEdit, sDBCalcEdit,
  Mask, sMaskEdit, sCustomComboEdit, sTooledit, sDBDateEdit, sDBEdit,
  sDBMemo, Buttons, sSpeedButton, sLabel, ComCtrls, sPageControl;

type
  TfFileProp = class(TFrame)
    pcFile: TsPageControl;
    sTabSheet1: TsTabSheet;
    lbDOCCOMMENT: TsLabel;
    lbNUM: TsLabel;
    lbDTNAME: TsLabel;
    lbDOCDATE: TsLabel;
    sLabel2: TsLabel;
    DldBtn: TsSpeedButton;
    UplBtn: TsSpeedButton;
    DBMemo1: TsDBMemo;
    edDocTypeName: TsDBEdit;
    DBEdit3: TsDBEdit;
    DBDateEdit1: TsDBDateEdit;
    sDBCalcEdit1: TsDBCalcEdit;
    sDBLookupComboBox1: TsDBLookupComboBox;
    Button2: TsButton;
    sDBEdit3: TsDBEdit;
    sTabSheet2: TsTabSheet;
    sTabSheet3: TsTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
