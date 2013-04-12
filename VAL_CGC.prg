PARAMETER ncgc
isvalid = .F.
primeira = .F.
dig1 = 0
dig2 = 0
ncgc = ALLTRIM(ncgc)
IF LEN(ncgc) = 14
     fator = 14
     FOR i = 12 TO 1 STEP -1
          IF i = 4
               fator = 6
          ENDIF
          dig1 = dig1 +  ;
                 VAL(SUBSTR(ncgc,  ;
                 i, 1)) * (fator -  ;
                 i)
     ENDFOR
     dig1 = MOD(dig1, 11)
     IF dig1 = 0 .OR. dig1 = 1
          dig1 = 0
     ELSE
          dig1 = 11 - dig1
     ENDIF
     IF STR(dig1, 1) =  ;
        SUBSTR(ncgc, 13, 1)
          primeira = .T.
     ENDIF
     IF primeira
          fator = 15
          FOR i = 13 TO 1 STEP -1
               IF i = 5
                    fator = 7
               ENDIF
               dig2 = dig2 +  ;
                      VAL(SUBSTR(ncgc,  ;
                      i, 1)) *  ;
                      (fator -  ;
                      i)
          ENDFOR
          dig2 = MOD(dig2, 11)
          IF dig2 = 0 .OR. dig2 =  ;
             1
               dig2 = 0
          ELSE
               dig2 = 11 - dig2
          ENDIF
          IF STR(dig2, 1) =  ;
             SUBSTR(ncgc, 14, 1)
               isvalid = .T.
          ENDIF
     ENDIF
ENDIF
RETURN isvalid
*
