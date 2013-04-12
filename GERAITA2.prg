PARAMETER nomarq
SET TEXTMERGE ON
SET TEXTMERGE TO &Nomarq
\\0
\\1
\\REMESSA
\\01
\\COBRANCA<<SPACE(7)>>
\\0716
\\00
\\79241
\\1
\\<<SPACE(8)>>
\\INST BRAS POS GRAD QUALITTAS L
\\341
\\BANCO ITAU  S/A
\\<<SUBSTR(DTOC(DATE()),1,2)>><<SUBSTR(DTOC(DATE()),4,2)>><<SUBSTR(DTOC(DATE()),9,2)>>
\\<<SPACE(294)>>
\\000001
seq = 2
SELECT * FROM Recebs WHERE  NOT  ;
         recebs.boleto ORDER BY  ;
         recebs.numnotadoc,  ;
         recebs.datavencim INTO  ;
         CURSOR Recsig
SELECT recsig
SCAN
     \1
     \\02
     \\08221388000162
     \\0716
     \\00
     \\79241
     \\1
     \\<<SPACE(4)>>
     \\0000
     \\<<SPACE(25)>>
     auxnum1 = ALLTRIM(STR(recsig.numerolanc,  ;
               8))
     auxnum2 = STUFF(auxnum1, 1,  ;
               0, REPLICATE('0',  ;
               8 -  ;
               LEN(auxnum1)))
     \\<<Auxnum2>>
     \\<<REPLICATE('0',13)>>
     \\109
     \\<<SPACE(21)>>
     \\I
     \\01
     \\<<Auxnum2>><<SPACE(2)>>
     auxdata = SUBSTR(DTOC(recsig.datavencim),  ;
               1, 2) +  ;
               SUBSTR(DTOC(recsig.datavencim),  ;
               4, 2) +  ;
               SUBSTR(DTOC(recsig.datavencim),  ;
               9, 2)
     \\<<Auxdata>>
     auxval1 = INT(recsig.valpgtorec *  ;
               100)
     auxval2 = ALLTRIM(STR(auxval1,  ;
               13))
     auxval3 = STUFF(auxval2, 1,  ;
               0, REPLICATE('0',  ;
               13 -  ;
               LEN(auxval2)))
     \\<<Auxval3>>
     \\341
     \\00000
     \\01
     \\N
     auxdata2 = SUBSTR(DTOC(recsig.datalancam),  ;
                1, 2) +  ;
                SUBSTR(DTOC(recsig.datalancam),  ;
                4, 2) +  ;
                SUBSTR(DTOC(recsig.datalancam),  ;
                9, 2)
     \\<<Auxdata2>>
     \\43
     \\94
     auxval1 = INT(recsig.valpgtorec *  ;
               0.0033  * 100)
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
     \\<<REPLICATE('0',13)>>
     \\<<REPLICATE('0',13)>>
     SELECT cliente
     SEEK recsig.codcli
     IF cliente.aval_id = 0
          \\0<<STR(Cliente.Pessoa,1)>>
          auxcgc1 = ALLTRIM(cliente.cgc)
          auxcgc2 = STUFF(auxcgc1,  ;
                    1, 0,  ;
                    REPLICATE('0',  ;
                    14 -  ;
                    LEN(auxcgc1)))
          \\<<Auxcgc2>>
          \\<<LEFT(UPPER(Cliente.Nome),30)>>
          \\<<SPACE(10)>>
          \\<<LEFT(UPPER(Cliente.End),33)>><<SPACE(1)>><<Cliente.Numero>>
          \\<<SUBSTR(UPPER(Cliente.Bairro),1,12)>>
          \\<<SUBSTR(UPPER(Cliente.Cep),1,8)>>
          \\<<SUBSTR(UPPER(Cliente.Cidade),1,15)>>
          \\<<UPPER(Cliente.Uf)>>
     ELSE
          SELECT avalista
          SEEK (cliente.aval_id)
          IF LEN(ALLTRIM(avalista.cgc)) =  ;
             14
               auxpess = '02'
          ELSE
               auxpess = '01'
          ENDIF
          \\<<Auxpess>>
          auxcgc1 = ALLTRIM(avalista.cgc)
          auxcgc2 = STUFF(auxcgc1,  ;
                    1, 0,  ;
                    REPLICATE('0',  ;
                    14 -  ;
                    LEN(auxcgc1)))
          \\<<Auxcgc2>>
          \\<<LEFT(UPPER(Avalista.Nome),30)>>
          \\<<SPACE(10)>>
          \\<<LEFT(UPPER(Avalista.End),33)>><<SPACE(1)>><<Avalista.Numero>>
          \\<<SUBSTR(UPPER(Avalista.Bairro),1,12)>>
          \\<<SUBSTR(UPPER(Avalista.Cep),1,8)>>
          \\<<SUBSTR(UPPER(Avalista.Cidade),1,15)>>
          \\<<UPPER(Avalista.Uf)>>
     ENDIF
     \\<<SPACE(30)>>
     \\<<SPACE(4)>>
     \\<<Auxdata>>
     \\00
     \\<<SPACE(1)>>
     auxseq1 = ALLTRIM(STR(seq,  ;
               6))
     auxseq2 = STUFF(auxseq1, 1,  ;
               0, REPLICATE('0',  ;
               6 -  ;
               LEN(auxseq1)))
     \\<<Auxseq2>>
     seq = seq + 1
     SELECT recsig
ENDSCAN
auxseq1 = ALLTRIM(STR(seq, 6))
auxseq2 = STUFF(auxseq1, 1, 0,  ;
          REPLICATE('0', 6 -  ;
          LEN(auxseq1)))
\9
\\<<SPACE(393)>>
\\<<Auxseq2>>
\
SET TEXTMERGE OFF
SELECT recebs
REPLACE recebs.boleto WITH .T.  ;
        FOR  .NOT. recebs.boleto
*
