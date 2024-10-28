unit uDateUtils;

interface

uses
  System.SysUtils, System.DateUtils;

function StringToDate(const ADateStr: string; const AFormat: string = 'dd/mm/yyyy'): TDate;

implementation

function StringToDate(const ADateStr: string; const AFormat: string = 'dd/mm/yyyy'): TDate;
var
  LDate: TDateTime;
  FormatSettings: TFormatSettings;
begin
  FormatSettings := TFormatSettings.Create;
  FormatSettings.ShortDateFormat := AFormat; // Define o formato de data desejado

  // Tenta converter a string para TDateTime com o formato especificado
  if TryStrToDate(ADateStr, LDate, FormatSettings) then
    Result := DateOf(LDate)
  else
    raise Exception.Create('Formato de data inválido: ' + ADateStr);
end;

end.

