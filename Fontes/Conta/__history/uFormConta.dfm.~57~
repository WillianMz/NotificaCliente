object FormConta: TFormConta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Conta'
  ClientHeight = 494
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCodConta: TLabel
    Left = 8
    Top = 32
    Width = 23
    Height = 13
    Caption = 'C'#243'd.'
  end
  object lblCodCliente: TLabel
    Left = 99
    Top = 32
    Width = 59
    Height = 13
    Caption = 'C'#243'd. Cliente'
  end
  object lblNomeCliente: TLabel
    Left = 174
    Top = 32
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object lblValorConta: TLabel
    Left = 382
    Top = 80
    Width = 71
    Height = 13
    Caption = 'Valor da Conta'
  end
  object lblDtVencimento: TLabel
    Left = 527
    Top = 32
    Width = 69
    Height = 13
    Caption = 'Dt Vencimento'
  end
  object lblDtNotificar: TLabel
    Left = 527
    Top = 80
    Width = 58
    Height = 13
    Caption = 'Dt. Notificar'
  end
  object lblNotificado: TLabel
    Left = 8
    Top = 80
    Width = 48
    Height = 13
    Caption = 'Notificado'
  end
  object lblDtCadastro: TLabel
    Left = 72
    Top = 80
    Width = 62
    Height = 13
    Caption = 'Dt. Cadastro'
  end
  object lblCaminhoBoleto: TLabel
    Left = 8
    Top = 129
    Width = 89
    Height = 13
    Caption = 'Caminho do Boleto'
  end
  object lblCaminhoNF: TLabel
    Left = 8
    Top = 183
    Width = 94
    Height = 13
    Caption = 'Caminho NF(Danfe)'
  end
  object lblMensagem: TLabel
    Left = 8
    Top = 239
    Width = 186
    Height = 13
    Caption = 'Mensagem que ser'#225' enviada ao cliente'
  end
  object lblSituacao: TLabel
    Left = 199
    Top = 80
    Width = 41
    Height = 13
    Caption = 'Situa'#231#227'o'
  end
  object DBEdt_CodConta: TDBEdit
    Left = 8
    Top = 51
    Width = 81
    Height = 21
    DataField = 'id_conta'
    DataSource = DS_Contas
    Enabled = False
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdt_CodCliente: TDBEdit
    Left = 99
    Top = 51
    Width = 69
    Height = 21
    DataField = 'id_cliente'
    DataSource = DS_Contas
    TabOrder = 1
  end
  object DBEdt_ValorConta: TDBEdit
    Left = 382
    Top = 99
    Width = 139
    Height = 21
    DataField = 'valor_conta'
    DataSource = DS_Contas
    TabOrder = 3
    OnExit = DBEdt_ValorContaExit
  end
  object DBEdt_Notificado: TDBEdit
    Left = 8
    Top = 99
    Width = 58
    Height = 21
    DataField = 'cliente_notificado'
    DataSource = DS_Contas
    Enabled = False
    ParentColor = True
    ReadOnly = True
    TabOrder = 11
  end
  object DBEdt_DtCadastro: TDBEdit
    Left = 72
    Top = 99
    Width = 121
    Height = 21
    DataField = 'dt_cadastro'
    DataSource = DS_Contas
    Enabled = False
    ParentColor = True
    ReadOnly = True
    TabOrder = 12
  end
  object DBLookupCB_NomeCliente: TDBLookupComboBox
    Left = 174
    Top = 51
    Width = 314
    Height = 21
    DataField = 'nomeCliente'
    DataSource = DS_Contas
    TabOrder = 2
  end
  object DBEdt_CaminhoBoleto: TDBEdit
    Left = 8
    Top = 148
    Width = 555
    Height = 21
    DataField = 'caminho_boleto'
    DataSource = DS_Contas
    TabOrder = 4
  end
  object DBEdt_CaminhoNF: TDBEdit
    Left = 8
    Top = 202
    Width = 559
    Height = 21
    DataField = 'caminho_nf'
    DataSource = DS_Contas
    TabOrder = 6
  end
  object btnAnexoBoleto: TButton
    Left = 573
    Top = 146
    Width = 75
    Height = 25
    Caption = '...'
    TabOrder = 5
    OnClick = btnAnexoBoletoClick
  end
  object btnAnexoNF: TButton
    Left = 573
    Top = 200
    Width = 75
    Height = 25
    Caption = '...'
    TabOrder = 7
    OnClick = btnAnexoNFClick
  end
  object btnGerarMensagem: TButton
    Left = 8
    Top = 462
    Width = 106
    Height = 25
    Caption = 'Gerar Mensagem'
    TabOrder = 9
    OnClick = btnGerarMensagemClick
  end
  object DBEdt_Situacao: TDBEdit
    Left = 199
    Top = 99
    Width = 177
    Height = 21
    DataField = 'situacao_atual'
    DataSource = DS_Contas
    Enabled = False
    ParentColor = True
    ReadOnly = True
    TabOrder = 13
  end
  object btnNotificar: TButton
    Left = 120
    Top = 462
    Width = 106
    Height = 25
    Caption = 'Notificar'
    TabOrder = 14
    OnClick = btnNotificarClick
  end
  object DBMemo_Mensagem: TDBMemo
    Left = 8
    Top = 258
    Width = 640
    Height = 198
    DataField = 'mensagem'
    DataSource = DS_Contas
    TabOrder = 8
  end
  object DBNavigator2: TDBNavigator
    Left = 2
    Top = 2
    Width = 150
    Height = 25
    DataSource = DS_Contas
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
    TabOrder = 15
  end
  object btnNovo: TButton
    Left = 154
    Top = 2
    Width = 70
    Height = 25
    Caption = 'Novo'
    TabOrder = 10
    OnClick = btnNovoClick
  end
  object btnSalvar: TButton
    Left = 226
    Top = 2
    Width = 70
    Height = 25
    Caption = 'Salvar'
    TabOrder = 16
    OnClick = btnSalvarClick
  end
  object btnExcluir: TButton
    Left = 369
    Top = 2
    Width = 66
    Height = 25
    Caption = 'Excluir'
    TabOrder = 17
    OnClick = btnExcluirClick
  end
  object btnCancelar: TButton
    Left = 437
    Top = 2
    Width = 74
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 18
    OnClick = btnCancelarClick
  end
  object btnEditar: TButton
    Left = 298
    Top = 2
    Width = 69
    Height = 25
    Caption = 'Editar'
    TabOrder = 19
    OnClick = btnEditarClick
  end
  object cxDBDateEdt_DtNotificar: TcxDBDateEdit
    Left = 527
    Top = 99
    DataBinding.DataField = 'dt_notificar'
    DataBinding.DataSource = DS_Contas
    StyleDisabled.BorderStyle = ebsOffice11
    TabOrder = 20
    Width = 121
  end
  object cxDBDateEdt_DtVencimento: TcxDBDateEdit
    Left = 527
    Top = 51
    DataBinding.DataField = 'dt_vencimento'
    DataBinding.DataSource = DS_Contas
    TabOrder = 21
    Width = 121
  end
  object DS_Contas: TDataSource
    AutoEdit = False
    DataSet = Dados.FDT_Contas
    Left = 400
    Top = 231
  end
  object BuscaArquivo: TOpenDialog
    Left = 464
    Top = 228
  end
  object DS_Registro: TDataSource
    AutoEdit = False
    DataSet = Dados.FDT_Registro
    Left = 600
    Top = 440
  end
end
