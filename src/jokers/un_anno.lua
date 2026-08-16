SMODS.Joker {
    key = "un_anno",
    atlas = "bootloaders",
    pos = { x = 1, y = 1 },
    discovered = true,
    rarity = 1,
    cost = 5,
    config = {
        extra = {
            mult = 5,
            mult_gain = 5
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult, card.ability.extra.mult_gain
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and G.GAME.blind.boss and not context.repetition and not context.individual then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = localize("k_upgrade_ex")
            }
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}
