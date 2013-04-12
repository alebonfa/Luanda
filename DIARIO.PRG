PARAMETER pmod, ptip
ptip = ptip - 3
wanoinicio = modulos.ano_i
SELECT prof.nome AS professor,  ;
	discip.descricao AS  ;
	disciplina,  ;
	UPPER(area.descricao) AS  ;
	local,  ;
	UPPER(subarea.descricao)  ;
	AS CURSO, mod_disc.data,  ;
	mod_disc.carga,  ;
	mod_cab.dat_ini,  ;
	mod_cab.numero,  ;
	mod_cab.area,  ;
	mod_cab.subarea FROM  ;
	mod_cab, mod_disc, prof,  ;
	discip, area, subarea  ;
	WHERE mod_cab.primario ==  ;
	mod_disc.modulo AND  ;
	mod_cab.area ==  ;
	area.codigo AND  ;
	mod_cab.subarea ==  ;
	subarea.codigo AND  ;
	mod_disc.id_prof ==  ;
	prof.codigo AND  ;
	mod_disc.id_disc ==  ;
	discip.codigo AND  ;
	mod_disc.modulo == pmod  ;
	ORDER BY mod_disc.data  ;
	INTO CURSOR all_days
SCATTER MEMVAR
wnumero = ALLTRIM(STR(m.numero,  ;
	10))
STORE '' TO d1, d2, d3, d4, d5,  ;
	d6, d7, d8, d9
STORE '' TO m1, m2, m3, m4, m5,  ;
	m6, m7, m8, m9
i = 1
rcarga = 0
SELECT all_days
GOTO TOP
wpridata = all_days.data
GOTO BOTTOM
wultdata = all_days.data
IF wpridata = wultdata
	wperiodo = DTOC(wpridata)
ELSE
	wperiodo = DTOC(wpridata) +  ;
		' - ' +  ;
		DTOC(wultdata)
ENDIF
SELECT all_days
SCAN
	auxd = 'D' + STR(i, 1)
	&auxd = SUBSTR(DTOC(all_days.data),1,2)
	auxm = 'M' + STR(i, 1)
	&auxm = SUBSTR(DTOC(all_days.data),4,2)
	i = i + 1
	rcarga = rcarga +  ;
		all_days.carga
ENDSCAN
STORE '' TO rdiscip1, rdiscip2,  ;
	rdiscip3, rdiscip4, rprof1,  ;
	rprof2, rprof3, rprof4
SELECT all_days.professor FROM  ;
	all_days GROUP BY  ;
	all_days.professor INTO  ;
	CURSOR aux
i = 1
SELECT aux
SCAN
	auxprof = 'Rprof' + STR(i,  ;
		1)
	i = i + 1
	&auxprof = aux.professor
ENDSCAN
SELECT all_days.disciplina FROM  ;
	all_days GROUP BY  ;
	all_days.disciplina INTO  ;
	CURSOR aux
i = 1
SELECT aux
SCAN
	auxdiscip = 'Rdiscip' +  ;
		STR(i, 1)
	i = i + 1
	&auxdiscip = aux.disciplina
ENDSCAN
aux_aluno = ''
IF laluno
	aux_aluno = 'AND Cliente.Codigo == List_alu[Alus,2] '
ENDIF
SELECT cliente.nome FROM cliente, clicurso;
	WHERE cliente.codigo == clicurso.codcli;
	AND clicurso.codarea == m.area AND clicurso.codsub;
	== m.subarea AND ALLTRIM(clicurso.situacao);
	$ 'CONCLUIDO-BOLSISTA-ATIVO' &aux_aluno;
	ORDER BY cliente.nome INTO CURSOR alunos
SELECT cliente.nome,  ;
	area.descricao AS area,  ;
	subarea.sigla AS subarea  ;
	FROM cliente, mod_rep,  ;
	mod_cab, area, subarea  ;
	WHERE cliente.codigo ==  ;
	mod_rep.cliente_id AND  ;
	mod_rep.mod_orig ==  ;
	mod_cab.primario AND  ;
	mod_cab.area ==  ;
	area.codigo AND  ;
	mod_cab.subarea ==  ;
	subarea.codigo AND  ;
	mod_rep.mod_repost = pmod  ;
	ORDER BY cliente.nome INTO  ;
	CURSOR alunos2
SELECT cliente.nome FROM cliente,  ;
	mod_avul WHERE  ;
	cliente.codigo ==  ;
	mod_avul.cliente_id AND  ;
	mod_avul.modulo_id = pmod  ;
	ORDER BY cliente.nome INTO  ;
	CURSOR alunos3
SELECT alunos
IF vis_impr
	auxprev = ' PREVIEW NOCONSOLE'
ELSE
	auxprev = ' PROMPT NOCONSOLE'
ENDIF
DO CASE
CASE ptip = 1
	REPORT FORM diario TO PRINTER &auxprev
	SELECT alunos2
	nrec = RECCOUNT()
	IF nrec > 0
		REPORT FORM diario2 TO PRINTER &auxprev
	ENDIF
	SELECT alunos3
	nrec = RECCOUNT()
	IF nrec > 0
		REPORT FORM diario3 TO PRINTER &auxprev
	ENDIF
CASE ptip = 2
	REPORT FORM atanotas TO PRINTER	&auxprev
CASE ptip = 3
	CREATE CURSOR aux (aux C (1))
	FOR i = 1 TO 21
		SELECT aux
		APPEND BLANK
	ENDFOR
	REPORT FORM conteud TO PRINTER &auxprev
CASE ptip = 4
	REPORT FORM credhora TO PRINTER	&auxprev
CASE ptip = 5
	REPORT FORM ativcomp TO PRINTER	&auxprev
CASE ptip = 6
	REPORT FORM listpres TO PRINTER	&auxprev
CASE ptip = 7
	REPORT FORM atanota2 TO PRINTER	&auxprev
ENDCASE
*
