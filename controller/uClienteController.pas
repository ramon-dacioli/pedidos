unit uClienteController;

interface

uses
  uClienteModel;

type
  TClienteController = class
  private
    FCliente: TCliente;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Pesquisar (sNome: string);

    procedure PesquisarCodigo (sCodigo: Integer);

    function ObterCodigo: Integer;
    procedure DefinirCodigo(const Value: Integer);

    function ObterNome: string;
    procedure DefinirNome(const Value: string);

    function ObterCidade: string;
    procedure DefinirCidade(const Value: string);

    function ObterUf: string;
    procedure DefinirUf(const Value: string);

  end;

implementation

uses uDmCliente, SysUtils;

constructor TClienteController.Create;
begin
  FCliente := TCliente.Create;
end;

procedure TClienteController.DefinirCidade(const Value: string);
begin
  FCliente.Cidade := Value;
end;

procedure TClienteController.DefinirCodigo(const Value: Integer);
begin
  FCliente.Codigo := Value;
end;

procedure TClienteController.DefinirNome(const Value: string);
begin
  FCliente.Nome := Value;
end;

procedure TClienteController.DefinirUf(const Value: string);
begin
  FCliente.UF := Value;
end;

destructor TClienteController.Destroy;
begin
  FCliente.Free;
  inherited;
end;

function TClienteController.ObterCidade: string;
begin
  Result := FCliente.Cidade;
end;

function TClienteController.ObterCodigo: Integer;
begin
  Result := FCliente.Codigo;
end;

function TClienteController.ObterNome: string;
begin
  Result := FCliente.Nome;
end;

function TClienteController.ObterUf: string;
begin
  Result := FCliente.UF;
end;

procedure TClienteController.Pesquisar(sNome: string);
begin
  DmCliente.Pesquisar(sNome);
end;

procedure TClienteController.PesquisarCodigo(sCodigo: Integer);
begin
  DmCliente.PesquisarCodigo(sCodigo);
end;

end.
