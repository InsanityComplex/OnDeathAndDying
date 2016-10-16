function audioLoad()
	titleMusic = love.audio.newSource("1.wav", "static")
	gameMusic = love.audio.newSource("2.wav", "static")
end

function audioStop()

	love.audio.stop(titleMusic)

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
