unit uDmCliente;

interface

uses
  SysUtils, Classes, DB, FireDAC.Comp.Client, FireDAC.Stan.Param, uClienteModel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.DBClient;

type
  TDmCliente = class(TDataModule)
    query: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Pesquisar(sNome: string);
    procedure PesquisarCodigo(sCodigo: Integer);
  end;

var
  DmCliente: TDmCliente;

implementation

uses uDmConexao; // Supondo que o DmConexao contém o TFDConnection

{$R *.dfm}

procedure TDmCliente.DataModuleCreate(Sender: TObject);
begin
  try
    if Assigned(DmConexao) and Assigned(DmConexao.sqlConexao) and DmConexao.sqlConexao.Connected then
    begin
      query.Connection := DmConexao.sqlConexao;
    end
    else
    begin
      raise Exception.Create('A conexão não está disponível ou não foi criada.');
    end;
  except
    on E: Exception do
  end;

end;

procedure TDmCliente.Pesquisar(sNome: string);
begin
  query.SQL.Text := 'SELECT * FROM clientes WHERE nome LIKE :Nome';
  query.ParamByName('Nome').AsString := '%' + sNome + '%';
  query.Open;
end;

procedure TDmCliente.PesquisarCodigo(sCodigo: Integer);
begin
  query.SQL.Text := 'SELECT * FROM clientes WHERE codigo = :Codigo';
  query.ParamByName('Codigo').AsInteger := sCodigo;
  query.Open;
end;

end.

