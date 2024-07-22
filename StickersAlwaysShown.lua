G.F_NO_ACHIEVEMENTS = false

local CardDrawRef = Card.draw
function Card:draw(layer)
    if (self.ability.set == 'Joker' and G.STAGE == 2) then
        if (self.facing == 'front') then
            self.sticker = GetSticker(self)
        end
        if (self.facing == 'back') then
            self.sticker = nil
        end
    end
    local t = CardDrawRef(self, layer)
    return (t)
end

function GetSticker(card)
    if (card.sticker) then return card.sticker end
        local center = card.config.center
        local sticker = get_joker_win_sticker(center)
        return sticker
end

local win_gameRef = win_game
function win_game()
    local t = win_gameRef()
    for k, v in ipairs(G.jokers.cards) do
        v.sticker = nil
    end
    return (t)
end