SELECT cliente.codigo FROM  ;
       Cliente, Clicurso WHERE  ;
       cliente.codigo ==  ;
       clicurso.codcli AND  ;
       clicurso.codarea ==  ;
       wla_arec AND  ;
       clicurso.codsub ==  ;
       wla_subc ORDER BY  ;
       cliente.nome INTO CURSOR  ;
       Auxcli
SELECT 0
CREATE CURSOR AUXCONT (id  ;
       N (10), cliente_id N (10),  ;
       nome C (45), texto M,  ;
       texto2 M, local C (50))
j = 1
SELECT mp
SEEK mod_cab.curso_id
SELECT empresas
SEEK mp.empr_id
SELECT area
SEEK mod_cab.area
SELECT subarea
SEEK mod_cab.subarea
SELECT auxcli
SCAN
     SELECT cliente
     SEEK auxcli.codigo
     SELECT auxcont
     APPEND BLANK
     REPLACE auxcont.id WITH j
     j = j + 1
     REPLACE auxcont.cliente_id  ;
             WITH auxcli.codigo
     REPLACE auxcont.nome WITH  ;
             cliente.nome
     REPLACE auxcont.texto WITH  ;
             'Eu, ' +  ;
             ALLTRIM(cliente.nome) +  ;
             ', recebi de ' +  ;
             ALLTRIM(empresas.nome) +  ;
             ', o boleto referente ao mês de ' +  ;
             ALLTRIM(list_mes(ac_pri)) +  ;
             '/' + STR(ano_pri,  ;
             4) + ' do curso de ' +  ;
             ALLTRIM(subarea.descricao) +  ;
             '.'
     REPLACE auxcont.texto2 WITH  ;
             'Eu, ' +  ;
             ALLTRIM(cliente.nome) +  ;
             ', recebi de ' +  ;
             ALLTRIM(empresas.nome) +  ;
             'os boletos referente aos meses de ' +  ;
             ALLTRIM(list_mes(ac_fai_i)) +  ;
             ' a ' +  ;
             ALLTRIM(list_mes(ac_fai_f)) +  ;
             '/' + STR(ano_fai_f,  ;
             4) + ' do curso de ' +  ;
             ALLTRIM(subarea.descricao) +  ;
             '.'
     REPLACE auxcont.local WITH  ;
             ALLTRIM(area.descricao) +  ;
             ', ' +  ;
             LEFT(DTOC(mod_cab.dat_ini),  ;
             2) + ' de ' +  ;
             ALLTRIM(list_mes(MONTH(mod_cab.dat_ini))) +  ;
             ' de ' + STR(ano_pri,  ;
             4)
     SELECT auxcli
ENDSCAN
IF vis_impr
     auxvis = 'PREVIEW'
ELSE
     auxvis = 'PROMPT NOCONSOLE'
ENDIF
SELECT auxcont
DO CASE
     CASE lpri .AND. lseg
          REPORT FORM ACEITE TO PRINTER;
&Auxvis
     CASE lpri .AND.  .NOT. lseg
          REPORT FORM ACEITE2 TO PRINTER;
&Auxvis
     CASE  .NOT. lpri .AND. lseg
          REPORT FORM ACEITE3 TO PRINTER;
&Auxvis
     OTHERWISE
          DO winalert WITH  ;
             'ATENÇÃO',  ;
             'SELECIONE UMA DAS OPÇÕES DE IMPRESSÃO!'
ENDCASE
SELECT auxcont
USE
*
