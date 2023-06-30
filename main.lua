-- Débogueur Visual Studio Code tomblind.local-lua-debugger-vscode
if pcall(require, "lldebugger") then
    require("lldebugger").start()
end
local imgEtoile
local mesEtoiles = {}

-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

function love.load()
    largeur = love.graphics.getWidth()
    hauteur = love.graphics.getHeight()

    imgEtoile = love.graphics.newImage("img/star.png")

    for n = 1, 50 do
        etoile = {}
        etoile.x = love.math.random(1, largeur - imgEtoile:getWidth())
        etoile.y = love.math.random(1, hauteur - imgEtoile:getHeight())
        table.insert(mesEtoiles, etoile)
        etoile.vx = 3
    end
end

function love.update(dt)
    -- deplacement etoile
    for k, e in ipairs(mesEtoiles) do
        e.x = e.x + e.vx
        if e.x > largeur - imgEtoile:getWidth() then
            e.vx = -e.vx
        elseif e.x < 0 then
            e.vx = -e.vx
        end
    end
end

function love.draw()
    for k, v in ipairs(mesEtoiles) do
        love.graphics.draw(imgEtoile, v.x, v.y)
    end
end

function love.keypressed(key)
end
