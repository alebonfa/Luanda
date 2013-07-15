STORE 0 TO wtot_prin, wtot_juro, wtot_desc, wtot_tar
SET MEMOWIDTH TO 240
STORE FOPEN(ALLTRIM(nom_arq)) TO  file_handl
STORE FSEEK(file_handl, 0, 2) TO  ifp_size
STORE FSEEK(file_handl, 0) TO  ifp_top
IF ifp_size <= 0
	WAIT WINDOW NOWAIT 'O Arquivo está vazio'
ELSE
	l_string = FREAD(file_handl, ifp_size)
	nlinhas = MEMLINES(l_string)
	SELECT recnum
	DIMENSION list_liq[ 1]
	list_liq[ 1] = ''
	C = 1
	FOR i = 3 TO (nlinhas - 3)
		linha = MLINE(l_string, i)
		ret_cod = SUBSTR(linha, 16, 2)
		SELECT tarifas
		SEEK '104' + ret_cod
		IF FOUND()
			IF SUBSTR(linha, 14, 1) = 'T'
				ret_id = INT(VAL(SUBSTR(linha, 49, 8)))
				ret_tar = INT(VAL(SUBSTR(linha, 199, 15))) / 100
			ENDIF
			IF SUBSTR(linha, 14, 1) = 'U'
				SELECT recnum
				SEEK ret_id
				IF FOUND()
					ret_dpg = CTOD(SUBSTR(linha, 138, 02) + '/' + SUBSTR(linha, 140, 02) + '/' + SUBSTR(linha, 142, 04))
					ret_jur = INT(VAL(SUBSTR(linha, 18, 15))) / 100
					ret_des =  INT(VAL(SUBSTR(linha, 33, 15))) / 100
					ret_pag =  INT(VAL(SUBSTR(linha, 78, 15))) / 100
					wtot_juro = wtot_juro + ret_jur
					wtot_desc = wtot_desc + ret_des
					wtot_prin = wtot_prin + ret_pag + ret_des - ret_jur
					wtot_tar = wtot_tar + ret_tar
					IF ret_cod $ '06-17'
						IF recnum.situacao $ 'AFPV'
							REPLACE recnum.situacao WITH 'L'
							REPLACE recnum.datapagtos WITH ret_dpg
							REPLACE recnum.valorjuros WITH ret_jur
							REPLACE recnum.valordesco WITH ret_des
							REPLACE recnum.valorliqui WITH ret_pag
							IF isblank(list_liq(1))
								DIMENSION list_liq[ 1]
							ELSE
								DIMENSION list_liq[ c]
							ENDIF
							list_liq[ c] = 'LIQ ' + recnum.razaosocia + ' ' + STR(ret_id, 10) + ' ' + DTOC(ret_dpg) + ' ' + STR(ret_pag, 8, 2) + STR(ret_jur, 7, 2) + STR(ret_des, 7, 2)
							C = C + 1
						ELSE
							IF isblank(list_liq(1))
								DIMENSION list_liq[ 1]
							ELSE
								DIMENSION list_liq[ c]
							ENDIF
							list_liq[ c] = 'NÃO ' + recnum.razaosocia + ' ' + STR(ret_id, 10) + ' ' + DTOC(ret_dpg) + ' ' + STR(ret_pag, 8, 2) + STR(ret_jur, 7, 2) + STR(ret_des, 7, 2)
							C = C + 1
						ENDIF
					ENDIF
					SELECT rectar_2
					SEEK STR(ret_id, 8) + '104' + ret_cod + '  ' +  DTOC(ret_dpg)
					IF  .NOT. FOUND()
						SELECT rectarif
						GOTO BOTTOM
						ult_id = rectarif.id
						APPEND BLANK
						REPLACE rectarif.id WITH ult_id + 1
						REPLACE rectarif.recebs_id WITH ret_id
						REPLACE rectarif.banco_id WITH '104'
						REPLACE rectarif.tarifa_id WITH ret_cod
						REPLACE rectarif.valor WITH ret_tar
						REPLACE rectarif.data WITH ret_dpg
					ENDIF
				ELSE
					IF isblank(list_liq(1))
						DIMENSION list_liq[1]
					ELSE
						DIMENSION list_liq[c]
					ENDIF
					list_liq[c] = 'Título não Encontrado: ' + STR(ret_id, 10)
					C = C + 1
				ENDIF
			ENDIF
		ENDIF
	ENDFOR
ENDIF
= FCLOSE(file_handl)
