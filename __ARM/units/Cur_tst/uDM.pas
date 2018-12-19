unit uDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, MConnect;

const  SRegPath = '\SOFTWARE\FO\CurrAdm';

type
  TDM = class(TDataModule)
    rsCurAdm: TDCOMConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.DFM}

end.
