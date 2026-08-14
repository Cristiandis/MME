SMODS.Consumable {
    key = "keybox",
    set = "Tarot",
    atlas = "placeholders",
    cost = 5,
    discovered = true,
    config = {
        extra = {
            seal = "mme_integrity"
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return { vars = { card.ability.max_highlighted, colours = { HEX("008000") } } }
    end,
    pos = { x = 1, y = 2 },
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 1
    end,
    use = function(self, card, area, copier)
        for i = 1, #G.hand.cards do
            local _card = G.hand.cards[i]
            _card:set_seal(card.ability.extra.seal)
        end
    end
}
