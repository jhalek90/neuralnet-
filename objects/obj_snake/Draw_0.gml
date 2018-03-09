/// @description Insert description here
// You can write your code in this editor
draw_x=room_width/2
draw_y=room_height/2
if keyboard_check(ord("D"))
	{
	if global.first != id
		{
		exit
		}
	}
draw_set_color(c_white)
draw_circle(x,y,size,1)



i=0
repeat(total_tails)
	{
	draw_circle(tail_x[i],tail_y[i],size,1)
	i+=1
	}

	
	
if global.first != id
	{
	exit
	}

	
draw_set_alpha(0.5)
i=0
	repeat(node_layers)
	{
	if i>0
		{
		ii=0
		repeat(node_layer_count[i])
			{
			iii=0
			repeat(node_layer_count[i-1])
				{
				if node_bias[node_id[i,ii],node_id[i-1,iii]]>0
					{
					draw_set_color(make_color_hsv(64,node_bias[node_id[i,ii],node_id[i-1,iii]]*255,255))
					}
				else
					{
					draw_set_color(make_color_hsv(0,node_bias[node_id[i,ii],node_id[i-1,iii]]*255,255))
					}
				
				draw_line(draw_x+(node_x[i,ii]*scale),draw_y+(node_y[i,ii]*scale),draw_x+(node_x[i-1,iii]*scale),draw_y+(node_y[i-1,iii]*scale))
				iii+=1
				}
			ii+=1
			}
		}
	i+=1	
	}
	

i=0
repeat(node_layers)
	{
	ii=0
	repeat(node_layer_count[i])
		{
		if node_value[i,ii]>0
			{
			draw_set_color(make_color_hsv(64,node_value[i,ii]*255,255))
			}
		else
			{
			draw_set_color(make_color_hsv(0,node_value[i,ii]*255,255))
			}

		draw_circle(draw_x+(node_x[i,ii]*scale),draw_y+(node_y[i,ii]*scale),(2+(node_value[i,ii]))*scale,0)
		ii+=1
		}
	i+=1
	}
	draw_set_alpha(1)
draw_set_color(c_white)

draw_text(x+32,y-32,"fitness: "+string(fitness))
draw_text(x+32,y-64,"change: "+string(fitness_change))
draw_text(x+32,y-96,"id: "+string(id))



d=direction-(fov/2)
i=0
repeat(sight_rays)
	{
	draw_set_color(c_white)
	if sight_ray_value[i]=0
		{
		draw_line(x,y,x+lengthdir_x(sight_distance,d),y+lengthdir_y(sight_distance,d))
		}
		
	if sight_ray_value[i]>0
		{
		draw_set_color(c_lime)
		draw_line(x,y,x+lengthdir_x(sight_ray_value[i]*sight_distance,d),y+lengthdir_y(sight_ray_value[i]*sight_distance,d))
		}
	if sight_ray_value[i]<0
		{
		draw_set_color(c_red)
		sight_ray_value[i]=-sight_ray_value[i]
		draw_line(x,y,x+lengthdir_x(sight_ray_value[i]*sight_distance,d),y+lengthdir_y(sight_ray_value[i]*sight_distance,d))
		}
	
	d+=fov/sight_rays
	i+=1
	}

draw_set_color(c_white)
if dead>0
	{
	draw_set_color(c_red)
	}

draw_set_color(c_white)