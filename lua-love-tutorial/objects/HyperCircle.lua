HyperCircle = Circle:extend()

function HyperCircle:new(x, y, radius, line_width, outer_radius)
  HyperCircle.super.new(self, x, y, radius)
  self.line_width = line_width or 10
  self.outer_radius = outer_radius or 120
end

function HyperCircle:update(dt)
  HyperCircle.super.update(self, dt)
end

function HyperCircle:draw()
  -- Draw Outer Circle first
  love.graphics.setColor(255, 255, 255)
  love.graphics.circle("fill", self.x, self.y, self.outer_radius)
  -- Draw Black Circle next
  love.graphics.setColor(0, 0, 0)
  love.graphics.circle("fill", self.x, self.y, self.outer_radius - self.line_width)
  -- Draw original Circle on top
  love.graphics.setColor(255, 255, 255)
  HyperCircle.super.draw(self)
end
