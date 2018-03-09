/// @description Insert description here
// You can write your code in this editor

global.total_tails=0

with(obj_snake)
	{
	
	c=0
	repeat(total_tails)
		{
		global.tail_xx[global.total_tails]=tail_x[c]
		global.tail_yy[global.total_tails]=tail_y[c]
		global.tail_owner[global.total_tails]=id
		global.total_tails+=1
		c+=1
		}
	}
	
	
if instance_number(obj_snake)<5
	{
	instance_create_depth(random(room_width),random(room_height),1,obj_snake)
	}
	
/*
if (instance_number(obj_food)<10)//or(random(100)>98))
	{
	instance_create_depth(random(room_width),random(room_height),1,obj_food)
	}
*/	
	
global.first=0
global.second=0

repeat(3)
{
with(obj_snake)
	{
	
	if ((global.first=0)or(global.first=id))
		{
		global.first=id
		}
	else
		{
		if ((global.second=0)or(global.second=id))
			{
			global.second=id
			}
		else
			{
			if fitness>global.first.fitness
				{
				global.first=id
				}
			else
				{
				if fitness>global.second.fitness
					{
					global.second=id
					}
				}
			}
		}
	}
}
		
		