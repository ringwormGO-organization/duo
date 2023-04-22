---
--- @author Andrej Bartulin
--- @author Stjepan Bilić Matišić
--- @PROJECT: duo (the game)
--- @LICENSE: ringwormGO General License 1.0 | (RGL) 2022
---

--- Networking will be added in version 2.0.0

local vector = require("vector")

local runtime = {}

--- Player data
runtime.player = {}
runtime.player.cards = vector.new() -- card number and color

--- Stack holding info.
runtime.stack = {}
runtime.stack.hap = false;          -- is stack happening?
runtime.stack.num = 0;              -- card number
runtime.stack.noc = 0;              -- number of cards

--- In-game points
runtime.points = {}
runtime.player.p_path = ".points.8b911a8716b94442f9ca3dff20584048536e4c2f47b8b5bb9096cbd43c3432d5";
runtime.player.temp_pnt = 0;        -- round points
runtime.player.m_points = 0;        -- num. of pnts. to win
runtime.player.roun_win = 0;        -- player id of the winner
runtime.points.match_end = false;   -- has the match ended?
runtime.points.created = false;     -- .points.file created?

--- Settings
runtime.settings = {}


return runtime
