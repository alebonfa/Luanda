STORE '' TO wmoda1, wmoda2,  ;
      wmoda3, wmoda4, wmoda5
STORE 0 TO whora1, whora2, whora3,  ;
      whora4, whora5
STORE '' TO wtema, worientado,  ;
      wcorretor, wresumo
STORE {} TO wdat_praz, wdat_entr,  ;
      wdat_cert
STORE .F. TO waceite, wemissao
STORE 0 TO wconceito, wconccorr
STORE 1 TO waprovado
auxmod = mod_cab.primario
auxcur = mod_cab.curso_id
auxare = mod_cab.area
auxsub = mod_cab.subarea
SELECT clicurso.codcli FROM  ;
       Clicurso WHERE  ;
       clicurso.codarea == auxare  ;
       AND clicurso.codsub ==  ;
       auxsub AND  ;
       ALLTRIM(clicurso.situacao) $  ;
       'ATIVO-CONCLUIDO-BOLSISTA'  ;
       GROUP BY clicurso.codcli  ;
       INTO CURSOR Alu_ativ
IF mod_cab.opcional
     auxarq = ''
ELSE
     auxarq = 'C:\Notas' +  ;
              ALLTRIM(STR(mod_cab.numero,  ;
              10)) + '.xls'
ENDIF
SELECT 'I' AS tipo, 000000 AS  ;
       matricula,  ;
       mod_cab.primario AS turma,  ;
       mod_disc.id_disc,  ;
       discip.descricao AS  ;
       disciplina,  ;
       SUM(mod_disc.carga) AS  ;
       carga FROM Modulos,  ;
       Mod_cab, Mod_disc, Discip  ;
       WHERE modulos.primario ==  ;
       mod_cab.curso_id AND  ;
       mod_cab.primario ==  ;
       mod_disc.modulo AND  ;
       mod_disc.id_disc ==  ;
       discip.codigo AND  ;
       mod_cab.primario == auxmod  ;
       AND  NOT mod_cab.opcional  ;
       GROUP BY mod_cab.numero,  ;
       discip.descricao ORDER BY  ;
       mod_cab.numero,  ;
       mod_cab.dat_ini,  ;
       mod_disc.data,  ;
       mod_disc.carga_p INTO  ;
       CURSOR Mod_geral
SELECT academic.* FROM Academic  ;
       WHERE academic.codmod  ;
       IN(SELECT DISTINCT  ;
       mod_geral.turma FROM  ;
       Mod_geral) INTO CURSOR  ;
       Cli_dados
SELECT mod_geral
= AFIELDS(w_struct)
ncampos = ALEN(w_struct) / 4
DIMENSION w_struct[ ncampos + 2,  ;
          4]
w_struct[ ncampos + 1, 1] =  ;
        'Cli_pres'
w_struct[ ncampos + 1, 2] = 'N'
w_struct[ ncampos + 1, 3] = 4
w_struct[ ncampos + 1, 4] = 0
w_struct[ ncampos + 2, 1] =  ;
        'Cli_nota'
w_struct[ ncampos + 2, 2] = 'N'
w_struct[ ncampos + 2, 3] = 4
w_struct[ ncampos + 2, 4] = 1
CREATE CURSOR Rel_pres FROM ARRAY  ;
       w_struct
STORE 0 TO tpres, tnotas, tcarga
SELECT cli_dados
SCAN
     SELECT mod_geral
     SCAN
          SCATTER MEMVAR
          INSERT INTO Rel_pres  ;
                 FROM MEMVAR
     ENDSCAN
     aux_mod = cli_dados.codmod
     SELECT mod_disc.data,  ;
            mod_disc.id_disc AS  ;
            disciplina,  ;
            mod_disc.carga_p,  ;
            mod_disc.carga FROM  ;
            Mod_disc WHERE  ;
            mod_disc.modulo ==  ;
            aux_mod ORDER BY  ;
            mod_disc.data,  ;
            mod_disc.carga_p INTO  ;
            CURSOR Aux
     qde_presen = 0
     disc_ant = 0
     i = 1
     j = 1
     SELECT aux
     SCAN
          IF disc_ant <>  ;
             aux.disciplina
               IF disc_ant > 0
                    SELECT rel_pres
                    LOCATE FOR  ;
                           rel_pres.id_disc ==  ;
                           disc_ant  ;
                           .AND.  ;
                           rel_pres.matricula ==  ;
                           0
                    REPLACE rel_pres.cli_pres  ;
                            WITH  ;
                            qde_presen
                    qde_presen = 0
                    auxnota = 'N' +  ;
                              STR(j,  ;
                              1)
                    REPLACE Rel_pres.Cli_nota;
WITH Cli_dados.&Auxnota
                    j = j + 1
                    REPLACE rel_pres.matricula  ;
                            WITH  ;
                            cli_dados.codcli
               ENDIF
               disc_ant = aux.disciplina
          ENDIF
          auxper = 'P' + STR(i,  ;
                   1)
          SELECT cli_dados
          IF !Cli_dados.&Auxper
               qde_presen = qde_presen +  ;
                            aux.carga
          ENDIF
          i = i + 1
          SELECT aux
     ENDSCAN
     SELECT rel_pres
     LOCATE FOR rel_pres.id_disc ==  ;
            disc_ant .AND.  ;
            rel_pres.matricula ==  ;
            0
     REPLACE rel_pres.cli_pres  ;
             WITH qde_presen
     auxnota = 'N' + STR(j, 1)
     REPLACE Rel_pres.Cli_nota WITH Cli_dados.&Auxnota
     REPLACE rel_pres.matricula  ;
             WITH  ;
             cli_dados.codcli
     SELECT cli_dados
ENDSCAN
SELECT rel_pres
REPLACE rel_pres.turma WITH  ;
        auxcur ALL
SELECT rel_pres.tipo,  ;
       rel_pres.matricula,  ;
       rel_pres.turma,  ;
       rel_pres.disciplina,  ;
       rel_pres.cli_nota AS nota,  ;
       rel_pres.cli_pres AS  ;
       faltas, IIF(cli_nota >= 7,  ;
       IIF((rel_pres.cli_pres /  ;
       rel_pres.carga) > 0.25 ,  ;
       'N', 'S'), 'N') AS  ;
       aprovado FROM Rel_pres  ;
       WHERE rel_pres.matricula  ;
       IN(SELECT codcli FROM  ;
       Alu_ativ) INTO CURSOR  ;
       Exporta
IF  .NOT. ISBLANK(auxarq)
     IF FILE(auxarq)
          DELE FILE &Auxarq
     ENDIF
     file_name = auxarq
     out_file = PUTFILE( ;
                'Nome do Arquivo:',  ;
                file_name,  ;
                'XLS')
     IF EMPTY(out_file)
          DO winalert WITH  ;
             'ATENÇÃO',  ;
             'PLANILHA NÃO GRAVADA.'
     ELSE
          SELECT exporta
          SET SAFETY OFF
          COPY TO &out_file TYPE XLS
          SET SAFETY ON
          DO winalert WITH  ;
             'ATENCÃO',  ;
             'PLANILHA CRIADO COM SUCESSO: '+ ;
             ALLTRIM(out_file)
     ENDIF
ENDIF
*
FUNCTION get_aprov
PARAMETER pcarga, pfalta, pnota
raprov = 'S'
IF pnota >= 7
     IF pfalta / pcarga > 0.25 
          raprov = 'N'
     ENDIF
ELSE
     raprov = 'N'
ENDIF
RETURN raprov
*
