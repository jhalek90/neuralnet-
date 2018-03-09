/// @description Insert description here
// You can write your code in this editor


do
	{
	hit=0
	xx=random(room_width)
	yy=random(room_width)
	
	i=0
	repeat(global.total_tails)
		{
		if point_distance(xx,yy,global.tail_xx[i],global.tail_yy[i])<128
			{
			hit=1
			}
		i+=1
		}
	}until(hit=0)
s=instance_create_depth(xx,yy,0,obj_snake)
s.alarm[0]=1