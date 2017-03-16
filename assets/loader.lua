require "lib.TEsound"

local class = require "lib.middleclass"

local Loader = class('Loader')

Loader.val = {}

Loader.val.sounds = {}
Loader.val.names = {}
Loader.val.volumen = {}
Loader.val.img = {}

function Loader:initialize ()

  self.val.img[0] = love.graphics.newImage("assets/img/buble.png")

  self.val.sounds[0] = "assets/audio/game.ogg"
  self.val.sounds[1] = "assets/audio/space.ogg"
  self.val.sounds[2] = "assets/audio/intro.mp3"


  self.val.names[0] = 'GAME'
  self.val.names[1] = 'EAT'
  self.val.names[2] = 'INTRO'

  self.val.volumen[0] = 0.3
  self.val.volumen[1] = 0.8
  self.val.volumen[2] = 0.5

end



function Loader:update ()

  TEsound.cleanup()

end

function Loader:playLoop(n)

  TEsound.playLooping(self.val.sounds[n], self.val.names[n])
  TEsound.volume(self.val.names[n], self.val.volumen[n])

end

function Loader:play(n)

  TEsound.play(self.val.sounds[n], self.val.names[n])
  TEsound.volume(self.val.names[n], self.val.volumen[n])

end

function Loader:stop (n)
  TEsound.stop(self.val.names[n])
end

function Loader:pause (n)
  TEsound.pause(self.val.names[n])
end

function Loader:resume (n)
  TEsound.resume(self.val.names[n])
end

return Loader
