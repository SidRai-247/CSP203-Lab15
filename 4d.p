set terminal pdf
set output '4d.pdf'
set title "Percentage of Age Groups with Heart Disease"

angle1 = 0.3267973856 * 360
angle2 = angle1 + 0.4248366013 * 360
angle3 = angle2 + 0.2091503268 * 360
angle4 = angle3 + 0.0392156863 * 360
angle5 = angle4 + 0.0000000000 * 360
angle6 = angle5 + 0.0000000000 * 360

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

plot NaN title '40-50' with lines lc rgb "red",      NaN title '50-60' with lines lc rgb "yellow",      NaN title '60-70' with lines lc rgb "green",      NaN title '70-80' with lines lc rgb "blue",      NaN title '80-90' with lines lc rgb "cyan",      NaN title '90-100' with lines lc rgb "magenta"
