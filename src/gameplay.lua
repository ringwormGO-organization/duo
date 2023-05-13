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

local function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

--------------------------------------

local function GenerateDeck()
    return {}
end

function gameplay.Gameplay()
    local tmp_input = "";
    local time = math.randomseed(os.time())
    
    local players = {}                              -- table containing players
    for i = 1, runtime.settings.players, 1 do
        players[i] = {}
    end

    local stacking = {}

    local cards = {}                                -- table containing deck
    cards = GenerateDeck()

    -- Print all cards
    if settings.debug_mode == 1 then
        print("Cards: ")

        for i = 1, runtime.available_card, 1 do
            io.write("" .. (settings.colors == 1 and "color" or "no color"));
        end
    end

    -- Deal the cards to players
    for i = 1, runtime.settings.players, 1 do
        if (tablelength(cards) < 7) then
            cards = GenerateDeck()
        end
        
        local random = 0;
        for j = 1, 7, 1 do
            random = math.random(0, runtime.available_card)
        end

    end

end

return gameplay
