function generateSpike(xP,y)
	local spike = {}
	spike.width = 40
	spike.height = 20
	spike.x = xP
	spike.y = 600-spike.height
	spike.id = 1
	spike.image = love.graphics.newImage("spikes.png")
	
	spike.draw = function()
		love.graphics.draw(spike.image, spike.x, spike.y, 0, 0.1, 0.1, 0, 0, 0, 0) 
	end

	spike.update = function()
		
	end

	return spike

end

