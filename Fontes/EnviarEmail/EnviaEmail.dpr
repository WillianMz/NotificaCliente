program EnviaEmail;

uses
  Vcl.Forms,
  uEnviarEmailGmail in 'uEnviarEmailGmail.pas' {FormEnviarEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormEnviarEmail, FormEnviarEmail);
  Application.Run;
end.
