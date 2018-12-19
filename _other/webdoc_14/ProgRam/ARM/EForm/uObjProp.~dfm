object ObjProp: TObjProp
  Left = 360
  Top = 103
  ActiveControl = DBEdit1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Валюта'
  ClientHeight = 481
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TsPanel
    Left = 0
    Top = 440
    Width = 478
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sSpeedButton1: TsSpeedButton
      Left = 8
      Top = 9
      Width = 105
      Height = 25
      Action = aNote
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 40
      Images = DM.ilImage
    end
    object btnCancel: TsButton
      Left = 392
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnOk: TsButton
      Left = 301
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sPageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 478
    Height = 440
    ActivePage = tsMain
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'PAGECONTROL'
    object tsMain: TsTabSheet
      Caption = 'Основные данные'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object pnCA2: TsPanel
        Left = 0
        Top = 89
        Width = 470
        Height = 323
        Align = alClient
        Caption = ' '
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object SrcPanel: TsPanel
          Left = 1
          Top = 55
          Width = 200
          Height = 267
          Align = alLeft
          Caption = ' '
          TabOrder = 0
          SkinData.SkinSection = 'PANEL'
          object Panel1: TsPanel
            Left = 1
            Top = 1
            Width = 198
            Height = 24
            Align = alTop
            BevelOuter = bvNone
            Caption = ' '
            TabOrder = 0
            SkinData.SkinSection = 'PANEL'
            object SrcLabel: TsLabel
              Left = 4
              Top = 4
              Width = 118
              Height = 13
              Caption = 'Виды деятельности'
              ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
            end
          end
          object SrcList: TTextListBox
            Left = 1
            Top = 25
            Width = 198
            Height = 241
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            MultiSelect = True
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Sorted = True
            TabOrder = 1
            OnClick = SrcListClick
            OnDblClick = IncBtnClick
            OnKeyDown = SrcListKeyDown
          end
        end
        object BtnPanel: TsPanel
          Left = 201
          Top = 55
          Width = 40
          Height = 267
          Align = alLeft
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 1
          SkinData.SkinSection = 'PANEL'
          object IncBtn: TsButton
            Left = 6
            Top = 32
            Width = 26
            Height = 26
            Caption = '>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = IncBtnClick
            SkinData.SkinSection = 'BUTTON'
          end
          object IncAllBtn: TsButton
            Left = 6
            Top = 64
            Width = 26
            Height = 26
            Caption = '>>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = IncAllBtnClick
            SkinData.SkinSection = 'BUTTON'
          end
          object ExclBtn: TsButton
            Left = 6
            Top = 97
            Width = 26
            Height = 26
            Caption = '<'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = ExclBtnClick
            SkinData.SkinSection = 'BUTTON'
          end
          object ExclAllBtn: TsButton
            Left = 6
            Top = 129
            Width = 26
            Height = 26
            Caption = '<<'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = ExclAllBtnClick
            SkinData.SkinSection = 'BUTTON'
          end
          object sButton2: TsButton
            Left = 6
            Top = 193
            Width = 26
            Height = 26
            Caption = '+>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            OnClick = sButton2Click
            SkinData.SkinSection = 'BUTTON'
          end
        end
        object DestPanel: TsPanel
          Left = 241
          Top = 55
          Width = 228
          Height = 267
          Align = alClient
          Caption = ' '
          TabOrder = 2
          SkinData.SkinSection = 'PANEL'
          object Panel4: TsPanel
            Left = 1
            Top = 1
            Width = 226
            Height = 24
            Align = alTop
            BevelOuter = bvNone
            Caption = ' '
            TabOrder = 0
            SkinData.SkinSection = 'PANEL'
            object DstLabel: TsLabel
              Left = 8
              Top = 4
              Width = 69
              Height = 13
              Caption = 'Выбранные'
              ParentFont = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
            end
          end
          object DstList: TTextListBox
            Left = 1
            Top = 25
            Width = 226
            Height = 241
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            MultiSelect = True
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Sorted = True
            TabOrder = 1
            OnClick = DstListClick
            OnDblClick = ExclBtnClick
            OnDragOver = DstListDragOver
            OnKeyDown = DstListKeyDown
          end
        end
        object Panel3: TsPanel
          Left = 1
          Top = 1
          Width = 468
          Height = 54
          Align = alTop
          Caption = ' '
          TabOrder = 3
          SkinData.SkinSection = 'PANEL'
          object sLabel1: TsLabel
            Left = 8
            Top = 32
            Width = 30
            Height = 13
            Caption = 'e-mail:'
            FocusControl = sDBEdit1
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
          end
          object DBCheckBox1: TsDBCheckBox
            Left = 8
            Top = 8
            Width = 77
            Height = 19
            Caption = 'Продавец'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
            DataField = 'isBayer'
            DataSource = dsCurProp
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox2: TsDBCheckBox
            Left = 96
            Top = 8
            Width = 87
            Height = 19
            Caption = 'Покупатель'
            TabOrder = 1
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
            DataField = 'isSeller'
            DataSource = dsCurProp
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object sDBEdit1: TsDBEdit
            Left = 40
            Top = 28
            Width = 429
            Height = 21
            Color = clWhite
            DataField = 'EmailList'
            DataSource = dsCurProp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
        end
      end
      object pnUn: TsPanel
        Left = 0
        Top = 28
        Width = 470
        Height = 61
        Align = alTop
        Caption = ' '
        TabOrder = 1
        SkinData.SkinSection = 'PANEL'
        object Label2: TsLabel
          Left = 8
          Top = 29
          Width = 89
          Height = 26
          Caption = 'Текст для файла (10 знаков)'
          FocusControl = DBEdit2
          ParentFont = False
          WordWrap = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object Label1: TsLabel
          Left = 8
          Top = 8
          Width = 50
          Height = 13
          Caption = 'Название'
          FocusControl = DBEdit1
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object DBEdit2: TsDBEdit
          Left = 112
          Top = 35
          Width = 121
          Height = 21
          Color = clWhite
          DataField = 'FileName'
          DataSource = dsCurProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object DBEdit1: TsDBEdit
          Left = 112
          Top = 6
          Width = 326
          Height = 21
          Color = clWhite
          DataField = 'ObjName'
          DataSource = dsCurProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sButton1: TsButton
          Left = 233
          Top = 35
          Width = 25
          Height = 22
          Caption = '<='
          TabOrder = 2
          OnClick = sButton1Click
          SkinData.SkinSection = 'BUTTON'
        end
        object btnName: TsButton
          Left = 438
          Top = 6
          Width = 25
          Height = 22
          Caption = '<='
          TabOrder = 3
          OnClick = btnNameClick
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object pnCA1: TsPanel
        Left = 0
        Top = 0
        Width = 470
        Height = 28
        Align = alTop
        Caption = ' '
        TabOrder = 2
        SkinData.SkinSection = 'PANEL'
        object Label3: TsLabel
          Left = 8
          Top = 4
          Width = 87
          Height = 13
          Caption = 'Принадлежность'
          FocusControl = DBEdit3
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
        end
        object DBEdit3: TsDBEdit
          Left = 112
          Top = 2
          Width = 328
          Height = 21
          Color = clWhite
          DataField = 'Pname'
          DataSource = dsCurProp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object Button2: TsButton
          Left = 439
          Top = 2
          Width = 25
          Height = 22
          Caption = '...'
          TabOrder = 1
          OnClick = Button2Click
          SkinData.SkinSection = 'BUTTON'
        end
      end
    end
    object tsInfo: TsTabSheet
      Caption = 'Связи'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      inline fCAInfo1: TfCAInfo
        Width = 470
        Height = 412
        inherited dbgCAInfo: TsDBGrid
          Width = 470
          Height = 412
        end
      end
    end
  end
  object cdsObjProp: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = '@id_Obj'
        ParamType = ptInput
        Value = 1
      end>
    ProviderName = 'cdsObjProp'
    RemoteServer = DM.rsCA
    Left = 32
    Top = 16
    object cdsObjPropPname: TStringField
      FieldName = 'Pname'
      Size = 255
    end
    object cdsObjPropObjTypeName: TStringField
      FieldName = 'ObjTypeName'
      Size = 255
    end
    object cdsObjPropExtID: TIntegerField
      FieldName = 'ExtID'
    end
    object cdsObjPropid_Obj: TIntegerField
      FieldName = 'id_Obj'
    end
    object cdsObjPropid_NS: TIntegerField
      FieldName = 'id_NS'
    end
    object cdsObjPropPID: TIntegerField
      FieldName = 'PID'
    end
    object cdsObjPropid_ObjType: TIntegerField
      FieldName = 'id_ObjType'
    end
    object cdsObjPropObjName: TStringField
      FieldName = 'ObjName'
      Size = 255
    end
    object cdsObjPropFileName: TStringField
      FieldName = 'FileName'
      Size = 255
    end
    object cdsObjPropDeleted: TBooleanField
      FieldName = 'Deleted'
    end
    object cdsObjPropDateStart: TDateTimeField
      FieldName = 'DateStart'
    end
    object cdsObjPropDateStop: TDateTimeField
      FieldName = 'DateStop'
    end
    object cdsObjPropisBayer: TBooleanField
      FieldName = 'isBayer'
    end
    object cdsObjPropisSeller: TBooleanField
      FieldName = 'isSeller'
    end
    object cdsObjPropisDef: TBooleanField
      FieldName = 'isDef'
    end
    object cdsObjPropObj_Digit1: TBCDField
      FieldName = 'Obj_Digit1'
      Precision = 19
    end
    object cdsObjPropObj_Digit2: TBCDField
      FieldName = 'Obj_Digit2'
      Precision = 19
    end
    object cdsObjPropObj_Digit3: TBCDField
      FieldName = 'Obj_Digit3'
      Precision = 19
    end
    object cdsObjPropObj_Digit4: TBCDField
      FieldName = 'Obj_Digit4'
      Precision = 19
    end
    object cdsObjPropObj_Digit5: TBCDField
      FieldName = 'Obj_Digit5'
      Precision = 19
    end
    object cdsObjPropObj_Digit6: TBCDField
      FieldName = 'Obj_Digit6'
      Precision = 19
    end
    object cdsObjPropObj_Digit7: TBCDField
      FieldName = 'Obj_Digit7'
      Precision = 19
    end
    object cdsObjPropObj_Digit8: TBCDField
      FieldName = 'Obj_Digit8'
      Precision = 19
    end
    object cdsObjPropObj_Digit9: TBCDField
      FieldName = 'Obj_Digit9'
      Precision = 19
    end
    object cdsObjPropObj_Digit10: TBCDField
      FieldName = 'Obj_Digit10'
      Precision = 19
    end
    object cdsObjPropObj_Date1: TDateTimeField
      FieldName = 'Obj_Date1'
    end
    object cdsObjPropObj_Date2: TDateTimeField
      FieldName = 'Obj_Date2'
    end
    object cdsObjPropObj_Date3: TDateTimeField
      FieldName = 'Obj_Date3'
    end
    object cdsObjPropObj_Date4: TDateTimeField
      FieldName = 'Obj_Date4'
    end
    object cdsObjPropObj_Date5: TDateTimeField
      FieldName = 'Obj_Date5'
    end
    object cdsObjPropObj_Date6: TDateTimeField
      FieldName = 'Obj_Date6'
    end
    object cdsObjPropObj_Date7: TDateTimeField
      FieldName = 'Obj_Date7'
    end
    object cdsObjPropObj_Date8: TDateTimeField
      FieldName = 'Obj_Date8'
    end
    object cdsObjPropObj_Date9: TDateTimeField
      FieldName = 'Obj_Date9'
    end
    object cdsObjPropObj_Date10: TDateTimeField
      FieldName = 'Obj_Date10'
    end
    object cdsObjPropEmailList: TStringField
      FieldName = 'EmailList'
      Size = 255
    end
    object cdsObjPropid_Dic1: TIntegerField
      FieldName = 'id_Dic1'
    end
    object cdsObjPropid_Dic2: TIntegerField
      FieldName = 'id_Dic2'
    end
    object cdsObjPropid_Dic3: TIntegerField
      FieldName = 'id_Dic3'
    end
    object cdsObjPropid_Dic4: TIntegerField
      FieldName = 'id_Dic4'
    end
    object cdsObjPropid_Dic5: TIntegerField
      FieldName = 'id_Dic5'
    end
    object cdsObjPropid_Dic6: TIntegerField
      FieldName = 'id_Dic6'
    end
    object cdsObjPropid_Dic7: TIntegerField
      FieldName = 'id_Dic7'
    end
    object cdsObjPropid_Dic8: TIntegerField
      FieldName = 'id_Dic8'
    end
    object cdsObjPropid_Dic9: TIntegerField
      FieldName = 'id_Dic9'
    end
    object cdsObjPropid_Dic10: TIntegerField
      FieldName = 'id_Dic10'
    end
  end
  object dsCurProp: TDataSource
    DataSet = cdsObjProp
    Left = 64
    Top = 16
  end
  object cdsWT: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@id_Obj'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID_NS'
        ParamType = ptInput
      end>
    ProviderName = 'dsWT'
    RemoteServer = DM.rsCA
    Left = 32
    Top = 48
    object cdsWTid_Obj: TIntegerField
      FieldName = 'id_Obj'
    end
    object cdsWTObjName: TStringField
      FieldName = 'ObjName'
      Size = 255
    end
    object cdsWTid_Link: TAutoIncField
      FieldName = 'id_Link'
      ReadOnly = True
    end
  end
  object pmInsName: TPopupMenu
    Left = 396
    Top = 52
  end
  object pmInsFile: TPopupMenu
    Left = 324
    Top = 100
  end
  object ActionList1: TActionList
    Images = DM.ilImage
    Left = 125
    Top = 272
    object aNote: TAction
      Caption = 'Блокнот'
      ImageIndex = 40
      OnExecute = aNoteExecute
    end
  end
end
