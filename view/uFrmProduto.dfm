object FrmProduto: TFrmProduto
  Left = 0
  Top = 0
  Caption = 'FrmProduto'
  ClientHeight = 287
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 71
    Height = 15
    Caption = 'Cod. Produto'
  end
  object Label2: TLabel
    Left = 127
    Top = 16
    Width = 51
    Height = 15
    Caption = 'Descri'#231#227'o'
  end
  object edtPesquisaCodigo: TEdit
    Left = 8
    Top = 37
    Width = 113
    Height = 23
    TabOrder = 0
  end
  object btnPesquisar: TButton
    Left = 534
    Top = 36
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = btnPesquisarClick
  end
  object dbgProdutos: TDBGrid
    Left = 8
    Top = 79
    Width = 601
    Height = 194
    DataSource = DataSourceProdutos
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = dbgProdutosCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 420
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco_venda'
        Title.Caption = 'Pre'#231'o Venda'
        Width = 80
        Visible = True
      end>
  end
  object edtPesquisaDescricao: TEdit
    Left = 127
    Top = 37
    Width = 394
    Height = 23
    TabOrder = 3
  end
  object DataSourceProdutos: TDataSource
    DataSet = DmProdutos.query
    Left = 456
    Top = 184
  end
end
