buttons = {}
  
function button_spawn(x, y, text, changeState)
  table.insert(buttons, {x = x, y = y, text = text, state = changeState})
end

function button_draw()
  for i, v in ipairs(buttons) do
    love.graphics.setColor(255,255,255)
    love.graphics.setNewFont(30)
    love.graphics.print(v.text, v.x, v.y)
  end
end

function love.mousepressed(x, y, button)
  --print ("button: ".. button .. " x: " .. x .." y: " .. y .. " gS: " .. gameState)
  if button == 1 and gameState == 0 then
    --print "mouse 1 pressed"
    for i, v in ipairs(buttons) do
      if x >= v.x and x <= 300 + v.x and y >= v.y and y <= 300 + v.y then
        gameState = v.state
      end
    end
  end
end