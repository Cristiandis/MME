--#region Atlases

SMODS.Atlas({
    key = "placeholders",
    path = "placeholders.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "bootloaders",
    path = "bootloaders.png",
    px = 71,
    py = 95
})

SMODS.Atlas {
    key = "boosters",
    path = "boosters.png",
    px = 71,
    py = 95
}


--#endregion

--#region assets

SMODS.Shader {
    key = "green_overlay",
    path = "green_overlay.fs"
}

SMODS.Font {
    key = "WingDings",
    path = "Wingdings-Regular.ttf",
}

--#endregion

--#region objects

SMODS.ObjectType {
    key = "Phones",
    cards = {
        ["j_mme_xiaomi"] = true,
        ["j_mme_samsung"] = true,
        ["j_mme_google"] = true,
        ["j_mme_huawei"] = true
    }
}

--#endregion

--#region File Loading

local UI = B_UI

assert(SMODS.load_file("src/items/videos.lua"))()

local jokers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers")

for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("src/jokers/" .. file))()
end

local seals_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/seals")

for _, file in ipairs(seals_src) do
    assert(SMODS.load_file("src/seals/" .. file))()
end

local consumables_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/consumables")

for _, file in ipairs(consumables_src) do
    assert(SMODS.load_file("src/consumables/" .. file))()
end

local blinds_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/blinds")

for _, file in ipairs(blinds_src) do
    assert(SMODS.load_file("src/blinds/" .. file))()
end

local vouchers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/vouchers")

for _, file in ipairs(vouchers_src) do
    assert(SMODS.load_file("src/vouchers/" .. file))()
end

local boosters_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/boosters")

for _, file in ipairs(boosters_src) do
    assert(SMODS.load_file("src/boosters/" .. file))()
end

local tags_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src/tags")

for _, file in ipairs(tags_src) do
    assert(SMODS.load_file("src/tags/" .. file))()
end

--#endregion
--#region Config Tabs

SMODS.current_mod.extra_tabs = function()
    return {
        {
            label = "Credits",
            tab_definition_function = function()
                return UI.jsx([[
        <root align="cm" padding="0.2">
            <col align="cm" padding="0.1">
                <row align="cm"><text scale="0.6" colour="{G.C.BLUE}">Credits</text></row>
                <row><spacer w="0.0" h="0.1" /></row>
                <row align="cm"><text scale="0.45" colour="{G.C.WHITE}">Yahiamice</text></row>
                <row align="cm"><text scale="0.35" colour="{G.C.GREY}">Code snippets from YahiMOD</text></row>
                <row><spacer w="0.0" h="0.3" /></row>
                <row align="cm"><text scale="0.45" colour="{G.C.WHITE}">xotgamez</text></row>
                <row align="cm"><text scale="0.35" colour="{G.C.GREY}">Gaster Joker Sprite</text></row>
            </col>
        </root>
        ]])
            end,
        },
    }
end


--#endregion
