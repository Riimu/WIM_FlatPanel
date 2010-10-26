-- Custom Skin handlers (In this situation, this must be declared before the skin table. If loaded after, it would not have a chance to load and an error would be thrown.)
local function formatDetails(window, guild, level, race, class)
    if(guild ~= "") then
	guild = "<" .. guild .. "> ";
    end
    return "|cffffffff" .. guild .. level .. " " .. race .. " " .. class .. "|r";
end

local imageDir = "Interface\\AddOns\\WIM_FlatPanel\\images\\";

--Default window skin
local WIM_FlatPanelSkin = {
    title = "Flat Panel",
    version = "1.0.1",
    author = "Rithiur",
    website = "http://www.wimaddon.com",
    message_window = {
        texture = imageDir .. "default\\message_window",
        min_width = 50,
        min_height = 116,
        backdrop = {
            top_left = {
                width = 48,
                height = 48,
                offset = {0, 0},
                texture_coord = {0, 0, 0, 3/8, 3/8, 0, 3/8, 3/8}
            },
            top_right = {
                width = 48,
                height = 48,
                offset = {0, 0},
                texture_coord = {5/8, 0, 5/8, 3/8, 1, 0, 1, 3/8}
            },
            bottom_left = {
                width = 48,
                height = 48,
                offset = {0, 0},
                texture_coord = {0, 5/8, 0, 1, 3/8, 5/8, 3/8, 1}
            },
            bottom_right = {
                width = 48,
                height = 48,
                offset = {0, 0},
                texture_coord = {5/8, 5/8, 5/8, 1, 1, 5/8, 1, 1}
            },
            top = {
                tile = false,
                texture_coord = {3/8, 0, 3/8, 3/8, 5/8, 0, 5/8, 3/8}
            },
            bottom = {
                tile = false,
                texture_coord = {3/8, 5/8, 3/8, 1, 5/8, 5/8, 5/8, 1}
            },
            left = {
                tile = false,
                texture_coord = {0, 3/8, 0, 5/8, 3/8, 3/8, 3/8, 5/8}
            },
            right = {
                tile = false,
                texture_coord = {5/8, 3/8, 5/8, 5/8, 1, 3/8, 1, 5/8}
            },
            background = {
                tile = false,
                texture_coord = {3/8, 3/8, 3/8, 5/8, 5/8, 3/8, 5/8, 5/8}
            }
        },
        widgets = {
            class_icon = {
                texture = imageDir .. "default\\class_icons",
                width = 16,
                height = 16,
                points = {
                    {"TOPLEFT", "window", "TOPLEFT", 0, 0}
                },
                is_round = false,
				
				warrior     = {  0,   0,   0, .25, .25,   0, .25, .25},
				paladin     = {.25,   0, .25, .25, .50,   0, .50, .25},
				hunter      = {.50,   0, .50, .25, .75,   0, .75, .25},
				rogue       = {.75,   0, .75, .25,   1,   0,   1, .25},
				
				priest      = {  0, .25,   0, .50, .25, .25, .25, .50},
				shaman      = {.25, .25, .25, .50, .50, .25, .50, .50},
				mage        = {.50, .25, .50, .50, .75, .25, .75, .50},
				warlock     = {.75, .25, .75, .50,   1, .25,   1, .50},

	            druid       = {  0, .50,   0, .75, .25, .50, .25, .75},
				blank       = {.25, .50, .25, .75, .50, .50, .50, .75},
				gm          = {.50, .50, .50, .75, .75, .50, .75, .75},
				deathknight = {.75, .50, .75, .75,   1, .50,   1, .75},
            },
            from = {
                points = {
                    {"TOPLEFT", "window", "TOPLEFT", 18, -1}
                },
                font = "GameFontNormal",
                font_color = "ffffff",
                font_height = 14,
                font_flags = "",
                use_class_color = true
            },
            char_info = {
                format = formatDetails,
                points = {
                    {"TOPRIGHT", "window", "TOPRIGHT", -19, -1}
                },
                font = "GameFontNormal",
                font_color = "ffffff"
            },
            close = {
                state_hide = {
                    NormalTexture = imageDir .. "default\\down",
                    PushedTexture = imageDir .. "default\\down",
                    HighlightTexture = imageDir .. "default\\down",
                    HighlightAlphaMode = "ADD"
                },
                state_close = {
                    NormalTexture = imageDir .. "default\\close",
                    PushedTexture = imageDir .. "default\\close",
                    HighlightTexture = imageDir .. "default\\close",
                    HighlightAlphaMode = "ADD"
                },
                width = 16,
                height = 16,
                points = {
                    {"TOPRIGHT", "window", "TOPRIGHT", 0, 0}
                }
            },
            history = {
                NormalTexture = imageDir .. "default\\history",
                PushedTexture = imageDir .. "default\\history",
                HighlightTexture = imageDir .. "default\\history",
                HighlightAlphaMode = "ADD",
                width = 16,
                height = 16,
                points = {
                    {"BOTTOMRIGHT", "window", "BOTTOMRIGHT", 0, 36}
                }
            },
            w2w = {
                NormalTexture = imageDir .. "default\\w2w",
                PushedTexture = imageDir .. "default\\w2w",
                HighlightTexture = imageDir .. "default\\w2w",
                HighlightAlphaMode = "ADD",
				width = 16,
				height = 16,
                points = {
                    {"BOTTOMRIGHT", "window", "BOTTOMRIGHT", 0, 52}
                }
            },
            chatting = {
                NormalTexture = imageDir .. "default\\typing",
                PushedTexture = imageDir .. "default\\typing",
                width = 16,
                height = 16,
                points = {
                    {"BOTTOMRIGHT", "window", "BOTTOMRIGHT", 0, 68}
                }
            },
            scroll_up = {
                NormalTexture = imageDir .. "default\\up",
                PushedTexture = imageDir .. "default\\up",
                HighlightTexture = imageDir .. "default\\up",
                DisabledTexture = imageDir .. "default\\up",
                HighlightAlphaMode = "ADD",
                width = 16,
                height = 16,
                points = {
                    {"TOPRIGHT", "window", "TOPRIGHT", 0, -17}
                }
            },
            scroll_down = {
                NormalTexture = imageDir .. "default\\down",
                PushedTexture = imageDir .. "default\\down",
                HighlightTexture = imageDir .. "default\\down",
                DisabledTexture = imageDir .. "default\\down",
                HighlightAlphaMode = "ADD",
                width = 16,
                height = 16,
                points = {
                    {"BOTTOMRIGHT", "window", "BOTTOMRIGHT", 0, 17}
                }
            },
            chat_display = {
                points = {
                    {"TOPLEFT", "window", "TOPLEFT", 0, -17},
                    {"BOTTOMRIGHT", "window", "BOTTOMRIGHT", -17, 17}
                },
                font = "ChatFontNormal"
            },
            msg_box = {
                font = "ChatFontNormal",
                font_height = 14,
                font_color = {1,1,1},
                points = {
                    {"TOPLEFT", "window", "BOTTOMLEFT", 0, 16},
                    {"BOTTOMRIGHT", "window", "BOTTOMRIGHT", 0, 0}
                },
            },
            resize = {
                NormalTexture = imageDir .. "default\\resize",
                width = 16,
                height = 16,
                points = {
                    {"BOTTOMRIGHT", "window", "BOTTOMRIGHT", 0, 0}
                }
            },
            shortcuts = {
                stack = "DOWN",
                spacing = 0,
                points = {
                    {"TOPLEFT", "window", "TOPRIGHT", -16, -36},
					{"BOTTOMRIGHT", "window", "BOTTOMRIGHT", 0, 84}
                },
                buttons = {
                    NormalTexture = "Interface\\AddOns\\"..WIM.addonTocName.."\\Skins\\Default\\shortcuts_frame",
                    PushedTexture = "Interface\\Buttons\\UI-Quickslot-Depress",
                    HighlightTexture = "Interface\\Buttons\\ButtonHilight-Square",
                    HighlightAlphaMode = "ADD",
                    icons = {
                        location = "Interface\\Icons\\Ability_TownWatch",
                        invite = "Interface\\Icons\\Spell_Holy_BlessingOfStrength",
                        friend = "Interface\\Icons\\INV_Misc_GroupNeedMore",
                        ignore = "Interface\\Icons\\Ability_Physical_Taunt",
                    }
                }
            }
        },
    },
};

----------------------------------------------------------
--                  Register Skin                       --
----------------------------------------------------------

WIM.RegisterSkin(WIM_FlatPanelSkin);
