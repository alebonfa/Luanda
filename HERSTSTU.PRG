ACCESS = veracess(wcoduser,23, 'CON')
IF ACCESS
	CONF = winconf('ATENÇÃO', 'Deseja re-estruturar os Clientes X Cursos?' )
	IF CONF
		DO abr_cont
		WAIT WINDOW NOWAIT  'Processando...'
		
		SELECT recebs.codcli,  ;
			recebs.area,  ;
			recebs.subarea,  ;
			SUM(recebs.valpgtorec) AS valor, ;
			MAX(recebs.datavencim) AS data ;
			FROM recebs ;
			GROUP BY  recebs.codcli, recebs.area, recebs.subarea  ;
			INTO CURSOR aux_cc
			
		SELECT mod_cab.area AS hoof, ;
			mod_cab.subarea AS bend, ;
			MIN(mod_cab.dat_ini) AS vanaf, ;
			MAX(mod_cab.dat_fim) AS laatste ;
			FROM mod_cab ;
			GROUP BY mod_cab.area, mod_cab.subarea ;
			ORDER BY mod_cab.area, mod_cab.subarea ;
			INTO CURSOR tijZeer
		SELECT tijZeer
		INDEX ON hoof + bend TAG hoofBend
			
		SELECT cc
		REPLACE cc.situacao  WITH '' FOR ALLTRIM(cc.situacao) $  'INSCRITO-ATIVO-CONCLUIDO'
		SELECT aux_cc
		SCAN
			SELECT cc
			SEEK STR(aux_cc.codcli,  6) + aux_cc.subarea + aux_cc.area
			IF  !FOUND()
				APPEND BLANK
				REPLACE cc.codcli WITH aux_cc.codcli
				REPLACE cc.codarea WITH aux_cc.area
				REPLACE cc.codsub WITH aux_cc.subarea
				DO grava_situ
			ELSE
				IF isblank(cc.situacao)
					DO grava_situ
				ENDIF
			ENDIF
			SELECT aux_cc
		ENDSCAN
		i = 1
		SELECT cc
		SCAN
			REPLACE cc.primario WITH i
			i = i + 1
		ENDSCAN
		SELECT cc
		DELETE FOR  isblank(cc.situacao)
		DIMENSION list_res[ 1]
		list_res[ 1] =  'NADA A LANÇAR...'
		SELECT UPPER(area.descricao) + ' ' +  ;
			UPPER(subarea.sigla) + ' ' +  ;
			STR(COUNT(aux_cc.codcli), 4) ;
			FROM aux_cc, area, subarea  ;
			WHERE area.codigo == aux_cc.area AND  ;
			subarea.codigo == aux_cc.subarea  ;
			GROUP BY aux_cc.area, aux_cc.subarea  ;
			ORDER BY area.descricao, subarea.sigla  ;
			INTO ARRAY list_res
		DO resumocc.spr
		CLOSE DATABASES
	ENDIF
ENDIF


*
PROCEDURE grava_situ
	IF aux_cc.valor > 150

		SELECT tijZeer 
		SEEK aux_cc.area + aux_cc.subarea
		IF FOUND()
			lokVanaf = tijZeer.vanaf
			lokLaatste = tijZeer.laatste
		ELSE
			STORE DATE() TO lokVanaf, lokLaatste
		ENDIF

		SELECT modulos
		SEEK aux_cc.subarea + aux_cc.area
		IF FOUND()
			DO CASE
			CASE modulos.status = 1
				SELECT cc
				REPLACE cc.situacao WITH 'ATIVO'
				REPLACE cc.data WITH lokVanaf
			CASE modulos.status = 2
				SELECT cc
				REPLACE cc.situacao WITH 'CONCLUIDO'
				REPLACE cc.data WITH lokLaatste
			OTHERWISE
				SELECT cc
				REPLACE cc.situacao WITH 'INSCRITO'
				REPLACE cc.data WITH lokVanaf
			ENDCASE
		ELSE
			SELECT cc
			REPLACE cc.situacao WITH 'ATIVO'
			REPLACE cc.data WITH lokVanaf
		ENDIF
	ELSE
		SELECT cc
		REPLACE cc.situacao WITH 'INSCRITO'
		REPLACE cc.data WITH aux_cc.data
	ENDIF
	RETURN
	*
