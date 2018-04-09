program wnNotificaCliente;

uses
  Vcl.Forms,
  uFormPrincipal in 'Fontes\Principal\uFormPrincipal.pas' {FormPrincipal},
  dmDados in 'Fontes\DataModule\dmDados.pas' {Dados: TDataModule},
  uFormClientes in 'Fontes\Clientes\uFormClientes.pas' {FormClientes},
  uFormConta in 'Fontes\Conta\uFormConta.pas' {FormConta},
  uEnviarEmailGmail in 'Fontes\EnviarEmail\uEnviarEmailGmail.pas' {FormEnviarEmail},
  uFormConf in 'Fontes\Conf\uFormConf.pas' {FormConf},
  uFormNotificar in 'Fontes\Notificar\uFormNotificar.pas' {FormNotificar},
  Vcl.Themes,
  Vcl.Styles,
  uFormRegistro in 'Fontes\Log_Registro\uFormRegistro.pas' {FormRegistro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.Title := 'Notifica';
  Application.CreateForm(TDados, Dados);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormConta, FormConta);
  Application.CreateForm(TFormClientes, FormClientes);
  Application.CreateForm(TFormEnviarEmail, FormEnviarEmail);
  Application.CreateForm(TFormConf, FormConf);
  Application.CreateForm(TFormNotificar, FormNotificar);
  Application.CreateForm(TFormRegistro, FormRegistro);
  Application.Run;
end.
