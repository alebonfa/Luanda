CLOSE DATABASES
SET EXCLUSIVE OFF
SELECT 0
USE &dircont\tip_paga ORDER TAG codigo;
	OF &dircont\tip_paga
SELECT 0
USE &dircont\prof ORDER TAG codigo
SELECT 0
USE &dircont\fornecs ORDER TAG NOME OF;
	&dircont\fornecs
SELECT 0
USE &dircont\fornecs AGAIN ORDER TAG codigo;
	OF &dircont\fornecs ALIAS fornecod
SELECT 0
USE &dircont\contas ORDER TAG numerolanc;
	OF &dircont\contas
SELECT 0
USE &dircont\ccust2 ORDER TAG codigo OF;
	&dircont\ccust2
SELECT 0
USE &dircont\bancos ORDER TAG codigo OF;
	&dircont\bancos
SELECT 0
USE &dircont\forngrup ORDER TAG codigo;
	OF &dircont\forngrup
SELECT 0
USE &dircont\extrato ORDER TAG numerolanc;
	OF &dircont\extrato
SELECT 0
USE &dircont\extrato AGAIN ORDER TAG DATA;
	OF &dircont\extrato ALIAS ext_data
SELECT 0
USE &dircont\cheques ORDER TAG NOME OF;
	&dircont\cheques
SELECT 0
USE &dircont\funcs ORDER TAG codigo OF;
	&dircont\funcs
SELECT 0
USE &dircont\cliente AGAIN ORDER TAG codigo

SELECT 0
USE &dircont\avalista AGAIN ORDER TAG;
	codigo
SELECT 0
USE &dircont\recebs ORDER TAG datavencim;
	OF &dircont\recebs
SELECT 0
USE &dircont\recebs AGAIN ORDER TAG codcli;
	OF &dircont\recebs ALIAS reccod
SELECT 0
USE &dircont\recebs AGAIN ORDER TAG numerolanc;
	OF &dircont\recebs ALIAS recnum
SELECT 0
USE &dircont\area ORDER TAG codigo OF;
	&dircont\area
SELECT 0
USE &dircont\subarea ORDER TAG codigo;
	OF &dircont\subarea
SELECT 0
USE &dircont\juros
SELECT 0
USE &dircont\funcgrup
SELECT 0
USE &dircont\servgrup ORDER TAG codigo;
	OF &dircont\servgrup
SELECT 0
USE &dircont\status ORDER TAG codigo
SELECT 0
USE &dircont\crm.dbf ORDER TAG codigo
SELECT 0
USE &dircont\crm.dbf AGAIN ORDER TAG codcli ALIAS crmcli

SELECT 0
USE &dircont\crm_ativ.dbf ORDER TAG codigo;

SELECT 0
USE &dircont\crm_assu.dbf ORDER TAG codigo;

SELECT 0
USE &dircont\crm_padr.dbf ORDER TAG codigo;

SELECT 0
USE &dircont\parc_cab ORDER TAG codigo
SELECT 0
USE &dircont\parc_itm ORDER TAG codigo
SELECT 0
USE &dircont\clicurso ORDER TAG primario
SELECT 0
USE &dircont\clicurso AGAIN ORDER TAG;
	codsub ALIAS cc
SELECT 0
USE &dircont\discip ORDER TAG codigo
SELECT 0
USE &dircont\modulos ORDER TAG numero
SELECT 0
USE &dircont\modulos AGAIN ORDER TAG primario;
	ALIAS mp
SELECT 0
USE &dircont\mod_cab ORDER TAG subarea
SELECT 0
USE &dircont\mod_cab AGAIN ORDER TAG primario;
	ALIAS mc
SELECT 0
USE &dircont\mod_disc ORDER TAG modulo
SELECT 0
USE &dircont\academic ORDER TAG modulo
SELECT 0
USE &dircont\academic AGAIN ORDER TAG primario ALIAS la
SELECT 0
USE &dircont\modalid ORDER TAG codigo
SELECT 0
USE &dircont\tcc ORDER TAG codmod
SELECT 0
USE &dircont\ativcomp ORDER TAG codmod
SELECT 0
USE &dircont\ativcomp AGAIN ORDER TAG;
	primario ALIAS ac
SELECT 0
USE &dircont\cli_docs ORDER TAG id_cliente
SELECT 0
USE &dircont\mod_rep ORDER TAG id
SELECT 0
USE &dircont\cursos ORDER TAG id
SELECT 0
USE &dircont\int_area
SET ORDER TO TAG id
SELECT 0
USE &dircont\int_suba
SET ORDER TO TAG id
SELECT 0
USE &dircont\divulg ORDER TAG codigo
SELECT 0
USE &dircont\vendes ORDER TAG id
SELECT 0
USE &dircont\tarifas ORDER TAG id
SELECT 0
USE &dircont\cartao ORDER TAG id
SELECT 0
USE &dircont\rectarifa ORDER TAG id
SELECT 0
USE &dircont\rectarifa AGAIN ORDER TAG;
	recebs_id ALIAS rectar_2
SELECT 0
USE &dircont\unidade ORDER TAG id
SELECT 0
USE &dircont\produtos ORDER TAG id
SELECT 0
USE &dircont\logistic ORDER TAG id
SELECT 0
USE &dircont\logistic AGAIN ORDER TAG;
	modulo_id ALIAS lm
SELECT 0
USE &dircont\disc_prd ORDER TAG id
SELECT 0
USE &dircont\log_prd ORDER TAG id
SELECT 0
USE &dircont\mod_avul ORDER TAG id
SELECT 0
USE &dircont\empresas ORDER TAG id
SELECT 0
USE &dircont\certif ORDER TAG id
SELECT 0
USE &dircont\profdisc ORDER TAG id
SELECT 0
USE &dircont\tarefas ORDER TAG id
SELECT 0
USE &dircont\local ORDER TAG id
SELECT 0
USE &dircont\estoque ORDER TAG id
SELECT 0
USE &dircont\estoque AGAIN ORDER TAG local_id;
	ALIAS est_loca
SELECT 0
USE &dircont\mov_prod ORDER TAG id


SELECT 0
USE &dircont\erfPunt ORDER TAG id
SELECT 0
USE &dircont\erfGroep ORDER TAG id
SELECT 0
USE &dircont\magazijn ORDER TAG id
SELECT 0
USE &dircont\erfgoed ORDER TAG id

SELECT 0
USE &dircont\cobrad ORDER TAG id