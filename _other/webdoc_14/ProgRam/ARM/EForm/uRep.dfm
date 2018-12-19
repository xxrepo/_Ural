object Rep: TRep
  Left = 322
  Top = 154
  Width = 636
  Height = 407
  BorderIcons = [biSystemMenu, biMaximize]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 339
    Width = 628
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnOk: TButton
      Left = 545
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      Enabled = False
      ModalResult = 1
      TabOrder = 0
    end
  end
  inline fFiles1: TfFiles
    Width = 628
    Height = 339
    TabOrder = 1
    inherited dbgFileList: TDBGridEh
      Width = 628
      Height = 313
    end
    inherited sPanel1: TsPanel
      Width = 628
    end
  end
end
