object BJItemProp_v2: TBJItemProp_v2
  Left = 192
  Top = 107
  Width = 443
  Height = 516
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Категория'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 448
    Width = 435
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 349
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 258
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  inline fBJItemProp1: TfBJItemProp_v2
    Width = 435
    Height = 448
    Align = alClient
    TabOrder = 1
    inherited pBase: TPanel
      Width = 435
    end
    inherited Panel1: TPanel
      Width = 435
      Height = 418
      inherited Label8: TLabel
        Width = 36
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    inherited cdsBIP: TClientDataSet
      inherited cdsBIPid_business: TIntegerField
        ReadOnly = False
      end
      inherited cdsBIPRealName: TStringField
        ReadOnly = False
      end
      inherited cdsBIPid_BJ_Item: TAutoIncField
        ReadOnly = False
      end
    end
  end
end
