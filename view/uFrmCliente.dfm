object FrmCliente: TFrmCliente
  Left = 0
  Top = 0
  Caption = 'FrmCliente'
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
    Width = 65
    Height = 15
    Caption = 'Cod. Cliente'
  end
  object Label2: TLabel
    Left = 127
    Top = 15
    Width = 37
    Height = 15
    Caption = 'Cliente'
  end
  object edtPesquisarCodigo: TEdit
    Left = 8
    Top = 37
    Width = 113
    Height = 23
    TabOrder = 0
  end
  object btnPesquisaCliente: TButton
    Left = 536
    Top = 36
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = btnPesquisaClienteClick
  end
  object dbgCliente: TDBGrid
    Left = 8
    Top = 80
    Width = 603
    Height = 193
    DataSource = DataSourceCliente
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = dbgClienteCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 255
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Title.Caption = 'Cidade'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uf'
        Title.Caption = 'Estado'
        Visible = True
      end>
  end
  object edtPesquisarNome: TEdit
    Left = 127
    Top = 36
    Width = 394
    Height = 23
    TabOrder = 3
  end
  object DataSourceCliente: TDataSource
    DataSet = DmCliente.query
    Left = 496
    Top = 176
  end
end
