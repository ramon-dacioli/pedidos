unit uProdutoController;

interface

uses
  uProdutoModel;

type
  TProdutoController = class
  private
    FProduto: TProduto;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Pesquisar(sDescricao: string);
    procedure PesquisarCodigo(sCodigo: Integer);

    function ObterCodigo: Integer;
    procedure DefinirCodigo(const Value: Integer);

    function ObterDescricao: String;
    procedure DefinirDescricao(const Value: String);

    function ObterPrecoVenda: Double;
    procedure DefinirPrecoVenda(const Value: Double);

  end;

implementation

uses uDmProduto, SysUtils;

constructor TProdutoController.Create;
begin
  FProduto := TProduto.Create;
end;

procedure TProdutoController.DefinirCodigo(const Value: Integer);
begin
  FProduto.Codigo := Value;
end;

procedure TProdutoController.DefinirDescricao(const Value: String);
begin
  FProduto.Descricao := Value;
end;

procedure TProdutoController.DefinirPrecoVenda(const Value: Double);
begin
  FProduto.PrecoVenda := Value;
end;

destructor TProdutoController.Destroy;
begin
  FProduto.Free;
  inherited;
end;

function TProdutoController.ObterCodigo: Integer;
begin
  Result := FProduto.Codigo;
end;

function TProdutoController.ObterDescricao: String;
begin
  Result := FProduto.Descricao;
end;

function TProdutoController.ObterPrecoVenda: Double;
begin
  Result := FProduto.PrecoVenda;
end;

//constructor TProdutoController.Create;
//begin
//  DmProduto := TDmProduto.Create(nil);
//end;

//destructor TProdutoController.Destroy;
//begin
//  FreeAndNil(DmProduto);
// inherited;
//end;

procedure TProdutoController.Pesquisar(sDescricao: string);
begin
  DmProdutos.Pesquisar(sDescricao);
end;

procedure TProdutoController.PesquisarCodigo(sCodigo: Integer);
begin
  DmProdutos.PesquisarCodigo(sCodigo);
end;

end.

