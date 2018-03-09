/// @description Insert description here
// You can write your code in this editor

draw_x=room_width-256
draw_y=256
size=16
scale=1.25

//AI tuning
avoid_other_snakes=1
node_layers=7 /// tuneable
nodes_per_layer=10 /// tuneable
mutate_amount=98//lower = more mutation. 100 = no mutations
fov=180
sight_distance=300
inputs_total=5
outputs_total=2
fitness=1
fitness_change=0
spin=0

i=0
ii=0
iii=0


	
node_number=0

i=0
d=0

speed=4

total_tails=0
tail_x[total_tails]=x
tail_y[total_tails]=y

repeat(2)
	{
	total_tails+=1
	tail_x[total_tails]=tail_x[total_tails-1]
	tail_y[total_tails]=tail_x[total_tails-1]
	}

repeat(node_layers)
	{
	node_layer_count[i]=nodes_per_layer
	
	if i=0
		{
		node_layer_count[i]=outputs_total
		}
		
	if i=node_layers-1
		{
		node_layer_count[i]=inputs_total
		}
	
	d=0//random(360)//just for pretty
	ii=0
	repeat(node_layer_count[i])
		{
		node_x[i,ii]=lengthdir_x(16+(16*i),d)
		node_y[i,ii]=lengthdir_y(16+(16*i),d)
		node_id[i,ii]=node_number
		node_value[i,ii]=0
		node_type[i,ii]=choose(1,2,3,4)
		node_number+=1
		d+=360/node_layer_count[i]
		ii+=1
		}
	i+=1
	}
	
	c=0
	
	
dead=0


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
				node_bias[node_id[i,ii],node_id[i-1,iii]]=random(1)*choose(1,-1)
				iii+=1
				}
			ii+=1
			}
		}
	i+=1	
	}
	
	
	

sight_rays=node_layer_count[node_layers-1]


i=0
repeat(sight_rays)
	{
	sight_ray_value[i]=0
	i+=1
	}