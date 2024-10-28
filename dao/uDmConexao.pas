unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  IniFiles;

type
  TDmConexao = class(TDataModule)
    sqlConexao: TFDConnection;
    driver: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ConfigurarConexao;
  public
    { Public declarations }
  end;

var
  DmConexao: TDmConexao;

implementation

uses
  System.IOUtils;

{$R *.dfm}

procedure TDmConexao.DataModuleCreate(Sender: TObject);
begin
  ConfigurarConexao;
end;

procedure TDmConexao.ConfigurarConexao;
var
  Ini: TIniFile;
  ArquivoIni: string;
begin
  ArquivoIni := TPath.GetDirectoryName(TPath.GetDirectoryName(TPath.GetDirectoryName(ExtractFilePath(ParamStr(0))))) + '\config.ini';
  Ini := TIniFile.Create(ArquivoIni);
  try

    driver.VendorLib := Ini.ReadString('Database', 'Lib', '');

    sqlConexao.Params.DriverID := Ini.ReadString('Database', 'DriverID', '');
    sqlConexao.Params.Database := Ini.ReadString('Database', 'Database', '');
    sqlConexao.Params.UserName := Ini.ReadString('Database', 'User_Name', '');
    sqlConexao.Params.Password := Ini.ReadString('Database', 'Password', '');
    sqlConexao.Params.Add('Server=' + Ini.ReadString('Database', 'Server', ''));
    sqlConexao.Params.Add('Port=' + Ini.ReadString('Database', 'Port', ''));
  finally
    Ini.Free;
  end;

  // Ativando a conex�o
  sqlConexao.Connected := True;
end;

end.

