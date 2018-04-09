object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Notifica (v1.1 Beta - Programa em Testes)'
  ClientHeight = 345
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = Menu
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Superior: TPanel
    Left = 0
    Top = 56
    Width = 774
    Height = 33
    Align = alTop
    TabOrder = 0
    object lblDataAtual: TLabel
      Left = 251
      Top = 10
      Width = 27
      Height = 13
      Caption = 'Data:'
    end
    object DataHoje: TDateTimePicker
      Left = 284
      Top = 6
      Width = 224
      Height = 21
      Date = 43189.278693541660000000
      Time = 43189.278693541660000000
      DateFormat = dfLong
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 0
    end
  end
  object Panel_Centro: TPanel
    Left = 0
    Top = 89
    Width = 774
    Height = 231
    Align = alClient
    TabOrder = 1
    object DBGrid_Contas: TDBGrid
      Left = 1
      Top = 1
      Width = 772
      Height = 229
      Align = alClient
      DataSource = DS_Contas
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid_ContasDrawColumnCell
      OnDblClick = DBGrid_ContasDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'id_conta'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'id_cliente'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'dt_cadastro'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'valor_conta'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeCliente'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_vencimento'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_notificar'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente_notificado'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'caminho_boleto'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'caminho_nf'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'situacao_atual'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pode_notificar'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'mensagem'
          Visible = False
        end>
    end
  end
  object Panel_Inferior: TPanel
    Left = 0
    Top = 320
    Width = 774
    Height = 25
    Align = alBottom
    TabOrder = 2
    object WN2018: TLabel
      Left = 4
      Top = 7
      Width = 35
      Height = 11
      Caption = 'WN2018'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblMensagem: TLabel
      Left = 392
      Top = 5
      Width = 32
      Height = 13
      Alignment = taCenter
      Caption = '<<>>'
    end
  end
  object Panel_Botoes: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 56
    Align = alTop
    TabOrder = 3
    object btnVerVencidas: TButton
      Left = 6
      Top = 6
      Width = 75
      Height = 45
      Caption = 'Verificar Vencidas'
      DoubleBuffered = False
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      WordWrap = True
      OnClick = btnVerVencidasClick
    end
    object btnVerNotificacao: TButton
      Left = 84
      Top = 6
      Width = 75
      Height = 45
      Caption = 'Verificar Notifica'#231#227'o'
      TabOrder = 1
      WordWrap = True
      OnClick = btnVerNotificacaoClick
    end
    object btnNotificar: TButton
      Left = 163
      Top = 6
      Width = 75
      Height = 45
      Caption = 'Notificar'
      TabOrder = 2
      WordWrap = True
      OnClick = btnNotificarClick
    end
    object btnApagarVencidas: TButton
      Left = 241
      Top = 6
      Width = 75
      Height = 45
      Caption = 'Apagar Vencidas'
      DoubleBuffered = False
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      WordWrap = True
      StyleElements = [seFont, seClient]
      OnClick = btnApagarVencidasClick
    end
  end
  object DS_Contas: TDataSource
    AutoEdit = False
    DataSet = Dados.FDT_Contas
    Left = 728
    Top = 8
  end
  object Menu: TMainMenu
    Left = 664
    Top = 9
    object MenuArquivo: TMenuItem
      Caption = 'ARQUIVO'
      object Configurao1: TMenuItem
        Caption = 'Configura'#231#227'o'
        OnClick = Configurao1Click
      end
    end
    object MenuNovaConta: TMenuItem
      Caption = 'NOVA CONTA'
      OnClick = MenuNovaContaClick
    end
    object MenuClientes: TMenuItem
      Caption = 'CLIENTES'
      OnClick = MenuClientesClick
    end
    object MenuAjuda: TMenuItem
      Caption = 'AJUDA'
      object Ajuda1: TMenuItem
        Caption = 'Ajuda'
      end
      object MenuRegistro: TMenuItem
        Caption = 'Registro'
        OnClick = MenuRegistroClick
      end
      object ReportarErro1: TMenuItem
        Caption = 'Reportar Erro'
        OnClick = ReportarErro1Click
      end
    end
  end
  object DS_Registro: TDataSource
    AutoEdit = False
    DataSet = Dados.FDT_Registro
    Left = 584
    Top = 8
  end
end
