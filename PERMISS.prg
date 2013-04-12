PRIVATE wsenha
wsenha = SPACE(8)
DEFINE WINDOW permiss AT   0.000 ,    ;
       0.000  SIZE   5.308 ,   ;
       29.800  FONT  ;
       'MS Sans Serif', 8 FLOAT  ;
       NOCLOSE TITLE  ;
       'Permissão de Acesso'  ;
       MINIMIZE SYSTEM COLOR RGB(,,, ;
       192,192,192)
ACTIVATE WINDOW permiss
MOVE WINDOW permiss CENTER
@   1.000 ,   4.800  SAY  ;
    'Entre com a Senha:' FONT  ;
    'MS Sans Serif', 8 STYLE 'T'
@   2.846 ,   5.200  GET wsenha  ;
    DEFAULT ' ' FONT  ;
    'MS Sans Serif', 8 SIZE 1.000 ,  ;
    18.400  PICTURE  ;
    '@K!T XXXXXXXXXX' VALID fim()  ;
    COLOR ,RGB(0,255,255,0,255, ;
    255)
READ CYCLE
RELEASE WINDOW permiss
RETURN wsenha
*
PROCEDURE fim
CLEAR READ
RETURN
*
