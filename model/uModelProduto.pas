unit uModelProduto;

interface

uses
  System.SysUtils, System.Classes, uDmConexao, FireDAC.Comp.Client;

type
  TProduto = class
  private
    FCodigo: Integer;
    FDescricao: string;
    FPrecoVenda: Currency; // Alterado para PrecoVenda
    // Fun��o para setar os par�metros na query
    procedure SetParams(FDQuery: TFDQuery);
  public
    constructor Create(ADescricao: string; APrecoVenda: Currency; ACodigo: Integer = 0);

    // M�todos CRUD
    procedure Inserir;
    procedure Atualizar;
    procedure Excluir;
    class function ListarTodos: TFDQuery;

    // Propriedades para acessar os campos
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property PrecoVenda: Currency read FPrecoVenda write FPrecoVenda; // Alterado para PrecoVenda
  end;

implementation

{ TProduto }

constructor TProduto.Create(ADescricao: string; APrecoVenda: Currency; ACodigo: Integer = 0);
begin
  FCodigo := ACodigo;
  FDescricao := ADescricao;
  FPrecoVenda := APrecoVenda; // Alterado para PrecoVenda
end;

procedure TProduto.SetParams(FDQuery: TFDQuery);
begin
  FDQuery.ParamByName('Codigo').AsInteger := FCodigo; // Par�metro Codigo
  FDQuery.ParamByName('Descricao').AsString := FDescricao; // Par�metro Descricao
  FDQuery.ParamByName('PrecoVenda').AsCurrency := FPrecoVenda; // Alterado para PrecoVenda
end;

procedure TProduto.Inserir;
begin
  // Preparando a Query de Inser��o
  with DataModule2.FDQuery1 do
  begin
    SQL.Text := 'INSERT INTO Produto (Descricao, PrecoVenda) VALUES (:Descricao, :PrecoVenda)'; // Alterado para PrecoVenda
    SetParams(DataModule2.FDQuery1);
    ExecSQL;
  end;
end;

procedure TProduto.Atualizar;
begin
  // Preparando a Query de Atualiza��o
  with DataModule2.FDQuery1 do
  begin
    SQL.Text := 'UPDATE Produto SET Descricao = :Descricao, PrecoVenda = :PrecoVenda WHERE Codigo = :Codigo'; // Alterado para PrecoVenda
    SetParams(DataModule2.FDQuery1);
    ExecSQL;
  end;
end;

procedure TProduto.Excluir;
begin
  // Preparando a Query de Exclus�o
  with DataModule2.FDQuery1 do
  begin
    SQL.Text := 'DELETE FROM Produto WHERE Codigo = :Codigo'; // Mantendo a condi��o por Codigo
    ParamByName('Codigo').AsInteger := FCodigo;
    ExecSQL;
  end;
end;

class function TProduto.ListarTodos: TFDQuery;
begin
  // Preparando a Query de Sele��o
  with DataModule2.FDQuery1 do
  begin
    SQL.Text := 'SELECT * FROM Produto';
    Open;
    Result := DataModule2.FDQuery1;
  end;
end;

end.

