Object = require 'libraries/classic/classic'

function love.load()
  local object_files = {}
  recursiveEnumerate('objects', object_files)
  requireFiles(object_files)
  circle = Circle()
  hypercircle = HyperCircle()
end

function recursiveEnumerate(folder, file_list)
  local items = love.filesystem.getDirectoryItems(folder)
  for _, item in ipairs(items) do
    local file = folder .. '/' .. item
    if love.filesystem.isFile(file) then
      table.insert(file_list, file)
    elseif love.filesystem.isDirectory(file) then
      recursiveEnumerate(file, file_list)
    end
  end
end

function requireFiles(files)
  for _, file in ipairs(files) do
    local file = file:sub(1, -5)
    require(file)
  end
end

function love.update(dt)
end

function love.draw()
  -- circle:draw()
  hypercircle:draw()
end

