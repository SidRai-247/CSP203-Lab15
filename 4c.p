set terminal pdf
set output '4c.pdf'

set title 'Age vs Cholesterol'
set xlabel 'Age'
set ylabel 'Cholesterol'
set style data linespoints

plot 'temp.txt' using 1:2 title 'No Heart Disease' lc rgb 'blue'
