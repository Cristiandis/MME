SMODS.Atlas {
    key = "spft",
    path = "spft.png",
    px = 34,
    py = 34
}

SMODS.Blind {
    key = "sp_flash_tool",
    mult = 2,
    dollars = 8,
    atlas = "spft",
    pos = { x = 0, y = 0 },
    boss_colour = HEX("109520"),
    boss = { showdown = true },
    discovered = true,
    recalc_debuff = function(self, card, from_blind)
        local is_playing_card = card.area == G.hand
            or card.area == G.play
            or card.area == G.deck
            or card.area == G.discard

        if not is_playing_card then return false end
        return card.seal ~= "mme_integrity"
    end,
    drawn_to_hand = function(self)
        if G.GAME.used_vouchers and G.GAME.used_vouchers["v_mme_boot_unlock"] then
            G.GAME.used_vouchers["v_mme_boot_unlock"] = nil
        end
    end
}
