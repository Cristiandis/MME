SMODS.Joker {
    key = "gaster",
    atlas = "bootloaders",
    pos = { x = 0, y = 1 },
    discovered = true,
    rarity = 1,
    cost = 7,
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
