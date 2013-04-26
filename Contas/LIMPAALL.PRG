WAIT WINDOW 'DBF ZAPPING...' NOWAIT
SET TALK OFF
SET SAFE OFF
DIMENSION l1dbfs(1)
=ADIR(l1dbfs,'.\*.dbf')
l1err=.F.
CLEAR
??CHR(7)
WAIT WINDOW 'Checking Database Files...' NOWAIT
IF ALEN(l1dbfs)<>1
	FOR l1dbf=1 TO ALEN(l1dbfs)/5
		WAIT WIND l1dbfs[l1dbf,1] NOWAIT
		IF UPPER(l1dbfs[l1dbf,1]) != 'ROTINAS.DBF' ;
			OR UPPER(l1dbfs[l1dbf,1]) != 'VENDES.DBF' ;
			OR UPPER(l1dbfs[l1dbf,1]) != 'PERMS.DBF'
			use &l1dbfs[l1dbf,1]
			zap
		ENDIF
	ENDFOR
ENDIF

RETURN

