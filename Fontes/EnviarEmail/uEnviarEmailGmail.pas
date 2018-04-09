unit uEnviarEmailGmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
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
  IdText;

type
  TFormEnviarEmail = class(TForm)
    Assunto: TLabel;
    Mensagem: TLabel;
    Anexo: TLabel;
    EDT_Assunto: TEdit;
    BTN_Enviar: TButton;
    BTN_Anexar: TButton;
    OpenDialog1: TOpenDialog;
    mem_Mensagem: TMemo;
    Label1: TLabel;
    edt_Anexo: TEdit;
    procedure BTN_EnviarClick(Sender: TObject);
    procedure BTN_AnexarClick(Sender: TObject);
    //procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  function EnviarEmail(const AAssunto, ADestino, AAnexo: String; ACorpo: TStrings): Boolean;
  public
    { Public declarations }
  end;

var
  FormEnviarEmail: TFormEnviarEmail;



implementation

{$R *.dfm}

{ TFormEnviarEmail }

procedure TFormEnviarEmail.BTN_AnexarClick(Sender: TObject);
begin
  OpenDialog1.Execute;
  edt_Anexo.Text := OpenDialog1.FileName;
end;

procedure TFormEnviarEmail.BTN_EnviarClick(Sender: TObject);
var
  Para : String;
begin
  Para := 'willianmz.wn@gmail.com';

  if EnviarEmail(EDT_Assunto.Text, Para, edt_Anexo.Text, mem_Mensagem.Lines) then
    ShowMessage('Tudo ok!')
  else
    ShowMessage('Não foi possivel enviar seu Feedback!');
end;

function TFormEnviarEmail.EnviarEmail(const AAssunto, ADestino, AAnexo: String;
  ACorpo: TStrings): Boolean;
var
  IniFile              : TIniFile;
  sFrom                : String;
  sBccList             : String;
  sHost                : String;
  iPort                : Integer;
  sUserName            : String;
  sPassword            : String;

  idMsg                : TIdMessage;
  IdText               : TIdText;
  idSMTP               : TIdSMTP;
  IdSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
begin
  try
    try
      //Criação e leitura do arquivo INI com as configurações
      IniFile                          := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.wn');
      sFrom                            := IniFile.ReadString('Email' , 'From'     , sFrom);
      sBccList                         := IniFile.ReadString('Email' , 'BccList'  , sBccList);
      sHost                            := IniFile.ReadString('Email' , 'Host'     , sHost);
      iPort                            := IniFile.ReadInteger('Email', 'Port'     , iPort);
      sUserName                        := IniFile.ReadString('Email' , 'UserName' , sUserName);
      sPassword                        := IniFile.ReadString('Email' , 'Password' , sPassword);

      //Configura os parâmetros necessários para SSL
      IdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocket.SSLOptions.Mode  := sslmClient;

      //Variável referente a mensagem
      idMsg                            := TIdMessage.Create(Self);
      idMsg.CharSet                    := 'utf-8';
      idMsg.Encoding                   := meMIME;
      idMsg.From.Name                  := 'WN Notifica Cliente';
      idMsg.From.Address               := sFrom;
      idMsg.Priority                   := mpNormal;
      idMsg.Subject                    := AAssunto;

      //Add Destinatário(s)
      idMsg.Recipients.Add;
      idMsg.Recipients.EMailAddresses := ADestino;
      idMsg.CCList.EMailAddresses      := 'willianmz.wn@gmail.com';
      idMsg.BccList.EMailAddresses    := sBccList;
      //idMsg.BccList.EMailAddresses    := 'willianmz.wn@gmail.com'; //Cópia Oculta

      //Variável do texto
      idText := TIdText.Create(idMsg.MessageParts);
      idText.Body.Add(ACorpo.Text);
      idText.ContentType := 'text/html; text/plain; charset=iso-8859-1';

      //Prepara o Servidor
      IdSMTP                           := TIdSMTP.Create(Self);
      IdSMTP.IOHandler                 := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS                    := utUseImplicitTLS;
      IdSMTP.AuthType                  := satDefault;
      IdSMTP.Host                      := sHost;
      IdSMTP.AuthType                  := satDefault;
      IdSMTP.Port                      := iPort;
      IdSMTP.Username                  := sUserName;
      IdSMTP.Password                  := sPassword;

      //Conecta e Autentica
      IdSMTP.Connect;
      IdSMTP.Authenticate;

      if AAnexo <> EmptyStr then
        if FileExists(AAnexo) then
          TIdAttachmentFile.Create(idMsg.MessageParts, AAnexo);

      //Se a conexão foi bem sucedida, envia a mensagem
      if IdSMTP.Connected then
      begin
        try
          IdSMTP.Send(idMsg);
        except on E:Exception do
          begin
            ShowMessage('Erro ao tentar enviar: ' + E.Message);
          end;
        end;
      end;

      //Depois de tudo pronto, desconecta do servidor SMTP
      if IdSMTP.Connected then
        IdSMTP.Disconnect;

      Result := True;
    finally
      IniFile.Free;

      UnLoadOpenSSLLibrary;

      FreeAndNil(idMsg);
      FreeAndNil(IdSSLIOHandlerSocket);
      FreeAndNil(idSMTP);
    end;
  except on e:Exception do
    begin
      Result := False;
    end;
  end;
end;

{
procedure TFormEnviarEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FormEnviarEmail := Nil;
end;   }

end.
