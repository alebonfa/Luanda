*
FUNCTION extenso
PARAMETER nu, moeda
IF moeda
     cvar1 = ' real'
     cvar1p = ' reais'
     cvar2 = ' centavo'
     cvar2p = ' centavos'
ELSE
     STORE '' TO cvar1, cvar1p,  ;
           cvar2, cvar2p
ENDIF
DIMENSION u[ 10]
u[ 1] = 'um'
u[ 2] = 'dois'
u[ 3] = 'três'
u[ 4] = 'quatro'
u[ 5] = 'cinco'
u[ 6] = 'seis'
u[ 7] = 'sete'
u[ 8] = 'oito'
u[ 9] = 'nove'
DIMENSION dd[ 10]
dd[ 1] = 'onze'
dd[ 2] = 'doze'
dd[ 3] = 'treze'
dd[ 4] = 'quatorze'
dd[ 5] = 'quinze'
dd[ 6] = 'dezeseis'
dd[ 7] = 'dezessete'
dd[ 8] = 'dezoito'
dd[ 9] = 'dezenove'
DIMENSION d[ 10]
d[ 1] = 'dez'
d[ 2] = 'vinte'
d[ 3] = 'trinta'
d[ 4] = 'quarenta'
d[ 5] = 'cinquenta'
d[ 6] = 'sessenta'
d[ 7] = 'setenta'
d[ 8] = 'oitenta'
d[ 9] = 'noventa'
d[ 10] = 'cem'
DIMENSION c[ 10]
c[ 1] = 'cento'
c[ 2] = 'duzentos'
c[ 3] = 'trezentos'
c[ 4] = 'quatrocentos'
c[ 5] = 'quinhentos'
c[ 6] = 'seiscentos'
c[ 7] = 'setecentos'
c[ 8] = 'oitocentos'
c[ 9] = 'novecentos'
c[ 10] = 'mil'
nu = ALLTRIM(STR(nu, 10, 2))
ex = ''
IF VAL(nu) = INT(VAL(nu)) .AND.  ;
   (AT(',', nu)) = 0
     nu = nu + '.00'
ENDIF
nu = STRTRAN(nu, ',', '.')
IF VAL(nu) = 0
     ex = ''
     RETURN (ex)
ENDIF
lnu = LEN(nu)
DIMENSION aex[ 1]
aex[ 1] = ''
x1 = VAL(RIGHT(nu, 2))
x2 = VAL(LEFT(ALLTRIM(STR(x1)),  ;
     1))
x3 = VAL(RIGHT(ALLTRIM(STR(x1)),  ;
     1))
ex = ''
DO CASE
     CASE x1 = 0
          ex = ''
     CASE x1 = 1
          ex = u(x1) + cvar2
     CASE x1 < 10
          ex = u(x1) + cvar2p
     CASE x1 >= 10 .AND. x1 / 10 =  ;
          INT(x1 / 10)
          ex = d(x2) + cvar2p
     CASE x1 > 10 .AND. x1 < 20
          ex = dd(x3) + cvar2p
     CASE x1 > 20
          ex = d(x2) + ' e ' +  ;
               u(x3) + cvar2p
ENDCASE
x1 = 0
x2 = 0
x3 = 0
nlin = ALEN(aex)
DIMENSION aex[ nlin + 1]
aex[ nlin + 1] = ex
IF VAL(nu) < 0.99 
     RETURN (ex)
ENDIF
x1 = INT(VAL(RIGHT(nu, 5)))
x2 = VAL(LEFT(ALLTRIM(STR(x1)),  ;
     1))
x3 = VAL(RIGHT(ALLTRIM(STR(x1)),  ;
     1))
ex = ''
DO CASE
     CASE x1 = 0
          ex = ''
     CASE x1 = 1
          ex = u(x1) + cvar1
          IF LEN(nu) >= 6
               ex = u(x1) +  ;
                    cvar1p
          ENDIF
     CASE x1 < 10
          ex = u(x1) + cvar1p
     CASE x1 >= 10 .AND. x1 / 10 =  ;
          INT(x1 / 10)
          ex = d(x2) + cvar1p
     CASE x1 > 10 .AND. x1 < 20
          ex = dd(x3) + cvar1p
     CASE x1 > 20
          ex = d(x2) + ' e ' +  ;
               u(x3) + cvar1p
ENDCASE
nlin = ALEN(aex)
DIMENSION aex[ nlin + 1]
aex[ nlin + 1] = ex
ex = ''
IF VAL(nu) < 99.99 
     FOR h = ALEN(aex) TO 1 STEP - ;
         1
          conc = ''
          IF h >= 2
               IF  .NOT.  ;
                   EMPTY(aex(h -  ;
                   1))
                    conc = ' e '
               ENDIF
          ENDIF
          ex = ex + aex(h) + conc
     ENDFOR
     RETURN (ex)
ENDIF
x1 = 0
x2 = 0
x3 = 0
x1 = INT(VAL(RIGHT(nu, 6)))
x2 = VAL(LEFT(ALLTRIM(STR(x1)),  ;
     1))
ex = ''
IF x1 >= 100
     DO CASE
          CASE x1 = 100
               ex = 'cem' +  ;
                    cvar1p
          CASE x1 > 100 .AND. x1 /  ;
               100 = INT(x1 /  ;
               100)
               ex = c(x2) +  ;
                    cvar1p
          CASE x1 <= 999
               ex = c(x2)
     ENDCASE
     nlin = ALEN(aex)
     DIMENSION aex[ nlin + 1]
     aex[ nlin + 1] = ex
     ex = ''
     IF VAL(nu) <= 999.99 
          FOR h = ALEN(aex) TO 1  ;
              STEP -1
               conc = ''
               IF h >= 2
                    IF  .NOT.  ;
                        EMPTY(aex(h -  ;
                        1))
                         conc = ' e '
                    ENDIF
               ENDIF
               ex = ex + aex(h) +  ;
                    conc
          ENDFOR
          RETURN (ex)
     ENDIF
     x1 = 0
     x2 = 0
     x3 = 0
ENDIF
IF LEN(ALLTRIM(nu)) = 7
     x1 = RIGHT(ALLTRIM(nu), 7)
     x1 = VAL(LEFT(ALLTRIM(x1),  ;
          1))
     ex = ''
     DO CASE
          CASE x1 = 0
               ex = ''
          CASE x1 = 1
               ex = u(x1) +  ;
                    ' mil'
          CASE x1 < 10
               ex = u(x1) +  ;
                    ' mil'
     ENDCASE
     nlin = ALEN(aex)
     DIMENSION aex[ nlin + 1]
     aex[ nlin + 1] = ex
     ex = ''
     IF VAL(nu) < 9999.99 
          FOR h = ALEN(aex) TO 1  ;
              STEP -1
               conc = ''
               IF h >= 2
                    IF h = 5
                         IF  .NOT.  ;
                             ISBLANK(ALLTRIM(aex(h -  ;
                             1)))
                              conc =  ;
                               ', '
                         ENDIF
                    ELSE
                         IF  .NOT.  ;
                             ISBLANK(aex(h -  ;
                             1))
                              conc =  ;
                               ' e '
                         ELSE
                              conc =  ;
                               ''
                         ENDIF
                    ENDIF
                    ex = ex +  ;
                         aex(h) +  ;
                         conc
               ENDIF
          ENDFOR
          RETURN (ex)
     ENDIF
     x1 = 0
     x2 = 0
     x3 = 0
ENDIF
x1 = RIGHT(ALLTRIM(nu), 8)
x1 = VAL(LEFT(ALLTRIM(x1), 2))
x2 = VAL(LEFT(ALLTRIM(STR(x1)),  ;
     1))
x3 = VAL(RIGHT(ALLTRIM(STR(x1)),  ;
     1))
ex = ''
DO CASE
     CASE x1 = 0
          ex = ''
     CASE x1 < 10
          ex = u(x1) + ' mil'
     CASE x1 >= 10 .AND. x1 / 10 =  ;
          INT(x1 / 10)
          ex = d(x2) + ' mil'
     CASE x1 > 10 .AND. x1 < 20
          ex = dd(x3) + ' mil'
     CASE x1 > 20
          ex = d(x2) + ' e ' +  ;
               u(x3) + ' mil'
ENDCASE
nlin = ALEN(aex)
DIMENSION aex[ nlin + 1]
aex[ nlin + 1] = ex
ex = ''
IF VAL(nu) < 99999.99 
     FOR h = ALEN(aex) TO 1 STEP - ;
         1
          conc = ''
          IF h >= 2
               DO CASE
                    CASE h = 5
                         IF  .NOT.  ;
                             EMPTY(aex(h -  ;
                             1))
                              conc =  ;
                               ', '
                         ENDIF
                    CASE  .NOT.  ;
                          EMPTY(aex(h -  ;
                          1))
                         conc = ' e '
               ENDCASE
          ENDIF
          ex = ex + aex(h) + conc
     ENDFOR
     RETURN (ex)
ENDIF
x1 = 0
x2 = 0
x3 = 0
x1 = INT(VAL(RIGHT(nu, 9)))
x1 = VAL(LEFT(ALLTRIM(STR(x1)),  ;
     3))
x2 = VAL(LEFT(ALLTRIM(STR(x1)),  ;
     1))
flag = 0
ex = ''
DO CASE
     CASE x1 = 100
          ex = 'cem' + ' mil'
     CASE x1 > 100 .AND. x1 / 100 =  ;
          INT(x1 / 100)
          ex = c(x2) + ' mil'
     OTHERWISE
          ex = c(x2)
          flag = 1
ENDCASE
nlin = ALEN(aex)
DIMENSION aex[ nlin + 1]
aex[ nlin + 1] = ex
ex = ''
FOR h = LEN(aex) TO 1 STEP -1
     conc = ''
     IF h >= 2
          DO CASE
               CASE h = 6 .OR. h =  ;
                    5 .OR. h = 4
                    IF  .NOT.  ;
                        EMPTY(aex(h -  ;
                        1)) .AND.  ;
                        flag = 0
                         conc = ', '
                    ELSE
                         conc = ' e '
                         flag = 0
                    ENDIF
               CASE  .NOT.  ;
                     EMPTY(aex(h -  ;
                     1))
                    conc = ' e '
          ENDCASE
     ENDIF
     ex = ex + aex(h) + conc
ENDFOR
RETURN (ex)
x1 = 0
x2 = 0
x3 = 0
RETURN (ex)
*
