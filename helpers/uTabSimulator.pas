unit uTabSimulator;

interface

procedure SimularTab;

implementation

uses
  Vcl.Forms, Winapi.Messages;

procedure SimularTab;
begin
  // Envia a mensagem de Tab para o próximo controle focado
  Screen.ActiveForm.Perform(WM_NEXTDLGCTL, 0, 0);
end;

end.

