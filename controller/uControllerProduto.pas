unit uControllerProduto;

interface

uses
  System.SysUtils, System.Classes, uModelProduto, FireDAC.Comp.Client, FireDAC.Stan.Option, uDmConexao;

type
  TControllerProduto = class
  public
    // M�todo para inserir um produto
    function Inserir(ADescricao: string; APrecoVenda: Currency): Boolean;

    // M�todo para atualizar um produto
    function Atualizar(ACodigo: Integer; ADescricao: string; APrecoVenda: Currency): Boolean;

    // M�todo para excluir um produto
    function Excluir(ACodigo: Integer): Boolean;

    // M�todo para listar todos os produtos
    function ListarTodos: TFDQuery;
  end;

implementation

{ TControllerProduto }

function TControllerProduto.Inserir(ADescricao: string; APrecoVenda: Currency): Boolean;
var
  Produto: TProduto;
begin
  Result := False;
  DataModule2.FDConnection1.StartTransaction; // Inicia a transa��o
  try
    Produto := TProduto.Create(ADescricao, APrecoVenda);
    try
      Produto.Inserir;
      //DataModule2.FDConnection1.CommitTrans; // Comita a transa��o
      Result := True; // Sucesso na inser��o
    finally
      Produto.Free;
    end;
  except
    on E: Exception do
    begin
      //DataModule2.FDConnection1.RollbackTrans; // Desfaz a transa��o em caso de erro
      Writeln('Erro ao inserir produto: ' + E.Message);
    end;
  end;
end;

function TControllerProduto.Atualizar(ACodigo: Integer; ADescricao: string; APrecoVenda: Currency): Boolean;
var
  Produto: TProduto;
begin
  Result := False;
  DataModule2.FDConnection1.StartTransaction; // Inicia a transa��o
  try
    Produto := TProduto.Create(ADescricao, APrecoVenda, ACodigo);
    try
      Produto.Atualizar;
      //DataModule2.FDConnection1.CommitTrans; // Comita a transa��o
      Result := True; // Sucesso na atualiza��o
    finally
      Produto.Free;
    end;
  except
    on E: Exception do
    begin
      //DataModule2.FDConnection1.RollbackTrans; // Desfaz a transa��o em caso de erro
      Writeln('Erro ao atualizar produto: ' + E.Message);
    end;
  end;
end;

function TControllerProduto.Excluir(ACodigo: Integer): Boolean;
var
  Produto: TProduto;
begin
  Result := False;
  DataModule2.FDConnection1.StartTransaction; // Inicia a transa��o
  try
    Produto := TProduto.Create('', 0, ACodigo); // Passando valores padr�o
    try
      Produto.Excluir;
      //DataModule2.FDConnection1.CommitTrans; // Comita a transa��o
      Result := True; // Sucesso na exclus�o
    finally
      Produto.Free;
    end;
  except
    on E: Exception do
    begin
      //DataModule2.FDConnection1.RollbackTrans; // Desfaz a transa��o em caso de erro
      Writeln('Erro ao excluir produto: ' + E.Message);
    end;
  end;
end;

function TControllerProduto.ListarTodos: TFDQuery;
begin
  // Chama o m�todo ListarTodos do modelo
  Result := TProduto.ListarTodos;
end;

end.

