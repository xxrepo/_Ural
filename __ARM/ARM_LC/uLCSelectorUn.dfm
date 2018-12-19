object LCSelectorUn: TLCSelectorUn
  Left = 192
  Top = 107
  Width = 783
  Height = 540
  Caption = 'Объекты системы'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 472
    Width = 775
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    object btnCancel: TButton
      Left = 689
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
      Left = 598
      Top = 9
      Width = 75
      Height = 25
      Action = aOk
      Anchors = [akTop, akRight]
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 21
    Align = alTop
    Caption = ' '
    TabOrder = 2
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
    Width = 775
    Height = 21
    Align = alTop
    Caption = ' '
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 4
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
  end
  inline fLCEntFrame1: TfLCEntFrame
    Top = 42
    Width = 775
    Height = 430
    Align = alClient
    TabOrder = 3
    inherited Splitter1: TSplitter
      Height = 401
    end
    inherited TreeView1: TTreeView
      Height = 401
    end
    inherited PageControl1: TPageControl
      Width = 568
      Height = 401
    end
    inherited ToolBar1: TToolBar
      Width = 775
    end
  end
  object ActionList1: TActionList
    OnUpdate = ActionList1Update
    Left = 136
    Top = 480
    object aOk: TAction
      Caption = 'OK'
      OnExecute = aOkExecute
    end
  end
end
