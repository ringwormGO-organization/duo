---
--- @author Andrej Bartulin
--- @author Stjepan Bilić Matišić
--- @PROJECT: duo (the game)
--- @LICENSE: ringwormGO General License 1.0 | (RGL) 2022
---

local gameplay = require("gameplay")
local settings = require("settings")

io.write("Enter config path (def.cfg): ");
local path = io.read();

settings.Set(path)
gameplay.Gameplay()
