local class = require 'lib.middleclass'
local Entity = require "entities.entity"

local Comida = class('Comida', Entity)

Comida.eaten = false

local sx, sy = 0, 0

function Comida:initialize( x, y, scl, w, h )
  Entity.initialize( self, x, y, scl, w, h )

  sx, sy = x, y
  self:setLocation()

end

function Comida:draw (tail)

  love.graphics.setColor(189, 242 , 113, 255)
  love.graphics.rectangle('fill', self.x, self.y, self.scl, self.scl)

  if self.eaten then

    self:setLocation()

    for n = 0, #tail - 1 do
      if self.x == tail[n].x then
        if self.y == tail[n].y then
          self:setLocation()
          n = 0
        end
      end
    end

  end

end

function Comida:setLocation ()

  self.x = love.math.random(sx, (self.w / self.scl) - 1 ) * self.scl
  self.y = love.math.random(sy, (self.h / self.scl) - 1 ) * self.scl

  self.eaten = false

end

return Comida
