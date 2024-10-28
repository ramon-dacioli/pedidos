unit uFrmProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids, uDmProduto,
  Vcl.DBGrids;

type
  TFrmProduto = class(TForm)
    Label1: TLabel;
    edtPesquisaCodigo: TEdit;
    btnPesquisar: TButton;
    dbgProdutos: TDBGrid;
    DataSourceProdutos: TDataSource;
    edtPesquisaDescricao: TEdit;
    Label2: TLabel;
    procedure btnPesquisarClick(Sender: TObject);
    procedure dbgProdutosCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar;
    procedure PesquisarCodigo;
    procedure CarregarProduto;
    procedure ObterDadosProduto;
  end;

var
  FrmProduto: TFrmProduto;

implementation

uses
  uProdutoController, uFrmPedidoGeral;

{$R *.dfm}

{ TFrmProduto }

procedure TFrmProduto.btnPesquisarClick(Sender: TObject);
begin
  if (edtPesquisaCodigo.Text <> '') and (edtPesquisaDescricao.Text <> '') then
  begin
    ShowMessage('Preencha somente um campo para a pesquisa!');
  end
  else if (edtPesquisaCodigo.Text = '') and (edtPesquisaDescricao.Text = '') then
       begin
         Pesquisar;
       end
       else if edtPesquisaDescricao.Text <> '' then
           begin
            Pesquisar;
           end
           else
           begin
             PesquisarCodigo;
           end;
end;

procedure TFrmProduto.CarregarProduto;
begin

end;

procedure TFrmProduto.dbgProdutosCellClick(Column: TColumn);
begin
  ObterDadosProduto;
end;

procedure TFrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DmProdutos.query.close;
end;

procedure TFrmProduto.ObterDadosProduto;
begin
  FrmPedidoGeral.CarregarDadosProdutos( dbgProdutos.Fields[0].Value,
                                        dbgProdutos.Fields[1].Value,
                                        dbgProdutos.Fields[2].Value
  );

  FrmPedidoGeral.ExibirDadosProdutos;
end;

procedure TFrmProduto.Pesquisar;
var
  oProdutoController: TProdutoController;
begin
  oProdutoController := TProdutoController.Create;
  try
    oProdutoController.Pesquisar(edtPesquisaDescricao.Text);
  finally
    FreeAndNil(oProdutoController);
  end;
end;

procedure TFrmProduto.PesquisarCodigo;
var
  oProdutoController: TProdutoController;
begin
  oProdutoController := TProdutoController.Create;
  try
    oProdutoController.PesquisarCodigo(StrToInt(edtPesquisaCodigo.Text));
  finally
    FreeAndNil(oProdutoController);
  end;
end;

end.
