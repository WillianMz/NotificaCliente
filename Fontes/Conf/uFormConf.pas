unit uFormConf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IniFiles, Data.DB,
  Vcl.Mask, Vcl.DBCtrls;

type
  TFormConf = class(TForm)
    edtEmail: TEdit;
    edtHost: TEdit;
    edtPorta: TEdit;
    edtSenha: TEdit;
    edtEmailLista: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnGravar: TButton;
    btnLer: TButton;
    edtEmailPadrao: TEdit;
    Label6: TLabel;
    lblAssunto: TLabel;
    Label7: TLabel;
    DS_Registro: TDataSource;
    DBEdt_AsuntoEmail: TDBEdit;
    procedure btnLerClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConf: TFormConf;

implementation

{$R *.dfm}

procedure TFormConf.btnGravarClick(Sender: TObject);
var
  IniFile : TIniFile;
  Email, Senha, Host, EmailSecundario, sFrom: String;
  Porta : Integer;
begin
  Email := edtEmail.Text;
  Senha:= edtSenha.Text;
  Host:= edtHost.Text;
  Porta:= StrToInt(edtPorta.Text);
  EmailSecundario := edtEmailLista.Text;
  sFrom := edtEmailPadrao.Text;


  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.wn');
  //Email                            := IniFile.ReadString('Email' , 'From'     , sFrom);
  IniFile.WriteString('Email','BccLista',EmailSecundario);
  IniFile.WriteString('Email' , 'Host'     , Host);
  IniFile.WriteInteger('Email', 'Port'     , Porta);
  IniFile.WriteString('Email' , 'UserName' , Email);
  IniFile.WriteString('Email' , 'Password' , Senha);
  IniFile.WriteString('Email' , 'From'     , sFrom);
  //IniFile.WriteString('Email', 'AssuntoEmail', AssuntoEmail);

  DS_Registro.DataSet.Edit;
  DBEdt_AsuntoEmail.Text;
  DS_Registro.DataSet.Post;

  ShowMessage('Dados gravados com sucesso!');

  edtEmail.Clear;
  edtHost.Clear;
  edtPorta.Clear;
  edtSenha.Clear;
  edtEmailLista.Clear;
  edtEmailPadrao.Clear;
  DS_Registro.DataSet.Close;


end;

procedure TFormConf.btnLerClick(Sender: TObject);
var
  IniFile : TIniFile;
  Email, Senha, Host, EmailSecundario, sFrom: String;
  Porta : Integer;
begin
  IniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.wn');
  //Email                            := IniFile.ReadString('Email' , 'From'     , sFrom);
  EmailSecundario:= IniFile.ReadString('Email' , 'BccLista'  , EmailSecundario);
  Host := IniFile.ReadString('Email' , 'Host'     , Host);
  Porta := IniFile.ReadInteger('Email', 'Port'     , Porta);
  Email := IniFile.ReadString('Email' , 'Username' , Email);
  Senha := IniFile.ReadString('Email' , 'Password' , Senha);
  sFrom := IniFile.ReadString('Email' , 'From'     , sFrom);
  //AssuntoEmail := IniFile.ReadString('Email', 'AssuntoEmail', AssuntoEmail);

  DS_Registro.DataSet.Open;
  DS_Registro.DataSet.Edit;
  DBEdt_AsuntoEmail.Text;


  edtEmail.Text := Email;
  edtSenha.Text := Senha;
  edtHost.Text := Host;
  edtPorta.Text := IntToStr(Porta);
  edtEmailLista.Text := EmailSecundario;
  edtEmailPadrao.Text := sFrom;
  //edtAssuntoEmail.Text := AssuntoEmail;

end;

procedure TFormConf.FormShow(Sender: TObject);
begin
  DS_Registro.DataSet.Close;
end;

end.

