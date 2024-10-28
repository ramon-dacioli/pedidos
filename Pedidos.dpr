program Pedidos;

uses
  Vcl.Forms,
  uFrmPedidoGeral in 'view\uFrmPedidoGeral.pas' {FrmPedidoGeral},
  uDmConexao in 'dao\uDmConexao.pas' {DmConexao: TDataModule},
  uDmCliente in 'dao\uDmCliente.pas' {DmCliente: TDataModule},
  uClienteModel in 'model\uClienteModel.pas',
  uClienteController in 'controller\uClienteController.pas',
  uFrmCliente in 'view\uFrmCliente.pas' {FrmCliente},
  uProdutoModel in 'model\uProdutoModel.pas',
  uDmProduto in 'dao\uDmProduto.pas' {DmProdutos: TDataModule},
  uProdutoController in 'controller\uProdutoController.pas',
  uFrmProduto in 'view\uFrmProduto.pas' {FrmProduto},
  uPedidoGeralModel in 'model\uPedidoGeralModel.pas',
  uDmPedidoGeral in 'dao\uDmPedidoGeral.pas' {DmPedidoGeral: TDataModule},
  uPedidoGeralController in 'controller\uPedidoGeralController.pas',
  uPedidoProdutoModel in 'model\uPedidoProdutoModel.pas',
  uDmPedidoProduto in 'dao\uDmPedidoProduto.pas' {DmPedidoProduto: TDataModule},
  uPedidoProdutoController in 'controller\uPedidoProdutoController.pas',
  uDateUtils in 'helpers\uDateUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPedidoGeral, FrmPedidoGeral);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TDmCliente, DmCliente);
  Application.CreateForm(TFrmCliente, FrmCliente);
  Application.CreateForm(TDmProdutos, DmProdutos);
  Application.CreateForm(TFrmProduto, FrmProduto);
  Application.CreateForm(TDmPedidoGeral, DmPedidoGeral);
  Application.CreateForm(TDmPedidoProduto, DmPedidoProduto);
  Application.Run;
end.
