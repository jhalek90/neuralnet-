
if instance_exists(obj_food)
	{
	o=instance_nearest(x,y,obj_food)
	if point_distance(x,y,o.x,o.y)<size*2
		{
	
		with(o)
			{
			instance_destroy()
			}
		
		repeat(1)
			{
			total_tails+=1
			tail_x[total_tails]=tail_x[total_tails-1]
			tail_y[total_tails]=tail_x[total_tails-1]
			}

		fitness+=1
		speed-=0.1
		if speed<2
			{
			speed=2
			}
		}
	
	}	
ii=2
repeat(total_tails-1)
	{
	dd=point_distance(x,y,tail_x[ii],tail_y[ii])
	if dd<size*2
		{
		if dead=0
			{
			with(obj_control)
				{
				event_user(0)
				}
			dead=30
			}
		}
	ii+=1
	}
	
	
if avoid_other_snakes
	{
	ii=0
	repeat(global.total_tails)
		{
	
		if global.tail_owner[ii] != id
			{
				dd=point_distance(x,y,global.tail_xx[ii],global.tail_yy[ii])
				if dd<size*2
					{
					if dead=0
						{
						with(obj_control)
							{
							event_user(0)
							}
						dead=30
						}
					}
			}
		ii+=1
		}

	}

d=direction-fov/2
i=0
repeat(sight_rays)
	{
	dist=0
	hit=0
	do	
		{
		dx=lengthdir_x(dist,d)
		dy=lengthdir_y(dist,d)
		o=instance_nearest(x+dx,y+dy,obj_food)
		if point_distance(x+dx,y+dy,o.x,o.y)<size
			{
			hit=1
			}
			
		if x+dx>room_width
			{
			hit=-1
			}
			
		if x+dx<0
			{
			hit=-1
			}
		
		if y+dy>room_height
			{
			hit=-1
			}
			
		if y+dy<0
			{
			hit=-1
			}
			
			
		ii=2//2
		repeat(total_tails-1)//-1
			{
			dd=point_distance(x+dx,y+dy,tail_x[ii],tail_y[ii])
			if dd<size*2
				{
				hit=-1
				}
	
			ii+=1
			}
			
		if avoid_other_snakes
			{
			ii=0//2
			repeat(global.total_tails)//-1
				{
				//dx=lengthdir_x(dist,d)
				//dy=lengthdir_y(dist,d)
				if global.tail_owner[ii] != id
					{
					dd=point_distance(x+dx,y+dy,global.tail_xx[ii],global.tail_yy[ii])
					if dd<size*2
						{
						hit=-1
						}
					}
				ii+=1
				}
			}
		
		dist+=size
		if dist>sight_distance
			{
			dist=sight_distance
			}
		
		}until(hit != 0)or(dist=sight_distance)
		
	if hit !=0
		{
		sight_ray_value[i]=(dist/sight_distance)*hit
		}
	else
		{
		sight_ray_value[i]=0//(dist/sight_distance)
		}
	
	d+=fov/sight_rays
	i+=1
	}