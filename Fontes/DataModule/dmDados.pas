unit dmDados;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, ExtCtrls, StdCtrls,
  IniFiles, Windows, Forms, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs;

type
  TDados = class(TDataModule)
    FDCon_Dados: TFDConnection;
    FDQ_Clientes: TFDQuery;
    FDQ_Contas: TFDQuery;
    FDT_Clientes: TFDTable;
    FDT_Contas: TFDTable;
    FDT_Clientesid_cliente: TFDAutoIncField;
    FDT_Clientesnome_cliente: TStringField;
    FDT_Clientescli_email: TStringField;
    FDT_Clientescli_telefone: TStringField;
    FDT_Contasid_conta: TFDAutoIncField;
    FDT_Contasid_cliente: TIntegerField;
    FDT_Contasdt_cadastro: TStringField;
    FDT_Contasvalor_conta: TStringField;
    FDT_Contasdt_vencimento: TStringField;
    FDT_Contasdt_notificar: TStringField;
    FDT_Contascliente_notificado: TStringField;
    FDT_Contascaminho_boleto: TStringField;
    FDT_Contascaminho_nf: TStringField;
    FDT_Contassituacao_atual: TStringField;
    FDT_Contaspode_notificar: TStringField;
    FDT_Contasmensagem: TStringField;
    FDT_ContasNomeCliente: TStringField;
    FDQ_Registro: TFDQuery;
    FDT_Registro: TFDTable;
    FDT_Registroid_registro: TIntegerField;
    FDT_Registrodt_registro: TStringField;
    FDT_Registroempresa: TStringField;
    FDT_Registroemail_empresa: TStringField;
    FDT_Registrotelefone: TStringField;
    FDT_Registrodt_inicio_uso: TStringField;
    FDT_Registrostatus_registro: TStringField;
    FDT_Registrolocal_instalacao: TStringField;
    FDT_Registroassunto_email: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDCon_DadosAfterConnect(Sender: TObject);
    procedure FDCon_DadosBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dados: TDados;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}



procedure TDados.DataModuleCreate(Sender: TObject);
begin
  FDCon_Dados.Connected := True;
end;

procedure TDados.FDCon_DadosAfterConnect(Sender: TObject);
begin
  FDQ_Clientes.ExecSQL;
  FDT_Clientes.Active := True;

  FDQ_Contas.ExecSQL;
  FDT_Contas.Active := True;

  FDQ_Registro.ExecSQL;
  FDT_Registro.Active := True;

end;

procedure TDados.FDCon_DadosBeforeConnect(Sender: TObject);
begin
  FDCon_Dados.Params.Database := ExtractFilePath(ParamStr(0))+'Dados.sdb';
end;

end.
