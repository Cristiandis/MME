SMODS.Booster {
    key = "unieuro",
    atlas = "boosters",
    pos = { x = 0, y = 0 },
    cost = 5,
    discovered = true,
    config = {
        extra = 2,
        choose = 1
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra,
                card.ability.choose
            }
        }
    end,
    weight = 1,
    kind = "PhonePack",
    create_card = function(self, card, i)
        ease_background_colour(HEX("0d1d41"))
        return SMODS.create_card({
            set = "Phones",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false
        })
    end,
    select_card = "jokers",

    in_pool = function() return true end
}
