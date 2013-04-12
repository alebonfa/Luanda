CLOSE DATABASES
SET EXCLUSIVE ON
USE &DIRCONT\Academic
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON STR(codmod, 10) +  ;
      STR(codcli, 6) TAG modulo  ;
      ADDITIVE
INDEX ON primario TAG primario  ;
      ADDITIVE
USE &DIRCONT\Area
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Bancos
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
INDEX ON nome TAG nome ADDITIVE
USE &DIRCONT\Ccust2
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Prof
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Cheques
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON DTOS(data) + nome TAG  ;
      data ADDITIVE
INDEX ON nome + situacao +  ;
      DTOS(data) + STR(valor, 7,  ;
      2) TAG nome ADDITIVE
USE &DIRCONT\Cliente
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
INDEX ON cgc TAG cgc ADDITIVE
INDEX ON nome TAG nome ADDITIVE
USE &DIRCONT\Avalista
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Contas
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON datavencim TAG  ;
      datavencim ADDITIVE
INDEX ON numerolanc TAG  ;
      numerolanc ADDITIVE
USE &DIRCONT\Crm
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Crm_assu
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Crm_ativ
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Crm_padr
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Discip
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Extrato
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON numerolanc TAG  ;
      numerolanc ADDITIVE
INDEX ON DTOS(data) + destino +  ;
      historico + STR(valor) TAG  ;
      data ADDITIVE
INDEX ON data TAG sodata ADDITIVE
USE &DIRCONT\Fornecs
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
INDEX ON nome TAG nome ADDITIVE
USE &DIRCONT\Forngrup
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Funcgrup
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Funcs
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Mod_disc
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON primario TAG primario  ;
      ADDITIVE
INDEX ON STR(modulo, 10) +  ;
      DTOS(data) + STR(carga_p,  ;
      1) TAG modulo ADDITIVE
USE &DIRCONT\Modulos
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON primario TAG primario  ;
      ADDITIVE
INDEX ON subarea + area TAG  ;
      numero ADDITIVE
USE &DIRCONT\Mod_cab
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON primario TAG primario  ;
      ADDITIVE
INDEX ON subarea + area +  ;
      STR(numero, 2) TAG subarea  ;
      ADDITIVE
USE &DIRCONT\Parc_cab
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Parc_itm
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Recebs
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON datavencim TAG  ;
      datavencim ADDITIVE
INDEX ON numerolanc TAG  ;
      numerolanc ADDITIVE
INDEX ON codcli TAG codcli  ;
      ADDITIVE
INDEX ON recibocob TAG recibocob  ;
      ADDITIVE
INDEX ON ap_brad TAG ap_brad  ;
      ADDITIVE
INDEX ON del_id TAG del_id  ;
      ADDITIVE
USE &DIRCONT\Servgrup
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Status
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Subarea
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Tip_paga
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
USE &DIRCONT\Vendes
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON nome TAG nome ADDITIVE
INDEX ON id TAG id ADDITIVE
USE &DIRCONT\TCC
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON STR(curso_id, 10) +  ;
      STR(codcli, 6) TAG codmod  ;
      ADDITIVE
USE &DIRCONT\Perms
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON STR(user_id, 10) +  ;
      STR(rotina_id, 10) TAG  ;
      user_id ADDITIVE
INDEX ON id TAG id ADDITIVE
USE &DIRCONT\Cli_docs
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON id TAG id ADDITIVE
INDEX ON id_cliente TAG  ;
      id_cliente ADDITIVE
USE &DIRCONT\Mod_rep
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON id TAG id ADDITIVE
USE &DIRCONT\Cursos
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON id TAG id ADDITIVE
USE &DIRCONT\Int_area
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON id TAG id ADDITIVE
USE &DIRCONT\Int_suba
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON id TAG id ADDITIVE
USE &DIRCONT\Cartao
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON id TAG id ADDITIVE
USE &DIRCONT\Tarifas
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON banco_id + id + sub_id  ;
      TAG id ADDITIVE
USE &DIRCONT\Rectarif
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON id TAG id ADDITIVE
INDEX ON STR(recebs_id, 8) +  ;
      banco_id + tarifa_id +  ;
      tarsub_id + DTOC(data) TAG  ;
      recebs_id ADDITIVE
USE &DIRCONT\Empresas
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON id TAG id ADDITIVE
USE &DIRCONT\Certif
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON id TAG id ADDITIVE
USE &DIRCONT\Logistic
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON id TAG id ADDITIVE
INDEX ON modulo_id TAG modulo_id  ;
      ADDITIVE
USE &DIRCONT\Profdisc
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON id TAG id ADDITIVE
USE &DIRCONT\Mod_avul
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON id TAG id ADDITIVE
USE &DIRCONT\Clicurso
PACK
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON primario TAG primario  ;
      ADDITIVE
INDEX ON STR(codcli, 6) + codsub +  ;
      codarea TAG codsub  ;
      ADDITIVE
CLOSE DATABASES
*
