/// @description Insert description here
// You can write your code in this editor

randomize()
x=room_width/2
y=room_height/2

xx=0
yy=0
hot=0
i=0
global.first=0
global.second=0

global.total_tails=0
global.tail_xx[global.total_tails]=0
global.tail_yy[global.total_tails]=0
global.tail_owner[global.total_tails]=0


repeat(50)
	{
	instance_create_depth(random(room_width),random(room_height),1,obj_food)
	}