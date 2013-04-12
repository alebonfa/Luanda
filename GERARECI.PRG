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
       texto M, local C (50))
j = 1
SELECT mp
SEEK mod_cab.curso_id
SELECT empresas
SEEK mp.empr_id
wempresa = empresas.nome
SELECT area
SEEK mod_cab.area
SELECT subarea
SEEK mod_cab.subarea
SELECT auxcli
SCAN
     SELECT cliente
     SEEK auxcli.codigo
     aux_par1 = modulos.invest /  ;
                modulos.parcs
     aux_par2 = (aux_par1 *  ;
                cliente.desconto) /  ;
                100
     aux_par3 = aux_par1 -  ;
                aux_par2
     SELECT auxcont
     APPEND BLANK
     REPLACE auxcont.id WITH j
     j = j + 1
     REPLACE auxcont.cliente_id  ;
             WITH auxcli.codigo
     REPLACE auxcont.texto WITH  ;
             ALLTRIM(empresas.nome) +  ;
             ', recebeu de ' +  ;
             ALLTRIM(cliente.nome) +  ;
             ', o valor de R$ ' +  ;
             ALLTRIM(STR(aux_par3,  ;
             10, 2)) + ' (' +  ;
             ALLTRIM(extenso(aux_par3, ;
             .T.)) +  ;
             '), referente ao pagamento da primeira parcela (1/' +  ;
             ALLTRIM(STR(modulos.parcs,  ;
             4)) +  ;
             ') do curso de ' +  ;
             ALLTRIM(subarea.descricao) +  ;
             '.'
     REPLACE auxcont.local WITH  ;
             ALLTRIM(area.descricao) +  ;
             ', ' +  ;
             LEFT(DTOC(mod_cab.dat_ini),  ;
             2) + ' de ' +  ;
             get_mes(MONTH(mod_cab.dat_ini)) +  ;
             ' de ' +  ;
             STR(YEAR(mod_cab.dat_ini),  ;
             4) + '.'
     SELECT auxcli
ENDSCAN
SELECT auxcont
IF vis_impr
     REPORT FORM RECIBO  ;
            TO PRINTER PREVIEW
ELSE
     REPORT FORM RECIBO TO  ;
            PRINTER PROMPT  ;
            NOCONSOLE
ENDIF
SELECT auxcont
USE
*
FUNCTION get_mes
PARAMETER pmes
DO CASE
     CASE pmes = 1
          rmes = 'JANEIRO'
     CASE pmes = 2
          rmes = 'FEVEREIRO'
     CASE pmes = 3
          rmes = 'MARÇO'
     CASE pmes = 4
          rmes = 'ABRIL'
     CASE pmes = 5
          rmes = 'MAIO'
     CASE pmes = 6
          rmes = 'JUNHO'
     CASE pmes = 7
          rmes = 'JULHO'
     CASE pmes = 8
          rmes = 'AGOSTO'
     CASE pmes = 9
          rmes = 'SETEMBRO'
     CASE pmes = 10
          rmes = 'OUTUBRO'
     CASE pmes = 11
          rmes = 'NOVEMBRO'
     CASE pmes = 12
          rmes = 'DEZEMBRO'
ENDCASE
RETURN rmes
*
