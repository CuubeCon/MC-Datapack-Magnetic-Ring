execute as @r[tag=magnetring] at @s if data entity @s Inventory[{id:"minecraft:carrot_on_a_stick",tag:{Enchantments:[{}],CustomModelData:2,display:{Name:"{\"text\":\"magnetic ring\"}"}}}] run function magnetring:collect_items
execute as @r at @s if score @s cc_magnetring matches 1 if data entity @s SelectedItem{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2,display:{Name:"{\"text\":\"magnetic ring\"}"}}} run function magnetring:activate
execute as @r at @s if score @s cc_magnetring matches 2 if data entity @s SelectedItem{id:"minecraft:carrot_on_a_stick",tag:{Enchantments:[{}],CustomModelData:2,display:{Name:"{\"text\":\"magnetic ring\"}"}}} run function magnetring:deactivate
scoreboard players reset @a[scores={cc_magnetring=2..}] cc_magnetring

#Drop Crafting by halbzwilling
execute as @r at @s as @e[type=item,distance=..6,nbt={OnGround:1b,Item:{id:"minecraft:heart_of_the_sea", Count:1b}}] at @s if block ~ ~-1 ~ crafting_table run tag @s add drop_magnetring_1
execute as @r at @s as @e[type=item,distance=..6,nbt={OnGround:1b,Item:{id:"minecraft:emerald_block", Count:2b}}] at @s if block ~ ~-1 ~ crafting_table run tag @s add drop_magnetring_2
execute as @r at @s as @e[type=item,distance=..6,nbt={OnGround:1b,Item:{id:"minecraft:diamond_block", Count:2b}}] at @s if block ~ ~-1 ~ crafting_table run tag @s add drop_magnetring_3

execute as @e[tag=drop_magnetring_1] at @e[tag=drop_magnetring_1] if entity @e[tag=drop_magnetring_2, distance=..1] if entity @e[tag=drop_magnetring_3, distance=..1] if block ~ ~-1 ~ crafting_table run tag @s add craft_magnetring

execute as @e[type=item,tag=craft_magnetring] at @e[type=item,tag=craft_magnetring] run kill @e[tag=drop_magnetring_2, distance=..1]
execute as @e[type=item,tag=craft_magnetring] at @e[type=item,tag=craft_magnetring] run kill @e[tag=drop_magnetring_3, distance=..1]
execute as @e[type=item,tag=craft_magnetring] at @e[type=item,tag=craft_magnetring] run playsound minecraft:block.wood.break master @a
execute as @e[type=item,tag=craft_magnetring] at @e[type=item,tag=craft_magnetring] run data merge entity @s {Item:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2,display:{Name:"{\"text\":\"magnetic ring\"}"}}, Count:1b}, Motion:[0d,0.5d,0d], Tags:[]}
