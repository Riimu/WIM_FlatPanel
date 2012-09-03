local function formatDetails (window, guild, level, race, class)
    if(guild ~= "") then
		guild = "<" .. guild .. "> ";
    end
	
	local shorted = false;
	
	-- Abbreviate, if abbreviations exist
	if (WIM_FlatPanel_Abbreviations) then		
		if (WIM_FlatPanel_Abbreviations["race"][race]) then
			race = WIM_FlatPanel_Abbreviations["race"][race];
			shorted = true;
		end
		if (WIM_FlatPanel_Abbreviations["class"][class]) then
			class = WIM_FlatPanel_Abbreviations["class"][class];
			shorted = true;
		end
	end
	
	if (shorted) then
		return "|cffffffff" .. guild .. level .. " " .. race .. "/" .. class .. "|r";
	else
	    return "|cffffffff" .. guild .. level .. " " .. race .. " " .. class .. "|r";
	end
end

local imageDir = "Interface\\AddOns\\WIM_FlatPanel\\images\\";
local defaultSkin = "default";
local defaultSkinDir = imageDir .. defaultSkin .. "\\";

local defaultTextures = {
	["icons\\scroll_up"] = {
		disabled = ""
	},
	["icons\\scroll_down"] = {
		disabled = ""
	},
	["icons\\prev"] = {
		disabled = ""
	},
	["icons\\next"] = {
		disabled = ""
	},
	["buttons"] = "",
};

local function getTexture (name, state, textures, skinDir, isDefault)
	if (textures and textures[name]) then
		if (type(textures[name]) == "table" and state and textures[name][state]) then
			if (type(textures[name][state]) == "string") then
				if (textures[name][state] == "") then
					return "";
				else
					return skinDir .. textures[name][state];
				end
			else
				return skinDir .. name .. "_" .. state;
			end
		elseif (type(textures[name]) == "string") then
			if (textures[name] == "") then
				return "";
			else
				return skinDir .. textures[name];
			end
		else		
			return skinDir .. name;
		end
	elseif (not isDefault) then
		return getTexture(name, state, defaultTextures, defaultSkinDir, true);
	else
		return defaultSkinDir .. name;
	end
end

local function getSkin (name, dir, textures)
	local skin = imageDir .. dir .. "\\";
	
	return {
		title = name,
		version = "2.1",
		author = "Rinuwise",
		website = "http://www.rinuwise.com",
		message_window = {
			texture = getTexture("message_window", "default", textures, skin),
			min_width = 150,
			min_height = 173,
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
					texture = getTexture("class_icons", "default", textures, skin),
					width = 16,
					height = 16,
					points = {
						{"TOPLEFT", "window", "TOPLEFT", 1, -1}
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
					
					monk        = {  0, .75,   0,   1, .25, .75, .25,   1},
				},
				from = {
					points = {
						{"TOPLEFT", "window", "TOPLEFT", 20, -3}
					},
					font = "SystemFont_Small",
					font_color = "ffffff",
					font_height = 11,
					font_flags = "",
					use_class_color = true
				},
				char_info = {
					format = formatDetails,
					points = {
						{"TOPRIGHT", "window", "TOPRIGHT", -20, -3}
					},
					font = "SystemFont_Small",
					font_color = "ffffff",
					font_height = 11
				},
				close = {
					state_hide = {
						NormalTexture = getTexture("icons\\hide", "normal", textures, skin),
						PushedTexture = getTexture("icons\\hide", "pushed", textures, skin),
						HighlightTexture = getTexture("icons\\hide", "highlight", textures, skin),
						HighlightAlphaMode = "ADD"
					},
					state_close = {
						NormalTexture = getTexture("icons\\close", "normal", textures, skin),
						PushedTexture = getTexture("icons\\close", "pushed", textures, skin),
						HighlightTexture = getTexture("icons\\close", "highlight", textures, skin),
						HighlightAlphaMode = "ADD"
					},
					width = 16,
					height = 16,
					points = {
						{"TOPRIGHT", "window", "TOPRIGHT", -1, -1}
					}
				},
				history = {
					NormalTexture = getTexture("icons\\history", "normal", textures, skin),
					PushedTexture = getTexture("icons\\history", "pushed", textures, skin),
					HighlightTexture = getTexture("icons\\history", "highlight", textures, skin),
					HighlightAlphaMode = "ADD",
					width = 16,
					height = 16,
					points = {
						{"BOTTOMRIGHT", "window", "BOTTOMRIGHT", -1, 36}
					}
				},
				w2w = {
					NormalTexture = getTexture("icons\\w2w", "normal", textures, skin),
					PushedTexture = getTexture("icons\\w2w", "pushed", textures, skin),
					HighlightTexture = getTexture("icons\\w2w", "highlight", textures, skin),
					HighlightAlphaMode = "ADD",
					width = 16,
					height = 16,
					points = {
						{"BOTTOMRIGHT", "window", "BOTTOMRIGHT", -1, 53}
					}
				},
				chatting = {
					NormalTexture = getTexture("icons\\chatting", "normal", textures, skin),
					PushedTexture = getTexture("icons\\chatting", "pushed", textures, skin),
					width = 16,
					height = 16,
					points = {
						{"BOTTOMRIGHT", "window", "BOTTOMRIGHT", -18, 18}
					}
				},
				scroll_up = {
					NormalTexture = getTexture("icons\\scroll_up", "normal", textures, skin),
					PushedTexture = getTexture("icons\\scroll_up", "pushed", textures, skin),
					HighlightTexture = getTexture("icons\\scroll_up", "highlight", textures, skin),
					DisabledTexture = getTexture("icons\\scroll_up", "disabled", textures, skin),
					HighlightAlphaMode = "ADD",
					width = 16,
					height = 16,
					points = {
						{"TOPRIGHT", "window", "TOPRIGHT", -1, -18}
					}
				},
				scroll_down = {
					NormalTexture = getTexture("icons\\scroll_down", "normal", textures, skin),
					PushedTexture = getTexture("icons\\scroll_down", "pushed", textures, skin),
					HighlightTexture = getTexture("icons\\scroll_down", "highlight", textures, skin),
					DisabledTexture = getTexture("icons\\scroll_down", "disabled", textures, skin),
					HighlightAlphaMode = "ADD",
					width = 16,
					height = 16,
					points = {
						{"BOTTOMRIGHT", "window", "BOTTOMRIGHT", -1, 18}
					}
				},
				chat_display = {
					points = {
						{"TOPLEFT", "window", "TOPLEFT", 2, -20},
						{"BOTTOMRIGHT", "window", "BOTTOMRIGHT", -20, 20}
					},
					font = "FriendsFont_UserText",
					font_height = 12,
					font_flags = "",
				},
				msg_box = {
					font = "FriendsFont_UserText",
					font_height = 14,
					font_color = {1,1,1},
					points = {
						{"TOPLEFT", "window", "BOTTOMLEFT", 1, 17},
						{"BOTTOMRIGHT", "window", "BOTTOMRIGHT", -1, 1}
					},
				},
				resize = {
					NormalTexture = getTexture("icons\\resize", "normal", textures, skin),
					width = 16,
					height = 16,
					points = {
						{"BOTTOMLEFT", "window", "BOTTOMRIGHT", 0, 1}
					}
				},
				shortcuts = {
					stack = "DOWN",
					spacing = 1,
					points = {
						{"TOPLEFT", "window", "TOPRIGHT", -17, -36},
						{"BOTTOMRIGHT", "window", "TOPRIGHT", -1, -103}
					},
					buttons = {
						NormalTexture = getTexture("buttons", "normal", textures, skin),
						PushedTexture = getTexture("buttons", "pushed", textures, skin),
						HighlightTexture = getTexture("buttons", "highlight", textures, skin),
						HighlightAlphaMode = "ADD",
						icons = {
							location = getTexture("icons\\location", "default", textures, skin),
							invite = getTexture("icons\\invite", "default", textures, skin),
							friend = getTexture("icons\\friend", "default", textures, skin),
							ignore = getTexture("icons\\ignore", "default", textures, skin),
						}
					}
				}
			},
		},
		tab_strip = {
			textures = {
				tab = {
					NormalTexture = getTexture("tab", "normal", textures, skin),
					PushedTexture = getTexture("tab", "pushed", textures, skin),
					HighlightTexture = getTexture("tab", "highlight", textures, skin),
					HighlightAlphaMode = "ADD"
				},
				prev = {
					NormalTexture = getTexture("icons\\prev", "normal", textures, skin),
					PushedTexture = getTexture("icons\\prev", "pushed", textures, skin),
					HighlightTexture = getTexture("icons\\prev", "highlight", textures, skin),
					DisabledTexture = getTexture("icons\\prev", "disabled", textures, skin),
					HighlightAlphaMode = "ADD",
					height = 16,
					width = 16,
				},
				next = {
					NormalTexture = getTexture("icons\\next", "normal", textures, skin),
					PushedTexture = getTexture("icons\\next", "pushed", textures, skin),
					HighlightTexture = getTexture("icons\\next", "highlight", textures, skin),
					DisabledTexture = getTexture("icons\\next", "disabled", textures, skin),
					HighlightAlphaMode = "ADD",
					height = 16,
					width = 16,
				},
			},
			height = 20,
			points = {
				{"BOTTOMLEFT", "window", "TOPLEFT", 16, 2},
				{"BOTTOMRIGHT", "window", "TOPRIGHT", -16, 2}
			},
			text = {
				font = "SystemFont_Small",
				font_color = {1, 1, 1},
				font_height = 11,
				font_flags = ""
			},
			vertical = false,
		},
	};
end

----------------------------------------------------------
--                  Register Skin                       --
----------------------------------------------------------

WIM.RegisterSkin(getSkin("Flat Panel", "default"));
WIM.RegisterSkin(getSkin("Flat Panel - Grey", "grey", { message_window = true }));
