SET SAFETY OFF
CLOSE DATABASES
SELECT 0
USE &DIRCONT\Crm
ult_cod = 0
CALCULATE MAX(crm.crm_id) TO  ;
          ult_crm
ult_crm = 0
CALCULATE MAX(crm.crm_id) TO  ;
          ult_crm
SELECT 0
USE &DIRCONT\Juros
aux_equipe = juros.equipe
SELECT 0
USE &DIRTEMP\Crm ALIAS Icrm
SELECT * FROM Icrm WHERE  ;
         icrm.data > {08/09/2007}  ;
         AND icrm.equipe_id <>  ;
         aux_equipe AND  ;
         icrm.codigo > ult_crm  ;
         INTO CURSOR Importa
SELECT crm
ult_cod = 0
CALCULATE MAX(crm.codigo) TO  ;
          ult_cod
SELECT importa
SCAN
     ult_cod = ult_cod + 1
     SELECT crm
     APPEND BLANK
     REPLACE crm.codigo WITH  ;
             ult_cod
     REPLACE crm.codcli WITH  ;
             importa.codcli
     REPLACE crm.data WITH  ;
             importa.data
     REPLACE crm.hora WITH  ;
             importa.hora
     REPLACE crm.atividade WITH  ;
             importa.atividade
     REPLACE crm.assunto WITH  ;
             importa.assunto
     REPLACE crm.texto WITH  ;
             importa.texto
     REPLACE crm.dataagen WITH  ;
             importa.dataagen
     REPLACE crm.dataconc WITH  ;
             importa.dataconc
     REPLACE crm.user_id WITH  ;
             importa.user_id
     REPLACE crm.positivo WITH  ;
             importa.positivo
     REPLACE crm.recept WITH  ;
             importa.recept
     REPLACE crm.divulg WITH  ;
             importa.divulg
     REPLACE crm.curso WITH  ;
             importa.curso
     REPLACE crm.local WITH  ;
             importa.local
     REPLACE crm.equipe_id WITH  ;
             importa.equipe_id
     REPLACE crm.crm_id WITH  ;
             importa.codigo
     SELECT importa
ENDSCAN
CLOSE DATABASES
USE &DIRCONT\Crm
WAIT WINDOW NOWAIT  ;
     'Criando os Índices para - ' +  ;
     ALIAS()
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      ADDITIVE
CLOSE DATABASES
SET SAFETY ON
*
