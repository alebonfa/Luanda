PARAMETER nomarq
SET TEXTMERGE ON
SET TEXTMERGE TO &Nomarq
seq = 1
totval = 0
auxseq1 = ALLTRIM(STR(seq, 6))
auxseq2 = STUFF(auxseq1, 1, 0,  ;
          REPLICATE('0', 6 -  ;
          LEN(auxseq1)))
\\0
\\1REMESSA01COBRANCA<<SPACE(7)>>
\\0119201001851       CEPG CTO ESTUDOS POS GRADUACAO356BANCO REAL
\\     <<SUBSTR(DTOC(DATE()),1,2)>><<SUBSTR(DTOC(DATE()),4,2)>><<SUBSTR(DTOC(DATE()),9,2)>>
\\01600BPI<<REPL(' ', 286)>><<Auxseq2>>
SELECT * FROM Recebs WHERE  NOT  ;
         recebs.boleto ORDER BY  ;
         recebs.numnotadoc,  ;
         recebs.datavencim INTO  ;
         CURSOR Recsig
SELECT recsig
SCAN
     \1
     \\02
     \\09172358000176
     \\0
     \\1192
     \\0
     \\1001851
     \\<<SPACE(7)>>
     \\<<SPACE(25)>>
     \\00
     auxnum1 = ALLTRIM(STR(recsig.numerolanc,  ;
               7))
     auxnum2 = STUFF(auxnum1, 1,  ;
               0, REPLICATE('0',  ;
               7 -  ;
               LEN(auxnum1)))
     \\<<Auxnum2>>
     \\0
     \\00
     \\1
     \\0000000000200
     \\<<SPACE(7)>>
     \\<<REPL('0',9)>>
     \\<<SPACE(1)>>
     \\00
     \\5
     \\01
     \\
     auxnum1 = ALLTRIM(STR(recsig.numerolanc,  ;
               10))
     auxnum2 = STUFF(auxnum1, 1,  ;
               0, REPLICATE('0',  ;
               10 -  ;
               LEN(auxnum1)))
     \\<<Auxnum2>>
     auxdata = SUBSTR(DTOC(recsig.datavencim),  ;
               1, 2) +  ;
               SUBSTR(DTOC(recsig.datavencim),  ;
               4, 2) +  ;
               SUBSTR(DTOC(recsig.datavencim),  ;
               9, 2)
     \\<<Auxdata>>
     totval = totval +  ;
              recsig.valpgtorec
     auxval1 = INT(recsig.valpgtorec *  ;
               100)
     auxval2 = ALLTRIM(STR(auxval1,  ;
               13))
     auxval3 = STUFF(auxval2, 1,  ;
               0, REPLICATE('0',  ;
               13 -  ;
               LEN(auxval2)))
     \\<<Auxval3>>
     \\356
     \\00000
     \\01
     \\N
     auxdata = SUBSTR(DTOC(recsig.datalancam),  ;
               1, 2) +  ;
               SUBSTR(DTOC(recsig.datalancam),  ;
               4, 2) +  ;
               SUBSTR(DTOC(recsig.datalancam),  ;
               9, 2)
     \\<<Auxdata>>
     \\00
     \\<<SPACE(2)>>
     \\0
     auxval = (recsig.valpgtorec *  ;
              0.0033 ) * 100
     auxval1 = INT(auxval)
     auxval2 = ALLTRIM(STR(auxval1,  ;
               12))
     auxval3 = STUFF(auxval2, 1,  ;
               0, REPLICATE('0',  ;
               12 -  ;
               LEN(auxval2)))
     \\<<Auxval3>>
     \\888888
     auxval1 = INT(recsig.valdescont *  ;
               100)
     auxval2 = ALLTRIM(STR(auxval1,  ;
               13))
     auxval3 = STUFF(auxval2, 1,  ;
               0, REPLICATE('0',  ;
               13 -  ;
               LEN(auxval2)))
     \\<<Auxval3>>
     \\<<REPL('0',13)>>
     \\<<REPL('0',13)>>
     SELECT cliente
     SEEK (recsig.codcli)
     IF cliente.aval_id = 0
          qesp = 0
          qnum = LEN(ALLTRIM(cliente.numero))
          IF qnum > 0
               qesp = qesp + 1
          ENDIF
          qcomp = LEN(ALLTRIM(cliente.comp))
          IF qcomp > 0
               qesp = qesp + 1
          ENDIF
          \\01
          \\<<LEFT(Cliente.Cgc,9)>>
          \\000
          \\<<SUBSTR(Cliente.Cgc,10,2)>>
          \\<<SUBSTR(cliente.Nome,1,40)>>
          \\<<SUBSTR(cliente.End, 1, 40 - Qesp - Qnum - Qcomp)>>
          \\<<IIF(Qnum > 0, SPACE(1), '')>>
          \\<<ALLT(Cliente.Numero)>>
          \\<<IIF(Qcomp > 0, SPACE(1), '')>>
          \\<<ALLT(Cliente.Comp)>>
          \\<<LEFT(Cliente.Bairro,12)>>
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
          \\<<Auxpess>>
          IF auxpess = '01'
               \\<<LEFT(Avalista.Cgc,9)>>
               \\000
               \\<<SUBSTR(Avalista.Cgc,10,2)>>
          ELSE
               \\<<LEFT(Avalista.Cgc,14)>>
          ENDIF
          \\<<SUBSTR(Avalista.Nome,1,40)>>
          \\<<SUBSTR(Avalista.End, 1, 40 - Qesp - Qnum - Qcomp)>>
          \\<<IIF(Qnum > 0, SPACE(1), '')>>
          \\<<ALLT(Avalista.Numero)>>
          \\<<IIF(Qcomp > 0, SPACE(1), '')>>
          \\<<ALLT(Avalista.Comp)>>
          \\<<LEFT(Cliente.Bairro,12)>>
          \\<<SUBSTR(Avalista.Cep,1,8)>>
          \\<<SUBSTR(Avalista.Cidade,1,15)>>
          \\<<Avalista.Uf>>
     ENDIF
     \\CEPG  CENTRO DE ESTUDOS DE POS GRADUACAO
     \\0
     \\07
     seq = seq + 1
     auxseq1 = ALLTRIM(STR(seq,  ;
               6))
     auxseq2 = STUFF(auxseq1, 1,  ;
               0, REPLICATE('0',  ;
               6 -  ;
               LEN(auxseq1)))
     \\<<Auxseq2>>
     \8
     \\1
     \\0
     \\1192
     \\0
     \\1001851
     auxnum1 = ALLTRIM(STR(recsig.numerolanc,  ;
               10))
     auxnum2 = STUFF(auxnum1, 1,  ;
               0, REPLICATE('0',  ;
               10 -  ;
               LEN(auxnum1)))
     \\<<Auxnum2>>
     \\APOS VENCIMENTO, COBRAR MULTA DE 2%<<SPACE(34)>>
     \\3
     \\SUJEITO A PROTESTO SE NÃO FOR PAGO NO VENCIMENTO<<SPACE(21)>>
     \\3
     \\<<SPACE(210)>>
     \\<<SPACE(19)>>
     seq = seq + 1
     auxseq1 = ALLTRIM(STR(seq,  ;
               6))
     auxseq2 = STUFF(auxseq1, 1,  ;
               0, REPLICATE('0',  ;
               6 -  ;
               LEN(auxseq1)))
     \\<<Auxseq2>>
     SELECT recsig
ENDSCAN
auxseq1 = ALLTRIM(STR(seq, 6))
auxseq2 = STUFF(auxseq1, 1, 0,  ;
          REPLICATE('0', 6 -  ;
          LEN(auxseq1)))
\9
seq = seq + 1
auxseq1 = ALLTRIM(STR((seq - 2) /  ;
          2, 6))
auxseq2 = STUFF(auxseq1, 1, 0,  ;
          REPLICATE('0', 6 -  ;
          LEN(auxseq1)))
\\<<Auxseq2>>
auxval1 = INT(totval)
auxval2 = ALLTRIM(STR(auxval1,  ;
          13))
auxval3 = STUFF(auxval2, 1, 0,  ;
          REPLICATE('0', 13 -  ;
          LEN(auxval2)))
\\<<Auxval3>>
\\<<SPACE(374)>>
auxseq1 = ALLTRIM(STR(seq, 6))
auxseq2 = STUFF(auxseq1, 1, 0,  ;
          REPLICATE('0', 6 -  ;
          LEN(auxseq1)))
\\<<Auxseq2>>
SET TEXTMERGE OFF
SELECT recebs
REPLACE recebs.boleto WITH .T.  ;
        FOR  .NOT. recebs.boleto
*
