unit uDmPedidoProduto;

interface

uses
  SysUtils, Classes, DB, FireDAC.Comp.Client, FireDAC.Stan.Param, uPedidoProdutoModel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.DBClient;

type
  TDmPedidoProduto = class(TDataModule)
    query: TFDQuery;
  private
    { Private declarations }
  public
    procedure Pesquisar(sNumeroPedido: Integer);
    function Inserir(oPedidoProduto: TPedidoProduto; out sErro: string): Boolean;
    function Excluir(iID: Integer; out sErro: string): Boolean;
  end;

var
  DmPedidoProduto: TDmPedidoProduto;

implementation

uses uDmConexao; // Supondo que o DmConexao contém o TFDConnection

{$R *.dfm}

function TDmPedidoProduto.Excluir(iID: Integer; out sErro: string): Boolean;
begin
  Result := False;
  var Transaction := TFDTransaction.Create(nil);
  try
    Transaction.Connection := DmConexao.sqlConexao;
    Transaction.StartTransaction;

    query.SQL.Text := 'DELETE FROM pedidos_produtos WHERE pedidos_dados_gerais_numero_pedido = :NumeroPedido';
    query.ParamByName('NumeroPedido').AsInteger := iID;

    query.ExecSQL;
    Transaction.Commit;
    Result := True;
  except
    on E: Exception do
    begin
      Transaction.Rollback;
      sErro := 'Ocorreu um erro ao excluir os produtos: ' + sLineBreak + E.Message;
    end;
  end;
  Transaction.Free;
end;

function TDmPedidoProduto.Inserir(oPedidoProduto: TPedidoProduto; out sErro: string): Boolean;
begin
  Result := False;
  var Transaction := TFDTransaction.Create(nil);
  try
    Transaction.Connection := DmConexao.sqlConexao;
    Transaction.StartTransaction;

    query.SQL.Text := 'INSERT INTO pedidos_produtos (quantidade, valor_unitario, valor_total, produtos_codigo, pedidos_dados_gerais_numero_pedido) ' +
                           'VALUES (:quantidade, :valor_unitario, :valor_total, :produtos_codigo, :pedidos_dados_gerais_numero_pedido)';
    query.ParamByName('quantidade').AsFloat := oPedidoProduto.Quantidade;
    query.ParamByName('valor_unitario').AsFloat := oPedidoProduto.ValorUnitario;
    query.ParamByName('valor_total').AsFloat := oPedidoProduto.ValorTotal;
    query.ParamByName('produtos_codigo').AsInteger := oPedidoProduto.CodigoProduto;
    query.ParamByName('pedidos_dados_gerais_numero_pedido').AsInteger := oPedidoProduto.NumeroPedido;

    query.ExecSQL;
    Transaction.Commit;
    Result := True;
  except
    on E: Exception do
    begin
      Transaction.Rollback;
      sErro := 'Ocorreu um erro ao inserir o PedidoProduto: ' + sLineBreak + E.Message;
    end;
  end;
  Transaction.Free;
end;

procedure TDmPedidoProduto.Pesquisar(sNumeroPedido: Integer);
begin
  query.SQL.Text := 'SELECT * FROM pedidos_produtos WHERE pedidos_dados_gerais_numero_pedido = :NumeroPedido';
  query.ParamByName('NumeroPedido').AsInteger := sNumeroPedido;
  query.Open;
end;

end.

