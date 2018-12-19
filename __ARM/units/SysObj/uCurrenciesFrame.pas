unit uCurrenciesFrame;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, ActnList, Db, DBClient,
  ImgList;

type
  TCurrenciesFrame = class(TFrame)
    ImageList: TImageList;
    DataSource: TDataSource;
    cdsCurrencies: TClientDataSet;
    ActionList1: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDel: TAction;
    aRefresh: TAction;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    RxDBGrid1: TRxDBGrid;
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure   AddCurrency;
    procedure   EditCurrency;
  public
    { Public declarations }
  end;

implementation
     uses uAdminDM, uNSIDetailFormsAPI;
{$R *.DFM}

procedure TCurrenciesFrame.aAddExecute(Sender: TObject);
begin
 AddCurrency;
end;

procedure TCurrenciesFrame.aEditExecute(Sender: TObject);
begin
 EditCurrency;
end;

procedure   TCurrenciesFrame.AddCurrency;
begin
end;

procedure   TCurrenciesFrame.EditCurrency;
begin
end;


end.
