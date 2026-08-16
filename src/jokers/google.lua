SMODS.Joker {
    key = "google",
    atlas = "bootloaders",
    pos = { x = 0, y = 0 },
    discovered = true,
    rarity = 3,
    cost = 5,
    pools = { ["Phones"] = true },
    config = {
        extra = {
            mult = 20,
            Xmult = 1.5,
            extra_tarot = 1,
            dollars = 2,
            power = "xmult",
        }
    },
    loc_vars = function(self, info_queue, card)
        local voucher_active = G.GAME and G.GAME.used_vouchers and G.GAME.used_vouchers['v_mme_boot_unlock']
        local status_text = voucher_active and 'Active' or 'Not Active'
        local power_text
        if card.ability.extra.power == "xmult" then
            power_text = "X" .. card.ability.extra.Xmult .. " Mult"
        elseif card.ability.extra.power == "tarot" then
            power_text = "+" .. card.ability.extra.extra_tarot .. " Tarot card at the end of round"
        elseif card.ability.extra.power == "dollars" then
            power_text = "+" .. card.ability.extra.dollars .. "$ at the end of round"
        elseif card.ability.extra.power == "destroy" then
            power_text = "Destroys card with the least rank in scoring hand"
        end

        return { vars = { card.ability.extra.mult, status_text, power_text } }
    end,
    calculate = function(self, card, context)
        local voucher_active = G.GAME and G.GAME.used_vouchers and G.GAME.used_vouchers['v_mme_boot_unlock']

        if context.setting_blind then
            if voucher_active then
                local powers = { "xmult", "tarot", "dollars", "destroy" }
                card.ability.extra.power = pseudorandom_element(powers, "mme_google_power")
            end
        end

        if context.individual and context.cardarea == G.play then
            if not context.other_card.ability.enhancement then
                return {
                    mult = card.ability.extra.mult,
                    card = context.blueprint_card or card
                }
            end
        end

        if context.joker_main and card.ability.extra.power == "xmult" then
            if voucher_active then
                return {
                    xmult = card.ability.extra.Xmult,
                    card = context.blueprint_card or card
                }
            end
        end

        if context.after and card.ability.extra.power == "destroy" then
            if voucher_active then
                local lowest, lowest_val
                for _, c in ipairs(context.scoring_hand or context.full_hand or {}) do
                    local val = c:get_id()
                    if not lowest_val or val < lowest_val then
                        lowest, lowest_val = c, val
                    end
                end
                if lowest then
                    for i, c in ipairs(context.scoring_hand) do
                        if c == lowest then
                            table.remove(context.scoring_hand, i)
                            break
                        end
                    end

                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.2,
                        func = function()
                            lowest:start_dissolve(nil, true)
                            G.hand:remove_card(lowest)
                            lowest:remove()
                            return true
                        end
                    }))
                end
                return
            end
        end

        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if voucher_active then
                if card.ability.extra.power == "tarot" then
                    local target_limit = G.consumeables.config.card_limit + (G.GAME.consumeable_buffer or 0)
                    if #G.consumeables.cards < target_limit then
                        G.GAME.consumeable_buffer = (G.GAME.consumeable_buffer or 0) + 1
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = function()
                                SMODS.add_card({ set = "Tarot" })
                                G.GAME.consumeable_buffer = math.max(0, G.GAME.consumeable_buffer - 1)
                                return true
                            end
                        }))
                        return { message = localize('k_plus_tarot'), colour = G.C.SECONDARY_SET.Tarot }
                    end
                end
                if card.ability.extra.power == "dollars" then
                    return {
                        dollars = card.ability.extra.dollars,
                        card = context.blueprint or card
                    }
                end
            end
        end
    end
}
