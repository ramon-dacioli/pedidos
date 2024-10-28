unit uConversorData;

interface

uses
  System.SysUtils;

function ConverterData(const Data: string): string;

implementation

function ConverterData(const Data: string): string;
var
  DataFormatada: TDateTime;
begin
  // Converte a string no formato dd/mm/yyyy para TDateTime
  DataFormatada := StrToDate(Data);

  // Converte TDateTime para o formato yyyy-mm-dd
  Result := FormatDateTime('yyyy-mm-dd', DataFormatada);
end;

end.

