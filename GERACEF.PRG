PARAMETER nomarq, prog
DO CASE
     CASE prog = 1
          IF FILE('z:\CAIXA\M80V13\TITULOS.TXT')
               DELETE FILE  ;
                      z:\CAIXA\M80V13\TITULOS.TXT
          ENDIF
          SET TEXTMERGE ON
          SET TEXTMERGE TO z:\CAIXA\M80V13\TITULOS.TXT
     CASE prog = 2
          IF FILE('z:\CAIXA\M8052Z\TITULOS.TXT')
               DELETE FILE  ;
                      z:\CAIXA\M8052Z\TITULOS.TXT
          ENDIF
          SET TEXTMERGE ON
          SET TEXTMERGE TO z:\CAIXA\M8052Z\TITULOS.TXT
     CASE prog = 3
          IF FILE('z:\CAIXA\M81O91\TITULOS.TXT')
               DELETE FILE  ;
                      z:\CAIXA\M81O91\TITULOS.TXT
          ENDIF
          SET TEXTMERGE ON
          SET TEXTMERGE TO z:\CAIXA\M81O91\TITULOS.TXT
     CASE prog = 4
          IF FILE('z:\CAIXA\M81O72\TITULOS.TXT')
               DELETE FILE  ;
                      z:\CAIXA\M81O72\TITULOS.TXT
          ENDIF
          SET TEXTMERGE ON
          SET TEXTMERGE TO z:\CAIXA\M81O72\TITULOS.TXT
     CASE prog = 5
          IF FILE('z:\CAIXA\M82DAB\TITULOS.TXT')
               DELETE FILE  ;
                      z:\CAIXA\M82DAB\TITULOS.TXT
          ENDIF
          SET TEXTMERGE ON
          SET TEXTMERGE TO z:\CAIXA\M82DAB\TITULOS.TXT
     CASE prog = 6
          IF FILE('z:\CAIXA\M82C98\TITULOS.TXT')
               DELETE FILE  ;
                      z:\CAIXA\M82C98\TITULOS.TXT
          ENDIF
          SET TEXTMERGE ON
          SET TEXTMERGE TO z:\CAIXA\M82C98\TITULOS.TXT
     CASE prog = 7
          IF FILE('z:\CAIXA\M92DAD\TITULOS.TXT')
               DELETE FILE  ;
                      z:\CAIXA\M92DAD\TITULOS.TXT
          ENDIF
          SET TEXTMERGE ON
          SET TEXTMERGE TO z:\CAIXA\M92DAD\TITULOS.TXT
ENDCASE
SELECT * FROM Recebs WHERE  NOT  ;
         recebs.boleto ORDER BY  ;
         recebs.numnotadoc,  ;
         recebs.datavencim INTO  ;
         CURSOR Recsig
SELECT recsig
SCAN
     \\<<REPLICATE('0', 15 - LEN(ALLT(STR(Recsig.Codcli,15))))>>
     \\<<ALLT(STR(Recsig.Codcli,15))>>
     auxnum = '9' + REPLICATE('0',  ;
              9 -  ;
              LEN(ALLTRIM(STR(recsig.numerolanc,  ;
              10)))) +  ;
              ALLTRIM(STR(recsig.numerolanc,  ;
              10))
     auxdac = dac_cef(auxnum)
     \\<<Auxnum>>
     \\-<<SUBSTR(Recsig.Numdesmemb,1,2)+SUBSTR(Recsig.Numdesmemb,4,2)>>
     \\<<Auxnum>>
     \\<<Auxdac>>
     \\0012
     \\S
     \\02
     \\0
     \\0030
     \\1
     auxdata = SUBSTR(DTOC(recsig.datavencim),  ;
               1, 2) +  ;
               SUBSTR(DTOC(recsig.datavencim),  ;
               4, 2) +  ;
               SUBSTR(DTOC(recsig.datavencim),  ;
               7, 4)
     \\<<Auxdata>>
     auxdata = SUBSTR(DTOC(recsig.datalancam),  ;
               1, 2) +  ;
               SUBSTR(DTOC(recsig.datalancam),  ;
               4, 2) +  ;
               SUBSTR(DTOC(recsig.datalancam),  ;
               7, 4)
     \\<<Auxdata>>
     \\09
     auxval1 = INT(recsig.valpgtorec *  ;
               100)
     auxval2 = ALLTRIM(STR(auxval1,  ;
               15))
     auxval3 = STUFF(auxval2, 1,  ;
               0, REPLICATE('0',  ;
               15 -  ;
               LEN(auxval2)))
     \\<<Auxval3>>
     auxval1 = INT(recsig.valpgtorec *  ;
               0.0033  * 100)
     auxval2 = ALLTRIM(STR(auxval1,  ;
               15))
     auxval3 = STUFF(auxval2, 1,  ;
               0, REPLICATE('0',  ;
               15 -  ;
               LEN(auxval2)))
     \\<<Auxval3>>
     auxdata = SUBSTR(DTOC(recsig.datavencim),  ;
               1, 2) +  ;
               SUBSTR(DTOC(recsig.datavencim),  ;
               4, 2) +  ;
               SUBSTR(DTOC(recsig.datavencim),  ;
               7, 4)
     \\<<Auxdata>>
     auxval1 = INT(recsig.valdescont *  ;
               100)
     auxval2 = ALLTRIM(STR(auxval1,  ;
               15))
     auxval3 = STUFF(auxval2, 1,  ;
               0, REPLICATE('0',  ;
               15 -  ;
               LEN(auxval2)))
     \\<<Auxval3>>
     \\<<REPLICATE('0', 15)>>
     auxdata = SUBSTR(DTOC(recsig.datavencim),  ;
               1, 2) +  ;
               SUBSTR(DTOC(recsig.datavencim),  ;
               4, 2) +  ;
               SUBSTR(DTOC(recsig.datavencim),  ;
               7, 4)
     \\<<Auxdata>>
     auxval1 = INT(recsig.valpgtorec *  ;
               0.02  * 100)
     auxval2 = ALLTRIM(STR(auxval1,  ;
               15))
     auxval3 = STUFF(auxval2, 1,  ;
               0, REPLICATE('0',  ;
               15 -  ;
               LEN(auxval2)))
     \\<<Auxval3>>
     \\1
     \\S
     \\000
     \\<<SPACE(20)>>
     \\<<SPACE(1)>>
     \\<<SPACE(20)>>
     \\<<SPACE(40)>>
     \\* PROTESTO AUTOMATICO NO 30. DIA CORRIDO
     \\*** DEPTO. FINANCEIRO - 19 3797-6300 ***
     \\<<SPACE(40)>>
     \\<<SPACE(40)>>
     \\<<SPACE(40)>>
     \
     SELECT recsig
ENDSCAN
SET TEXTMERGE OFF
DO CASE
     CASE prog = 1
          IF FILE('z:\CAIXA\M80V13\CLIENTES.TXT')
               DELETE FILE  ;
                      z:\CAIXA\M80V13\CLIENTES.TXT
          ENDIF
          SET TEXTMERGE ON
          SET TEXTMERGE TO z:\CAIXA\M80V13\CLIENTES.TXT
     CASE prog = 2
          IF FILE('z:\CAIXA\M8052Z\CLIENTES.TXT')
               DELETE FILE  ;
                      z:\CAIXA\M8052Z\CLIENTES.TXT
          ENDIF
          SET TEXTMERGE ON
          SET TEXTMERGE TO z:\CAIXA\M8052Z\CLIENTES.TXT
     CASE prog = 3
          IF FILE('z:\CAIXA\M81O91\CLIENTES.TXT')
               DELETE FILE  ;
                      z:\CAIXA\M81O91\CLIENTES.TXT
          ENDIF
          SET TEXTMERGE ON
          SET TEXTMERGE TO z:\CAIXA\M81O91\CLIENTES.TXT
     CASE prog = 4
          IF FILE('z:\CAIXA\M81O72\CLIENTES.TXT')
               DELETE FILE  ;
                      z:\CAIXA\M81O72\CLIENTES.TXT
          ENDIF
          SET TEXTMERGE ON
          SET TEXTMERGE TO z:\CAIXA\M81O72\CLIENTES.TXT
     CASE prog = 5
          IF FILE('z:\CAIXA\M82DAB\CLIENTES.TXT')
               DELETE FILE  ;
                      z:\CAIXA\M82DAB\CLIENTES.TXT
          ENDIF
          SET TEXTMERGE ON
          SET TEXTMERGE TO z:\CAIXA\M82DAB\CLIENTES.TXT
     CASE prog = 6
          IF FILE('z:\CAIXA\M82C98\CLIENTES.TXT')
               DELETE FILE  ;
                      z:\CAIXA\M82C98\CLIENTES.TXT
          ENDIF
          SET TEXTMERGE ON
          SET TEXTMERGE TO z:\CAIXA\M82C98\CLIENTES.TXT
     CASE prog = 7
          IF FILE('z:\CAIXA\M92DAD\CLIENTES.TXT')
               DELETE FILE  ;
                      z:\CAIXA\M92DAD\CLIENTES.TXT
          ENDIF
          SET TEXTMERGE ON
          SET TEXTMERGE TO z:\CAIXA\M92DAD\CLIENTES.TXT
ENDCASE
SELECT cliente.* FROM Cliente,  ;
       Recebs WHERE  ;
       cliente.codigo ==  ;
       recebs.codcli AND  NOT  ;
       recebs.boleto GROUP BY  ;
       cliente.codigo INTO CURSOR  ;
       Clisig
SELECT clisig
SCAN
     \\<<REPLICATE('0', 15 - LEN(ALLT(STR(Clisig.Codigo,15))))>>
     \\<<ALLT(STR(Clisig.Codigo,15))>>
     \\<<LEFT(Clisig.Nome,40)>>
     \\<<LEFT(Clisig.Nome,40)>>
     \\<<SPACE(10)>>
     IF clisig.pessoa = 1
          auxpess = 'F'
     ELSE
          auxpess = 'J'
     ENDIF
     \\<<Auxpess>>
     \\<<REPLICATE('0', 20 - LEN(ALLT(Clisig.Cgc)))>>
     \\<<ALLT(Clisig.Cgc)>>
     \\<<LEFT(Clisig.End,35)>>
     \\<<SPACE(1)>>
     \\<<LEFT(Clisig.Numero,4)>>
     \\<<LEFT(Clisig.Bairro,15)>>
     \\<<LEFT(Clisig.Cidade,15)>>
     \\<<LEFT(Clisig.Uf,2)>>
     \\<<LEFT(Clisig.Cep,8)>>
     \\<<SPACE(20)>>
     \\<<REPLICATE('0', 27)>>
     \
     SELECT clisig
ENDSCAN
SET TEXTMERGE OFF
SELECT recebs
REPLACE recebs.boleto WITH .T.  ;
        FOR  .NOT. recebs.boleto
*
