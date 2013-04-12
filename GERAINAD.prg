WAIT WINDOW NOWAIT  ;
     'Gerando Arquivo de Inadimplentes'
IF FILE('c:\action\temp\recebs.dbf')
     DELETE FILE  ;
            c:\action\temp\recebs.dbf
ENDIF
USE C:\ACTION\CONTAS\RECEBS
SELECT * FROM Recebs WHERE  ;
         recebs.situacao $ 'AFPV'  ;
         AND recebs.datavencim <=  ;
         DATE() - 1 INTO DBF  ;
         c:\action\temp\recebs.dbf
WAIT WINDOW TIMEOUT 1 'Concluído'
*
