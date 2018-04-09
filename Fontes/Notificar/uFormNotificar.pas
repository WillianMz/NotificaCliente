unit uFormNotificar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  //Units Necessárias
  IniFiles,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdHTTP,
  IdBaseComponent,
  IdMessage,
  IdExplicitTLSClientServerBase,
  IdMessageClient,
  IdSMTPBase,
  IdSMTP,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL,
  IdSSLOpenSSL,
  IdAttachmentFile,
  IdText, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFormNotificar = class(TForm)
    BarraDeProgresso: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FormNotificar: TFormNotificar;

implementation

{$R *.dfm}

{ TFormNotificar }



end.
