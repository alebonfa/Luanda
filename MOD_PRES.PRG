SELECT modulos
SEEK lst_curs(curs,2)
IF FOUND()
     auxcur = modulos.primario
     auxare = modulos.area
     auxsub = modulos.subarea
     auxnmd = modulos.modus
     SELECT subarea.descricao AS  ;
            subarea,  ;
            subarea.sigla,  ;
            area.descricao AS  ;
            area,  ;
            modulos.primario,  ;
            modulos.mes_i,  ;
            modulos.ano_i,  ;
            modulos.mes_f,  ;
            modulos.ano_f,  ;
            mod_cab.primario AS  ;
            prim_cab,  ;
            mod_cab.numero,  ;
            mod_cab.qde_notas,  ;
            SUM(mod_disc.carga)  ;
            AS carga FROM Modulos,  ;
            Subarea, Area,  ;
            Mod_cab, Mod_disc  ;
            WHERE modulos.area ==  ;
            area.codigo AND  ;
            modulos.subarea ==  ;
            subarea.codigo AND  ;
            modulos.primario ==  ;
            mod_cab.curso_id AND  ;
            mod_cab.primario ==  ;
            mod_disc.modulo AND   ;
            NOT mod_cab.opcional  ;
            AND modulos.primario ==  ;
            auxcur GROUP BY  ;
            modulos.primario,  ;
            mod_cab.numero ORDER  ;
            BY modulos.ano_i,  ;
            area.descricao,  ;
            subarea.sigla,  ;
            mod_cab.numero,  ;
            mod_cab.dat_ini INTO  ;
            CURSOR Mod_geral
     n_mod = 0
     auxcampos = 'Codigo N(6), Soma_nt N(7,2), Soma_fr N(6), Ac N(6)'
     SELECT mod_geral
     n_mod = RECCOUNT()
     IF n_mod > 13
          DIMENSION list_pm[ 1]
          FOR i = 1 TO  ;
              modulos.modus - 13
               DIMENSION list_pm[  ;
                         i]
               list_pm[ i] =  ;
                      STR(i, 4)
          ENDFOR
          pms = 1
          wpm = INT(VAL(list_pm(pms)))
     ELSE
          wpm = 1
     ENDIF
     FOR i = 1 TO 26
          aux_ch = 'Ch' +  ;
                   ALLTRIM(STR(i,  ;
                   4))
          &Aux_CH = 0
          aux_nt = 'Nt' +  ;
                   ALLTRIM(STR(i,  ;
                   4))
          &Aux_NT = 0
          nmod = 'M' +  ;
                 ALLTRIM(STR(i,  ;
                 4))
          auxcampos = auxcampos +  ;
                      ', ' + nmod +  ;
                      '_FR N(4), ' +  ;
                      nmod +  ;
                      '_MD N(4,1)'
     ENDFOR
     CREATE CURSOR Espelho (&Auxcampos)
     SELECT espelho
     INDEX ON codigo TAG codigo
     SELECT academic.* FROM  ;
            Academic WHERE  ;
            academic.codmod  ;
            IN(SELECT DISTINCT  ;
            mod_geral.prim_cab  ;
            FROM Mod_geral) ORDER  ;
            BY academic.codmod,  ;
            academic.codcli INTO  ;
            CURSOR Cli_dados
     i = 1
     SELECT mod_geral
     SCAN
          auxmod = mod_geral.prim_cab
          WAIT WINDOW NOWAIT  ;
               'Módulo ' +  ;
               ALLTRIM(STR(auxmod,  ;
               10))
          SELECT ativcomp.codcli,  ;
                 SUM(ativcomp.pontos)  ;
                 AS pontos FROM  ;
                 Ativcomp WHERE  ;
                 ativcomp.codmod ==  ;
                 auxmod GROUP BY  ;
                 codcli INTO  ;
                 CURSOR Pts_ac
          aux_fr = 'M' +  ;
                   ALLTRIM(STR(i,  ;
                   4)) + '_FR'
          aux_ch = 'Ch' +  ;
                   ALLTRIM(STR(i,  ;
                   4))
          &Aux_CH = Mod_geral.Carga
          aux_md = 'M' +  ;
                   ALLTRIM(STR(i,  ;
                   4)) + '_MD'
          aux_nt = 'Nt' +  ;
                   ALLTRIM(STR(i,  ;
                   4))
          &Aux_NT = Mod_geral.Qde_notas
          SELECT cli_dados
          SCAN FOR  ;
               cli_dados.codmod =  ;
               auxmod
               WAIT WINDOW NOWAIT  ;
                    'Módulo ' +  ;
                    ALLTRIM(STR(auxmod,  ;
                    10)) +  ;
                    ' Aluno ' +  ;
                    ALLTRIM(STR(cli_dados.codcli,  ;
                    10))
               aux_mod = cli_dados.codmod
               SELECT mod_disc.data,  ;
                      mod_disc.professor,  ;
                      mod_disc.disciplina,  ;
                      mod_disc.carga_p,  ;
                      mod_disc.carga  ;
                      FROM  ;
                      Mod_disc  ;
                      WHERE  ;
                      mod_disc.modulo ==  ;
                      aux_mod  ;
                      ORDER BY  ;
                      mod_disc.data,  ;
                      mod_disc.carga_p  ;
                      INTO CURSOR  ;
                      Aux
               qde_presen = 0
               j = 1
               SELECT aux
               SCAN
                    auxper = 'P' +  ;
                             STR(j,  ;
                             1)
                    SELECT cli_dados
                    IF Cli_dados.&Auxper;
= .T.
                         qde_presen =  ;
                          qde_presen +  ;
                          aux.carga
                    ENDIF
                    j = j + 1
                    SELECT aux
               ENDSCAN
               SELECT espelho
               SEEK cli_dados.codcli
               IF  .NOT. FOUND()
                    APPEND BLANK
                    REPLACE espelho.codigo  ;
                            WITH  ;
                            cli_dados.codcli
               ENDIF
               REPLACE Espelho.&Aux_fr;
WITH Espelho.&Aux_fr + Qde_presenca
               REPLACE Espelho.&Aux_md;
WITH Espelho.&Aux_md + Cli_dados.N1 +;
Cli_dados.N2 + Cli_dados.N3
               REPLACE espelho.soma_fr  ;
                       WITH  ;
                       espelho.soma_fr +  ;
                       qde_presen
               REPLACE Espelho.Soma_nt;
WITH Espelho.Soma_nt + ((Cli_dados.N1;
+ Cli_dados.N2 + Cli_dados.N3) / &Aux_NT)
               SELECT pts_ac
               LOCATE FOR  ;
                      pts_ac.codcli ==  ;
                      cli_dados.codcli
               IF FOUND()
                    SELECT espelho
                    REPLACE espelho.ac  ;
                            WITH  ;
                            espelho.ac +  ;
                            pts_ac.pontos
               ENDIF
               SELECT cli_dados
          ENDSCAN
          i = i + 1
          SELECT mod_geral
     ENDSCAN
     SELECT espelho.*,  ;
            cliente.nome FROM  ;
            Espelho, Cliente  ;
            WHERE espelho.codigo ==  ;
            cliente.codigo AND  ;
            espelho.codigo  ;
            IN(SELECT codcli FROM  ;
            Clicurso WHERE  ;
            clicurso.codarea ==  ;
            auxare AND  ;
            clicurso.codsub ==  ;
            auxsub) ORDER BY  ;
            cliente.nome INTO  ;
            CURSOR Imp_esp
     SELECT imp_esp
     IF vis_impr
          REPORT FORM Espelho  ;
                 TO PRINTER PREVIEW  ;
                 NOCONSOLE
          IF n_mod > 13
               REPORT FORM  ;
                      Espelho2  ;
                      TO PRINTER PREVIEW  ;
                      NOCONSOLE
          ENDIF
     ELSE
          REPORT FORM Espelho  ;
                 TO PRINTER  ;
                 PROMPT  ;
                 NOCONSOLE
          IF n_mod > 13
               REPORT FORM  ;
                      Espelho2 TO  ;
                      PRINTER  ;
                      PROMPT  ;
                      NOCONSOLE
          ENDIF
     ENDIF
ELSE
     DO winalert WITH 'ATENÇÃO',  ;
        'CURSO NÃO CADASTRADO!'
ENDIF
*
