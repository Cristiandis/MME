SMODS.Atlas {
    key = "video",
    path = "video.png",
    px = 34,
    py = 34
}

SMODS.Tag {
    key = "rand_vid",
    atlas = "video",
    pos = { x = 0, y = 0 },
    discovered = true,
    config = {
        extra = {
            video_options = { "xbox_live", "superbowl", "bad_apple", "macarena", "mcflurry", "balatro", "pizzeria", "family_guy", "golf", "goku", "google", "death", "pigeon", "undertale", "fuckyou", "horses", "slap", "bitch" },
            dollars = 5
        }
    },
    loc_vars = function(self, info_queue, tag)
        return {
            vars = { tag.config.extra.dollars }
        }
    end,
    apply = function(self, tag, context)
        local options = tag.config.extra.video_options
        local chosen_video = options[math.random(1, #options)]

        tag:yep('+', G.C.DARK_EDITION, print())

        G.FUNCS.overlay_menu {
            definition = create_UIBox_custom_video1(chosen_video, "Skip AD"),
            config = { no_esc = true }
        }

        tag.triggered = true

        ease_dollars(tag.config.extra.dollars)
        return true
    end,
}
