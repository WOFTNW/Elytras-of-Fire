#> eof:load/gen/teams
#
# Generates Elytras of Fire teams.

#region
    # Debug
execute if entity @s run tellraw @s[tag=eoflib.debug] [{"text": "[", "color": "dark_gray"}, {"text": "Debug", "color": "gold"}, {"text": "] - ", "color": "dark_gray"}, {"text": "eof:gen/teams.mcf", "color": "gold", "hoverEvent": {"action": "show_text", "value": {"text": "You executed the following function:\n\ndata/eof/functions/load/gen/teams.mcfunction", "color": "aqua"}}}]
execute unless entity @s run tellraw @a[tag=eoflib.debug] [{"text": "[", "color": "dark_gray"}, {"text": "Debug", "color": "gold"}, {"text": "] - ", "color": "dark_gray"}, {"text": "eof:gen/teams.mcf", "color": "gray", "hoverEvent": {"action": "show_text", "value": {"text": "Server executed the following function:\n\ndata/eof/functions/load/gen/teams.mcfunction", "color": "aqua"}}}]

    # Create tribe teams
team add IceWing
team add MudWing
team add NightWing
team add RainWing
team add SandWing
team add SeaWing
team add SkyWing

    # Team modifiers
team modify IceWing color aqua
team modify MudWing color red
team modify NightWing color dark_purple
team modify RainWing color green
team modify SandWing color yellow
team modify SeaWing color blue
team modify SkyWing color dark_red

#endregion
