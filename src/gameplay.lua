---
--- @author Andrej Bartulin
--- @author Stjepan Bilić Matišić
--- @PROJECT: duo (the game)
--- @LICENSE: ringwormGO General License 1.0 | (RGL) 2022
---

local runtime = require("runtime")
local settings = require("settings")
local strings = require("strings")
local vector = require("libraries.vector")

local gameplay = {}

local function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

--------------------------------------

local card_number = 0

local function sizeof_table(table)
    local c = 0;
    for _ in pairs(table) do c = c + 1 end
    return c;
end

local function GetNumber()
    card_number = card_number + 1
    return card_number
end

local function GetColor(num)
    if num == 13 or num == 14 then
        return 0
    else
        math.random(1,4);
    end
end

local function GenerateDeck()
    local ret = {}

    --- 10 - skip
    --- 11 - reverse
    --- 12 - +2
    --- 13 - change color
    --- 14 - +4
    --- 15 - swap (if enabled)
    local cards = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14}

    --- 0 - for change color, +4 and swap card
    --- 1 - red
    --- 2 - yellow
    --- 3 - green
    --- 4 - blue
    local color = {0,1,2,3,4}

    local num = 108
    local i = 1

    -- swap card
    if (runtime.settings.special.swap_card == 1) then
        num = 109
        i = 2

        ret[1] = {
            number = 15,
            color = 0,
        }
    end

    runtime.runtime.available_card = num

    -- +4 cards
    for x = i, (i + 3), 1 do
        ret[x] = {
            number = 14,
            color = 0,
        }
    end

    i = i + 4;

    -- change color cards
    for x = i, (i + 3), 1 do
        ret[x] = {
            number = 13,
            color = 0,
        }
    end

    i = i + 4

    -- zero cards
    for y = 1, 4, 1 do
        ret[i] = {
            number = 0,
            color = y,
        }

        i = i + 1
    end

    -- red cards
    for y = 1, 2, 1 do
        for x = i, (i + 11), 1 do
            ret[x] = {
                number = GetNumber(),
                color = 1,
            }
        end

        card_number = 0
        i = i + 12
    end

    -- yellow cards
    for y = 1, 2, 1 do
        for x = i, (i + 11), 1 do
            ret[x] = {
                number = GetNumber(),
                color = 2,
            }
        end

        card_number = 0
        i = i + 12
    end

    -- green cards
    for y = 1, 2, 1 do
        for x = i, (i + 11), 1 do
            ret[x] = {
                number = GetNumber(),
                color = 3,
            }
        end

        card_number = 0
        i = i + 12
    end

    -- blue cards
    for y = 1, 2, 1 do
        for x = i, (i + 11), 1 do
            ret[x] = {
                number = GetNumber(),
                color = 4,
            }
        end

        card_number = 0
        i = i + 12
    end

    return ret
end

local function readInput()
    return coroutine.yield()
end

local inputCoroutine = coroutine.create(readInput)

function gameplay.Gameplay()
    local players = {}
    local deck = {}

    deck = GenerateDeck();

    for i = 1, runtime.settings.players, 1 do
        for j = 1, math.random(5, 8), 1 do
            
            if (runtime.runtime.available_card < 8) then
                deck = GenerateDeck();
            end

            players[i] = {
                number = math.random(1, runtime.runtime.available_card),
            }
            players[i].color = GetColor(players[i].number)

            runtime.runtime.available_card = runtime.runtime.available_card - 1
            table.remove(deck, players[i].number)
        end
    end

    -- Top card
    local id = math.random(1, runtime.runtime.available_card)
    runtime.runtime.top_card.number = deck[id].number
    runtime.runtime.top_card.color = deck[id].color

    runtime.runtime.available_card = runtime.runtime.available_card - 1
    table.remove(deck, id)
    
    -- Game loop
    local game_ended = false
    local is_new = false

    -- NEED TO FIX INPUT
    print("Enter your input:")
    local tinput = io.read();
end

return gameplay
