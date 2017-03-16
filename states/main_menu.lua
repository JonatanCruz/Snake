state = require "lib.stateswitcher"

menu_items = 0

function love.draw()

  love.graphics.setBackgroundColor(4, 99, 128, 255)

  love.graphics.setColor(230, 226, 175, 255)
  love.graphics.print("Menu Principal", ( height / 2 ) - 40, 50, 0, 3, 3)

  if menu_items == 0 then
    love.graphics.setColor(239, 236, 202, 255)
    love.graphics.print("Juega a Snake", ( height / 2 ), 150, 0, 2, 2)
  else
    love.graphics.setColor(239, 236, 202, 100)
    love.graphics.print("Juega a Snake", ( height / 2 ), 150, 0, 2, 2)
  end
  if menu_items == 1 then
    love.graphics.setColor(239, 236, 202, 255)
    love.graphics.print("Juega a Snake1", ( height / 2 ), 200, 0, 2, 2)
  else
    love.graphics.setColor(239, 236, 202, 100)
    love.graphics.print("Juega a Snake1", ( height / 2 ), 200, 0, 2, 2)
  end
  if menu_items == 2 then
    love.graphics.setColor(239, 236, 202, 255)
    love.graphics.print("Juega a Snake2", ( height / 2 ), 250, 0, 2, 2)
  else
    love.graphics.setColor(239, 236, 202, 100)
    love.graphics.print("Juega a Snake2", ( height / 2 ), 250, 0, 2, 2)
  end
  if menu_items == 3 then
    love.graphics.setColor(239, 236, 202, 255)
    love.graphics.print("Salir", ( height / 2 ), 300, 0, 2, 2)
  else
    love.graphics.setColor(239, 236, 202, 100)
    love.graphics.print("Salir", ( height / 2 ), 300, 0, 2, 2)
  end

end

function love.update(dt)

  render.music:update()

end
