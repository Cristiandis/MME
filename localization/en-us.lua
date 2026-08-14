return {
    descriptions = {
        Other = {
            mme_integrity_seal = {
                name = "Play Integrity",
                text = {
                    "Does nothing"
                }
            }
        },
        Tarot = {
            c_mme_keybox = {
                name = "Keybox",
                text = {
                    "Adds a {V:1}Integrity Seal{}",
                    "to all cards held in hand"
                }
            }
        },
        Blind = {
            bl_mme_mcdonalds = {
                name = "McDonald's App",
                text = {
                    "Cards without Integrity Seal",
                    "Score {C:attention}half{} {X:chips}chips{}"
                }
            }
        },
        Voucher = {
            v_mme_boot_unlock = {
                name = "Bootloader Unlock",
                text = {
                    "Unlocks the bootloader of {C:red}phone jokers{}",
                    "{C:edition}(extra effects){}"
                }
            }
        },
        Joker = {
            j_mme_huawei = {
                name = "Huawei",
                text = {
                    {
                        "{C:chips}+#1# chips{} per {C:attention}Steel Card{}"
                    },
                    {
                        "{C:edition}If bootloader is unlocked{}",
                        "{C:mult}X#2#{} Mult",
                        "{C:green}#3# in #4#{} chance this",
                        "card is destroyed",
                        "at end of round",
                        "{C:blue}Status: {C:attention}#5#"
                    },
                }
            }
        }
    },
    misc = {
        labels = {
            mme_integrity_seal = "Integrity"
        },
        dictionary = {
            bl_mcdonalds_msg = "Halved!"
        }
    }
}
