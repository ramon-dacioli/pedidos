unit uFrmCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, uDmCliente,
  Vcl.StdCtrls, uFrmPedidoGeral;

type
  TFrmCliente = class(TForm)
    Label1: TLabel;
    edtPesquisarCodigo: TEdit;
    btnPesquisaCliente: TButton;
    dbgCliente: TDBGrid;
    DataSourceCliente: TDataSource;
    edtPesquisarNome: TEdit;
    Label2: TLabel;
    procedure btnPesquisaClienteClick(Sender: TObject);
    procedure dbgClienteCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar;
    procedure PesquisarCodigo;
    procedure CarregarCliente;
    procedure ObterDadosCliente;
  end;

var
  FrmCliente: TFrmCliente;

implementation

uses
  uClienteController;

{$R *.dfm}

procedure TFrmCliente.btnPesquisaClienteClick(Sender: TObject);
begin
  if (edtPesquisarCodigo.Text <> '') and (edtPesquisarNome.Text <> '') then
  begin
    ShowMessage('Preencha somente um campo para a pesquisa!');
  end
  else if (edtPesquisarCodigo.Text = '') and (edtPesquisarNome.Text = '') then
       begin
         Pesquisar;
       end
       else if edtPesquisarNome.Text <> '' then
           begin
            Pesquisar;
           end
           else
           begin
             PesquisarCodigo;
           end;
end;

procedure TFrmCliente.CarregarCliente;
begin

end;

procedure TFrmCliente.dbgClienteCellClick(Column: TColumn);
begin
  ObterDadosCliente;
end;

procedure TFrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DmCliente.query.close;
end;

procedure TFrmCliente.ObterDadosCliente;
begin
  FrmPedidoGeral.CarregarDados( dbgCliente.Fields[0].Value,
                                dbgCliente.Fields[1].Value,
                                dbgCliente.Fields[2].Value,
                                dbgCliente.Fields[3].Value
  );

  FrmPedidoGeral.ExibirDados;
end;

procedure TFrmCliente.Pesquisar;
var
  oClienteController: TClienteController;
begin
  oClienteController := TClienteController.Create;
  try
    oClienteController.Pesquisar(edtPesquisarNome.Text);
  finally
  FreeAndNil(oClienteController);
  end;
end;

procedure TFrmCliente.PesquisarCodigo;
var
  oClienteController: TClienteController;
begin
  oClienteController := TClienteController.Create;
  try
    oClienteController.PesquisarCodigo(StrToInt(edtPesquisarCodigo.Text));
  finally
  FreeAndNil(oClienteController);
  end;
end;

end.
