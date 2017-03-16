local snake_debug = {}

local text = [[
  Snake ( x , y )
  ( %d , %d )

  Booleanos ( x , y )
  ( %s , %s )

  Comida ( x , y )
  ( %d , %d )

  Comidos?
  Cantidad = %d

  Murio Snake?
  ( %s )


]]

function snake_debug.draw(snake,comida,sx,sy)

  for x = sx, snake.w / snake.scl do
    for y = sy, snake.h / snake.scl do
      love.graphics.setColor(1, 162, 166, 50)
      love.graphics.rectangle('line', x * snake.scl, y * snake.scl, snake.scl, snake.scl)
    end
  end

  love.graphics.setColor(255, 255, 166, 255)
  texto = text:format(snake.x, snake.y, tostring(snake.bx), tostring(snake.by), comida.x, comida.y, snake.eat, tostring(snake.dead))
  love.graphics.printf(texto, snake.w - 20, 10, 200, 'right')

end

return snake_debug
