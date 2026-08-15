return {
    descriptions = {
        Other = {
            mme_integrity_seal = {
                name = "Play Integrity",
                text = {
                    "Does nothing"
                }
            },
            p_mme_unieuro = {
                name = "Unieuro Booster Pack",
                text = {
                    "Pick {C:attention}#1#{} card out",
                    "of {C:attention}#2#{} Phone Jokers"
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
            },
            bl_mme_sp_flash_tool = {
                name = "SP Flash Tool",
                text = { "{C:red}Locks bootloader{}",
                    "All cards without Integrity Seal",
                    "are debuffed"
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
            },
            j_mme_google = {
                name = "Google",
                text = {
                    {
                        "{C:mult}+#1# mult{} when {C:attention}scoring card{} has no enhancement"
                    },
                    {
                        "{C:edition}If bootloader is unlocked{}",
                        "{C:attention}Gains{} a random power every round",
                        "{C:disabled}Current power:{}",
                        "#3#",
                        "{C:blue}Status: {C:attention}#2#"
                    },
                }
            },
            j_mme_paypal_mod = {
                name = "PayPal Mod APK",
                text = {
                    "Gives {C:money}#1#${} at the end of every round",
                    "{C:green}#2# in #3#{} chance to",
                    "set money to {C:red}0${}",
                }
            },
            j_mme_gaster = {
                name = "{X:green}Gaster{}",
                text = {
                    "{C:green}Makes the game{} {X:green}25%{} {C:green}more green{}"
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
