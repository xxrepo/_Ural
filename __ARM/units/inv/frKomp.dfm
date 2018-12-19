object fKomp: TfKomp
  Left = 0
  Top = 0
  Width = 1182
  Height = 391
  TabOrder = 0
  object lb2: TLabel
    Left = 227
    Top = 1
    Width = 6
    Height = 16
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lb3: TLabel
    Left = 463
    Top = 1
    Width = 6
    Height = 16
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lb4: TLabel
    Left = 703
    Top = 1
    Width = 6
    Height = 16
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lb5: TLabel
    Left = 943
    Top = 1
    Width = 6
    Height = 16
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbMat: TComboBox
    Left = -1
    Top = -1
    Width = 85
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnChange = cbMatChange
    Items.Strings = (
      'Al '
      'OPP'
      'PET'
      'Polifan'
      'Polifan met '
      'PP'
      'PPcast'
      'РЕ')
  end
  object cbW: TComboBox
    Left = 86
    Top = -1
    Width = 52
    Height = 21
    Style = csDropDownList
    DropDownCount = 11
    ItemHeight = 13
    PopupMenu = PopupMenu2
    TabOrder = 1
    OnChange = cbMatChange
    Items.Strings = (
      '12'
      '15'
      '20'
      '30'
      '32'
      '35'
      '40'
      '60'
      '80'
      '90'
      '140')
  end
  object cbColor: TComboBox
    Left = 140
    Top = -1
    Width = 85
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    PopupMenu = PopupMenu3
    TabOrder = 2
    Items.Strings = (
      'cast'
      'бел'
      'бело-мол'
      'жемч'
      'мат'
      'мет'
      'прозр')
  end
  object cbMat2: TComboBox
    Left = 234
    Top = -1
    Width = 85
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 3
    OnChange = cbMatChange
    Items.Strings = (
      'Al '
      'OPP'
      'PET'
      'Polifan'
      'Polifan met '
      'PP'
      'PPcast'
      'РЕ')
  end
  object cbW2: TComboBox
    Left = 321
    Top = -1
    Width = 52
    Height = 21
    Style = csDropDownList
    DropDownCount = 11
    Enabled = False
    ItemHeight = 13
    PopupMenu = PopupMenu2
    TabOrder = 4
    OnChange = cbMatChange
    Items.Strings = (
      '12'
      '15'
      '20'
      '30'
      '32'
      '35'
      '40'
      '60'
      '80'
      '90'
      '140')
  end
  object cbColor2: TComboBox
    Left = 375
    Top = -1
    Width = 85
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    PopupMenu = PopupMenu3
    TabOrder = 5
    Items.Strings = (
      'cast'
      'бел'
      'бело-мол'
      'жемч'
      'мат'
      'мет'
      'прозр')
  end
  object cbMat3: TComboBox
    Left = 472
    Top = -1
    Width = 85
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 6
    OnChange = cbMatChange
    Items.Strings = (
      'Al '
      'OPP'
      'PET'
      'Polifan'
      'Polifan met '
      'PP'
      'PPcast'
      'РЕ')
  end
  object cbW3: TComboBox
    Left = 559
    Top = -1
    Width = 52
    Height = 21
    Style = csDropDownList
    DropDownCount = 11
    Enabled = False
    ItemHeight = 13
    PopupMenu = PopupMenu2
    TabOrder = 7
    OnChange = cbMatChange
    Items.Strings = (
      '12'
      '15'
      '20'
      '30'
      '32'
      '35'
      '40'
      '60'
      '80'
      '90'
      '140')
  end
  object cbColor3: TComboBox
    Left = 613
    Top = -1
    Width = 85
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    PopupMenu = PopupMenu3
    TabOrder = 8
    Items.Strings = (
      'cast'
      'бел'
      'бело-мол'
      'жемч'
      'мат'
      'мет'
      'прозр')
  end
  object cbMat4: TComboBox
    Left = 712
    Top = -1
    Width = 85
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 9
    OnChange = cbMatChange
    Items.Strings = (
      'Al '
      'OPP'
      'PET'
      'Polifan'
      'Polifan met '
      'PP'
      'PPcast'
      'РЕ')
  end
  object cbW4: TComboBox
    Left = 799
    Top = -1
    Width = 52
    Height = 21
    Style = csDropDownList
    DropDownCount = 11
    Enabled = False
    ItemHeight = 13
    PopupMenu = PopupMenu2
    TabOrder = 10
    OnChange = cbMatChange
    Items.Strings = (
      '12'
      '15'
      '20'
      '30'
      '32'
      '35'
      '40'
      '60'
      '80'
      '90'
      '140')
  end
  object cbColor4: TComboBox
    Left = 853
    Top = -1
    Width = 85
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    PopupMenu = PopupMenu3
    TabOrder = 11
    Items.Strings = (
      'cast'
      'бел'
      'бело-мол'
      'жемч'
      'мат'
      'мет'
      'прозр')
  end
  object cbMat5: TComboBox
    Left = 952
    Top = -1
    Width = 85
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    PopupMenu = PopupMenu1
    TabOrder = 12
    OnChange = cbMatChange
    Items.Strings = (
      'Al '
      'OPP'
      'PET'
      'Polifan'
      'Polifan met '
      'PP'
      'PPcast'
      'РЕ')
  end
  object cbW5: TComboBox
    Left = 1039
    Top = -1
    Width = 52
    Height = 21
    Style = csDropDownList
    DropDownCount = 11
    Enabled = False
    ItemHeight = 13
    PopupMenu = PopupMenu2
    TabOrder = 13
    OnChange = cbMatChange
    Items.Strings = (
      '12'
      '15'
      '20'
      '30'
      '32'
      '35'
      '40'
      '60'
      '80'
      '90'
      '140')
  end
  object cbColor5: TComboBox
    Left = 1093
    Top = -1
    Width = 85
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    PopupMenu = PopupMenu3
    TabOrder = 14
    Items.Strings = (
      'cast'
      'бел'
      'бело-мол'
      'жемч'
      'мат'
      'мет'
      'прозр')
  end
  object cdsInvDict: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = '@xType'
        ParamType = ptInput
      end>
    ProviderName = 'dsInvDict'
    RemoteServer = DM.rsCA
    Left = 8
    Top = 24
    object cdsInvDictid_Inv_Dict: TAutoIncField
      FieldName = 'id_Inv_Dict'
      ReadOnly = True
    end
    object cdsInvDictxType: TIntegerField
      FieldName = 'xType'
    end
    object cdsInvDictVal: TStringField
      FieldName = 'Val'
      Size = 50
    end
    object cdsInvDictDeleted: TBooleanField
      FieldName = 'Deleted'
    end
  end
  object cdsInvC: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = '@RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@Komp'
        ParamType = ptInput
      end>
    ProviderName = 'dsInvC'
    RemoteServer = DM.rsCA
    Left = 56
    Top = 24
    object cdsInvCID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object cdsInvCID1: TIntegerField
      FieldName = 'ID1'
    end
    object cdsInvCID2: TIntegerField
      FieldName = 'ID2'
    end
    object cdsInvCID3: TIntegerField
      FieldName = 'ID3'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 104
    Top = 32
    object N1: TMenuItem
      Caption = 'Добавить состав'
      OnClick = N1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 144
    Top = 32
    object N2: TMenuItem
      Caption = 'Добавить толщину'
      OnClick = N2Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 192
    Top = 32
    object N3: TMenuItem
      Caption = 'Добавить цвет'
      OnClick = N3Click
    end
  end
end
