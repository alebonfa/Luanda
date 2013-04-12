PARAMETER ncpf
isvalid = .F.
primeira = .F.
dig1 = 0
dig2 = 0
ncpf = ALLTRIM(ncpf)
IF LEN(ncpf) = 11
     FOR i = 1 TO 9
          dig1 = dig1 +  ;
                 VAL(SUBSTR(ncpf,  ;
                 i, 1)) * i
     ENDFOR
     dig1 = MOD(dig1, 11)
     IF dig1 = 10
          dig1 = 0
     ENDIF
     IF STR(dig1, 1) =  ;
        SUBSTR(ncpf, 10, 1)
          primeira = .T.
     ENDIF
     IF primeira
          FOR i = 2 TO 10
               dig2 = dig2 +  ;
                      VAL(SUBSTR(ncpf,  ;
                      i, 1)) * (i -  ;
                      1)
          ENDFOR
          dig2 = MOD(dig2, 11)
          IF dig2 = 10
               dig2 = 0
          ENDIF
          IF STR(dig2, 1) =  ;
             SUBSTR(ncpf, 11, 1)
               isvalid = .T.
          ENDIF
     ENDIF
ENDIF
RETURN isvalid
*
