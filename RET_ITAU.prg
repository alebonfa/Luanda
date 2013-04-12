STORE 0 TO wtot_prin, wtot_juro,  ;
      wtot_desc, wtot_tar
STORE FOPEN(ALLTRIM(nom_arq)) TO  ;
      file_handl
STORE FSEEK(file_handl, 0, 2) TO  ;
      ifp_size
STORE FSEEK(file_handl, 0) TO  ;
      ifp_top
IF ifp_size <= 0
     WAIT WINDOW NOWAIT  ;
          'O Arquivo está vazio'
ELSE
     l_string = FREAD(file_handl,  ;
                ifp_size)
     nlinhas = LEN(l_string) /  ;
               402
     SELECT recnum
     DIMENSION list_liq[ 1]
     list_liq[ 1] = ''
     c = 1
     FOR i = 2 TO (nlinhas - 1)
          linha = SUBSTR(l_string,  ;
                  ((i - 1) * 402) +  ;
                  1, 400)
          ret_cod = SUBSTR(linha,  ;
                    109, 2)
          SELECT tarifas
          SEEK '341' + ret_cod
          IF FOUND()
               ret_id = INT(VAL(SUBSTR(linha,  ;
                        63, 8)))
               SELECT recnum
               SEEK ret_id
               IF FOUND()
                    ret_tar = INT(VAL(SUBSTR(linha,  ;
                              176,  ;
                              13))) /  ;
                              100
                    ret_dpg = CTOD(SUBSTR(linha,  ;
                              111,  ;
                              02) +  ;
                              '/' +  ;
                              SUBSTR(linha,  ;
                              113,  ;
                              02) +  ;
                              '/20' +  ;
                              SUBSTR(linha,  ;
                              115,  ;
                              02))
                    ret_jur = INT(VAL(SUBSTR(linha,  ;
                              267,  ;
                              13))) /  ;
                              100
                    ret_des = INT(VAL(SUBSTR(linha,  ;
                              241,  ;
                              13))) /  ;
                              100
                    ret_pag = INT(VAL(SUBSTR(linha,  ;
                              153,  ;
                              13))) /  ;
                              100
                    wtot_tar = wtot_tar +  ;
                               ret_tar
                    IF ret_cod $  ;
                       '06-08'
                         wtot_juro =  ;
                          wtot_juro +  ;
                          ret_jur
                         wtot_desc =  ;
                          wtot_desc +  ;
                          ret_des
                         wtot_prin =  ;
                          wtot_prin +  ;
                          ret_pag
                         IF recnum.situacao $  ;
                            'AFPV'
                              REPLACE  ;
                               recnum.situacao  ;
                               WITH  ;
                               'L'
                              REPLACE  ;
                               recnum.datapagtos  ;
                               WITH  ;
                               ret_dpg
                              REPLACE  ;
                               recnum.valorjuros  ;
                               WITH  ;
                               ret_jur
                              REPLACE  ;
                               recnum.valordesco  ;
                               WITH  ;
                               ret_des
                              REPLACE  ;
                               recnum.valorliqui  ;
                               WITH  ;
                               ret_pag +  ;
                               ret_jur -  ;
                               ret_des
                              IF ISBLANK(list_liq(1))
                                   DIMENSION list_liq[ 1]
                              ELSE
                                   DIMENSION list_liq[ c]
                              ENDIF
                              list_liq[  ;
                               c] =  ;
                               'LIQ ' +  ;
                               recnum.razaosocia +  ;
                               ' ' +  ;
                               STR(ret_id,  ;
                               10) +  ;
                               ' ' +  ;
                               DTOC(ret_dpg) +  ;
                               ' ' +  ;
                               STR(ret_pag,  ;
                               8,  ;
                               2) +  ;
                               STR(ret_jur,  ;
                               7,  ;
                               2) +  ;
                               STR(ret_des,  ;
                               7,  ;
                               2)
                              c =  ;
                               c +  ;
                               1
                         ELSE
                              IF ISBLANK(list_liq(1))
                                   DIMENSION list_liq[ 1]
                              ELSE
                                   DIMENSION list_liq[ c]
                              ENDIF
                              list_liq[  ;
                               c] =  ;
                               'NÃO ' +  ;
                               recnum.razaosocia +  ;
                               ' ' +  ;
                               STR(ret_id,  ;
                               10) +  ;
                               ' ' +  ;
                               DTOC(ret_dpg) +  ;
                               ' ' +  ;
                               STR(ret_pag,  ;
                               8,  ;
                               2) +  ;
                               STR(ret_jur,  ;
                               7,  ;
                               2) +  ;
                               STR(ret_des,  ;
                               7,  ;
                               2)
                              c =  ;
                               c +  ;
                               1
                         ENDIF
                    ENDIF
                    SELECT rectar_2
                    SEEK STR(ret_id,  ;
                         8) +  ;
                         '341' +  ;
                         ret_cod +  ;
                         '  ' +  ;
                         DTOC(ret_dpg)
                    IF  .NOT.  ;
                        FOUND()
                         SELECT rectarif
                         GOTO BOTTOM
                         ult_id =  ;
                          rectarif.id
                         APPEND BLANK
                         REPLACE rectarif.id  ;
                                 WITH  ;
                                 ult_id +  ;
                                 1
                         REPLACE rectarif.recebs_id  ;
                                 WITH  ;
                                 ret_id
                         REPLACE rectarif.banco_id  ;
                                 WITH  ;
                                 '341'
                         REPLACE rectarif.tarifa_id  ;
                                 WITH  ;
                                 ret_cod
                         REPLACE rectarif.valor  ;
                                 WITH  ;
                                 ret_tar
                         REPLACE rectarif.data  ;
                                 WITH  ;
                                 ret_dpg
                    ENDIF
               ELSE
                    IF ISBLANK(list_liq(1))
                         DIMENSION  ;
                          list_liq[  ;
                          1]
                    ELSE
                         DIMENSION  ;
                          list_liq[  ;
                          c]
                    ENDIF
                    list_liq[ c] =  ;
                            'Título não Encontrado: ' +  ;
                            STR(ret_id,  ;
                            10)
                    c = c + 1
               ENDIF
          ENDIF
     ENDFOR
ENDIF
= FCLOSE(file_handl)
*
