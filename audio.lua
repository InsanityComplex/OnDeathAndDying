function audioLoad()
	gameLoopMusic = love.audio.newSource("Gameplay Loop.ogg", "static")
	titleMusic = love.audio.newSource("Title sequence.ogg", "static")
	depressionMusic = love.audio.newSource("Depression.ogg", "static")
end


--Keep music on track
lastState = -1
function audioUpdate()
	if not (gameState == lastState) then
		audioStop()
		--Menus
		if gameState == 0 then
			audioPlayTitle()
		end
		--Game
		if gameState == 1 then
			audioPlayGameMusic()
		end
		--Credits
		if gameState == 2 then
			audioPlayTitle()
		end
	end
	lastState = gameState
end

function audioStop()

	love.audio.stop(titleMusic)
	love.audio.stop(depressionMusic)
	love.audio.stop(gameMusic)
end

function audioPlayTitle()
	titleMusic:setLooping(true)
	love.audio.play(titleMusic)
end

function audioPlayGameMusic()
	gameMusic:setLooping(true)
	love.audio.play(gameMusic)
end

function audioPlayDepression()
	depressionMusic:setLooping(true)
	love.audio.play(depressionMusic)
end
