function generateCloud(xP,yP)
	local cloud = {}
	cloud.x = xP
	cloud.y = yP
	cloud.id = 0

	cloud.currentIndex = 0
	cloud.animation = {}
	for i=1,48 do
		cloud.animation[i-1] =love.graphics.newImage("cloud/00" .. string.format("%02d",i) .. ".png")
	end

	
	cloud.draw = function()
		love.graphics.draw(cloud.animation[cloud.currentIndex], cloud.x, cloud.y, 0, 0.1, 0.1, 0, 0, 0, 0) 
	end

	cloud.update = function()
		cloud.currentIndex = cloud.currentIndex + 1
		if(cloud.currentIndex >= 47) then
			cloud.currentIndex = 0
		end
	end

	return cloud

end