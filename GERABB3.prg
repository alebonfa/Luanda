PARAMETER nomarq
SET TEXTMERGE ON
SET TEXTMERGE TO &Nomarq
\\000208221388000162INSTIT BRAS POS-GRAD QUALITTAS<<REPLICATE('0',452)>>
seq = 1
SELECT * FROM Recebs WHERE  NOT  ;
         recebs.boleto ORDER BY  ;
         recebs.numnotadoc,  ;
         recebs.datavencim INTO  ;
         CURSOR Recsig
SELECT recsig
SCAN
     \01
     \\000000
     \\17019
     auxnum2 = SUBSTR(recsig.curso,  ;
               1, 3) +  ;
               STR(recsig.numerolanc,  ;
               7)
     \\<<Auxnum2>>
     auxnum1 = ALLTRIM(STR(recsig.numerolanc,  ;
               7))
     auxnum2 = STUFF(auxnum1, 1,  ;
               0, REPLICATE('0',  ;
               10 -  ;
               LEN(auxnum1)))
     \\0001313758<<Auxnum2>>
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
     \\001313758
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
     IF cliente.aval_id = 0
          auxpess = '01'
          qesp = 0
          qnum = LEN(ALLTRIM(cliente.numero))
          IF qnum > 0
               qesp = qesp + 1
          ENDIF
          qcomp = LEN(ALLTRIM(cliente.comp))
          IF qcomp > 0
               qesp = qesp + 1
          ENDIF
          \\<<Auxpess>><<SUBSTR(Cliente.Cgc,1,14)>>
          \\<<SUBSTR(cliente.Nome,1,37)>>
          \\<<SUBSTR(cliente.End, 1, 37 - Qesp - Qnum - Qcomp)>>
          \\<<IIF(Qnum > 0, SPACE(1), '')>>
          \\<<ALLT(Cliente.Numero)>>
          \\<<IIF(Qcomp > 0, SPACE(1), '')>>
          \\<<ALLT(Cliente.Comp)>>
          \\<<SUBSTR(cliente.Cep,1,8)>>
          \\<<SUBSTR(cliente.Cidade,1,15)>>
          \\<<cliente.Uf>>
     ELSE
          SELECT avalista
          SEEK (cliente.aval_id)
          IF LEN(ALLTRIM(avalista.cgc)) =  ;
             14
               auxpess = '02'
          ELSE
               auxpess = '01'
          ENDIF
          qesp = 0
          qnum = LEN(ALLTRIM(avalista.numero))
          IF qnum > 0
               qesp = qesp + 1
          ENDIF
          qcomp = LEN(ALLTRIM(avalista.comp))
          IF qcomp > 0
               qesp = qesp + 1
          ENDIF
          \\<<Auxpess>><<SUBSTR(Avalista.Cgc,1,14)>>
          \\<<SUBSTR(Avalista.Nome,1,37)>>
          \\<<SUBSTR(Avalista.End, 1, 37 - Qesp - Qnum - Qcomp)>>
          \\<<IIF(Qnum > 0, SPACE(1), '')>>
          \\<<ALLT(Avalista.Numero)>>
          \\<<IIF(Qcomp > 0, SPACE(1), '')>>
          \\<<ALLT(Avalista.Comp)>>
          \\<<SUBSTR(Avalista.Cep,1,8)>>
          \\<<SUBSTR(Avalista.Cidade,1,15)>>
          \\<<Avalista.Uf>>
     ENDIF
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
