unit uDmProduto;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uProdutoModel, uDmConexao;

type
  TDmProdutos = class(TDataModule)
    query: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar(sDescricao: string);
    procedure PesquisarCodigo(sCodigo: Integer);
  end;

var
  DmProdutos: TDmProdutos;

implementation

{$R *.dfm}

procedure TDmProdutos.Pesquisar(sDescricao: string);
begin
  query.SQL.Text := 'SELECT * FROM produtos WHERE descricao LIKE :Descricao';
  query.ParamByName('Descricao').AsString := '%' + sDescricao + '%';
  query.Open;
end;

procedure TDmProdutos.PesquisarCodigo(sCodigo: Integer);
begin
  query.SQL.Text := 'SELECT * FROM produtos WHERE codigo = :Codigo';
  query.ParamByName('Codigo').AsInteger := sCodigo;
  query.Open;
end;

end.
