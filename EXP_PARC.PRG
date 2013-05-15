SELECT parc_cab
SEEK list_cab(cabs,2)
SELECT parc_itm
tot_parc = 0.00
gravaUnidade = ''
quantPlanilhas = 0

SCAN FOR parc_itm.cod_parc == parc_cab.codigo
	auxarea = parc_itm.area
	SELECT area
	SEEK auxarea
	auxsubarea = parc_itm.subarea
	SELECT subarea
	SEEK auxsubarea
	SELECT SUBSTR(DTOC(recebs.datapagtos), 4, 7) AS periodo ;
		FROM recebs ;
		WHERE recebs.area = auxarea  AND ;
		recebs.subarea = auxsubarea AND ;
		recebs.valpgtorec > 100.00 AND ;
		recebs.situacao = 'L' ;
		GROUP BY 1 ;
		ORDER BY recebs.datapagtos ;
		INTO CURSOR meses
	auxcampos = ''
	SELECT meses
	SCAN
		auxcampos = auxcampos + ', M' + SUBSTR(meses.periodo, 1, 2) + '_' + ;
			SUBSTR(meses.periodo, 4, 4) + ' N(10,2)'
	ENDSCAN

	CREATE CURSOR tabela (NOME C(35), ;
		codigo N(6) &auxcampos)
	SELECT tabela
	INDEX ON codigo TAG codigo

	SELECT recebs.codcli AS codigo,  ;
		recebs.razaosocia AS NOME,  ;
		recebs.datapagtos AS DATA,  ;
		IIF(recebs.valpgtorec - recebs.valdescont > recebs.valorliqui, recebs.valorliqui, recebs.valpgtorec - recebs.valdescont) AS valor ;
		FROM recebs  ;
		WHERE recebs.area = auxarea AND ;
		recebs.subarea = auxsubarea AND ;
		recebs.valpgtorec > 100.00 AND ;
		recebs.situacao = 'L' ;
		ORDER BY recebs.razaosocia  ;
		INTO CURSOR parcelas
		
	SELECT parcelas
	SCAN
		SELECT tabela
		SEEK parcelas.codigo
		IF  !FOUND()
			APPEND BLANK
			REPLACE tabela.codigo WITH parcelas.codigo
			REPLACE tabela.nome WITH parcelas.nome
		ENDIF
		auxfield = 'M' + SUBSTR(DTOC(parcelas.data), 4, 2) + '_' + SUBSTR(DTOC(parcelas.data), 7, 4)
		REPLACE &auxfield WITH &auxfield + parcelas.valor
		SELECT parcelas
	ENDSCAN

	IF ISBLANK(gravaUnidade)
		narq = 'C:\' + LEFT(ALLTRIM(area.sigla), 2) + LEFT(ALLTRIM(STUFF(ALLTRIM(subarea.sigla), LEN(ALLTRIM(subarea.sigla)) - 2, 2, '')), 5) + RIGHT(ALLTRIM(subarea.sigla), 2)
		file_name = narq
		out_file = PUTFILE( 'Nome do Arquivo:', file_name,  'XLS')
	ELSE
		out_file = gravaUnidade + ':\' + LEFT(ALLTRIM(area.sigla), 2) + LEFT(ALLTRIM(STUFF(ALLTRIM(subarea.sigla), LEN(ALLTRIM(subarea.sigla)) - 2, 2, '')), 5) + RIGHT(ALLTRIM(subarea.sigla), 2)
	ENDIF	

	WAIT WINDOW NOWAIT out_file

	IF EMPTY(out_file)
		DO winalert WITH  'ATENÇÃO', 'PLANILHA NÃO GRAVADA.'
	ELSE
		quantPlanilhas = quantPlanilhas + 1
		gravaUnidade = LEFT(out_file,1)
		SELECT tabela
		SET SAFETY OFF
		COPY TO &out_file TYPE XLS
		SET SAFETY ON
	ENDIF
	USE
	SELECT parc_itm
ENDSCAN

IF quantPlanilhas > 0
	DO winalert WITH  'ATENCÃO', ALLTRIM(STR(quantPlanilhas,4)) + ' PLANILHA(S) CRIADA(S) COM SUCESSO'
ENDIF
