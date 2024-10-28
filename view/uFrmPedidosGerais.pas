unit uFrmPedidosGerais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uControllerProduto;

type
  TForm1 = class(TForm)
    btnInserir: TButton;
    EditDescricao: TEdit;
    EditPrecoVenda: TEdit;
    procedure btnInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FController: TControllerProduto;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{ TForm1 }

procedure TForm1.btnInserirClick(Sender: TObject);
var
  Descricao: string;
  PrecoVenda: Currency;
begin
  Descricao := EditDescricao.Text;
  // Verifica se o valor inserido em PrecoVenda é um número válido
  if TryStrToCurr(EditPrecoVenda.Text, PrecoVenda) then
  begin
    // Chama o método Inserir da controller
    if FController.Inserir(Descricao, PrecoVenda) then
      ShowMessage('Produto inserido com sucesso!')
    else
      ShowMessage('Falha ao inserir produto.');
  end
  else
  begin
    ShowMessage('Por favor, insira um valor válido para o preço.');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FController := TControllerProduto.Create; // Instancia o controller
end;

end.
