---
--- @author Andrej Bartulin
--- @author Stjepan Bilić Matišić
--- @PROJECT: duo (the game)
--- @LICENSE: ringwormGO General License 1.0 | (RGL) 2022
---

local vector = {}

vector.vec = {
    a = {},
    b = {},
}

function vector.push(vec, a, b)
    table.insert(vec.a, a)
    table.insert(vec.b, b)
end

function vector.erase(vec, a, b, id)
    
end

return vector
