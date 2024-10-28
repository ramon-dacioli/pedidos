object FrmPedidoGeral: TFrmPedidoGeral
  Left = 0
  Top = 0
  Caption = 'FrmPedidoGeral'
  ClientHeight = 488
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 9
    Top = 62
    Width = 84
    Height = 15
    Caption = 'N'#250'mero Pedido'
  end
  object Label2: TLabel
    Left = 136
    Top = 62
    Width = 24
    Height = 15
    Caption = 'Data'
  end
  object Label3: TLabel
    Left = 637
    Top = 445
    Width = 25
    Height = 15
    Caption = 'Total'
  end
  object Label4: TLabel
    Left = 133
    Top = 128
    Width = 43
    Height = 15
    Caption = 'Produto'
  end
  object Label5: TLabel
    Left = 433
    Top = 129
    Width = 62
    Height = 15
    Caption = 'Vlr. Unit'#225'rio'
  end
  object Label6: TLabel
    Left = 534
    Top = 128
    Width = 62
    Height = 15
    Caption = 'Quantidade'
  end
  object Label7: TLabel
    Left = 613
    Top = 128
    Width = 25
    Height = 15
    Caption = 'Total'
  end
  object Label8: TLabel
    Left = 9
    Top = 8
    Width = 65
    Height = 15
    Caption = 'Cod. Cliente'
  end
  object Label9: TLabel
    Left = 129
    Top = 8
    Width = 37
    Height = 15
    Caption = 'Cliente'
  end
  object Label10: TLabel
    Left = 480
    Top = 8
    Width = 37
    Height = 15
    Caption = 'Cidade'
  end
  object Label11: TLabel
    Left = 724
    Top = 8
    Width = 35
    Height = 15
    Caption = 'Estado'
  end
  object SpeedButton1: TSpeedButton
    Left = 97
    Top = 148
    Width = 23
    Height = 22
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 97
    Top = 29
    Width = 23
    Height = 22
    OnClick = SpeedButton2Click
  end
  object Label12: TLabel
    Left = 8
    Top = 128
    Width = 71
    Height = 15
    Caption = 'Cod. Produto'
  end
  object edtNumeroPedido: TEdit
    Left = 9
    Top = 83
    Width = 121
    Height = 23
    TabOrder = 4
  end
  object Button3: TButton
    Left = 344
    Top = 441
    Width = 113
    Height = 25
    Caption = 'GRAVAR PEDIDO'
    TabOrder = 12
    OnClick = Button3Click
  end
  object edtDescricao: TEdit
    Left = 126
    Top = 149
    Width = 296
    Height = 23
    TabOrder = 7
  end
  object edtQuantidade: TEdit
    Left = 534
    Top = 149
    Width = 73
    Height = 23
    TabOrder = 9
    OnExit = edtQuantidadeExit
  end
  object edtCodigoCliente: TEdit
    Left = 9
    Top = 29
    Width = 81
    Height = 23
    TabOrder = 0
    OnExit = edtCodigoClienteExit
    OnKeyUp = edtCodigoClienteKeyUp
  end
  object edtNomeCliente: TEdit
    Left = 126
    Top = 29
    Width = 348
    Height = 23
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 200
    Width = 786
    Height = 225
    TabOrder = 13
    OnKeyDown = StringGrid1KeyDown
    OnKeyUp = StringGrid1KeyUp
    OnSelectCell = StringGrid1SelectCell
  end
  object btnPesquisarPedidos: TButton
    Left = 263
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 14
    OnClick = btnPesquisarPedidosClick
  end
  object edtCidade: TEdit
    Left = 484
    Top = 29
    Width = 234
    Height = 23
    TabOrder = 2
  end
  object cbxUf: TComboBox
    Left = 720
    Top = 29
    Width = 74
    Height = 23
    TabOrder = 3
    Text = 'Selecione'
    Items.Strings = (
      'Selecione'
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'ES'
      'GO'
      'MA'
      'MT'
      'MS'
      'MG'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SP'
      'SE'
      'TO'
      'DF')
  end
  object edtDataEmissao: TMaskEdit
    Left = 136
    Top = 83
    Width = 109
    Height = 23
    EditMask = ' !99/99/0000;1;_'
    MaxLength = 11
    TabOrder = 5
    Text = '   /  /    '
  end
  object btnAdicionar: TButton
    Left = 719
    Top = 148
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 11
    OnClick = btnAdicionarClick
  end
  object edtCodigoProduto: TEdit
    Left = 8
    Top = 149
    Width = 81
    Height = 23
    TabOrder = 6
    OnExit = edtCodigoProdutoExit
    OnKeyDown = edtCodigoProdutoKeyDown
  end
  object edtPrecoVenda: TMaskEdit
    Left = 428
    Top = 149
    Width = 99
    Height = 23
    TabOrder = 8
    Text = ''
  end
  object edtPrecoTotal: TMaskEdit
    Left = 614
    Top = 149
    Width = 100
    Height = 23
    TabOrder = 10
    Text = ''
  end
  object btnExcluir: TButton
    Left = 347
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 15
    OnClick = btnExcluirClick
  end
  object edtValorTotal: TEdit
    Left = 673
    Top = 442
    Width = 121
    Height = 23
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
  end
  object btnPreencherNumeroPedido: TButton
    Left = 9
    Top = 441
    Width = 121
    Height = 25
    Caption = 'Preencher N'#176' Pedido'
    TabOrder = 17
    OnClick = btnPreencherNumeroPedidoClick
  end
  object btnLimpar: TButton
    Left = 136
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 18
    OnClick = btnLimparClick
  end
end
