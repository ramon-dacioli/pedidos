unit uClienteModel;

interface

uses
  SysUtils;

type
  TCliente = class
  private
    FCodigo: Integer;
    FNome: string;
    FCidade: string;
    FUF: string;
  public

    function GetCodigo: Integer;
    procedure SetCodigo(const Value: Integer);

    function GetNome: string;
    procedure SetNome(const Value: string);

    function GetCidade: string;
    procedure SetCidade(const Value: string);

    function GetUf: string;
    procedure SetUf(const Value: string);

    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read GetNome write SetNome;
    property Cidade: string read FCidade write FCidade;
    property UF: string read FUF write FUF;

  end;

implementation

function TCliente.GetCidade: string;
begin
  Result := FCidade;
end;

function TCliente.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TCliente.GetNome: string;
begin
  Result := FNome;
end;

function TCliente.GetUf: string;
begin
  Result := FUF;
end;

procedure TCliente.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TCliente.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TCliente.SetUf(const Value: string);
begin
  FUF := Value;
end;

end.

