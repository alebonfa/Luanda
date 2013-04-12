SELECT cliente.codigo,  ;
       cliente.aval_id FROM  ;
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
USE &DIRCONT\CONTRATO
SELECT 0
CREATE CURSOR AUXCONT (id N (10), ;
 cliente_id N (10), ;
 clausula C (100), ;
 texto M, ;
 aval_id N (10))
j = 1
SELECT mp
SEEK mod_cab.curso_id
SELECT empresas
SEEK mp.empr_id
wempresa = ALLTRIM(empresas.nome)
SELECT area
SEEK mod_cab.area
SELECT subarea
SEEK mod_cab.subarea
SELECT auxcli
SCAN
     SELECT cliente
     SEEK auxcli.codigo
     DO claus_01 WITH 'NOME: '+ ;
        ALLTRIM(cliente.nome)
     DO claus_01 WITH  ;
        'ENDEREÇO: '+ ;
        ALLTRIM(cliente.end)+' '+ ;
        ALLTRIM(cliente.numero)+ ;
        ' '+ALLTRIM(cliente.comp)+ ;
        ' BAIRRO: '+ ;
        ALLTRIM(cliente.bairro)
     DO claus_01 WITH 'CIDADE: '+ ;
        ALLTRIM(cliente.cidade)+ ;
        ' UF: '+ ;
        ALLTRIM(cliente.uf)+ ;
        ' CEP: '+ ;
        ALLTRIM(cliente.cep)
     DO claus_01 WITH 'FONE(S): '+ ;
        ALLTRIM(cliente.fone1)+ ;
        ' '+ ;
        ALLTRIM(cliente.fone2)+ ;
        ' '+ ;
        ALLTRIM(cliente.fone3)
     DO claus_01 WITH 'CPF: '+ ;
        TRANSFORM(cliente.cgc,  ;
        '@R 999.999.999-99')+ ;
        ' RG: '+ ;
        ALLTRIM(cliente.insc)
     IF cliente.aval_id > 0
          SELECT avalista
          SEEK cliente.aval_id
          IF FOUND()
               DO claus_02 WITH  ;
                  'NOME: '+ ;
                  ALLTRIM(avalista.nome)
               DO claus_02 WITH  ;
                  'ENDEREÇO: '+ ;
                  ALLTRIM(avalista.end)+ ;
                  ' '+ ;
                  ALLTRIM(avalista.numero)+ ;
                  ' '+ ;
                  ALLTRIM(avalista.comp)+ ;
                  ' BAIRRO: '+ ;
                  ALLTRIM(avalista.bairro)
               DO claus_02 WITH  ;
                  'CIDADE: '+ ;
                  ALLTRIM(avalista.cidade)+ ;
                  ' UF: '+ ;
                  ALLTRIM(avalista.uf)+ ;
                  ' CEP: '+ ;
                  ALLTRIM(avalista.cep)
               DO claus_02 WITH  ;
                  'FONE(S): '+ ;
                  ALLTRIM(avalista.fone1)+ ;
                  ' '+ ;
                  ALLTRIM(avalista.fone2)+ ;
                  ' '+ ;
                  ALLTRIM(avalista.fone3)
               DO claus_02 WITH  ;
                  'CPF: '+ ;
                  TRANSFORM(avalista.cgc,  ;
                  '@R 999.999.999-99' ;
                  )+' RG: '+ ;
                  ALLTRIM(avalista.insc)
          ENDIF
     ENDIF
     SELECT contrato
     GOTO TOP
     FOR i = 1 TO 43
          SELECT auxcont
          APPEND BLANK
          REPLACE auxcont.id WITH  ;
                  j
          j = j + 1
          REPLACE auxcont.cliente_id  ;
                  WITH  ;
                  auxcli.codigo
          REPLACE auxcont.aval_id  ;
                  WITH  ;
                  auxcli.aval_id
          REPLACE auxcont.clausula  ;
                  WITH  ;
                  contrato.clausula
          IF i = 23
               IF w_campo = 1
                    REPLACE auxcont.texto  ;
                            WITH  ;
                            contrato.texto
               ELSE
                    REPLACE auxcont.texto  ;
                            WITH  ;
                            '3.4 NTIPCURSOs trabalhos de orientação e correção da monografia '
                    REPLACE auxcont.texto  ;
                            WITH  ;
                            auxcont.texto +  ;
                            'não terão custo adicional.'
               ENDIF
          ELSE
               REPLACE auxcont.texto  ;
                       WITH  ;
                       contrato.texto
          ENDIF
          DO CASE
               CASE i = 1
                    REPLACE auxcont.texto  ;
                            WITH  ;
                            STRTRAN(auxcont.texto,  ;
                            'NEMPRESA',  ;
                            ALLTRIM(empresas.nome) +  ;
                            ', constituído sob o CNPJ nº. ' +  ;
                            ALLTRIM(empresas.cnpj) +  ;
                            ', com sede a ' +  ;
                            ALLTRIM(empresas.endereco))
                    DO CASE
                         CASE tip_curso =  ;
                              1
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NTIPCURSO ',  ;
                               '')
                         CASE tip_curso =  ;
                              2
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NTIPCURSO ',  ;
                               'de Aperfeiçoamento ' ;
                               )
                         CASE tip_curso =  ;
                              3
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NTIPCURSO ',  ;
                               'de Lato Sensu ' ;
                               )
                         CASE tip_curso =  ;
                              4
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NTIPCURSO ',  ;
                               'de MBA ' ;
                               )
                    ENDCASE
                    REPLACE auxcont.texto  ;
                            WITH  ;
                            ALLTRIM(auxcont.texto) +  ;
                            ' ' +  ;
                            ALLTRIM(subarea.descricao) +  ;
                            ', a ser realizado em ' +  ;
                            ALLTRIM(area.descricao) +  ;
                            '-' +  ;
                            ALLTRIM(area.uf)
               CASE i = 2
                    DO CASE
                         CASE w_campo =  ;
                              1
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NCAMPO',  ;
                               'Medicina Veterinária' ;
                               )
                         CASE w_campo =  ;
                              2
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NCAMPO',  ;
                               'Saúde')
                    ENDCASE
               CASE i = 3
                    DO CASE
                         CASE w_certific =  ;
                              1
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               auxcont.texto +  ;
                               'a UNIVERSIDADE CASTELO BRANCO - UCB, '
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               auxcont.texto +  ;
                               'constituída sob o CNPJ 42.265.413/0001-48, com sede à Avenida Santa Cruz, 1631, '
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               auxcont.texto +  ;
                               'Realengo, Rio de Janeiro, RJ, CEP nº 21710-255, neste caso, legalmente representada '
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               auxcont.texto +  ;
                               'pela Chanceler Vera Costa Gissoni (Diretora Executiva do Centro Educacional de Realengo, '
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               auxcont.texto +  ;
                               'na forma da constituição da instituição mantenedora da UCB), cadastrada junto ao '
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               auxcont.texto +  ;
                               'CPF sob o nº 012.391.807-30.'
                         CASE w_certific =  ;
                              2
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               auxcont.texto +  ;
                               'FACULDADES INTEGRADAS DA TERRA DE BRASÍLIA - FTB, '
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               auxcont.texto +  ;
                               'constituída sob o CNPJ 02.671.953/0001-07, com sede à Avenida Recanto das Emas, Quadra 203, '
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               auxcont.texto +  ;
                               'Lote 32, Recanto das Emas, DF, neste caso,  legalmente representada por Antonio José Rigueira '
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               auxcont.texto +  ;
                               '(Diretor Administrativo), cadastrado junto ao CPF sob o nº 175.805.527-87.'
                         CASE w_certific =  ;
                              3
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               auxcont.texto +  ;
                               'SOCIEDADE CIVIL DE EDUCAÇÃO DE GRANDE DOURADOS - UNIGRAN, '
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               auxcont.texto +  ;
                               'constituída sob o CNPJ 03.361.110/0001-77, com sede à Rua Balbina de Matos, 2121, Jardim, '
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               auxcont.texto +  ;
                               'Dourados, MS, neste caso,  legalmente representada por Cecília Tânia Grinberg Zauith, '
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               auxcont.texto +  ;
                               'cadastrado junto ao CPF sob o nº 699.070.561-20.'
                    ENDCASE
               CASE i = 11 .OR. i =  ;
                    17
                    REPLACE auxcont.texto  ;
                            WITH  ;
                            STRTRAN(auxcont.texto,  ;
                            'NMODS',  ;
                            ALLTRIM(STR(modulos.modus,  ;
                            4)) +  ;
                            ' (' +  ;
                            ALLTRIM(extenso(modulos.modus, ;
                            .F.)) +  ;
                            ')')
                    REPLACE auxcont.texto  ;
                            WITH  ;
                            STRTRAN(auxcont.texto,  ;
                            'NPARCS',  ;
                            ALLTRIM(STR(modulos.parcs,  ;
                            4)) +  ;
                            ' (' +  ;
                            ALLTRIM(extenso(modulos.parcs, ;
                            .F.)) +  ;
                            ')')
                    IF i = 17
                         REPLACE auxcont.texto  ;
                                 WITH  ;
                                 STRTRAN(auxcont.texto,  ;
                                 'NINVEST',  ;
                                 ALLTRIM(STR(modulos.invest,  ;
                                 8,  ;
                                 2)) +  ;
                                 ' (' +  ;
                                 ALLTRIM(extenso(modulos.invest, ;
                                 .T.)) +  ;
                                 ')')
                         REPLACE auxcont.texto  ;
                                 WITH  ;
                                 STRTRAN(auxcont.texto,  ;
                                 'NVALPARC',  ;
                                 ALLTRIM(STR(modulos.invest /  ;
                                 modulos.parcs,  ;
                                 8,  ;
                                 2)) +  ;
                                 ' (' +  ;
                                 ALLTRIM(extenso(modulos.invest /  ;
                                 modulos.parcs, ;
                                 .T.)) +  ;
                                 ')')
                         IF cliente.desconto >  ;
                            0
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               auxcont.texto +  ;
                               'As parcelas que forem pagas na pontualidade terão um desconto de ' +  ;
                               ALLTRIM(STR(cliente.desconto,  ;
                               6,  ;
                               2)) +  ;
                               '%, o que acarretará num decréscimo ' +  ;
                               'proporcional no valor total.'
                         ENDIF
                    ENDIF
               CASE i = 16
                    REPLACE auxcont.texto  ;
                            WITH  ;
                            STRTRAN(auxcont.texto,  ;
                            'NPAGADOR',  ;
                            IIF(cliente.aval_id >  ;
                            0,  ;
                            'RESPONSÁVEL FINANCEIRO',  ;
                            'CONTRATANTE'))
               CASE i = 18
                    REPLACE auxcont.texto  ;
                            WITH  ;
                            STRTRAN(auxcont.texto,  ;
                            'NDATINI',  ;
                            DTOC(mod_cab.dat_ini))
                    IF ISBLANK(wdatpag)
                         REPLACE auxcont.texto  ;
                                 WITH  ;
                                 STRTRAN(auxcont.texto,  ;
                                 'NDATPAG',  ;
                                 DTOC(mod_cab.dat_ini +  ;
                                 1))
                    ELSE
                         REPLACE auxcont.texto  ;
                                 WITH  ;
                                 STRTRAN(auxcont.texto,  ;
                                 'NDATPAG',  ;
                                 DTOC(wdatpag))
                    ENDIF
               CASE i = 23 .OR. i =  ;
                    35
                    DO CASE
                         CASE tip_curso =  ;
                              1
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NTIPCURSO',  ;
                               'O')
                         CASE tip_curso =  ;
                              2
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NTIPCURSO',  ;
                               'Nos cursos de Aperfeiçoamento, o' ;
                               )
                         CASE tip_curso =  ;
                              3
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NTIPCURSO',  ;
                               'Nos cursos de Lato Sensu, o' ;
                               )
                         CASE tip_curso =  ;
                              4
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NTIPCURSO',  ;
                               'Nos cursos de MBA, o' ;
                               )
                    ENDCASE
                    IF i = 23  ;
                       .AND.  ;
                       w_certific =  ;
                       2
                         REPLACE auxcont.texto  ;
                                 WITH  ;
                                 '3.4 É de responsabilidade do aluno (a) a viabilização da orientação, desde que atendam as normas e titulação.'
                    ENDIF
                    IF i = 35
                         DO CASE
                              CASE  ;
                               w_certific =  ;
                               1
                                   REPLACE auxcont.texto WITH STRTRAN(auxcont.texto, 'NCERTIF', 'Universidade Castelo Branco')
                              CASE  ;
                               w_certific =  ;
                               2
                                   REPLACE auxcont.texto WITH STRTRAN(auxcont.texto, 'NCERTIF', 'FTB')
                              CASE  ;
                               w_certific =  ;
                               3
                                   REPLACE auxcont.texto WITH STRTRAN(auxcont.texto, 'NCERTIF', 'UNIGRAN')
                         ENDCASE
                    ENDIF
               CASE i = 24 .OR. i =  ;
                    25
                    DO CASE
                         CASE w_certific =  ;
                              1
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NCERTIF',  ;
                               'UCB')
                         CASE w_certific =  ;
                              2
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NCERTIF',  ;
                               'FTB')
                         CASE w_certific =  ;
                              3
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NCERTIF',  ;
                               'UNIGRAN')
                    ENDCASE
                    IF i = 25
                         IF w_campo =  ;
                            1
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NTIPMONO',  ;
                               'o Trabalho de Conclusão de Curso' ;
                               )
                         ELSE
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NTIPMONO',  ;
                               'a Monografia' ;
                               )
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NENTREGA',  ;
                               ' ou no módulo designado para a entrega da mesma' ;
                               )
                         ENDIF
                    ENDIF
               CASE i = 29
                    DO CASE
                         CASE tip_curso =  ;
                              1
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NTIPCURSO',  ;
                               'E')
                         CASE tip_curso =  ;
                              2
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NTIPCURSO',  ;
                               'Nos cursos de Aperfeiçoamento, e' ;
                               )
                         CASE tip_curso =  ;
                              3
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NTIPCURSO',  ;
                               'Nos cursos de Lato Sensu, e' ;
                               )
                         CASE tip_curso =  ;
                              4
                              REPLACE  ;
                               auxcont.texto  ;
                               WITH  ;
                               STRTRAN(auxcont.texto,  ;
                               'NTIPCURSO',  ;
                               'Nos cursos de MBA, e' ;
                               )
                    ENDCASE
                    IF w_campo =  ;
                       1
                         REPLACE auxcont.texto  ;
                                 WITH  ;
                                 STRTRAN(auxcont.texto,  ;
                                 'NTIPMONO',  ;
                                 'o TCC' ;
                                 )
                    ELSE
                         REPLACE auxcont.texto  ;
                                 WITH  ;
                                 STRTRAN(auxcont.texto,  ;
                                 'NTIPMONO',  ;
                                 'a Monografia' ;
                                 )
                    ENDIF
               CASE i = 34
                    IF w_campo =  ;
                       1
                         REPLACE auxcont.texto  ;
                                 WITH  ;
                                 STRTRAN(auxcont.texto,  ;
                                 'NTIPMONO',  ;
                                 'o Trabalho de Conclusão de Curso (TCC)' ;
                                 )
                    ELSE
                         REPLACE auxcont.texto  ;
                                 WITH  ;
                                 STRTRAN(auxcont.texto,  ;
                                 'NTIPMONO',  ;
                                 'a Monografia' ;
                                 )
                    ENDIF
          ENDCASE
          SELECT contrato
          SKIP
     ENDFOR
     SELECT cliente
ENDSCAN
SELECT auxcont
IF vis_impr
     REPORT FORM CONTRATO  ;
            TO PRINTER PREVIEW 
ELSE
     REPORT FORM CONTRATO TO  ;
            PRINTER PROMPT  ;
            NOCONSOLE
ENDIF
SELECT auxcont
USE
SELECT contrato
USE
*
PROCEDURE claus_01
PARAMETER ptexto
SELECT auxcont
APPEND BLANK
REPLACE auxcont.id WITH j
REPLACE auxcont.cliente_id WITH  ;
        auxcli.codigo
j = j + 1
REPLACE auxcont.clausula WITH  ;
        'I - CONTRATANTE:'
REPLACE auxcont.texto WITH ptexto
RETURN
*
PROCEDURE claus_02
PARAMETER ptexto
SELECT auxcont
APPEND BLANK
REPLACE auxcont.id WITH j
REPLACE auxcont.cliente_id WITH  ;
        auxcli.codigo
j = j + 1
REPLACE auxcont.clausula WITH  ;
        'I - RESPONSÀVEL FINANCEIRO:'
REPLACE auxcont.texto WITH ptexto
RETURN
*
