--[[
Juego Hecho por: Jonatan Tlilayatzi Cruz
Titulo: Snake
Versión: 0.3
Fecha: 9 de Febrero del 2017
--]]

require 'lib.middleclass'

-- Clase para cambiar de estados
state = require "lib.stateswitcher"

sdebug = require "debug.snake_debug"

Render = require "Render"

--tamaño del area de juego *tiene que ser par
width = 600
height = 600

-- tamaño de los cuadros *tiene que ser divisible entre la altura y la anchura
scl = 20

-- punto de inicio de toda la superficie del area de juego
x, y = 0,0

-- Variable booleana para depurar
debug = true

-- Main Menu
state.clear()
state.switch("states.main_menu")

onGame = false

function love.load(arg)

  render = Render:new( scl, width, height, x, y )

  render.music:playLoop(2)

end

-- Evento cuando se preciona una tecla
function love.keypressed(key, scancode, isrepeat)

  if key == 'up' then
    menu_items = menu_items - 1
    if menu_items < 0 then
      menu_items = 3
    end
  end

  if key == 'down' then
    menu_items = menu_items + 1
    if menu_items > 3 then
      menu_items = 0
    end
  end

  if key == 'return' then

    if menu_items == 0 then
      render.music:stop(2)
      state.switch("states.play")
      render.music:playLoop(0)
    elseif menu_items == 3 then
      love.event.quit()
    end

  end

  -- Salir del Juego
  --if key == 'escape' then love.event.quit() end

  -- Activar el colector de basura
  if key == "c" then
    collectgarbage("collect")
  end

end
