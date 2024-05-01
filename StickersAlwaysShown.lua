--- STEAMODDED HEADER
--- MOD_NAME: Stickers Always Shown 🃏
--- MOD_ID: StickersAlwaysShown
--- MOD_AUTHOR: [SirMaiquis]
--- MOD_DESCRIPTION: The jokers stickers are always shown!

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.StickersAlwaysShown()
    --- Enable achivements, you can comment it if you dont want them.
    G.F_NO_ACHIEVEMENTS = false
end

local CardDrawRef = Card.draw
function Card:draw(layer)
    if(self.ability.set == 'Joker' and G.STAGE == 2 and self.facing == 'front' ) then

        local center = getCenterKeyByJokerName(self.ability.name)
        local sticker = get_joker_win_sticker(center)
        self.sticker = sticker
    end
    local t = CardDrawRef(self, layer)
   
    return(t)
end

function getCenterKeyByJokerName(name)
    for key, joker in pairs(G.P_CENTERS) do
        if joker.name == name then
            return joker
        end
    end
    return nil
end

----------------------------------------------
------------MOD CODE END----------------------