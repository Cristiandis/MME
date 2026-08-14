SMODS.Joker {
    key = "paypal_mod",
    atlas = "bootloaders",
    pos = { x = 5, y = 0 },
    cost = 2,
    rarity = 2,
    blueprint_compat = false,
    discovered = true,
    config = {
        extra = {
            dollars = 25,
            odds = 4
        }
    },
    loc_vars = function(self, info_queue, card)
        local odds_num, odds_den = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'mme_expire')

        return {
            vars = {
                card.ability.extra.dollars,
                odds_num,
                odds_den
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if SMODS.pseudorandom_probability(card, "mme_expire", 1, card.ability.extra.odds) then
                if G.GAME.dollars ~= 0 then
                    ease_dollars(-G.GAME.dollars, true)
                end
                return {
                    message = "Patched!",
                    colour = G.C.RED
                }
            else
                return {
                    dollars = card.ability.extra.dollars,
                    message = "100% Real",
                    colour = G.C.BLUE
                }
            end
        end
    end
}
