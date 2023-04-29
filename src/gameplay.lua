---
--- @author Andrej Bartulin
--- @author Stjepan Bilić Matišić
--- @PROJECT: duo (the game)
--- @LICENSE: ringwormGO General License 1.0 | (RGL) 2022
---

local vector = require("libraries.vector")
local runtime = require("runtime")
local settings = require("settings")

local gameplay = {}

function gameplay.Gameplay()
    local tmp_input = "";
    local time = math.randomseed(os.time())
    local players = {};

    local stacking = {};

    if settings.debug_mode == 1 then
        for i = 1, runtime.runtime.available_card, 1
        do
            io.write("" .. (settings.colors == 1 and "color" or "no color"));
        end
    end

    for i = 1, players, 1
    do
        io.write("");
    end

end

return gameplay
