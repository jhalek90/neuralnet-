/// @description Insert description here
// You can write your code in this editor


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
				if choose(1,2)=1
					{
					node_bias[node_id[i,ii],node_id[i-1,iii]]=global.first.node_bias[node_id[i,ii],node_id[i-1,iii]]
					}
				else
					{
					node_bias[node_id[i,ii],node_id[i-1,iii]]=global.second.node_bias[node_id[i,ii],node_id[i-1,iii]]
					}
					
				if random(100)>mutate_amount
					{
					node_bias[node_id[i,ii],node_id[i-1,iii]]=random(2)-1
					}
				
				iii+=1
				}
			ii+=1
			}
		}
	i+=1	
	}