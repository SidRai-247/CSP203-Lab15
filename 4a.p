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
