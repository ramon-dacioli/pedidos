unit uPedidoGeralModel;

interface

uses
  SysUtils;

type
  TPedidoGeral = class
  private
    FNumeroPedido: Integer;
    FDataEmissao: TDate;
    FValorTotal: Double;
    FCodigoCliente: Integer;
  public

    function GetNumeroPedido: Integer;
    procedure SetNumeroPedido(const Value: Integer);
    function GetDataEmissao: TDate;
    procedure SetDataEmissao(const Value: TDate);
    function GetValorTotal: Double;
    procedure SetValorTotal(const Value: Double);
    function GetCodigoCliente: Integer;
    procedure SetCodigoCliente(const Value: Integer);

    property NumeroPedido: Integer read GetNumeroPedido write SetNumeroPedido;
    property DataEmissao: TDate read GetDataEmissao write SetDataEmissao;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;
    property CodigoCliente: Integer read GetCodigoCliente write SetCodigoCliente;
  end;

implementation

{ TPedidoGeral }

function TPedidoGeral.GetNumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

procedure TPedidoGeral.SetNumeroPedido(const Value: Integer);
begin
  FNumeroPedido := Value;
end;

function TPedidoGeral.GetDataEmissao: TDate;
begin
  Result := FDataEmissao;
end;

procedure TPedidoGeral.SetDataEmissao(const Value: TDate);
begin
  FDataEmissao := Value;
end;

function TPedidoGeral.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

procedure TPedidoGeral.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

function TPedidoGeral.GetCodigoCliente: Integer;
begin
  Result := FCodigoCliente;
end;

procedure TPedidoGeral.SetCodigoCliente(const Value: Integer);
begin
  FCodigoCliente := Value;
end;

end.

