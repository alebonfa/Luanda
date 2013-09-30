sele funcs
replace hist with 'Fone Editado: ' + allt(fone) + CHR(10) + CHR(13) + hist all
replace fone with strtran(fone, '(', '') all
replace fone with strtran(fone, ')', '') all
for i = 1 to 5
	replace fone with strtran(fone, ' ', '') all
next i
replace fone with strtran(fone, '/', '') all
replace fone with strtran(fone, '-', '') all
replace fone with strtran(fone, '.', '') all
replace fone with substr(fone, 2, 100) for left(fone,1) = '0'
replace fone with left(fone,10) all
replace fone with stuff(fone, 3, 0, ' ') all
wait wind 'concluído'