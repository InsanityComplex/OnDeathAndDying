--Thunder cloud, grows visibly smaller and calmer as level progresses.

cloud = {}
cloud.x = player.x
cloud.y = player.y - 180
cloud.status = 100

cloud.update = function()
	cloud.x = player.x - 30
	cloud.y = player.y - 180 
end

cloud.draw = function()
	love.graphics.draw(cloud.image, cloud.x, cloud.y, 0, 1, 1, 0, 0, 0, 0) 
end