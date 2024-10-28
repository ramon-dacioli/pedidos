object DmConexao: TDmConexao
  OnCreate = DataModuleCreate
  Height = 235
  Width = 415
  object sqlConexao: TFDConnection
    Left = 192
    Top = 104
  end
  object driver: TFDPhysMySQLDriverLink
    Left = 64
    Top = 80
  end
end
