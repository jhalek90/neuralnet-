/// @description Insert description here
// You can write your code in this editor


draw_set_color(c_white)
draw_text(32,32,"FPS: "+string(fps)+" / "+string(fps_real))


draw_text(32,64,"1st: "+string(global.first.fitness)+"    "+string(global.first))
draw_text(32,96,"2nd: "+string(global.second.fitness)+"    "+string(global.second))
