spike = {}



function generateSpike(xP,y)
	local spike = {}
	spike.width = 40
	spike.height = 20
	spike.x = xP
	spike.y = 600-spike.height
	
	spike.draw = function()
		love.graphics.rectangle("fill",spike.x, spike.y, spike.width, spike.height)
	end

	spike.update = function()
		
	end

	return spike

end

