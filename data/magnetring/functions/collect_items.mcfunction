scoreboard players add @s cc_magnettimer 1
execute if score @s cc_magnettimer matches 40 run teleport @e[type=item,nbt={OnGround:1b},sort=nearest,distance=..13] ^ ^ ^0.1 facing entity @s feet
execute if score @s cc_magnettimer matches 41.. run scoreboard players reset @s cc_magnettimer
