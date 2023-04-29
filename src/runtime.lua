---
--- @author Andrej Bartulin
--- @author Stjepan Bilić Matišić
--- @PROJECT: duo (the game)
--- @LICENSE: ringwormGO General License 1.0 | (RGL) 2022
---

--- Networking will be added in version 2.0.0

local vector = require("libraries.vector")
local runtime = {}

--- Player data
runtime.player = {
    cards = vector.vec                  -- card number and color
}

--- Stack holding info.
runtime.stack = {
    hap = false,                        -- is stack happening?
    num = 0,                            -- card number
    noc = 40,                           -- number of cards
}

--- In-game points
runtime.points = {
    p_path = "points.8b911a8716b9",     -- path of file where points are stored
    temp_pnt = 0,                       -- round points
    m_points = 0,                       -- num. of pnts. to win
    round_win = 0,                      -- player id of the winner
    match_end = false,                  -- has the match ended?
    created = false,                    -- .points.file created?
}

runtime.runtime = {
    available_card = 0,
    current_c_id = 0,
    player_turn = 0,
    is_positive = false,
    top_card = {},
}

--- Settings
runtime.settings = {
    debug_mode = 0,                     -- is debug mode active?
    colors = 0,                         -- are colors active?
    players = 0,                        -- number of players
    special = {                         -- special rules
        swap_card = 0,                      -- is swap card available?
        stacking = 0,                       -- is stackingt available?
        seven_o = 0,                        -- is seven_o rule available?
    },
    sequences = vector.vec,             -- AI & network sequence
    network = {                         -- network settings
        ip = "127.0.0.1",                   -- IP address
        port = 5956,                        -- port
    },
}

return runtime
