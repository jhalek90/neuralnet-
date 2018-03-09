/// @description Insert description here
// You can write your code in this editor


if global.first=id
	{
	i=0
	repeat(node_layers)
		{
		d=spin*i//random(360)//just for pretty
		ii=0
		repeat(node_layer_count[i])
			{
			node_x[i,ii]=lengthdir_x((scale*sin(spin*i))+(16*i),d)
			node_y[i,ii]=lengthdir_y((scale*sin(spin*i))+(16*i),d)
			d+=360/node_layer_count[i]
			ii+=1
			}
		i+=1
		}
	}


if dead>0
	{
	dead-=1
	if dead=0
		{
		
		i=2
		repeat(total_tails-2)
			{
			instance_create_depth(tail_x[i],tail_y[i],1,obj_food)
			i+=1
			}

		
		
		instance_destroy()
		}
	speed=0
	exit
	}
	
	
//use data from last step to move
if node_value[0,0]>0
	{
	direction+=5
	spin+=0.1
	}
if node_value[0,1]>0
	{
	direction-=5
	spin-=0.1
	}
	
target_food()


tail_x[0]=x	
tail_y[0]=y
i=1
repeat(total_tails)
	{
	d=point_distance(tail_x[i-1],tail_y[i-1],tail_x[i],tail_y[i])
	if d>size*2
		{
		d=point_direction(tail_x[i-1],tail_y[i-1],tail_x[i],tail_y[i])
		tail_x[i]=tail_x[i-1]+lengthdir_x(size*2,d)
		tail_y[i]=tail_y[i-1]+lengthdir_y(size*2,d)
		}
	
	i+=1
	}


////wipe network
i=0
repeat(node_layers)
	{

		ii=0
		repeat(node_layer_count[i])
			{
			node_value[i,ii]=0	
			ii+=1
			}
	
	i+=1
	}
	

//add input
i=node_layers-1
ii=0
repeat(node_layer_count[i])
	{
	node_value[i,ii]=sight_ray_value[ii]
	//node_value[i,ii]=min(node_value[i,ii],1)
	//node_value[i,ii]=max(node_value[i,ii],-1)
	ii+=1
	}

	




//distibute info
i=node_layers-1
repeat(node_layers)
	{
	if i>0// layer we are working on
		{
		ii=0//node in layer we are on
		repeat(node_layer_count[i])
			{
			iii=0// node in next layer inwords
			repeat(node_layer_count[i-1])
				{
				node_value[i-1,iii]+=(node_value[i,ii]*node_bias[node_id[i,ii],node_id[i-1,iii]])/node_layer_count[i]
				//node 1 layer down += our value times our bias to that node div by total nodes in our layer
				iii+=1//next node in lower layer
				}
			ii+=1
			}
		}
	i-=1	
	}
	