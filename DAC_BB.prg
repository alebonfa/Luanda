PARAMETER nossonum
nossonum = '152906' + nossonum
c = 0
fator = 9
FOR i = LEN(nossonum) TO 1 STEP - ;
    1
     c = c + (VAL(SUBSTR(nossonum,  ;
         i, 1)) * fator)
     fator = fator - 1
     IF fator = 1
          fator = 9
     ENDIF
ENDFOR
dac = MOD(c, 11)
IF dac = 10
     dac = 'X'
ELSE
     dac = STR(dac, 1)
ENDIF
RETURN dac
*
