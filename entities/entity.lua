local class = require 'lib.middleclass'

local Entity = class('Entity')

function Entity:initialize(x, y, scl, w, h)
  self.x, self.y, self.scl, self.w, self.h = x, y, scl, w, h
end

return Entity
