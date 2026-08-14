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

--#endregion
