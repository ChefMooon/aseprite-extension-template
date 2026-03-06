-- Aseprite Extension Template
-- Main initialization file for the extension
-- This file is called when the extension is loaded by Aseprite

function init(plugin)

    -- "plugin.preferences" as a table with fields for the plugin
    -- (these fields are saved between sessions)
    if plugin.preferences.count == nil then
        plugin.preferences.count = 0
    end

    plugin:newCommand{
        id="template_command",
        title="Template Command",
        group="sprite_properties",
        onclick=function()
        end
    }
end