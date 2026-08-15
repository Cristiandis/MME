SMODS.Joker {
    key = "gaster",
    atlas = "bootloaders",
    pos = { x = 0, y = 1 },
    discovered = true,
    rarity = 1,
    cost = 7,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint and context.blind.boss then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if G.GAME.blind.name == "The Wheel" or G.GAME.blind.name == "The Serpent" or G.GAME.blind.name == "The Needle" or G.GAME.blind.name == "Verdant Leaf" or G.GAME.blind.name == "bl_mme_sp_flash_tool" then
                                G.GAME.blind:disable()
                                play_sound('timpani')
                                delay(0.4)
                                SMODS.calculate_effect(
                                    { message = localize('ph_boss_disabled'), font = "mme_WingDings", colour = G.C.GREEN },
                                    card)
                            end
                            return true
                        end
                    }))

                    return true
                end
            }))
            return nil, true
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            if G.GAME.blind.name == "The Wheel" or G.GAME.blind.name == "The Serpent" or G.GAME.blind.name == "The Needle" or G.GAME.blind.name == "Verdant Leaf" or G.GAME.blind.name == "bl_mme_sp_flash_tool" then
                G.GAME.blind:disable()
                play_sound('timpani')

                SMODS.calculate_effect(
                    { message = localize('ph_boss_disabled'), font = "mme_WingDings", colour = G.C.GREEN },
                    card)
            end
        end
    end
}

local function count_green()
    if not G.jokers then return 0 end
    local count = 0
    for i, j in ipairs(G.jokers.cards) do
        if not j.getting_sliced and not j.debuff then
            if j.config.center.key == "j_mme_gaster" then
                count = count + 1
            end

            if j.config.center.key == "j_blueprint" then
                local right = G.jokers.cards[i + 1]
                if right and right.config.center.key == "j_mme_gaster" then
                    count = count + 1
                end
            end

            if j.config.center.key == "j_brainstorm" then
                local leftmost = G.jokers.cards[1]
                if leftmost and leftmost.config.center.key == "j_mme_gaster" then
                    count = count + 1
                end
            end
        end
    end
    return count
end


SMODS.ScreenShader {
    key = "green_gaster",
    shader = "mme_green_overlay",
    should_apply = function(self)
        return count_green() > 0
    end,
    send_vars = function(self)
        return { green_count = count_green() }
    end
}
