unit uPedidoGeralController;

interface

uses
  uPedidoGeralModel;

type
  TPedidoGeralController = class
    procedure Pesquisar(sNumeroPedido: Integer);
    function Inserir(oPedido: TPedidoGeral; var sErro: String): Boolean;
    function Excluir(iNumeroPedido: Integer; var sErro: String): Boolean;
  end;

implementation

uses uDmPedidoGeral, SysUtils;

function TPedidoGeralController.Excluir(iNumeroPedido: Integer; var sErro: String): Boolean;
begin
  Result := DmPedidoGeral.Excluir(iNumeroPedido, sErro);
end;

function TPedidoGeralController.Inserir(oPedido: TPedidoGeral; var sErro: String): Boolean;
begin
  Result := DmPedidoGeral.Inserir(oPedido, sErro);
end;

procedure TPedidoGeralController.Pesquisar(sNumeroPedido: Integer);
begin
  DmPedidoGeral.Pesquisar(sNumeroPedido);
end;

end.

