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
            },
            j_mme_samsung = {
                name = "Samsung",
                text = {
                    {
                        "{C:mult}X#2#{} Mult",
                        "Earn {C:money}$#1#{} at",
                        "end of round",
                    },
                    {
                        "{C:edition}If bootloader is unlocked{}",
                        "{C:red}NO{} end of round {C:money}bonus money{}",
                        "Creates the {C:planet}Planet{} card",
                        "for final played {C:attention}poker hand{}",
                        "of round if {C:attention}held{} in hand",
                        "{C:inactive}(Must have room)",
                        "{C:blue}Status: {C:attention}#4#"
                    },
                }
            },
            j_mme_xiaomi = {
                name = "Xiaomi",
                text = {
                    {
                        "{C:green}#1#/#2#{} rounds to {C:edition}unlock the bootloader{}"
                    },
                    {
                        "{C:edition}If bootloader is unlocked{}",
                        "{C:mult}X#3#{} Mult",
                        "{C:green}#4# in #5#{} chance this",
                        "card is destroyed",
                        "at end of round",
                        "{C:blue}Status: {C:attention}#6#"
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
