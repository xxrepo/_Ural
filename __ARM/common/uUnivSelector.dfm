object UnivSelector: TUnivSelector
  Left = 400
  Top = 93
  Width = 638
  Height = 526
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Объекты системы'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 451
    Width = 630
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 536
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TButton
      Left = 445
      Top = 9
      Width = 75
      Height = 25
      Action = aOk
      Anchors = [akTop, akRight]
      ModalResult = 1
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 630
    Height = 21
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 39
      Height = 13
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 21
    Width = 630
    Height = 21
    Align = alTop
    Caption = ' '
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 4
      Width = 32
      Height = 13
      Caption = 'Label2'
    end
  end
  inline fEForm1: TfEForm
    Top = 42
    Width = 630
    Height = 409
    Align = alClient
    TabOrder = 3
    inherited Splitter1: TSplitter
      Height = 380
    end
    inherited TreeView1: TTreeView
      Height = 380
    end
    inherited PageControl1: TPageControl
      Width = 423
      Height = 380
      ActivePage = fEForm1.tsCA
      inherited tsEmpty: TTabSheet
        inherited Image2: TImage
          Width = 560
        end
      end
    end
    inherited ToolBar1: TToolBar
      Width = 630
    end
  end
  object ActionList1: TActionList
    OnUpdate = ActionList1Update
    Left = 136
    Top = 480
    object aOk: TAction
      Caption = 'OK'
      Enabled = False
      OnExecute = aOkExecute
    end
  end
end
