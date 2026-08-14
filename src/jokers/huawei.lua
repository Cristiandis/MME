SMODS.Joker {
    key = "huawei",
    atlas = "bootloaders",
    pos = { x = 1, y = 0 },
    discovered = true,
    rarity = 3,
    cost = 5,
    pools = { ["Phones"] = true },
    config = {
        extra = {
            chips = 100,
            Xmult = 3,
            odds = 100
        }
    },
    loc_vars = function(self, info_queue, card)
        local odds_num, odds_den = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'mme_expire')

        local voucher_active = G.GAME and G.GAME.used_vouchers and G.GAME.used_vouchers['v_mme_boot_unlock']
        local status_text = voucher_active and 'Active' or 'Not Active'

        return { vars = { card.ability.extra.chips, card.ability.extra.Xmult, odds_num, odds_den, status_text } }
    end,
    calculate = function(self, card, context)
        local voucher_active = G.GAME and G.GAME.used_vouchers and G.GAME.used_vouchers['v_mme_boot_unlock']

        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if SMODS.has_enhancement(context.other_card, "m_steel") then
                return {
                    chips = card.ability.extra.chips,
                    card = context.blueprint_card or card
                }
            end
        end


        if context.joker_main then
            if voucher_active then
                return {
                    xmult = card.ability.extra.Xmult,
                }
            end
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if voucher_active then
                if SMODS.pseudorandom_probability(card, "mme_expire", 1, card.ability.extra.odds) then
                    card:start_dissolve(nil, nil)
                    return {
                        message = localize("k_extinct_ex")
                    }
                else
                    return {
                        message = localize("k_safe_ex")
                    }
                end
            end
        end
    end
}
