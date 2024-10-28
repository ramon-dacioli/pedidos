unit uPedidoProdutoController;

interface

uses
  uPedidoProdutoModel;

type
  TPedidoProdutoController = class
  public
    procedure Pesquisar(sNumeroPedido: Integer);
    function Inserir(oPedidoProduto: TPedidoProduto; var sErro: String): Boolean;
    function Excluir(iID: Integer; var sErro: String): Boolean;
  end;

implementation

uses
  uDmPedidoProduto, SysUtils;

function TPedidoProdutoController.Excluir(iID: Integer;
  var sErro: String): Boolean;
begin
  Result := DmPedidoProduto.Excluir(iID, sErro);
end;

function TPedidoProdutoController.Inserir(oPedidoProduto: TPedidoProduto;
  var sErro: String): Boolean;
begin
  Result := DmPedidoProduto.Inserir(oPedidoProduto, sErro);
end;

procedure TPedidoProdutoController.Pesquisar(sNumeroPedido: Integer);
begin
  DmPedidoProduto.Pesquisar(sNumeroPedido);
end;

end.

