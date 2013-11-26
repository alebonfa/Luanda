SET SYSMENU TO
SET SYSMENU AUTOMATIC
DEFINE PAD _28d0u8ov1 OF  ;
	_msysmenu PROMPT 'Sistema'  ;
	COLOR SCHEME 3
DEFINE PAD _28d0u8ov2 OF  ;
	_msysmenu PROMPT  ;
	'Cadastro' COLOR SCHEME 3
DEFINE PAD _28d0u8ov3 OF  ;
	_msysmenu PROMPT  ;
	'Financeiro' COLOR SCHEME  ;
	3
DEFINE PAD _28d0u8ov4 OF  ;
	_msysmenu PROMPT  ;
	'Ferramentas' COLOR SCHEME  ;
	3
ON PAD _28d0u8ov1 OF _msysmenu ACTIVATE;
	POPUP sistema
ON PAD _28d0u8ov2 OF _msysmenu ACTIVATE;
	POPUP cadastro
ON PAD _28d0u8ov3 OF _msysmenu ACTIVATE;
	POPUP financeiro
ON PAD _28d0u8ov4 OF _msysmenu ACTIVATE;
	POPUP ferramenta
DEFINE POPUP sistema SHADOW  ;
	MARGIN RELATIVE COLOR  ;
	SCHEME 4
DEFINE BAR 1 OF sistema PROMPT  ;
	'Sair'
DEFINE BAR 2 OF sistema PROMPT  ;
	'\-'
DEFINE BAR _med_undo OF sistema  ;
	PROMPT 'Desfazer' KEY ctrl+z
DEFINE BAR _med_cut OF sistema  ;
	PROMPT 'Recortar' KEY ctrl+x
DEFINE BAR _med_copy OF sistema  ;
	PROMPT 'Copiar' KEY ctrl+C
DEFINE BAR _med_paste OF sistema  ;
	PROMPT 'Colar' KEY ctrl+v

ON SELECTION BAR 1 OF sistema DO _28d0u8ov5
DEFINE POPUP cadastro SHADOW  ;
	MARGIN RELATIVE COLOR  ;
	SCHEME 4
	
DEFINE BAR 1 OF cadastro PROMPT 'Clientes'
DEFINE BAR 2 OF cadastro PROMPT 'Clientes - Dados Incompletos'
DEFINE BAR 3 OF cadastro PROMPT 'Avalistas'
DEFINE BAR 4 OF cadastro PROMPT 'Funcionários'
DEFINE BAR 5 OF cadastro PROMPT '\-'
DEFINE BAR 6 OF cadastro PROMPT 'Contas Bancárias'
DEFINE BAR 7 OF cadastro PROMPT 'Cartões de Crédito'
DEFINE BAR 8 OF cadastro PROMPT 'Formas de Pagamento'
DEFINE BAR 9 OF cadastro PROMPT 'Fornecedores'
DEFINE BAR 10 OF cadastro PROMPT '\-'
DEFINE BAR 11 OF cadastro PROMPT 'Cursos'
DEFINE BAR 12 OF cadastro PROMPT 'Turmas'
DEFINE BAR 13 OF cadastro PROMPT 'Áreas'
DEFINE BAR 14 OF cadastro PROMPT 'Modalidades'
DEFINE BAR 15 OF cadastro PROMPT 'Plano de Contas'
DEFINE BAR 16 OF cadastro PROMPT 'Parceiros'
DEFINE BAR 17 OF cadastro PROMPT '\-'
DEFINE BAR 18 OF cadastro PROMPT 'Empresas'
DEFINE BAR 19 OF cadastro PROMPT 'Certificadoras'
DEFINE BAR 20 OF cadastro PROMPT '\-'
DEFINE BAR 21 OF cadastro PROMPT 'Cadastro de Produtos'
DEFINE BAR 22 OF cadastro PROMPT 'Locais de Estoque'
DEFINE BAR 23 OF cadastro PROMPT 'Estoque'
DEFINE BAR 24 OF cadastro PROMPT 'Itens de Patrimônio'
DEFINE BAR 25 OF cadastro PROMPT 'Grupos de Patrimônio'
DEFINE BAR 26 OF cadastro PROMPT 'Locais de Estoque'
DEFINE BAR 27 OF cadastro PROMPT 'Patrimônio'

ON SELECTION BAR 1 OF cadastro DO _28d0u8ov6
ON SELECTION BAR 2 OF cadastro DO _28d0u8ov7
ON SELECTION BAR 3 OF cadastro DO _28d0u8ov8
ON SELECTION BAR 4 OF cadastro DO _28d0u8ov9
ON SELECTION BAR 6 OF cadastro DO _28d0u8ova
ON SELECTION BAR 7 OF cadastro DO _28d0u8ovb
ON SELECTION BAR 8 OF cadastro DO _28d0u8ove
ON SELECTION BAR 9 OF cadastro DO _28d0u8ovf
ON SELECTION BAR 11 OF cadastro DO _28d0u8ovg
ON SELECTION BAR 12 OF cadastro DO _28d0u8ovh
ON SELECTION BAR 13 OF cadastro DO _28d0u8ovi
ON SELECTION BAR 14 OF cadastro DO _28d0u8ovz
ON SELECTION BAR 15 OF cadastro DO _28d0u8ovj
ON SELECTION BAR 16 OF cadastro DO _28d0u8ovk
ON SELECTION BAR 18 OF cadastro DO _28d0u8emp
ON SELECTION BAR 19 OF cadastro DO _28d0u8cer
ON SELECTION BAR 21 OF cadastro DO _28d0u8ovl
ON SELECTION BAR 22 OF cadastro DO _28d0u8loc
ON SELECTION BAR 23 OF cadastro DO _28d0u8est
ON SELECTION BAR 24 OF cadastro DO hetErfPunt
ON SELECTION BAR 25 OF cadastro DO hetErfGroep
ON SELECTION BAR 26 OF cadastro DO hetMagazijn
ON SELECTION BAR 27 OF cadastro DO hetErfGoed

DEFINE POPUP financeiro SHADOW  ;
	MARGIN RELATIVE COLOR  ;
	SCHEME 4
DEFINE BAR 1 OF financeiro PROMPT  ;
	'Contas a Pagar'
DEFINE BAR 2 OF financeiro PROMPT  ;
	'Caixa e Bancos'
DEFINE BAR 3 OF financeiro PROMPT  ;
	'\-'
DEFINE BAR 4 OF financeiro PROMPT  ;
	'Contas a Receber'
DEFINE BAR 5 OF financeiro PROMPT  ;
	'Controle de Cheques'
ON SELECTION BAR 1 OF financeiro DO _28d0u8ovm;

ON SELECTION BAR 2 OF financeiro DO _28d0u8ovn;

ON SELECTION BAR 4 OF financeiro DO _28d0u8ovo;

ON SELECTION BAR 5 OF financeiro DO _28d0u8ovp;

DEFINE POPUP ferramenta SHADOW  ;
	MARGIN RELATIVE COLOR  ;
	SCHEME 4
DEFINE BAR 1 OF ferramenta PROMPT  ;
	'Reestrutura - Contas a Receber'
DEFINE BAR 2 OF ferramenta PROMPT  ;
	'Reestrutura - Clientes X Cursos'
DEFINE BAR 3 OF ferramenta PROMPT  ;
	'\-'
DEFINE BAR 4 OF ferramenta PROMPT  ;
	'Reindexa'
DEFINE BAR 5 OF ferramenta PROMPT  ;
	'Cadastro de Usuários'
DEFINE BAR 6 OF ferramenta PROMPT  ;
	'Usuário - Troca de Senha'
ON SELECTION BAR 1 OF ferramenta DO _28d0u8ovq;

ON SELECTION BAR 2 OF ferramenta DO _28d0u8ovr;

ON SELECTION BAR 4 OF ferramenta DO _28d0u8ovs;

ON SELECTION BAR 5 OF ferramenta DO _28d0u8ovt;

ON SELECTION BAR 6 OF ferramenta DO _28d0u8ovu
*
PROCEDURE _28d0u8ov5
	CLEAR READ
	*
PROCEDURE _28d0u8ov6
	ACCESS = veracess(wcoduser,1, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO clientes.app
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ov7
	ACCESS = veracess(wcoduser,6, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cli_corr.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ov8
	ACCESS = veracess(wcoduser,1, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cad_aval.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ov9
	ACCESS = veracess(wcoduser,7, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cad_func.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ova
	ACCESS = veracess(wcoduser,9, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cad_ban.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ovb
	ACCESS = veracess(wcoduser,9, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cad_cart.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ove
	ACCESS = veracess(wcoduser,10, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cad_tpag.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ovf
	ACCESS = veracess(wcoduser,11, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cad_for.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ovg
	ACCESS = veracess(wcoduser,14, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cursos.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ovh
	ACCESS = veracess(wcoduser,14, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cad_suba.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ovi
	ACCESS = veracess(wcoduser,13, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cad_area.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ovz
	ACCESS = veracess(wcoduser,13, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO modalid.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ovj
	ACCESS = veracess(wcoduser,15, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cad_ccu3.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ovk
	ACCESS = veracess(wcoduser,16, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cad_parc.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ovl
	ACCESS = veracess(wcoduser,2, ;
		'IMP')
	IF ACCESS
		DO abr_cont
		lseleciona = .F.
		DO cad_prod.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8emp
	ACCESS = veracess(wcoduser,2, ;
		'IMP')
	IF ACCESS
		DO abr_cont
		DO cad_empr.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8cer
	ACCESS = veracess(wcoduser,37, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cad_cert.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8loc
	ACCESS = veracess(wcoduser,38, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cad_loca.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8est
	ACCESS = veracess(wcoduser,38, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO almox.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE hetErfPunt
	ACCESS = veracess(wcoduser,38, 'CON')
	IF ACCESS
		DO abr_cont
		DO erfPunt.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE hetErfGroep
	ACCESS = veracess(wcoduser,39, 'CON')
	IF ACCESS
		DO abr_cont
		DO erfGroep.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE hetMagazijn
	ACCESS = veracess(wcoduser,38, 'CON')
	Access = .F.
	IF ACCESS
		DO abr_cont
		DO magazijn.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE hetErfgoed
	ACCESS = veracess(wcoduser,38, 'CON')
	IF ACCESS
		DO abr_cont
		DO erfgoed.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ovm
	ACCESS = veracess(wcoduser,17, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO contas.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ovn
	ACCESS = veracess(wcoduser,18, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cxbancos.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ovo
	ACCESS = veracess(wcoduser,19, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO recebs.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ovp
	ACCESS = veracess(wcoduser,21, ;
		'CON')
	IF ACCESS
		DO abr_cont
		DO cheqdev.spr
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ovq
	ACCESS = veracess(wcoduser,22, ;
		'CON')
	IF ACCESS
		DO abr_cont
		SELECT recebs
		SCAN
			SELECT cliente
			SEEK recebs.codcli
			SELECT recebs
			REPLACE recebs.razaosocia  ;
				WITH  ;
				cliente.nome
		ENDSCAN
		WAIT WINDOW 'CONCLUÍDO'
		CLOSE DATABASES
	ENDIF
	*
PROCEDURE _28d0u8ovr
	DO herstStu
	RETURN
	*
PROCEDURE _28d0u8ovs
	ACCESS = veracess(wcoduser,24, ;
		'CON')
	IF ACCESS
		DO reindexa
		CLOSE DATABASES
	ENDIF
	RETURN
	*
PROCEDURE _28d0u8ovt
	IF wsetor == 'ADM'
		DO abr_cont
		DO cad_user.spr
		CLOSE DATABASES
	ENDIF
	RETURN
	*
PROCEDURE _28d0u8ovu
	DO abr_cont
	DO senhtroc.spr
	CLOSE DATABASES
	RETURN
	*
