STORE '' TO wmoda1, wmoda2, wmoda3, wmoda4, wmoda5, wcertif
STORE 0 TO whora1, whora2, whora3, whora4, whora5
STORE '' TO wtema, worientado, wcorretor, wresumo
STORE {} TO wdat_praz, wdat_entr, wdat_cert
STORE .F. TO waceite, wemissao
STORE 0 TO wconceito, wconccorr
STORE 1 TO waprovado

SELECT clicurso
SEEK l_clicur(clicurs,2)

SELECT modulos
SEEK clicurso.codsub + clicurso.codarea
IF FOUND()
	SELECT certif
	SEEK modulos.cert_id
	wcertif = ALLTRIM(certif.nome)
	SELECT modulos
	auxcur = modulos.primario
	auxcli = wcodigo
	SELECT subarea.descricao AS subarea, ;
		subarea.sigla, ;
		area.descricao AS area, ;
		modulos.primario, ;
		modulos.mes_i, ;
		modulos.ano_i, ;
		modulos.mes_f, ;
		modulos.ano_f, ;
		mod_cab.primario AS prim_cab, ;
		mod_cab.numero, ;
		mod_cab.qde_notas, ;
		mod_cab.dat_ini, ;
		mod_cab.dat_fim, ;
		mod_cab.opcional, ;
		discip.descricao AS disciplina,  ;
		discip.ativ, ;
		prof.titulo, ;
		prof.nome AS professor,  ;
		mod_disc.data, ;
		SUM(mod_disc.carga) AS carga ;
		FROM modulos, subarea, area, mod_cab, mod_disc, prof, discip ;
		WHERE modulos.area == area.codigo ;
		AND modulos.subarea == subarea.codigo ;
		AND modulos.primario == mod_cab.curso_id ;
		AND mod_cab.primario == mod_disc.modulo ;
		AND mod_disc.id_prof == prof.codigo ;
		AND mod_disc.id_disc == discip.codigo ;
		AND modulos.primario == auxcur ;
		GROUP BY modulos.primario, mod_cab.numero, mod_disc.disciplina, mod_disc.professor ;
		ORDER BY modulos.ano_i, area.descricao, subarea.sigla, mod_cab.numero, mod_cab.dat_ini ;
		INTO CURSOR mod_geral
		
	auxfor = ''
	nopcs = 0
	SELECT mod_geral
	COUNT FOR mod_geral.opcional = .T. TO nopcs
	IF nopcs > 0
		conf_ = winconf('AVISO', 'Deseja Imprimir o(s) Módulo(s) Opcionais?')
		IF  .NOT. conf_
			auxfor = 'FOR Mod_geral.Opcional = .F. '
		ENDIF
	ENDIF
	SELECT academic.* ;
		FROM academic ;
		WHERE academic.codcli == auxcli ;
		AND academic.codmod IN(SELECT DISTINCT mod_geral.prim_cab FROM mod_geral) ;
		INTO CURSOR cli_dados
	SELECT mod_geral
	= AFIELDS(w_struct)
	ncampos = ALEN(w_struct) / 4
	DIMENSION w_struct[ ncampos + 2, 4]
	w_struct[ ncampos + 1, 1] = 'Cli_pres'
	w_struct[ ncampos + 1, 2] = 'N'
	w_struct[ ncampos + 1, 3] = 4
	w_struct[ ncampos + 1, 4] = 0
	w_struct[ ncampos + 2, 1] = 'Cli_nota'
	w_struct[ ncampos + 2, 2] = 'N'
	w_struct[ ncampos + 2, 3] = 4
	w_struct[ ncampos + 2, 4] = 1
	CREATE CURSOR rel_pres FROM ARRAY w_struct
	SELECT mod_geral
	SCAN &auxfor
		SCATTER MEMVAR
		INSERT INTO rel_pres FROM MEMVAR
	ENDSCAN
	STORE 0 TO tpres, tnotas, tcarga
	SELECT rel_pres
	SCAN
		SELECT mod_cab
		LOCATE FOR mod_cab.primario == rel_pres.prim_cab
		IF  .NOT. mod_cab.opcional
			tcarga = tcarga + rel_pres.carga
		ENDIF
		SELECT rel_pres
	ENDSCAN
	SELECT cli_dados
	SCAN
		aux_mod = cli_dados.codmod
		SELECT mod_disc.data, ;
			mod_disc.professor, ;
			mod_disc.disciplina, ;
			mod_disc.carga_p, ;
			mod_disc.carga ;
			FROM mod_disc ;
			WHERE mod_disc.modulo == aux_mod ;
			ORDER BY mod_disc.data, mod_disc.carga_p ;
			INTO CURSOR aux
		qde_presen = 0
		auxcarga = 0
		i = 1
		SELECT aux
		SCAN
			auxper = 'P' + STR(i, 1)
			SELECT cli_dados
			IF cli_dados.&auxper = .T.
				qde_presen = qde_presen + aux.carga
			ENDIF
			auxcarga = auxcarga + aux.carga
			i = i + 1
			SELECT aux
		ENDSCAN
		SELECT mod_cab
		LOCATE FOR mod_cab.primario == aux_mod
		IF  .NOT. mod_cab.opcional
			tpres = tpres + qde_presen
		ENDIF
		SELECT rel_pres
		REPLACE rel_pres.cli_pres WITH qde_presen FOR rel_pres.prim_cab == cli_dados.codmod
		REPLACE rel_pres.cli_nota WITH cli_dados.n1 + cli_dados.n2 + cli_dados.n3 FOR rel_pres.prim_cab == cli_dados.codmod
		SELECT cli_dados
	ENDSCAN
	SELECT DISTINCT rel_pres.numero, ;
		rel_pres.cli_nota, ;
		rel_pres.qde_notas ;
		FROM rel_pres ;
		INTO CURSOR aux_nota
	nmod = 0
	SELECT aux_nota
	SCAN
		tnotas = tnotas + (cli_nota / qde_notas)
		nmod = nmod + 1
	ENDSCAN
	media_gera = tnotas / nmod
	SELECT ativcomp.codmoda, ;
		modalid.descricao, ;
		SUM(ativcomp.pontos) AS pontos ;
		FROM ativcomp, modalid ;
		WHERE ativcomp.codmoda == modalid.codigo ;
		AND	ativcomp.codcli == auxcli ;
		AND ativcomp.codmod IN(SELECT DISTINCT mod_geral.prim_cab FROM mod_geral) ;
		GROUP BY ativcomp.codmoda ;
		ORDER BY ativcomp.codmoda ;
		INTO CURSOR cli_ativ
	i = 1
	SELECT cli_ativ
	SCAN
		auxmoda = 'WMODA' + STR(i, 1)
		auxhora = 'WHORA' + STR(i, 1)
		&auxmoda = cli_ativ.descricao
		&auxhora = cli_ativ.pontos
		i = i + 1
	ENDSCAN
	SELECT tcc
	SEEK STR(auxcur, 10) + STR(auxcli, 6)
	IF FOUND()
		wtema = tcc.tema
		wcorretor = tcc.corretor
		waprovado = tcc.aprovado
		waceite = tcc.aceite
		wdat_praz = tcc.dat_praz
		wdat_entr = tcc.dat_entr
		wdat_cert = tcc.dat_cert
		wemissao = tcc.emissao
		wconceito = tcc.conceito
		wconccorr = tcc.conccorr
		SELECT prof
		SEEK tcc.orient_id
		IF FOUND()
			worientado = prof.nome
		ELSE
			worientado = ''
		ENDIF
	ENDIF

	datumBereik = 0
	IF !ISBLANK(lokAfstudeer)
		eerstDatum = {}
		SELE rel_pres
		CALC MIN(rel_pres.dat_ini) TO eerstDatum
		IF eerstDatum < lokAfstudeer
			datumBereik = (lokAfstudeer - eerstDatum) + 30
			datumBereik = (INT(datumBereik/7))*7
		ENDIF
	ENDIF
	
	modAtiv = 0
	SELECT rel_pres
	SELECT DIST numero ;
		FROM rel_pres ;
		WHERE !rel_pres.ativ ;
		INTO CURSOR mod_ativ
	SELE mod_ativ
	COUNT TO modAtiv

	SELECT rel_pres
	CONF = winconf('AVISO', 'Deseja imprimir com Atividades Complementares?' )
	IF CONF
		IF vis_impr
			REPORT FORM cli_pre2 TO PRINTER PREVIEW NOCONSOLE
		ELSE
			REPORT FORM cli_pre2 TO PRINTER PROMPT NOCONSOLE
		ENDIF
	ELSE
		IF vis_impr
			REPORT FORM cli_pres TO PRINTER PREVIEW NOCONSOLE
		ELSE
			REPORT FORM cli_pres TO PRINTER PROMPT NOCONSOLE
		ENDIF
	ENDIF
ELSE
	DO winalert WITH 'ATENÇÃO', 'CURSO NÃO CADASTRADO!'
ENDIF