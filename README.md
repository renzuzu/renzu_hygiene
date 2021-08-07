# renzu_hygiene
Fivem Hygiene System - ( Shower, Poop, Pee )
![image](https://user-images.githubusercontent.com/82306584/128605654-5964a581-378a-499c-9a2a-3980846b2bc5.png)

# Feature :poop: 
- Add Poop Status  if Hunger status is added (status) ex. eating burger
- Add Pee Status if Thirst status is added (status) ex. drinking water
- Hygiene is Decreasing over a time you can config it @config.lua
- Bad Hygiene Player ( zero hygiene status ) will be swarmed by  FLIES.
- Player nearby to Bad Hygiene Player will gain a stress status and reduced a little of health.
- 
# Sample Config
``` This is IPL Apartment you may need IPL loader or BOB_74 ipl to test the default config
{pos = vector3(-803.74468994141,335.79489135742,220.9154486084), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=257.05}, -- this one is IPL from bob_74 ipl
```
# Installation and Setup
- Step 1
- Download renzu_hygiene
- Download renzu_hud
- Download renzu_status
- Download renzu_notify
- Step 2
- Copy the config renzu_hygiene/renzu_hud_config/status.lua to -> renzu_hud/conf/status.lua
# Coords config
- when setting up a coordinates
- heading is important to poo and shower
- just copy the current corrdinates example: if you are near to toilet and shower heading must be looking to the shower/toilet.
- adjusting original Z for shower a + 0.5 will do
# important at config to setup
```
config.poostatus = 'poop' -- registered status name
config.peestatus = 'pee' -- registered status name
config.hygienestatus  = 'hygiene' -- registered status name
config.badhygienestatus_effect = 'stress' -- a status name to be affected if your hygiene is 0 (other player will experience this not the bad hygiened player)
config.badhygiene_effect_value = 1000 -- value to remove/add in status if some bad hygiened player is nearby
config.badhygiene_hp_effect = 3 -- minus this value to players sorrounding hp
config.thirst_to_pee = 50 -- thirst to pee convertion, pee will add if you gain thirst (ex. from drinking water item)
config.hunger_to_poo = 50 -- hunger to poo convertion, poo will add if you gain hunger (ex. from eating burger item)
```
# Dependency
- https://github.com/renzuzu/renzu_hud (optional)
- https://github.com/renzuzu/renzu_status (optional)
- https://github.com/renzuzu/renzu_notify
- https://github.com/renzuzu/renzu_popui

# optional
- edit renzu_hud/conf/status.lua
- set all hygiene/poo/pee status to hideifmax = true
- the status will only show if its 50%
