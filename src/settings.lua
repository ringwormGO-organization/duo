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

    local test = json.decode(content)

    if (test ~= nil and test.match_points ~= nil) then
        print(test.match_points)
    end
end

return settings
