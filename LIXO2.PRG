SELE Cliente
REPLACE Cliente.Nome WITH schoneTekst(Cliente.Nome) ALL

FUNCTION schoneTekst
	PARAMETER lokTekst
	
	lokTekst = STRTRAN(lokTekst, '�', 'A')
	lokTekst = STRTRAN(lokTekst, '�', 'A')
	lokTekst = STRTRAN(lokTekst, '�', 'A')
	lokTekst = STRTRAN(lokTekst, '�', 'A')
	lokTekst = STRTRAN(lokTekst, '�', 'E')
	lokTekst = STRTRAN(lokTekst, '�', 'E')
	lokTekst = STRTRAN(lokTekst, '�', 'I')
	lokTekst = STRTRAN(lokTekst, '�', 'O')
	lokTekst = STRTRAN(lokTekst, '�', 'O')
	lokTekst = STRTRAN(lokTekst, '�', 'O')
	lokTekst = STRTRAN(lokTekst, '�', 'U')
	lokTekst = STRTRAN(lokTekst, '�', 'C')

	RETURN lokTekst	