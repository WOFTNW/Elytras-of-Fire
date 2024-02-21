#> eof:passives/seawings/true_blessing/1/charge
#
# Runs charge functions for the True Blessing passive attribute.

#region
    # Debug
execute if entity @s run tellraw @s[tag=eoflib.debug] [{"text": "[", "color": "dark_gray"}, {"text": "Debug", "color": "gold"}, {"text": "] - ", "color": "dark_gray"}, {"text": "eof:1/charge.mcf", "color": "gold", "hoverEvent": {"action": "show_text", "value": {"text": "data/eof/functions/passives/seawings/true_blessing/1/charge.mcfunction", "color": "aqua"}}}]
execute unless entity @s run tellraw @a[tag=eoflib.debug] [{"text": "[", "color": "dark_gray"}, {"text": "Debug", "color": "gold"}, {"text": "] - ", "color": "dark_gray"}, {"text": "eof:1/charge.mcf", "color": "gray", "hoverEvent": {"action": "show_text", "value": {"text": "data/eof/functions/passives/seawings/true_blessing/1/charge.mcfunction", "color": "aqua"}}}]

    # Increment scores
scoreboard players add @a[tag=eof.passives.true_blessing.init, tag=!eof.passives.true_blessing.active] eof.passives.true_blessing 1

    # Charge display
execute as @a[tag=eof.passives.true_blessing.init, tag=!eof.passives.true_blessing.active, scores={eof.passives.true_blessing=1..100}] run function eof:passives/seawings/true_blessing/1/charge_tree/l1

    # Check loop criteria
        ## Stop loop
            ### Stopped charging
execute as @a[tag=eof.passives.true_blessing.init, tag=!eof.passives.true_blessing.active] unless entity @s[predicate=eof:passives/true_blessing/1, scores={eof.passives.true_blessing=1..100}] run function eof:passives/seawings/true_blessing/1/deactivate

            ### Fully charged
execute as @a[tag=eof.passives.true_blessing.init, tag=!eof.passives.true_blessing.active, scores={eof.passives.true_blessing=100}] as @a[tag=eof.passives.true_blessing.init, scores={eof.passives.true_blessing=100}] at @s run function eof:passives/seawings/true_blessing/1/activate

        ## Continue loop
execute if entity @a[tag=eof.passives.true_blessing.init, tag=!eof.passives.true_blessing.active, scores={eof.passives.true_blessing=1..100}] run schedule function eof:passives/seawings/true_blessing/1/charge 1t

#endregion
