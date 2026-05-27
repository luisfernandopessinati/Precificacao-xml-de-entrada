object frmPressificacao: TfrmPressificacao
  Left = 0
  Top = 0
  Caption = 'Pressificacao'
  ClientHeight = 654
  ClientWidth = 1201
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1201
    Height = 67
    Align = alTop
    TabOrder = 0
    object edtCaminho: TEdit
      Left = 56
      Top = 25
      Width = 313
      Height = 23
      Enabled = False
      TabOrder = 0
    end
    object Button1: TButton
      Left = 600
      Top = 24
      Width = 123
      Height = 25
      Caption = 'Importar'
      TabOrder = 1
    end
    object Button2: TButton
      Left = 312
      Top = 24
      Width = 57
      Height = 25
      Caption = 'Buscar'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 67
    Width = 1201
    Height = 587
    Align = alClient
    TabOrder = 1
    ExplicitTop = 79
    ExplicitHeight = 581
  end
  object OpenDialog1: TOpenDialog
    Filter = '|.xml'
    Left = 496
    Top = 32
  end
end
