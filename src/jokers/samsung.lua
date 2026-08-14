SMODS.Joker {
    key = "samsung",
    atlas = "placeholders",
    pos = { x = 2, y = 0 },
    discovered = true,
    rarity = 3,
    cost = 5,
    config = {
        extra = {
            dollar = 1,
            Xmult = 1.25,
            planet_card = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        local voucher_active = G.GAME and G.GAME.used_vouchers and G.GAME.used_vouchers['v_mme_boot_unlock']
        local status_text = voucher_active and 'Active' or 'Not Active'

        return { vars = { card.ability.extra.dollar, card.ability.extra.Xmult, card.ability.extra.planet_card, status_text } }
    end,
    calc_dollar_bonus = function(self, card)
        if G.GAME and G.GAME.used_vouchers and not G.GAME.used_vouchers["v_mme_boot_unlock"] then
            return card.ability.extra.dollar, {
                text = "Samsung Wallet"
            }
        end
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult,
            }
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if G.GAME and G.GAME.used_vouchers and G.GAME.used_vouchers["v_mme_boot_unlock"] then
                local target_limit = G.consumeables.config.card_limit + (G.GAME.consumeable_buffer or 0)
                if #G.consumeables.cards < target_limit then
                    G.GAME.consumeable_buffer = (G.GAME.consumeable_buffer or 0) + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = function()
                            if G.GAME.last_hand_played then
                                local _planet = nil
                                for _, planet_center in pairs(G.P_CENTER_POOLS.Planet) do
                                    if planet_center.config.hand_type == G.GAME.last_hand_played then
                                        _planet = planet_center.key
                                    end
                                end
                                if _planet then
                                    SMODS.add_card({ key = _planet })
                                end
                                G.GAME.consumeable_buffer = math.max(0, G.GAME.consumeable_buffer - 1)
                            end
                            return true
                        end
                    }))
                    return { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet }
                end
            end
        end
    end
}
