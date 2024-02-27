#> eof:passives/skywings/skyborn/jump/1/charge
#
# Runs charge functions for the skyborn passive attribute.

#region
    # Debug
execute if entity @s run tellraw @s[tag=eoflib.debug] [{"text": "[", "color": "dark_gray"}, {"text": "Debug", "color": "gold"}, {"text": "] - ", "color": "dark_gray"}, {"text": "eof:1/charge.mcf", "color": "gold", "hoverEvent": {"action": "show_text", "value": {"text": "You executed the following function:\n\ndata/eof/functions/passives/skywings/skyborn/jump/1/charge.mcfunction", "color": "aqua"}}}]
execute unless entity @s run tellraw @a[tag=eoflib.debug] [{"text": "[", "color": "dark_gray"}, {"text": "Debug", "color": "gold"}, {"text": "] - ", "color": "dark_gray"}, {"text": "eof:1/charge.mcf", "color": "gray", "hoverEvent": {"action": "show_text", "value": {"text": "Server executed the following function:\n\ndata/eof/functions/passives/skywings/skyborn/jump/1/charge.mcfunction", "color": "aqua"}}}]

    # Increment scores
scoreboard players add @a[tag=eof.passives.skyborn.init, tag=!eof.passives.skyborn.active] eof.passives.skyborn.jump 1

    # Charge display
execute as @a[tag=eof.passives.skyborn.init, tag=!eof.passives.skyborn.active, scores={eof.passives.skyborn.jump=1..100}] run function eof:passives/skywings/skyborn/jump/1/charge_tree/l1

    # Check loop criteria
        ## Stop loop
            ### Stopped charging
execute as @a[tag=eof.passives.skyborn.init, tag=!eof.passives.skyborn.active] unless entity @s[predicate=eof:passives/skyborn/jump/1, scores={eof.passives.skyborn.jump=1..100}] run function eof:passives/skywings/skyborn/jump/1/deactivate

            ### Fully charged
execute as @a[tag=eof.passives.skyborn.init, tag=!eof.passives.skyborn.active, scores={eof.passives.skyborn.jump=100}] as @a[tag=eof.passives.skyborn.init, scores={eof.passives.skyborn.jump=100}] at @s run function eof:passives/skywings/skyborn/jump/1/activate

        ## Continue loop
execute if entity @a[tag=eof.passives.skyborn.init, tag=!eof.passives.skyborn.active, scores={eof.passives.skyborn.jump=1..100}] run schedule function eof:passives/skywings/skyborn/jump/1/charge 1t

#endregion
