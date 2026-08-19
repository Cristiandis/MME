SMODS.Joker {
    key = "xiaomi",
    atlas = "bootloaders",
    pos = { x = 3, y = 0 },
    discovered = true,
    rarity = 3,
    cost = 5,
    pools = { ["Phones"] = true },
    config = {
        extra = {
            invis_rounds = 0,
            total_rounds = 7,
            Xmult = 10,
            odds = 10,
            triggered = false
        }
    },
    loc_vars = function(self, info_queue, card)
        local odds_num, odds_den = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'mme_expire')

        local voucher_active = G.GAME and G.GAME.used_vouchers and G.GAME.used_vouchers['v_mme_boot_unlock']
        local status_text = (voucher_active or card.ability.extra.triggered) and 'Active' or 'Not Active'

        return { vars = { card.ability.extra.invis_rounds, card.ability.extra.total_rounds, card.ability.extra.Xmult, odds_num, odds_den, status_text } }
    end,
    calculate = function(self, card, context)
        local voucher_active = G.GAME and G.GAME.used_vouchers and G.GAME.used_vouchers['v_mme_boot_unlock']

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if not card.ability.extra.triggered and not voucher_active then
                card.ability.extra.invis_rounds = card.ability.extra.invis_rounds + 1

                if card.ability.extra.invis_rounds >= card.ability.extra.total_rounds then
                    card.ability.extra.triggered = true
                    return {
                        message = "Unlocked!",
                        colour = G.C.FILTER
                    }
                end

                return {
                    message = card.ability.extra.invis_rounds .. '/' .. card.ability.extra.total_rounds,
                    colour = G.C.FILTER
                }
            end
        end


        if context.joker_main then
            if voucher_active or card.ability.extra.triggered then
                return {
                    xmult = card.ability.extra.Xmult,
                }
            end
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if voucher_active or card.ability.extra.triggered then
                if SMODS.pseudorandom_probability(card, "mme_expire", 1, card.ability.extra.odds) then
                    card:start_dissolve(nil, nil)
                    G.FUNCS.overlay_menu {
                        definition = create_UIBox_mme_custom_video1("hardbrick", "Womp Womp"),
                        config = { no_esc = true }
                    }
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
