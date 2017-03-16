local class = require "lib.middleclass"
local Snake = require "entities.snake"
local Comida = require "entities.comida"
local Music = require "assets.loader"

local Render = class('Render')

Render.music = nil

function Render:initialize( scl, w, h, x, y )
  self.scl, self.w, self.h, self.x, self.y = scl, w, h, x, y

  self.music = Music:new()

  self:reset()

end

function Render:draw()

  for n = 0, self.snake.eat - 1 , 1  do

    love.graphics.setColor(41, 217, 194, self.tail[n].alfa)
    love.graphics.rectangle('fill', self.tail[n].x, self.tail[n].y, self.snake.scl, self.snake.scl)

  end

  self.snake:draw()
  self.comida:draw(self.tail)

end

function Render:update()

  self.music:update()

  -- Metodo para mover la snake mientras no se muera
  if not self.snake.dead then
    self.snake:move()
  end

  -- Seccion de Creacion de la cola de la snake
  if self.snake.eat == #self.tail then
    for n = 0, self.snake.eat - 1, 1 do
      self.tail[n] = self.tail[n + 1]
      if self.tail[n].alfa > 100 then
        self.tail[n].alfa = self.tail[n].alfa - 20
      end
    end
  end

  self.tail[self.snake.eat] = {alfa = self.snake.alfa, x = self.snake.x, y = self.snake.y}
  -- Fin de la seccion de la cola de la snake

  -- Metodo que valida si la snake come
  self.snake:isEating(self.comida)

  -- Musica cuando la snake come
  if self.comida.eaten then
    self.music:play(1)
  end

  -- Se revisa que no choque con su cuerpo la snake
  self.snake:citSelf(self.tail)

end

function Render:reset ()

  self.tail = {}

  self.snake = Snake:new(275, self.x, self.y, self.scl, self.w, self.h)
  self.comida = Comida:new(self.x, self.y, self.scl, self.w, self.h)

  self.snake:dir(self.scl,0)

end

return Render
