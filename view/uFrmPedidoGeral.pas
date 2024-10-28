unit uFrmPedidoGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uClienteController,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.Mask, uDateUtils,
  uProdutoController;

type
  TFrmPedidoGeral = class(TForm)
    Label1: TLabel;
    edtNumeroPedido: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Button3: TButton;
    Label4: TLabel;
    edtDescricao: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtQuantidade: TEdit;
    Label7: TLabel;
    edtCodigoCliente: TEdit;
    edtNomeCliente: TEdit;
    StringGrid1: TStringGrid;
    btnPesquisarPedidos: TButton;
    Label8: TLabel;
    edtCidade: TEdit;
    cbxUf: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtDataEmissao: TMaskEdit;
    btnAdicionar: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label12: TLabel;
    edtCodigoProduto: TEdit;
    edtPrecoVenda: TMaskEdit;
    edtPrecoTotal: TMaskEdit;
    btnExcluir: TButton;
    edtValorTotal: TEdit;
    btnPreencherNumeroPedido: TButton;
    btnLimpar: TButton;
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtCodigoClienteExit(Sender: TObject);
    procedure edtCodigoClienteKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure edtCodigoProdutoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtCodigoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarPedidosClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPreencherNumeroPedidoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    FClienteController: TClienteController;
    FProdutoController: TProdutoController;
    procedure Configuracoes;
    procedure Pesquisar;
    procedure PesquisarProduto;
    function PesquisarProdutoDescricao: String;
    procedure PesquisarPedido;
    procedure PesquisarPedidosProdutos;
    procedure Inserir;
    procedure InserirPedidoProduto;
    procedure Gravar();
    procedure AbrirCliente;
    procedure AbrirProduto;
    procedure ExcluirPedidos;
    procedure ExcluirPedidosProdutos;
  public

    procedure CarregarDados(Codigo: Integer; nome: String; Cidade: String; Uf: String);
    procedure ExibirDados;

    procedure CarregarDadosProdutos(Codigo: Integer; Descricao: String; PrecoVenda: Double);
    procedure ExibirDadosProdutos;

    procedure InserirProduto;
    procedure LimparDadosProduto;
    procedure LimparDadosCliente;
    procedure BloquearCamposProduto;
    procedure BloquearCamporCliente;
    procedure LiberarCamposProduto;
    procedure LiberarCamposCliente;
    procedure CalcularPrecoVendaTotal;
    procedure ConsultarPedido;
    procedure LimparCampos;
    function verificarGrid(Grid: TStringGrid): Boolean;
    procedure CarregarNumeroPedido;
    procedure ApagarLinha(StringGrid: TStringGrid; ARow: Integer);
    procedure LimparGrid;
  end;

var
  FrmPedidoGeral: TFrmPedidoGeral;
  SelectedRow, NumeroPedido: Integer;
  PrecoTotal: Double;

implementation

uses
  uFrmCliente, uFrmProduto, uPedidoGeralController, uPedidoGeralModel,
  uPedidoProdutoController, uPedidoProdutoModel, uProdutoModel, uDmCliente,
  uDmProduto, uDmPedidoGeral, uDmPedidoProduto, System.IOUtils;

{$R *.dfm}

{ TForm1 }

procedure TFrmPedidoGeral.AbrirCliente;
begin
  FrmCliente := TFrmCliente.Create(nil);
  try
    FrmCliente.ShowModal;
  finally
    FreeAndNil(FrmCliente);
  end;
end;

procedure TFrmPedidoGeral.AbrirProduto;
begin
  FrmProduto := TFrmProduto.Create(nil);
  try
    FrmProduto.ShowModal;
  finally
    FreeAndNil(FrmProduto);
  end;

end;

procedure TFrmPedidoGeral.ApagarLinha(StringGrid: TStringGrid; ARow: Integer);
var
  i, j: Integer;
begin
  // Desloca as linhas acima da linha a ser deletada
  for i := ARow to StringGrid.RowCount - 2 do
    for j := 0 to StringGrid.ColCount - 1 do
      StringGrid.Cells[j, i] := StringGrid.Cells[j, i + 1];

  // Reduz o n�mero de linhas em 1
  StringGrid.RowCount := StringGrid.RowCount - 1;
end;

procedure TFrmPedidoGeral.BloquearCamporCliente;
begin
  edtNomeCliente.Enabled := False;
  edtCidade.Enabled := False;
  cbxUf.Enabled := False;
end;

procedure TFrmPedidoGeral.BloquearCamposProduto;
begin
  edtDescricao.Enabled := False;
  edtQuantidade.Enabled := False;
  edtPrecoVenda.Enabled := False;
  edtPrecoTotal.Enabled := False;
end;

procedure TFrmPedidoGeral.btnExcluirClick(Sender: TObject);
begin
  ExcluirPedidos;
end;

procedure TFrmPedidoGeral.btnLimparClick(Sender: TObject);
begin
  LimparDadosProduto;
  LimparDadosCliente;
  LimparCampos;
  LimparGrid;
end;

procedure TFrmPedidoGeral.btnPreencherNumeroPedidoClick(Sender: TObject);
begin
  edtNumeroPedido.Text := IntToStr(NumeroPedido);
end;

procedure TFrmPedidoGeral.Button3Click(Sender: TObject);
var
  i, row: Integer;
begin

  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    if StringGrid1.Cells[0, i] = '' then
    begin
      row := 0;
      Break;
    end
    else
    begin
      row := 1 ;
      Break;
    end;
  end;

  if (edtCodigoCliente.Text = '') or (edtNomeCliente.Text = '') or
     (edtCidade.Text = '') or (cbxUf.Text = '') or (edtNumeroPedido.Text = '') or
     (row = 0) then
     begin
      ShowMessage('Preencha todos os campos!');
     end
     else
     begin

      if edtNumeroPedido.Text <> IntToStr(NumeroPedido) then
      begin
        ShowMessage('N�mero do pedido diferente da sequencia!')
      end
      else
      begin
        Gravar();
        LimparDadosCliente;
        LimparCampos;
        LimparGrid;
      end;
     end;
end;

procedure TFrmPedidoGeral.btnPesquisarPedidosClick(Sender: TObject);
begin
  if edtNumeroPedido.Text = '' then
  begin
    ShowMessage('Preencha o n�mero do pedido');
  end
  else
  begin
    LimparDadosCliente;
    LimparDadosProduto;
    LimparGrid;
    PesquisarPedido;

    if edtCodigoCliente.Text <> '' then
    begin
      Pesquisar;
    end;

    PesquisarPedidosProdutos;
  end;
end;

procedure TFrmPedidoGeral.btnAdicionarClick(Sender: TObject);
var
  valorCalculado, total: Double;
  i: Integer;
begin

  valorCalculado := 0;

  if (edtPrecoVenda.Text <> '') and (edtQuantidade.Text <> '') then
  begin
    valorCalculado := StrToFloat(edtQuantidade.Text) * StrToFloat(edtPrecoVenda.Text);
  end;

  if SelectedRow > 0 then
  begin

    if valorCalculado = PrecoTotal then
    begin
      StringGrid1.Cells[2, SelectedRow] := edtQuantidade.Text;
      StringGrid1.Cells[3, SelectedRow] := edtPrecoVenda.Text;

      SelectedRow := 0;

      LimparDadosProduto;

    end
    else
    begin
      ShowMessage('� permitido a altera��o do Vlr Unit�rio e Quantidade, ' +
                  'mas o total deve continuar o mesmo! Valor Calculado: ' +
                   valorCalculado.ToString);
    end;

  end
  else
  begin
    if (edtCodigoProduto.Text <> '') and (edtDescricao.Text <> '') and
    (edtPrecoVenda.Text <> '') and (edtQuantidade.Text <> '') and
    (edtPrecoTotal.Text <> '') then
    begin
      InserirProduto;
      LimparDadosProduto;
      edtCodigoProduto.SetFocus;

      for i := 1 to StringGrid1.RowCount - 1 do
      begin
        total := total + StrToFloat(StringGrid1.Cells[4, i]);
      end;

      edtValorTotal.Text := FloatToStr(total);

    end
    else
    begin
      ShowMessage('Preencha todos os campos!');
    end;
  end;

end;

procedure TFrmPedidoGeral.CalcularPrecoVendaTotal;
begin
  edtPrecoTotal.Text := FormatFloat('0.00', StrToFloat(edtQuantidade.Text) * StrToFloat(edtPrecoVenda.Text));
end;

procedure TFrmPedidoGeral.CarregarDados(Codigo: Integer; Nome: String; Cidade: String; Uf: String);
begin
  try
    with FClienteController do
    begin
      DefinirNome(Nome);
      DefinirCodigo(Codigo);
      DefinirCidade(Cidade);
      DefinirUf(Uf);
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Ocorreu um erro ao definir os dados do cliente: ' + E.Message);
    end;
  end;
end;

procedure TFrmPedidoGeral.CarregarDadosProdutos(Codigo: Integer;
  Descricao: String; PrecoVenda: Double);
begin
  try
    with FProdutoController do
    begin
      DefinirCodigo(Codigo);
      DefinirDescricao(Descricao);
      DefinirPrecoVenda(PrecoVenda);
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Ocorreu um erro ao definir os dados do Produto: ' + E.Message);
    end;
  end;
end;

procedure TFrmPedidoGeral.CarregarNumeroPedido;
begin

end;

procedure TFrmPedidoGeral.Configuracoes;
begin
  // Configurando o n�mero de colunas e linhas no StringGrid
  StringGrid1.ColCount := 5;
  StringGrid1.RowCount := 2;
  StringGrid1.FixedCols := 0;
  StringGrid1.FixedRows := 1;

  // Configurando cabe�alhos das colunas
  StringGrid1.Cells[0, 0] := 'Cod. Produto';
  StringGrid1.Cells[1, 0] := 'Descri��o';
  StringGrid1.Cells[2, 0] := 'Quantidade';
  StringGrid1.Cells[3, 0] := 'Vlr. Unit�rio';
  StringGrid1.Cells[4, 0] := 'Total';

  StringGrid1.ColWidths[0] := 100;
  StringGrid1.ColWidths[1] := 370;
  StringGrid1.ColWidths[2] := 100;
  StringGrid1.ColWidths[3] := 100;
  StringGrid1.ColWidths[4] := 100;

end;

procedure TFrmPedidoGeral.ConsultarPedido;
begin

end;

procedure TFrmPedidoGeral.edtCodigoClienteExit(Sender: TObject);
begin
  if edtCodigoCliente.Text <> '' then
  begin
    Pesquisar;
    btnPesquisarPedidos.Visible := false;
    btnExcluir.Visible := false;
  end
  else
  begin
    btnPesquisarPedidos.Visible := true;
    btnExcluir.Visible := true;
    LimparDadosCliente;
  end;
end;

procedure TFrmPedidoGeral.edtCodigoClienteKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin

    if not edtNomeCliente.Enabled then
    begin
      edtNomeCliente.Enabled := True;
      edtNomeCliente.SetFocus;

      if edtNomeCliente.Text <> '' then
      begin
        edtNomeCliente.Enabled := True;
      end
      else
      begin
        edtNomeCliente.Enabled := False;
      end;

    end
    else
    begin
      edtNomeCliente.SetFocus;
    end;

  end;
end;

procedure TFrmPedidoGeral.edtCodigoProdutoExit(Sender: TObject);
begin
  if edtCodigoProduto.Text <> '' then
  begin
    PesquisarProduto;
  end
  else
  begin
    LimparDadosProduto;
  end;
end;

procedure TFrmPedidoGeral.edtCodigoProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin

    if not edtDescricao.Enabled then
    begin
      edtDescricao.Enabled := True;
      edtDescricao.SetFocus;

      if edtDescricao.Text <> '' then
      begin
        edtDescricao.Enabled := True;
      end
      else
      begin
        edtDescricao.Enabled := False;
      end;

    end
    else
    begin
      edtDescricao.SetFocus;
    end;

    Key := 0;

  end;

end;

procedure TFrmPedidoGeral.edtQuantidadeExit(Sender: TObject);
begin
  if edtQuantidade.Text <> '' then
  begin
    CalcularPrecoVendaTotal;
  end;
end;

procedure TFrmPedidoGeral.ExcluirPedidos;
var
  oPedidoGeralController: TPedidoGeralController;
  sErro: string;
begin
  oPedidoGeralController := TPedidoGeralController.Create;
  try
    if MessageDlg('Deseja realmente excluir esse Pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if oPedidoGeralController.Excluir(StrToInt(edtNumeroPedido.Text), sErro) then
      begin
        ExcluirPedidosProdutos;
      end
      else
      begin
        raise Exception.Create(sErro);
      end;
    end;
  finally
    FreeAndNil(oPedidoGeralController);
  end;
end;

procedure TFrmPedidoGeral.ExcluirPedidosProdutos;
var
  oPedidoProdutolController: TPedidoProdutoController;
  sErro: string;
begin
  oPedidoProdutolController := TPedidoProdutoController.Create;
  try
    if not oPedidoProdutolController.Excluir(StrToInt(edtNumeroPedido.Text), sErro) then
      raise Exception.Create(sErro);

    LimparDadosProduto;
    LimparDadosCliente;
    LimparCampos;
    LimparGrid;

  finally
    FreeAndNil(oPedidoProdutolController);
  end;
end;

procedure TFrmPedidoGeral.ExibirDados;
begin
  try
    edtCodigoCliente.Text := IntToStr(FClienteController.ObterCodigo);
    edtNomeCliente.Text := FClienteController.ObterNome;
    edtCidade.Text := FClienteController.ObterCidade;
    cbxUf.Text := FClienteController.ObterUf;

    LiberarCamposCliente;

  except
    on E: Exception do
    begin
      ShowMessage('Ocorreu um erro ao obter os dados do cliente: ' + E.Message);
    end;
  end;
end;

procedure TFrmPedidoGeral.ExibirDadosProdutos;
begin
  try
    edtCodigoProduto.Text := IntToStr(FProdutoController.ObterCodigo);
    edtDescricao.Text := FProdutoController.ObterDescricao;
    edtPrecoVenda.Text := FloatToStr(FProdutoController.ObterPrecoVenda);

    LiberarCamposProduto;

  except
    on E: Exception do
    begin
      ShowMessage('Ocorreu um erro ao obter os dados do Produto: ' + E.Message);
    end;
  end;
end;

procedure TFrmPedidoGeral.FormCreate(Sender: TObject);
begin
  FClienteController := TClienteController.Create;
  FProdutoController := TProdutoController.Create;
end;

procedure TFrmPedidoGeral.FormDestroy(Sender: TObject);
begin
  FClienteController.Free;
end;

procedure TFrmPedidoGeral.FormShow(Sender: TObject);
begin
  Configuracoes;
  NumeroPedido := DmPedidoGeral.GerarNumeroVenda;

  edtNumeroPedido.Text := IntToStr(NumeroPedido);

end;

procedure TFrmPedidoGeral.Gravar;
var
  oPedidoGeralController: TPedidoGeralController;
  oPedidoProdutoController: TPedidoProdutoController;
begin
  oPedidoGeralController := TPedidoGeralController.Create;
  try
    Inserir;
  finally
    FreeAndNil(oPedidoGeralController);
  end;

  oPedidoProdutoController := TPedidoProdutoController.Create;
  try
    InserirPedidoProduto;
  finally
    FreeAndNil(oPedidoProdutoController);
  end;

end;

procedure TFrmPedidoGeral.Inserir;
var
  oPedido: TPedidoGeral;
  oPedidoGeralController: TPedidoGeralController;
  sErro: string;
begin
  oPedido := TPedidoGeral.Create;
  oPedidoGeralController := TPedidoGeralController.Create;
  try
    with oPedido do
    begin
      NumeroPedido := StrToInt(edtNumeroPedido.Text);
      DataEmissao := StringToDate(edtDataEmissao.Text);
      ValorTotal := StrToFloat(edtValorTotal.Text);
      CodigoCliente := StrToInt(edtCodigoCliente.Text);
    end;
    if oPedidoGeralController.Inserir(oPedido, sErro) = False then
      raise Exception.Create(sErro);

    NumeroPedido := DmPedidoGeral.GerarNumeroVenda;

  finally
    FreeAndNil(oPedidoGeralController);
    FreeAndNil(oPedido);
  end;
end;

procedure TFrmPedidoGeral.InserirPedidoProduto;
var
  oPedido: TPedidoProduto;
  oPedidoProdutoController: TPedidoProdutoController;
  sErro: string;
  i: Integer;
begin
  oPedido := TPedidoProduto.Create;
  oPedidoProdutoController := TPedidoProdutoController.Create;
  try

    for i := 1 to StringGrid1.RowCount - 1 do
    begin

      with oPedido do
      begin
        Quantidade := StrToFloat(StringGrid1.Cells[2, i]);
        ValorUnitario := StrToFloat(StringGrid1.Cells[3, i]);
        ValorTotal := StrToFloat(StringGrid1.Cells[4, i]);
        CodigoProduto := StrToInt(StringGrid1.Cells[0, i]);
        NumeroPedido := StrToInt(edtNumeroPedido.Text);
      end;
      if oPedidoProdutoController.Inserir(oPedido, sErro) = False then
        raise Exception.Create(sErro);

    end;
  finally
    FreeAndNil(oPedidoProdutoController);
    FreeAndNil(oPedido);
  end;
end;

procedure TFrmPedidoGeral.InserirProduto;
var
  row: Integer;
begin

  row := StringGrid1.RowCount - 1;
  if StringGrid1.Cells[0, row] <> '' then
  begin
    StringGrid1.RowCount := StringGrid1.RowCount + 1;
    row := StringGrid1.RowCount - 1;
  end;

  StringGrid1.Cells[0, row] := edtCodigoProduto.Text;
  StringGrid1.Cells[1, row] := edtDescricao.Text;
  StringGrid1.Cells[2, row] := edtQuantidade.Text;
  StringGrid1.Cells[3, row] := edtPrecoVenda.Text;
  StringGrid1.Cells[4, row] := edtPrecoTotal.Text;

end;

procedure TFrmPedidoGeral.LiberarCamposCliente;
begin
  edtNomeCliente.Enabled := True;
  edtCidade.Enabled := True;
  cbxUf.Enabled := True;
end;

procedure TFrmPedidoGeral.LiberarCamposProduto;
begin
  edtDescricao.Enabled := True;
  edtQuantidade.Enabled := True;
  edtPrecoVenda.Enabled := True;
  edtPrecoTotal.Enabled := True;
end;

procedure TFrmPedidoGeral.LimparCampos;
begin
  edtNumeroPedido.Text := '';
  edtDataEmissao.Text := '';
  edtValorTotal.Text := '';

  btnPesquisarPedidos.Visible := true;
  btnExcluir.Visible := true;

end;

procedure TFrmPedidoGeral.LimparDadosCliente;
begin
  edtCodigoCliente.Text := '';
  edtNomeCliente.Text := '';
  edtCidade.Text := '';
  cbxUf.Text := '';
end;

procedure TFrmPedidoGeral.LimparDadosProduto;
begin
  edtCodigoProduto.Text := '';
  edtDescricao.Text := '';
  edtQuantidade.Text := '';
  edtPrecoVenda.Text := '';
  edtPrecoTotal.Text := '';
end;

procedure TFrmPedidoGeral.LimparGrid;
var
  i: Integer;
begin
  for i := 1 to StringGrid1.RowCount - 1 do // Come�a de 1 para n�o limpar o cabe�alho
  begin
    StringGrid1.Rows[i].Clear; // Limpa a linha
  end;

  StringGrid1.RowCount := 1;
end;

procedure TFrmPedidoGeral.Pesquisar;
var
  oClienteController: TClienteController;
begin
  oClienteController := TClienteController.Create;
  try
    oClienteController.PesquisarCodigo(StrToInt(edtCodigoCliente.Text));

    LiberarCamposCliente;

    if DmCliente.query.IsEmpty then
    begin
      ShowMessage('Cliente n�o encontrado.');
      BloquearCamporCliente;
      LimparDadosCliente;
      Exit;
    end;

    while not DmCliente.query.Eof do
    begin
      edtCodigoCliente.Text := DmCliente.query.FieldByName('Codigo').AsString;
      edtNomeCliente.Text := DmCliente.query.FieldByName('Nome').AsString;
      edtCidade.Text := DmCliente.query.FieldByName('Cidade').AsString;
      cbxUf.Text := DmCliente.query.FieldByName('Uf').AsString;

      DmCliente.query.Next;
    end;

  finally
    FreeAndNil(oClienteController);
    DmCliente.query.close;
  end;
end;

procedure TFrmPedidoGeral.PesquisarPedido;
var
  oPedidoGeralController: TPedidoGeralController;
begin
  oPedidoGeralController := TPedidoGeralController.Create;
  try
    oPedidoGeralController.Pesquisar(StrToInt(edtNumeroPedido.Text));

    if DmPedidoGeral.query.IsEmpty then
    begin
      ShowMessage('Pedido n�o encontrado.');
      Exit;
    end;

    while not DmPedidoGeral.query.Eof do
    begin
      edtCodigoCliente.Text := DmPedidoGeral.query.FieldByName('clientes_codigo').AsString;
      edtDataEmissao.Text := ' !' + DmPedidoGeral.query.FieldByName('data_emissao').AsString;
      edtValorTotal.Text := DmPedidoGeral.query.FieldByName('valor_total').AsString;

      DmPedidoGeral.query.Next;
    end;

  finally
    FreeAndNil(oPedidoGeralController);
    DmPedidoGeral.query.close;
  end;
end;

procedure TFrmPedidoGeral.PesquisarPedidosProdutos;
var
  oPedidoProdutoController: TPedidoProdutoController;
  row: Integer;
begin
  oPedidoProdutoController := TPedidoProdutoController.Create;
  try
    oPedidoProdutoController.Pesquisar(StrToInt(edtNumeroPedido.Text));

    if DmPedidoProduto.query.IsEmpty then
    begin
      ShowMessage('Produtos n�o encontrado.');
      Exit;
    end;

    row := 0;

    while not DmPedidoProduto.query.Eof do
    begin

      row := StringGrid1.RowCount - 1;
      if StringGrid1.Cells[0, row] <> '' then
      begin
        StringGrid1.RowCount := StringGrid1.RowCount + 1;
        row := StringGrid1.RowCount - 1;
      end;

      if DmPedidoProduto.query.RecordCount = 1 then
      begin
        row := 1;
      end;

      StringGrid1.Cells[0, row] := DmPedidoProduto.query.FieldByName('produtos_codigo').AsString;
      StringGrid1.Cells[1, row] := PesquisarProdutoDescricao;
      StringGrid1.Cells[2, row] := DmPedidoProduto.query.FieldByName('quantidade').AsString;
      StringGrid1.Cells[3, row] := DmPedidoProduto.query.FieldByName('valor_unitario').AsString;
      StringGrid1.Cells[4, row] := DmPedidoProduto.query.FieldByName('valor_total').AsString;

      DmPedidoProduto.query.Next;
    end;

  finally
    FreeAndNil(oPedidoProdutoController);
    DmPedidoProduto.query.close;
  end;
end;

procedure TFrmPedidoGeral.PesquisarProduto;
var
  oProdutoController: TProdutoController;
begin
  oProdutoController := TProdutoController.Create;
  try
    oProdutoController.PesquisarCodigo(StrToInt(edtCodigoProduto.Text));

    LiberarCamposProduto;

    if DmProdutos.query.IsEmpty then
    begin
      ShowMessage('Produto n�o encontrado.');

      BloquearCamposProduto;
      LimparDadosProduto;

      Exit;
    end;

    while not DmProdutos.query.Eof do
    begin
      edtCodigoProduto.Text := DmProdutos.query.FieldByName('codigo').AsString;
      edtDescricao.Text := DmProdutos.query.FieldByName('descricao').AsString;
      edtPrecoVenda.Text := DmProdutos.query.FieldByName('preco_venda').AsString;

      DmProdutos.query.Next;
    end;

  finally
    FreeAndNil(oProdutoController);
    DmProdutos.query.close;
  end;
end;

function TFrmPedidoGeral.PesquisarProdutoDescricao: String;
var
  oProdutoController: TProdutoController;
begin
  oProdutoController := TProdutoController.Create;
  try
    oProdutoController.PesquisarCodigo(DmPedidoProduto.query.FieldByName('produtos_codigo').AsInteger);

    LiberarCamposProduto;

    if DmProdutos.query.IsEmpty then
    begin
      Result := '';
      Exit;
    end;

    while not DmProdutos.query.Eof do
    begin

      Result := DmProdutos.query.FieldByName('descricao').AsString;

      DmProdutos.query.Next;
    end;

  finally
    FreeAndNil(oProdutoController);
    DmProdutos.query.close;
  end;
end;

procedure TFrmPedidoGeral.SpeedButton1Click(Sender: TObject);
begin
  AbrirProduto;
end;

procedure TFrmPedidoGeral.SpeedButton2Click(Sender: TObject);
begin
  AbrirCliente;
end;

procedure TFrmPedidoGeral.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  data: string;
  newID, newName, newAge: string;
  total: double;
  i:integer;
begin
  // Verifica se a tecla pressionada � o Enter
  if Key = VK_RETURN then
  begin
    // Verifica se existe uma linha selecionada
    if SelectedRow > 0 then
    begin
      edtQuantidade.Text := StringGrid1.Cells[2, SelectedRow];
      edtPrecoVenda.Text := StringGrid1.Cells[3, SelectedRow];
      PrecoTotal := StrToFloat(StringGrid1.Cells[4, SelectedRow]);
    end;

    // Impede que o som padr�o do Enter seja executado
    Key := 0;
  end;

  if Key = VK_DELETE then
  begin
    // Verifica se uma linha est� selecionada
    if SelectedRow > 0 then
    begin
      ApagarLinha(StringGrid1, SelectedRow);
      SelectedRow := -1; // Reseta a vari�vel de linha selecionada, se necess�rio

      total := 0;

      for i := 1 to StringGrid1.RowCount - 1 do
      begin
        total := total + StrToFloat(StringGrid1.Cells[4, i]);
      end;
      
      edtValorTotal.Text := FloatToStr(total);

    end;
  end;

end;

procedure TFrmPedidoGeral.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Verifica se a tecla pressionada � uma seta
  if (Key = VK_UP) or (Key = VK_DOWN) then
  begin
    // Obtem a linha atual
    SelectedRow := StringGrid1.Row;
  end;
end;

procedure TFrmPedidoGeral.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: LongInt; var CanSelect: Boolean);
begin
  if ARow > 0 then
    SelectedRow := ARow;
end;

function TFrmPedidoGeral.verificarGrid(Grid: TStringGrid): Boolean;
var
  i, j: Integer;
  RowIsEmpty: Boolean;
begin
  // Percorre todas as linhas
  for i := 0 to Grid.RowCount - 1 do
  begin
    RowIsEmpty := True;
    // Verifica se a linha cont�m alguma c�lula preenchida
    for j := 0 to Grid.ColCount - 1 do
    begin
      if Grid.Cells[j, i] <> '' then
      begin
        RowIsEmpty := False;
        Break;
      end;
    end;

    // Se uma linha tiver conte�do, o StringGrid n�o est� vazio
    if not RowIsEmpty then
    begin
      Result := False;
      Exit;
    end;
  end;

  // Se nenhuma linha tiver conte�do, considera vazio
  Result := True;
end;

end.
