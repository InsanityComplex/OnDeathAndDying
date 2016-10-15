function generatePlatform(xP,yP,widthP,heightP)
	local platform = {}
	platform.width = widthP
	platform.height = heightP
	platform.x = xP
	platform.y = yP
	platform.id = 0
	
	platform.draw = function()
		love.graphics.rectangle("fill",platform.x, platform.y, platform.width, platform.height)
	end

	platform.update = function()
		
	end

	return platform

end