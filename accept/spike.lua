spike = {}

spike.width = 40
spike.height = 20
spike.x = 500
spike.y = 600-spike.height

spike.draw = function()
	love.graphics.rectangle("fill",spike.x, spike.y, spike.width, spike.height)
end

spike.update = function()
	
end