SELE cliente
J = 0
SCAN
	J = J + 1
	WAIT WIND STR(J) NOWAIT
	B = ''
	FOR i = 1 TO LEN(cliente.matricula)
		IF SUBSTR(cliente.matricula,i,1) $ '0123456789'
			B = B + SUBSTR(cliente.matricula,i,1)
		ENDIF
	NEXT I
	SELE CLIENTE
	REPLACE MATRICULA WITH B
ENDSCAN
