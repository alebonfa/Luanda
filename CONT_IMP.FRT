     !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Times New Roman                `  /   winspool  Ricoh Aficio MP01 (c�pia 1) aIP_192.168.1.200  		REPORT FORMAT funcs.frx TO PR                                 �Ricoh Aficio MP01 (c�pia 1)     
 D �C�� 	 �4d   X  X  A4                                                     ����                DINU"   <  �
P&                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        13MD� <                                                                                                                                             13MD� �                                	descricao                      curso                          c"De "+DTOC(Di)+" a "+DTOC(Df) + IIF(lokBelang > 0, ' - Juros: ' + ALLTRIM(STR(lokBelang,6,2)), ' ')                               Arial                          Arial                          "Contas a Receber"             Arial                          "Sit."                         Situacao                       Arial                          Arial                          "Nome"                         Cliente                        Arial                          Arial                          "Vecto."                       
Datavencim                     Arial                          Arial                          "Principal"                    
datapagtos                     Arial                          G"P�gina:"+" "+ALLTRIM(STR(_pageno)) + ' ' + DTOC(DATE()) + ' ' + TIME()                          Arial                          Arial                          "Pagto."                       
valpgtorec                     Arial                          "999,999.99"                   Arial                          "Liquidado"                    
Valorliqui                     Arial                          "999,999.99"                   
valpgtorec                     Arial                          "999,999.99"                   
Valorliqui                     Arial                          "999,999.99"                   Curso                          Arial                          
valpgtorec                     Arial                          "999,999.99"                   
Valorliqui                     Arial                          "999,999.99"                   Obs                            Arial                          	descricao                      Arial                          
valpgtorec                     Arial                          "999,999.99"                   
Valorliqui                     Arial                          "999,999.99"                   Codcli                         Arial                          
geacWaarde                     Arial                          "999,999.99"                   
geacWaarde                     Arial                          "999,999.99"                   
geacWaarde                     Arial                          "999,999.99"                   
geacWaarde                     Arial                          "999,999.99"                   'Total ' + ALLTRIM(curso)      Arial                          'Total ' + ALLTRIM(descricao)                                   Arial                          'Total Geral'                  Arial                          Arial                          "Atualizado"                   Times New Roman                Arial                          Arial                          Arial                          Arial                          Arial                          `  ;  winspool  PDFCreator (de CLIENTE-PC) na sess�o 19  TS132 ILETITLE FINDTEXT PRINTDLG                                 �PDFCreator (de CLIENTE-PC) na   
 D 8S�  �4d   X  X  A4                                                                                PRIV�0                                                                                       '''  '          �                                  P4 (�                            �KL    
 �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          13MD� �� ?                          Times New Roman                	descricao                      curso                          c"De "+DTOC(Di)+" a "+DTOC(Df) + IIF(lokBelang > 0, ' - Juros: ' + ALLTRIM(STR(lokBelang,6,2)), ' ')                               Arial                          "Contas a Receber"             Arial                          "Sit."                         Arial                          Situacao                       Arial                          "Nome"                         Arial                          Cliente                        Arial                          "Vecto."                       Arial                          
Datavencim                     Arial                          "Principal"                    Arial                          
datapagtos                     Arial                          G"P�gina:"+" "+ALLTRIM(STR(_pageno)) + ' ' + DTOC(DATE()) + ' ' + TIME()                          Arial                          "Pagto."                       Arial                          
valpgtorec                     "999,999.99"                   Arial                          "Liquidado"                    Arial                          
Valorliqui                     "999,999.99"                   Arial                          
valpgtorec                     "999,999.99"                   Arial                          
Valorliqui                     "999,999.99"                   Arial                          Curso                          Arial                          
valpgtorec                     "999,999.99"                   Arial                          
Valorliqui                     "999,999.99"                   Arial                          "Notas"                        Arial                          Obs                            Arial                          	descricao                      Arial                          
valpgtorec                     "999,999.99"                   Arial                          
Valorliqui                     "999,999.99"                   Arial                          Codcli                         Arial                          
geacWaarde                     "999,999.99"                   Arial                          
geacWaarde                     "999,999.99"                   Arial                          
geacWaarde                     "999,999.99"                   Arial                          
geacWaarde                     "999,999.99"                   Arial                          'Total ' + ALLTRIM(curso)      Arial                          'Total ' + ALLTRIM(descricao)                                   Arial                          'Total Geral'                  Arial                          "Atualizado"                   Arial                          Times New Roman                Arial                          Arial                          Arial                          Arial                          Arial                         �* WIZARD = QREPORT
* WIZNAME = C:\FPW26\WIZARDS\WZ_QREPO.APP
* WIZCLASS = REPORT
* VERSION = 1.0
* TIMESTAMP = 664239786,00
* STYLE = PRESENTATION
* LAYOUT = TABULAR
* TITLE = Cheques
* COLUMNS = 1,00
* TABLE = "C:\SISTEMA\CONTAS\CHEQUES.DBF"
* FIELDS = Situacao;Nome;Data;Valor;Banco;Agencia;Cc;Numero;Data_tr;
* SORTS = Nome;
* GROUPS = Nome;
* MODIFIERS = ;
* TOTALS = 0,00
* SUBTOTALS = 0,00
* TOPBOTTOM = 1,00
* LABELS = ;
* AVERY = 1,00
* TAGASCEND = 1,00
