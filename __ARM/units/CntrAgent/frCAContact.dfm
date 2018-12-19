object fCAContact: TfCAContact
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  object Label1: TLabel
    Left = 7
    Top = 8
    Width = 86
    Height = 13
    Caption = 'Контактное лицо'
  end
  object Label2: TLabel
    Left = 7
    Top = 32
    Width = 58
    Height = 13
    Caption = 'Должность'
  end
  object Label3: TLabel
    Left = 7
    Top = 80
    Width = 27
    Height = 13
    Caption = 'e-mail'
  end
  object Label4: TLabel
    Left = 7
    Top = 56
    Width = 45
    Height = 13
    Caption = 'Телефон'
  end
  object edFIO: TEdit
    Left = 99
    Top = 6
    Width = 213
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 255
    TabOrder = 0
  end
  object edPost: TEdit
    Left = 99
    Top = 30
    Width = 213
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 50
    TabOrder = 1
  end
  object edPhone: TEdit
    Left = 99
    Top = 54
    Width = 213
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 50
    TabOrder = 2
  end
  object edMail: TEdit
    Left = 99
    Top = 78
    Width = 213
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 50
    TabOrder = 3
  end
end
