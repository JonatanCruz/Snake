state = require "lib.stateswitcher"

bubblex = 100
bubbley = 100

function love.draw()

  love.graphics.draw(render.music.val.img[0], bubblex, bubbley)

end

function love.update(dt)

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

  -- Salir del Juego
  if key == 'escape' then love.event.quit() end

  -- Activar el colector de basura
  if key == "c" then
    collectgarbage("collect")
  end

end
