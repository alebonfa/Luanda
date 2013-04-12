IF FILE('C:\Financ.DBF')
	DELETE FILE C:\financ.dbf
	DELETE FILE C:\financ.cdx
ENDIF
SELECT 0
CREATE DBF C:\financ (tipo C (1),  ;
	matric N (6), codcurso N  ;
	(10), compet C (6),  ;
	dt_venc C (10), valor N  ;
	(10, 2), bolsa N (10, 2),  ;
	abatim N (10, 2), pago N  ;
	(10, 2), dt_pago C (10))
SELECT parc_cab
SEEK list_cab(cabs,2)
SELECT parc_itm
tot_parc = 0.00
SCAN FOR parc_itm.cod_parc ==  ;
		parc_cab.codigo
	auxarea = parc_itm.area
	SELECT area
	SEEK auxarea
	auxsubarea = parc_itm.subarea
	SELECT subarea
	SEEK auxsubarea
	SELECT modulos
	SEEK auxsubarea + auxarea
	IF FOUND()
		aux_mes = IIF(modulos.mes_i <  ;
			10,  ;
			modulos.mes_i +  ;
			3,  ;
			modulos.mes_i -  ;
			9)
		aux_ano = IIF(modulos.mes_i <  ;
			10,  ;
			modulos.ano_i,  ;
			modulos.ano_i +  ;
			1)
		exp_di = CTOD('01/' +  ;
			IIF(aux_mes <  ;
			10, '0', '') +  ;
			ALLTRIM(STR(aux_mes,  ;
			2)) + '/' +  ;
			STR(aux_ano,  ;
			4))
		exp_df = exp_di + 364
		SELECT clicurso.codcli  ;
			FROM clicurso  ;
			WHERE  ;
			clicurso.codarea ==  ;
			auxarea AND  ;
			clicurso.codsub ==  ;
			auxsubarea AND  ;
			ALLTRIM(clicurso.situacao) $  ;
			'ATIVO-CONCLUIDO-BOLSISTA'  ;
			GROUP BY  ;
			clicurso.codcli  ;
			INTO CURSOR  ;
			clis
		SELECT 0
		SELECT recebs.codcli AS  ;
			matric,  ;
			recebs.datavencim  ;
			AS dt_venc,  ;
			IIF(recebs.valpgtorec -  ;
			recebs.valdescont >  ;
			recebs.valorliqui,  ;
			recebs.valorliqui,  ;
			recebs.valpgtorec -  ;
			recebs.valdescont)  ;
			AS valor,  ;
			recebs.datapagtos  ;
			AS dt_pago FROM  ;
			recebs, clis  ;
			WHERE  ;
			recebs.codcli ==  ;
			clis.codcli AND  ;
			recebs.area =  ;
			auxarea AND  ;
			recebs.subarea =  ;
			auxsubarea AND  ;
			recebs.datavencim >=  ;
			exp_di AND  ;
			recebs.datavencim <=  ;
			exp_df AND  ;
			recebs.datapagtos >=  ;
			di AND  ;
			recebs.datapagtos <=  ;
			df AND  ;
			recebs.valpgtorec >  ;
			120.00  AND  ;
			recebs.situacao =  ;
			'L' ORDER BY  ;
			recebs.codcli,  ;
			recebs.datavencim  ;
			INTO CURSOR  ;
			parcelas
		SELECT parcelas
		SCAN
			SELECT financ
			APPEND BLANK
			REPLACE financ.tipo  ;
				WITH 'I'
			REPLACE financ.matric  ;
				WITH  ;
				parcelas.matric
			REPLACE financ.codcurso  ;
				WITH  ;
				modulos.primario
			REPLACE financ.compet  ;
				WITH  ;
				SUBSTR(DTOC(parcelas.dt_venc),  ;
				4, 2) +  ;
				SUBSTR(DTOC(parcelas.dt_venc),  ;
				7, 4)
			REPLACE financ.dt_venc  ;
				WITH  ;
				DTOC(parcelas.dt_venc)
			REPLACE financ.valor  ;
				WITH  ;
				parcelas.valor
			REPLACE financ.bolsa  ;
				WITH 0.00
			REPLACE financ.abatim  ;
				WITH 0.00
			REPLACE financ.pago  ;
				WITH  ;
				parcelas.valor
			REPLACE financ.dt_pago  ;
				WITH  ;
				DTOC(parcelas.dt_pago)
		ENDSCAN
		SELECT parcelas
		USE
	ELSE
		DO winalert WITH  ;
			'ATENÇÃO',  ;
			'Curso não encontrado: '+ ;
			ALLTRIM(area.descricao)+ ;
			' '+ ;
			ALLTRIM(subarea.sigla)
	ENDIF
	SELECT parc_itm
ENDSCAN
file_name = 'C:\FINANC.XLS'
out_file = PUTFILE( ;
	'Nome do Arquivo:',  ;
	file_name, 'XLS')
IF EMPTY(out_file)
	DO winalert WITH 'ATENÇÃO',  ;
		'PLANILHA NÃO GRAVADA.'
ELSE
	SELECT financ
	SET SAFETY OFF
	COPY TO &out_file TYPE XLS
	SET SAFETY ON
	DO winalert WITH 'ATENCÃO',  ;
		'PLANILHA CRIADO COM SUCESSO: '+ ;
		ALLTRIM(out_file)
ENDIF
SELECT area.codigo AS codare,  ;
	area.descricao,  ;
	subarea.codigo AS codsub,  ;
	subarea.sigla,  ;
	SUM(financ.valor) AS ucb  ;
	FROM financ, modulos, area,  ;
	subarea WHERE  ;
	financ.codcurso ==  ;
	modulos.primario AND  ;
	modulos.subarea ==  ;
	subarea.codigo AND  ;
	modulos.area ==  ;
	area.codigo GROUP BY  ;
	area.descricao,  ;
	subarea.sigla ORDER BY  ;
	area.descricao,  ;
	subarea.sigla INTO CURSOR  ;
	totais
CREATE CURSOR comp_ucb (area C  ;
	(20), subarea C (10), ucb  ;
	N (10, 2), qua N (10, 2))
SELECT totais
SCAN
	tot_qua = 0
	SELECT recebs
	CALCULATE FOR recebs.area ==  ;
		totais.codare  ;
		.AND.  ;
		recebs.subarea ==  ;
		totais.codsub  ;
		.AND.  ;
		recebs.datapagtos >=  ;
		di .AND.  ;
		recebs.datapagtos <=  ;
		df  ;
		SUM(recebs.valorliqui)  ;
		TO tot_qua
	SELECT comp_ucb
	APPEND BLANK
	REPLACE comp_ucb.area WITH  ;
		totais.descricao
	REPLACE comp_ucb.subarea  ;
		WITH totais.sigla
	REPLACE comp_ucb.ucb WITH  ;
		totais.ucb
	REPLACE comp_ucb.qua WITH  ;
		tot_qua
	SELECT totais
ENDSCAN
SELECT * FROM comp_ucb
SELECT financ
USE
DO winalert WITH 'AVISO',  ;
	'ARQUIVO EXPORTADO PARA C:\FINANC.XLS'
*
