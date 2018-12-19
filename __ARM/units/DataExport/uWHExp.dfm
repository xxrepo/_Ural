object WHExp: TWHExp
  Left = 186
  Top = 107
  Width = 783
  Height = 540
  Caption = 'WHExp'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline fBsnSelector1: TfBsnSelector
    Width = 361
    Height = 33
    inherited edName: TEdit
      Width = 275
    end
    inherited Button1: TButton
      Left = 330
    end
  end
end
