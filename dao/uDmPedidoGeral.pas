unit uDmPedidoGeral;

interface

uses
  SysUtils, Classes, DB, FireDAC.Comp.Client, FireDAC.Stan.Param, uPedidoGeralModel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.DBClient;

type
  TDmPedidoGeral = class(TDataModule)
    query: TFDQuery;
  private
    { Private declarations }
  public
    function GerarNumeroVenda: Integer;
    procedure Pesquisar(sNumeroPedido: Integer);
    function Inserir(oPedido: TPedidoGeral; out sErro: string): Boolean;
    function Excluir(iNumeroPedido: Integer; out sErro: string): Boolean;
  end;

var
  DmPedidoGeral: TDmPedidoGeral;

implementation

uses uDmConexao;

{$R *.dfm}

function TDmPedidoGeral.GerarNumeroVenda: Integer;
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := DmConexao.sqlConexao; // Define a conex�o FireDAC
    FDQuery.SQL.Text := 'SELECT COALESCE(MAX(numero_pedido), 0) + 1 AS SEQ FROM pedidos_dados_gerais'; // Consulta SQL para gerar o pr�ximo n�mero de pedido
    FDQuery.Open;

    Result := FDQuery.FieldByName('SEQ').AsInteger; // Obt�m o valor da sequ�ncia
  finally
    FDQuery.Free; // Libera o objeto FDQuery
  end;
end;

function TDmPedidoGeral.Excluir(iNumeroPedido: Integer; out sErro: string): Boolean;
begin
  Result := False;
  var Transaction := TFDTransaction.Create(nil);
  try
    Transaction.Connection := DmConexao.sqlConexao;
    Transaction.StartTransaction;

    query.SQL.Text := 'DELETE FROM pedidos_dados_gerais WHERE numero_pedido = :NumeroPedido';
    query.ParamByName('NumeroPedido').AsInteger := iNumeroPedido;

    query.ExecSQL;
    Transaction.Commit;
    Result := True;
  except
    on E: Exception do
    begin
      Transaction.Rollback;
      sErro := 'Ocorreu um erro ao excluir o Pedido: ' + sLineBreak + E.Message;
    end;
  end;
  Transaction.Free;
end;

function TDmPedidoGeral.Inserir(oPedido: TPedidoGeral; out sErro: string): Boolean;
begin
  Result := False;
  var Transaction := TFDTransaction.Create(nil);
  try
    Transaction.Connection := DmConexao.sqlConexao;
    Transaction.StartTransaction;

    query.SQL.Text := 'INSERT INTO pedidos_dados_gerais (numero_pedido, data_emissao, valor_total, clientes_codigo) ' +
                           'VALUES (:numero_pedido, :data_emissao, :valor_total, :clientes_codigo)';
    query.ParamByName('numero_pedido').AsInteger := oPedido.NumeroPedido;
    query.ParamByName('data_emissao').AsDate := oPedido.DataEmissao;
    query.ParamByName('valor_total').AsFloat := oPedido.ValorTotal;
    query.ParamByName('clientes_codigo').AsInteger := oPedido.CodigoCliente;

    query.ExecSQL;
    Transaction.Commit;
    Result := True;
  except
    on E: Exception do
    begin
      Transaction.Rollback;
      sErro := 'Ocorreu um erro ao inserir o Pedido: ' + sLineBreak + E.Message;
    end;
  end;
  Transaction.Free;
end;

procedure TDmPedidoGeral.Pesquisar(sNumeroPedido: Integer);
begin
  query.SQL.Text := 'SELECT * FROM pedidos_dados_gerais WHERE numero_pedido LIKE :NumeroPedido';
  query.ParamByName('NumeroPedido').AsInteger := sNumeroPedido;
  query.Open;
end;

end.

