age_40_50=0
age_50_60=0
age_60_70=0
age_70_80=0
age_80_90=0
age_90_100=0
total=0

awk -F, 'NR>1 && $8 == 1 {
    if ($1 >= 40 && $1 < 50) age_40_50+=1
    else if ($1 >= 50 && $1 < 60) age_50_60+=1
    else if ($1 >= 60 && $1 < 70) age_60_70+=1
    else if ($1 >= 70 && $1 < 80) age_70_80+=1
    else if ($1 >= 80 && $1 < 90) age_80_90+=1
    else if ($1 >= 90 && $1 <= 100) age_90_100+=1
}
END {
	total = age_40_50 + age_50_60 + age_60_70 + age_70_80 + age_80_90 + age_90_100
    printf "age4050=%.10f\n", age_40_50/total
    printf "age5060=%.10f\n", age_50_60/total
    printf "age6070=%.10f\n", age_60_70/total
    printf "age7080=%.10f\n", age_70_80/total
    printf "age8090=%.10f\n", age_80_90/total
    printf "age90100=%.10f\n", age_90_100/total
}' heart.csv > temp_d.txt

eval $(grep "age" temp_d.txt)

cat <<EOF > '4d.p'
set terminal pdf
set output '4d.pdf'
set title "Percentage of Age Groups with Heart Disease"

angle1 = ${age4050} * 360
angle2 = angle1 + ${age5060} * 360
angle3 = angle2 + ${age6070} * 360
angle4 = angle3 + ${age7080} * 360
angle5 = angle4 + ${age8090} * 360
angle6 = angle5 + ${age90100} * 360

set angles degree
set xrange [-1:1]
set yrange [-1:1]
set size square
set style fill solid
set key out top box

set obj 1 circle arc [0:angle1] at 0, 0 size 1 front fc rgb "red"
set obj 2 circle arc [angle1:angle2] at 0, 0 size 1 front fc rgb "yellow"
set obj 3 circle arc [angle2:angle3] at 0, 0 size 1 front fc rgb "green"
set obj 4 circle arc [angle3:angle4] at 0, 0 size 1 front fc rgb "blue"
set obj 5 circle arc [angle4:angle5] at 0, 0 size 1 front fc rgb "cyan"
set obj 6 circle arc [angle5:angle6] at 0, 0 size 1 front fc rgb "magenta"

plot NaN title '40-50' with lines lc rgb "red", \
     NaN title '50-60' with lines lc rgb "yellow", \
     NaN title '60-70' with lines lc rgb "green", \
     NaN title '70-80' with lines lc rgb "blue", \
     NaN title '80-90' with lines lc rgb "cyan", \
     NaN title '90-100' with lines lc rgb "magenta"
EOF

gnuplot '4d.p'
