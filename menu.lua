buttons = {}
X_CONSTANT = 110
Y_CONSTANT = 30

function button_spawn(x, y, text, changeState)
  table.insert(buttons, {x = x, y = y, text = text, state = changeState})
end

function button_draw()
  for i, v in ipairs(buttons) do
    love.graphics.setColor(255,255,255)
    love.graphics.setNewFont(Y_CONSTANT)
    love.graphics.print(v.text, v.x, v.y)
    love.graphics.rectangle("line", v.x, v.y, X_CONSTANT, Y_CONSTANT)
  end
end

function love.mousepressed(x, y, button)
  --print ("x: " .. x .." y: " .. y)
  if button == 1 and gameState == 0 then
    --print "mouse 1 pressed"
    for i, v in ipairs(buttons) do
      if x >= v.x and x <= v.x + X_CONSTANT and y >= v.y and y <= v.y + Y_CONSTANT then
        
        gameState = v.state
      end
    end
  elseif button == 1 and gameState == 2 then
    gameState = 0
  end
end