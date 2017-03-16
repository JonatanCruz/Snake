local class = require 'lib.middleclass'

local Entity = require "entities.entity"

local Snake = class('Snake', Entity)

-- Movimiento de la Snake
local mx = 0
local my = 0

-- Punto de partida (0,0)
local sx, sy = 0, 0

-- Colision con las paredes
Snake.bx = true
Snake.by = true

Snake.dead = false

Snake.eat = 0

function Snake:initialize(alfa, x, y, scl, w, h)
  Entity.initialize(self, x, y, scl, w, h)

  sx, sy = x, y
  self.alfa = alfa

end

function Snake:draw()

  love.graphics.setColor(41, 217, 194, self.alfa)
  love.graphics.rectangle('fill', self.x, self.y, self.scl, self.scl)

end

function Snake:move()

  if self.x > self.w then
    self.bx = false
    self.dead = true
    self.x = self.x
  elseif self.x < sx then
    self.bx = false
    self.dead = true
    self.x = self.x
  else
    self.bx = true
    self.x = self.x + mx
  end

  if self.y > self.h - self.scl then
    self.by = false
    self.dead = true
    self.y = self.y
  elseif self.y < sy then
    self.by = false
    self.dead = true
    self.y = self.y
  else
    self.by = true
    self.y = self.y + my
  end

end

function Snake:dir(smx, smy)

  mx = smx
  my = smy

end

function Snake:isEating (comida)

  if comida.x == self.x then
    if comida.y == self.y then
      comida.eaten = true
      self.eat = self.eat + 1
      return true
    end
  end

  return false

end

function Snake:citSelf (tail)

  for n = 0, #tail - 1 do
    if tail[n].x == self.x then
      if tail[n].y == self.y then
        self.dead = true
      end
    end
  end
  
end

return Snake
