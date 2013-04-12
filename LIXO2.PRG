SELE Cliente
REPLACE Cliente.Nome WITH schoneTekst(Cliente.Nome) ALL

FUNCTION schoneTekst
	PARAMETER lokTekst
	
	lokTekst = STRTRAN(lokTekst, 'Á', 'A')
	lokTekst = STRTRAN(lokTekst, 'Â', 'A')
	lokTekst = STRTRAN(lokTekst, 'Ã', 'A')
	lokTekst = STRTRAN(lokTekst, 'À', 'A')
	lokTekst = STRTRAN(lokTekst, 'É', 'E')
	lokTekst = STRTRAN(lokTekst, 'Ê', 'E')
	lokTekst = STRTRAN(lokTekst, 'Í', 'I')
	lokTekst = STRTRAN(lokTekst, 'Ó', 'O')
	lokTekst = STRTRAN(lokTekst, 'Ô', 'O')
	lokTekst = STRTRAN(lokTekst, 'Õ', 'O')
	lokTekst = STRTRAN(lokTekst, 'Ú', 'U')
	lokTekst = STRTRAN(lokTekst, 'Ç', 'C')

	RETURN lokTekst	