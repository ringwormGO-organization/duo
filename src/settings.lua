---
--- @author Andrej Bartulin
--- @author Stjepan Bilić Matišić
--- @PROJECT: duo (the game)
--- @LICENSE: ringwormGO General License 1.0 | (RGL) 2022
---

local vector = require("libraries.vector")
local json = require("libraries.dkjson")
local runtime = require("runtime")

local function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
end

local function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end
  

local settings = {}

function settings.Set(path)
    local content = ""

    --- If input is nil then load the def. cfg. file
    if file_exists(path) == false then
        local cfg = "../def.cfg";
        io.write("=== No config. file found, using def.cfg\n\n");
        io.open(cfg, "r");
        io.input(cfg);

        content = io.read("*a");
    else
        io.open(path, "r");
        io.input(path);

        content = io.read("*a");
    end

    local settings_table = json.decode(content)

    if (settings_table ~= nil) then
        runtime.points.m_points = settings_table.match_points
        runtime.points.p_path = settings_table.points_path

        runtime.settings.debug_mode = settings_table.debug_mode
        runtime.settings.colors = settings_table.colors
        runtime.settings.players = settings_table.players

        runtime.settings.special.progressive = settings_table.special[1].progressive
        runtime.settings.special.stacking = settings_table.special[1].stacking
        runtime.settings.special.swap_card = settings_table.special[1].swap_card
        runtime.settings.special.seven_o = settings_table.special[1].seven_o
        runtime.settings.special.jump_in = settings_table.special[1].jump_in

        for i = 1, runtime.settings.players, 1 do
            vector.push(runtime.settings.sequences, string.sub(settings_table.ai_sequence, i, i), string.sub(settings_table.network[1].network_sequence, i, i))
        end

        runtime.settings.network.ip = settings_table.network[1].ip
        runtime.settings.network.port = settings_table.network[1].port
    else
        print("Cannot read settings!")
    end
end

return settings
