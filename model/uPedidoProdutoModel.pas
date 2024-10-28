unit uPedidoProdutoModel;

interface

uses
  SysUtils;

type
  TPedidoProduto = class
  private
    FID: Integer;
    FQuantidade: Double;
    FValorUnitario: Double;
    FValorTotal: Double;
    FCodigoProduto: Integer;
    FNumeroPedido: Integer;

    // Getters e Setters
    function GetID: Integer;
    procedure SetID(const Value: Integer);

    function GetQuantidade: Double;
    procedure SetQuantidade(const Value: Double);

    function GetValorUnitario: Double;
    procedure SetValorUnitario(const Value: Double);

    function GetValorTotal: Double;
    procedure SetValorTotal(const Value: Double);

    function GetCodigoProduto: Integer;
    procedure SetCodigoProduto(const Value: Integer);

    function GetNumeroPedido: Integer;
    procedure SetNumeroPedido(const Value: Integer);
  public
    // Propriedades
    property ID: Integer read GetID write SetID;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property ValorUnitario: Double read GetValorUnitario write SetValorUnitario;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;
    property CodigoProduto: Integer read GetCodigoProduto write SetCodigoProduto;
    property NumeroPedido: Integer read GetNumeroPedido write SetNumeroPedido;

  end;

implementation

function TPedidoProduto.GetID: Integer;
begin
  Result := FID;
end;

procedure TPedidoProduto.SetID(const Value: Integer);
begin
  FID := Value;
end;

function TPedidoProduto.GetQuantidade: Double;
begin
  Result := FQuantidade;
end;

procedure TPedidoProduto.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

function TPedidoProduto.GetValorUnitario: Double;
begin
  Result := FValorUnitario;
end;

procedure TPedidoProduto.SetValorUnitario(const Value: Double);
begin
  FValorUnitario := Value;
end;

function TPedidoProduto.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

procedure TPedidoProduto.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

function TPedidoProduto.GetCodigoProduto: Integer;
begin
  Result := FCodigoProduto;
end;

procedure TPedidoProduto.SetCodigoProduto(const Value: Integer);
begin
  FCodigoProduto := Value;
end;

function TPedidoProduto.GetNumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

procedure TPedidoProduto.SetNumeroPedido(const Value: Integer);
begin
  FNumeroPedido := Value;
end;

end.

