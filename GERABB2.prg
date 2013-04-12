PARAMETER nomarq
SET TEXTMERGE ON
SET TEXTMERGE TO &Nomarq
\\000205354405000141QUALITAS QUALIF PROF LTDA - ME<<REPLICATE('0',452)>>
seq = 1
SELECT * FROM Recebs WHERE  NOT  ;
         recebs.boleto ORDER BY  ;
         recebs.numnotadoc,  ;
         recebs.datavencim INTO  ;
         CURSOR Recsig
SELECT recsig
SCAN
     \0119635317019
     auxnum2 = SUBSTR(recsig.curso,  ;
               1, 3) +  ;
               STR(recsig.numerolanc,  ;
               7)
     \\<<Auxnum2>>
     \\00000000
     auxnum1 = ALLTRIM(STR(recsig.numerolanc,  ;
               7))
     auxnum2 = STUFF(auxnum1, 1,  ;
               0, REPLICATE('0',  ;
               5 -  ;
               LEN(auxnum1)))
     auxdac = dac_bb2(auxnum2)
     \\196353<<Auxnum2>><<Auxdac>>
     \\<<SPACE(25)>>
     \\DM<<SPACE(3)>>
     auxdata = SUBSTR(DTOC(recsig.datalancam),  ;
               1, 2) +  ;
               SUBSTR(DTOC(recsig.datalancam),  ;
               4, 2) +  ;
               SUBSTR(DTOC(recsig.datalancam),  ;
               7, 4)
     \\<<Auxdata>>
     auxdata = SUBSTR(DTOC(recsig.datavencim),  ;
               1, 2) +  ;
               SUBSTR(DTOC(recsig.datavencim),  ;
               4, 2) +  ;
               SUBSTR(DTOC(recsig.datavencim),  ;
               7, 4)
     \\<<Auxdata>>
     auxval1 = INT(recsig.valpgtorec *  ;
               100)
     auxval2 = ALLTRIM(STR(auxval1,  ;
               13))
     auxval3 = STUFF(auxval2, 1,  ;
               0, REPLICATE('0',  ;
               13 -  ;
               LEN(auxval2)))
     \\<<Auxval3>>09<<SPACE(3)>>
     \\<<REPLICATE('0',13)>>N
     auxval = (recsig.valpgtorec *  ;
              0.0033 ) * 100
     auxval1 = INT(auxval)
     auxval2 = ALLTRIM(STR(auxval1,  ;
               13))
     auxval3 = STUFF(auxval2, 1,  ;
               0, REPLICATE('0',  ;
               13 -  ;
               LEN(auxval2)))
     \\<<Auxval3>>
     \\<<Auxdata>>
     auxval1 = INT(recsig.valdescont *  ;
               100)
     auxval2 = ALLTRIM(STR(auxval1,  ;
               13))
     auxval3 = STUFF(auxval2, 1,  ;
               0, REPLICATE('0',  ;
               13 -  ;
               LEN(auxval2)))
     \\<<Auxval3>>
     \\<<SPACE(15)>>
     \\***** SUJEITO A PROTESTO APOS VENCIMENTO
     \\<<SPACE(9)>>
     \\1
     \\<<Auxdata>>
     auxval = (recsig.valpgtorec *  ;
              0.02 ) * 100
     auxval1 = INT(auxval)
     auxval2 = ALLTRIM(STR(auxval1,  ;
               13))
     auxval3 = STUFF(auxval2, 1,  ;
               0, REPLICATE('0',  ;
               13 -  ;
               LEN(auxval2)))
     \\<<Auxval3>>
     \\<<SPACE(62)>>
     \\S
     SELECT cliente
     SEEK (recsig.codcli)
     auxpess = '01'
     \\<<Auxpess>><<SUBSTR(Cliente.Cgc,1,14)>>
     \\<<SUBSTR(cliente.Nome,1,37)>>
     \\<<SUBSTR(cliente.End,1,32)>>
     \\<<SPACE(1)>>
     \\<<SUBSTR(cliente.Numero,1,4)>>
     \\<<SUBSTR(cliente.Cep,1,8)>>
     \\<<SUBSTR(cliente.Cidade,1,15)>>
     \\<<cliente.Uf>>
     \\<<REPLICATE('0',61)>>0709
     \\<<REPLICATE('0',16)>>
     seq = seq + 1
     SELECT recsig
ENDSCAN
auxseq1 = ALLTRIM(STR(seq, 6))
auxseq2 = STUFF(auxseq1, 1, 0,  ;
          REPLICATE('0', 6 -  ;
          LEN(auxseq1)))
\99<<Auxseq2>><<REPLICATE('0',492)>>
SET TEXTMERGE OFF
SELECT recebs
REPLACE recebs.boleto WITH .T.  ;
        FOR  .NOT. recebs.boleto
*
