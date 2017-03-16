state = require "lib.stateswitcher"

function love.draw()

  love.graphics.setBackgroundColor(47, 41, 51, 255)

  love.graphics.setColor(189, 242, 113, 255)
  love.graphics.rectangle('line', 0, 0, width + scl, height + scl)

  render:draw()

  --Codigo para depurar
  if debug then sdebug.draw( render.snake, render.comida, x, y ) end

  if debug then
    local statistics = ("fps: %d, mem: %dKB"):format( love.timer.getFPS(), collectgarbage("count") )
    love.graphics.setColor( 189, 242, 113, 255 )
    love.graphics.printf( statistics, width - 50, height - (height / 100), 200, 'right' )
  end
  -- Termina codigo para depurar

end

function love.update(dt)

  -- Codigo para modificar los FPS
  if love.timer then love.timer.sleep(0.1) end

  render:update()

end

function love.keypressed(key, scancode, isrepeat)

  if key == "space" then

    onGame = not onGame

    if onGame then
      render.music:stop(2)
      state.switch("states.play")
      render.music:playLoop(0)
    else
      render.music:stop(0)
      state.switch("states.pause")
      render.music:play(2)
    end
  end

  -- Reiniciar el juego
  if key == 'return' then render:reset() end

  -- Mover la Snake
  if key == 'up' then render.snake:dir(0,-scl) end
  if key == 'down' then render.snake:dir(0,scl) end
  if key == 'left' then render.snake:dir(-scl,0) end
  if key == 'right' then render.snake:dir(scl,0) end

  -- Activar Desactivar el panel de Debug
  if key == 'tab' then debug = not debug end

  -- Salir del Juego
  if key == 'escape' then love.event.quit() end

  -- Activar el colector de basura
  if key == "c" then
    collectgarbage("collect")
  end

end
