read male female <<< $(awk -F, 'NR>1 {if ($8 == 1 && $2 == 1) male+=1; else if ($8 == 1 && $2 == 0) female+=1}  END {print male, female}' heart.csv)


cat<<EOF > '4a.txt'
Female $female
Male $male
EOF

cat<<EOF > '4a.p'
set terminal pdf
set output '4a.pdf'

set title "Sex vs Heart Disease"
set xlabel "Sex"
set ylabel "Number of People"
set style data histogram
set key out top box
set xtics ("Female" 0, "Male" 1)
set style fill solid

plot '4a.txt' using 2 title "With Heart Disease" lc rgb "red"
EOF

gnuplot '4a.p'
