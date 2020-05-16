--[[-- Commands Module - Quickbar
    - Adds a command that allows players to load Quickbar presets
    @commands LoadQuickbar
]]

local Commands = require 'expcore.commands' --- @dep expcore.commands
local Roles = require 'expcore.roles' --- @dep expcore.roles
local Game = require 'utils.game' --- @dep utils.game
local config = require 'config.preset_player_quickbar' --- @dep config.preset_player_quickbar
require 'config.expcore.command_general_parse'


--- Changes the amount of bonus you receive
-- @command bonus
-- @tparam number amount range 0-50 the percent increase for your bonus
Commands.new_command('load-quickbar','Loads your preset Quickbar items')
:register(function(player)
    if config.players[player.name] then
        local custom_quickbar = config.players[player.name]
        for i, item_name in ipairs(custom_quickbar) do
          player.set_quick_bar_slot(i, item_name)
        end
    else
        Commands.print('Quickbar preset not found','red')
    end
end)