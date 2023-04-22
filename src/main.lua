---
--- @author Andrej Bartulin
--- @author Stjepan Bilić Matišić
--- @PROJECT: duo (the game)
--- @LICENSE: ringwormGO General License 1.0 | (RGL) 2022
---

local function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
end

io.write("Enter config path (def.cfg): ");
local path = io.read();

--- If input is nil then load the def. cfg. file
if file_exists(path) == false then
    local cfg = "../def.cfg";
    io.write("=== No config. file found, using def.cfg\n\n");
    io.open(cfg, "r");
    io.input(cfg);
    print(io.read("*a"));
else
    io.open(path, "r");
    io.input(path);
    print(io.read("*a"));
end
