SMODS.Atlas {
    key = "mcdonalds",
    path = "mcdonalds.png",
    px = 34,
    py = 34
}

SMODS.Blind {
    key = "mcdonalds",
    mult = 2,
    dollars = 12,
    atlas = "mcdonalds",
    pos = { x = 0, y = 0 },
    boss_colour = HEX("febd11"),
    boss = { min = 4 },
    discovered = true,
    calculate = function(self, blind, context)
        if context.individual and context.cardarea == G.play and context.other_card.seal ~= "mme_integrity" then
            local card_chips = context.other_card:get_chip_bonus()
            return {
                chips = -math.ceil(card_chips * 0.5),
            }
        end
    end
}
