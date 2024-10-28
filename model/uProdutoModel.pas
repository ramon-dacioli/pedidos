unit uProdutoModel;

interface

uses
  SysUtils;

type
  TProduto = class
  private
    FCodigo: Integer;
    FDescricao: string;
    FPrecoVenda: Double;
  public

    function GetCodigo: Integer;
    procedure SetCodigo(const Value: Integer);

    function GetDescricao: String;
    procedure SetDescricao(const Value: string);

    function GetPrecoVenda: Double;
    procedure SetPrecoVenda(const Value: Double);

    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write SetDescricao;
    property PrecoVenda: Double read FPrecoVenda write FPrecoVenda;
  end;

implementation

function TProduto.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TProduto.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TProduto.GetPrecoVenda: Double;
begin
  Result := FPrecoVenda;
end;

procedure TProduto.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProduto.SetPrecoVenda(const Value: Double);
begin
  FPrecoVenda := Value;
end;

end.

