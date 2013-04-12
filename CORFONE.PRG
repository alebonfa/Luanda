replace fax with strtran(fax, '(', '') all
replace fax with strtran(fax, ')', '') all
replace fax with strtran(fax, '-', '') all
replace fax with strtran(fax, '.', '') all
for i = 1 to 10
	replace fax with strtran(fax, ' ', '') all
endfor
replace fax with '' for len(allt(fax)) = 9
replace fax with '' for len(allt(fax)) < 8
replace fax with substr(fax,2,10) for len(allt(fax)) = 11
replace fax with '00' + allt(fax) for len(allt(fax)) = 8
