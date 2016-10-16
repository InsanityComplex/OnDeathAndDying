-- Basic chaser creature
require "animation"

animation.monster.load()

function generateMonster()
	local monster = {}
	monster.x = math.random( 900, 2000)
	monster.y = math.random(70, 500)
	monster.width = 100
	monster.height = 60
	monster.speed = math.random(2, 6)
	monster.visionRange = 250
	monster.chasing = false
	monster.direction = 0
  monster.currentImage = 0
  monster.currentTick = 0
  monster.currentAngle = math.random(360)

	monster.update = function()
		-- Chase if player is in sight radius
		-- player.x + backgroundX => map X position of player  
			monster.x = monster.x - monster.speed
	monster.id = 1
  monster.currentTick = monster.currentTick + 1
	if monster.currentTick >= 39 then
		monster.currentTick = 0
  end
end

  monster.draw = function()
    -- Debugging
--    love.graphics.rectangle("line", monster.x, monster.y, monster.width, monster.height)
    monster.currentAngle = 0 -- debug
		love.graphics.draw(monsterfalling[monster.currentTick], monster.x, monster.y, monster.currentAngle, 0.1, 0.1, 0, 0, 0, 0)
	end

	return monster

end
