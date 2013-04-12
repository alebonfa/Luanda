PARAMETERS tip

IF FILE('Fluxo.DBF')
	DELE FILE fluxo.dbf
ENDIF

IF FILE('FluxoEnd.DBF')
	DELE FILE fluxoend.dbf
ENDIF

rotulo = 'Período de '+DTOC(di)+' a '+DTOC(df)

auxfilt = ''
IF filt_area
	wc_area = lst_area[areas,2]
	auxfilt = auxfilt + "AND Area = Wc_area "
	rotulo  = rotulo + ' / Área: ' + ALLT(LEFT(lst_area[areas,1],20))
ENDIF

IF filt_suba
	wc_suba = lst_suba[subas,2]
	auxfilt = auxfilt + "AND Subarea = Wc_suba "
	rotulo  = rotulo + ' / Sub-Área: ' + ALLT(LEFT(lst_suba[subas,1],20))
ENDIF

SELE contas
CALC SUM(contas.valpgtorec) FOR;
	isblank(contas.datapagtos) &auxfilt;
	AND contas.datavencim < di TO atr_pagar

SELE recebs
CALC SUM(recebs.valpgtorec-recebs.valpgtorec) FOR;
	isblank(recebs.datapagtos) &auxfilt;
	AND recebs.datavencim < di TO atr_receber


SELECT contas.datavencim AS DATA,;
	SUM(contas.valpgtorec) AS apagar,;
	0000000000.00 AS alpagar,;
	0000000000.00 AS areceber,;
	0000000000.00 AS alreceber;
	FROM contas, area;
	WHERE contas.area == area.codigo;
	AND contas.datavencim >= di;
	AND contas.datavencim <= df;
	&auxfilt;
	ORDER BY contas.datavencim;
	GROUP BY contas.datavencim;
	INTO TABLE fluxo

SELECT contas.datavencim AS DATA,;
	SUM(contas.valpgtorec) AS valor;
	FROM contas, area;
	WHERE contas.area == area.codigo;
	AND contas.datavencim >= di;
	AND contas.datavencim <= df;
	AND isblank(contas.datapagtos);
	&auxfilt;
	ORDER BY contas.datavencim;
	GROUP BY contas.datavencim;
	INTO CURSOR transp

SELE transp
SCAN
	SELE fluxo
	LOCATE FOR fluxo.data = transp.data
	IF !FOUND()
		APPEND BLANK
		REPLACE fluxo.data WITH transp.data
	ENDIF
	REPLACE fluxo.alpagar WITH transp.valor
	SELE transp
ENDSCAN

SELECT recebs.datavencim AS DATA,;
	SUM(recebs.valpgtorec-recebs.valdescont) AS valor;
	FROM recebs, area;
	WHERE recebs.area == area.codigo;
	AND recebs.datavencim >= di;
	AND recebs.datavencim <= df;
	&auxfilt;
	ORDER BY recebs.datavencim;
	GROUP BY recebs.datavencim;
	INTO CURSOR transp

SELE transp
SCAN
	SELE fluxo
	LOCATE FOR fluxo.data = transp.data
	IF !FOUND()
		APPEND BLANK
		REPLACE fluxo.data WITH transp.data
	ENDIF
	REPLACE fluxo.areceber WITH transp.valor
	SELE transp
ENDSCAN


SELECT recebs.datavencim AS DATA,;
	SUM(recebs.valpgtorec-recebs.valdescont) AS valor;
	FROM recebs, area;
	WHERE recebs.area == area.codigo;
	AND recebs.datavencim >= di;
	AND recebs.datavencim <= df;
	AND isblank(recebs.datapagtos);
	&auxfilt;
	ORDER BY recebs.datavencim;
	GROUP BY recebs.datavencim;
	INTO CURSOR transp

SELE transp
SCAN
	SELE fluxo
	LOCATE FOR fluxo.data = transp.data
	IF !FOUND()
		APPEND BLANK
		REPLACE fluxo.data WITH transp.data
	ENDIF
	REPLACE fluxo.alreceber WITH transp.valor
	SELE transp
ENDSCAN

SELECT fluxo.*,;
	0000000000.00 AS gsaldo,;
	0000000000.00 AS lsaldo;
	FROM fluxo;
	ORDER BY fluxo.data;
	INTO TABLE fluxoend

saldo_g = 0.00
saldo_l = 0.00

SELE fluxoend
SCAN
	REPLACE fluxoend.gsaldo WITH saldo_g + fluxoend.areceber - fluxoend.apagar
	saldo_g = fluxoend.gsaldo
	REPLACE fluxoend.lsaldo WITH saldo_l + fluxoend.alreceber - fluxoend.alpagar
	saldo_l = fluxoend.lsaldo
ENDSCAN

SELE fluxoend
DO CASE
CASE tip = 1
	REPORT FORM fluxo TO PRINTER PREVIEW
CASE tip = 2
	REPORT FORM fluxo TO PRINTER PROMPT NOCONSOLE
CASE tip = 3
	SET SAFE OFF
	SELE fluxo
	COPY TO fluxo TYPE XLS
	SET SAFE ON
ENDCASE

SELE fluxo
USE
DELE FILE fluxo.dbf

SELE fluxoend
USE
DELE FILE fluxoend.dbf
