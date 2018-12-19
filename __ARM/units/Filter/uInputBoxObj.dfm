object FrmInputBoxObj: TFrmInputBoxObj
  Left = 239
  Top = 109
  ActiveControl = FilterEdit
  BorderStyle = bsDialog
  Caption = 'Выбор объекта'
  ClientHeight = 293
  ClientWidth = 436
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 45
    Width = 436
    Height = 207
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    OnCheckButton = RxDBGrid1CheckButton
    OnGetBtnParams = RxDBGrid1GetBtnParams
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Наименование'
        Width = 391
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 252
    Width = 436
    Height = 41
    Align = alBottom
    Caption = ' '
    TabOrder = 1
    object btnOk: TButton
      Left = 254
      Top = 9
      Width = 75
      Height = 25
      Action = aOk
      Anchors = [akRight, akBottom]
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 347
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Отмена'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object FilterPanel: TPanel
    Left = 0
    Top = 0
    Width = 436
    Height = 45
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 6
      Width = 32
      Height = 13
      Caption = 'Поиск'
    end
    object SpeedButton1: TSpeedButton
      Left = 394
      Top = 2
      Width = 34
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD0000000000
        FDFDFDFDFD0000000000FD00FF000000FDFDFDFDFD00FF000000FD00FF000000
        FDFDFDFDFD00FF000000FD00000000000000FD00000000000000FD0000FF0000
        00000000FF0000000000FD0000FF000000080000FF0000000000FD0000FF0000
        00080000FF0000000000FDFD00000000000000000000000000FDFDFDFD00FF00
        0000FD00FF000000FDFDFDFDFD0000000000FD0000000000FDFDFDFDFDFD0000
        00FDFDFD000000FDFDFDFDFDFDFD00FF00FDFDFD00FF00FDFDFDFDFDFDFD0000
        00FDFDFD000000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object Label2: TLabel
      Left = 16
      Top = 28
      Width = 32
      Height = 13
      Caption = 'Label2'
    end
    object FilterEdit: TEdit
      Left = 168
      Top = 1
      Width = 225
      Height = 21
      TabOrder = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsObj
    OnDataChange = DataSource1DataChange
    Left = 56
    Top = 88
  end
  object ActionList1: TActionList
    Left = 224
    Top = 136
    object aOk: TAction
      Caption = 'OK'
      Enabled = False
      OnExecute = aOkExecute
    end
  end
  object cdsObj: TClientDataSet
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
        DataType = ftString
        Name = '@Name'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@ID'
        ParamType = ptInput
      end>
    ProviderName = 'dsObj'
    OnFilterRecord = cdsObjFilterRecord
    Left = 104
    Top = 64
    object cdsObjID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object cdsObjName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 255
    end
    object cdsObjid_bsn: TIntegerField
      FieldName = 'id_bsn'
      ReadOnly = True
    end
  end
end
