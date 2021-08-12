config = {}
config.framework = 'ESX' -- ESX or STANDALONE
config.Mysql = 'mysql-async' -- ghmattisql , mysql-async
config.weight_type = 'weight' -- limit or weight ESX items
config.items = { -- FRAMEWORK REQUIRED - you can rename the item
    ['rexona'] = {name = 'Rexona', value = 100000}, -- value to add in hygiene
    ['bodyspray'] = {name = 'Body Spray', value = 200000},
    ['channelspray'] = {name = 'Chanel Spray', value = 500000},
    ['bvlgari'] = {name = 'BVLGARI EXTREME', value = 600000},
}
config.testcommand = true -- /toilet and /shower -- spawn the prop to test

config.poostatus = 'poop' -- registered status name
config.peestatus = 'pee' -- registered status name
config.hygienestatus  = 'hygiene' -- registered status name
config.hygieneremove = 10 -- value to remove per tick (if using renzu_status check the multiplier)
config.badhygienestatus_effect = 'stress' -- a status name to be affected if your hygiene is 0 (other player will experience this not the bad hygiened player)
config.badhygiene_effect_value = 100 -- value to remove/add in status if some bad hygiened player is nearby
config.badhygiene_hp_effect = 3 -- minus this value to players sorrounding hp
config.thirst_to_pee = 0.01 -- thirst to pee convertion, pee will add if you gain thirst (ex. from drinking water item) 0.1 = 10% from add value of thirst
config.hunger_to_poo = 0.01 -- hunger to poo convertion, poo will add if you gain hunger (ex. from eating burger item) 0.1 = 10% from add value of hunger

config.washface_effectstatus = 'energy' -- optional, this can be hygiene status too
config.washfaceadd_status = 100000

config.enablepropbase = true -- prop base toilet and showers , for housing purpose
config.showerprop = { -- prop list add as many as you want
    'ligoshower', -- custom prop
}
config.toiletprop = { -- prop list add as many as you want
    'prop_toilet_01',
}


-- you need a bathroom map or IPL map to use
showers = { -- shower station
    {pos = vector3(-803.74468994141,335.79489135742,220.9154486084), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=257.05}, -- this one is IPL from bob_74 ipl
    -- others are custom maps
    -- Premier rouleau (droite)
    --MRPD
    {pos = vector3(478.84, -983.99, 31.24), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=168.48},
    {pos = vector3(477.27, -983.8, 31.24), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=175.71},
    {pos = vector3(477.25, -980.03, 31.24), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=355.36},
    {pos = vector3(478.82, -979.86, 31.24), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=358.94},
    --HP MT ZONAH
    {pos = vector3(-440.56, -307.67, 35.47), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=280.3},
    {pos = vector3(-435.05, -305.41, 35.47), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=286.93},
    --HP 3rdfloor
    {pos = vector3(-435.19, -332.12, 69.72), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=343.84},
    {pos = vector3(-438.76, -350.98, 69.75), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=258.08},
    {pos = vector3(-457.53, -336.48, 69.72), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=264.68},
    {pos = vector3(-466.16, -340.16, 69.72), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=68.95},
    --PINK CAGE
    {pos = vector3(303.82, -221.3, 54.52), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=244.37},
    {pos = vector3(303.85, -221.27, 58.32), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=240.72},
    {pos = vector3(304.3, -206.28, 54.48), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=153.05},
    {pos = vector3(304.32, -206.28, 58.42), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=153.9},
    {pos = vector3(308.08, -196.42, 54.49), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=154.12},
    {pos = vector3(308.08, -196.4, 58.37), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=155.32},
    {pos = vector3(322.81, -191.62, 54.52), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=62.96},
    {pos = vector3(322.79, -191.59, 58.32), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=68.06},
    {pos = vector3(346.12, -216.66, 54.53), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=337.72},
    {pos = vector3(346.12, -216.66, 58.32), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=337.72},
    {pos = vector3(349.95, -206.82, 58.32), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=337.72},
    {pos = vector3(349.95, -206.82, 54.53), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=337.72},
    --VICTORIA
    {pos = vector3(484.89, 235.57, 105.25), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=67.46},
    {pos = vector3(478.41, 217.05, 108.81), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=70.1},
    {pos = vector3(508.32, 240.77, 105.18), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=335.87},
    {pos = vector3(520.49, 236.38, 105.20), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=331.39},
    --YATCH
    {pos = vector3(-940.98, -1327.37, 6.73), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=110.78},
    {pos = vector3(-941.44, -1326.08, 10.34), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=114.67},
    {pos = vector3(-942.51, -1323.52, 13.70), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=114.55},
    {pos = vector3(-873.34, -1302.75, 6.70), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=108.33},
    {pos = vector3(-873.7, -1301.42, 10.26), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=106.09},
    {pos = vector3(-874.87, -1298.88, 13.70), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=115.79},
    {pos = vector3(-907.21, -1314.95, 6.70), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=120.03},
    {pos = vector3(-907.7, -1313.67, 10.30), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=107.77},
    {pos = vector3(-908.54, -1311.07, 13.70), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=100.53},
    --PUBLIC
    {pos = vector3(-44.76, -1407.16, 29.58), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=87.0},
    {pos = vector3(-44.84, -1405.03, 29.58), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=87.0},
    {pos = vector3(-44.84, -1409.26, 29.58), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=89.62},
    {pos = vector3(-44.83, -1411.37, 29.58), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=88.23},
    --bayview
    {pos = vector3(-676.28936767578,5766.1572265625,17.869000244141), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=249.07781982422},
    {pos = vector3(-674.46551513672,5770.0234375,17.869002151489), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=236.45457458496},
    {pos = vector3(-678.14227294922,5762.1137695313,17.869002151489), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=251.07562255859},
    {pos = vector3(-679.94830322266,5758.2416992188,17.868990707397), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=245.0919342041},
    {pos = vector3(-690.97595214844,5752.0747070313,17.872496414185), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=156.74156188965},
    {pos = vector3(-694.85803222656,5753.8413085938,17.869000244141), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=151.65232849121},
    {pos = vector3(-698.84747314453,5755.740234375,17.869000244141), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=155.07949829102},
    {pos = vector3(-702.744140625,5757.5122070313,17.869019317627), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=151.91107177734},
    {pos = vector3(-706.59405517578,5759.4272460938,17.869025039673), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=152.41172790527},
    {pos = vector3(-710.57928466797,5761.1840820313,17.869000244141), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=152.75549316406},
}

washface = { -- wash face station
    {pos = vector3(-804.85552978516,332.40093994141,220.43850708008), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=166.9}, -- this one is IPL from bob_74 ipl
    -- OTHERS ARE CUSTOM MAP
    -- Premier rouleau (droite)
    --MRPD
    {pos = vector3(472.36, -982.93, 31.24), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=84.9},
    --HP
    {pos = vector3(-440.25, -310.15, 35.44), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=284.92},
    {pos = vector3(-434.66, -307.77, 35.44), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=280.6},
    {pos = vector3(-452.58, -334.01, 69.52), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=212.72},
    --PINK CAGE
    {pos = vector3(303.1, -222.97, 54.25), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=159.38},
    --VICTORIA
    {pos = vector3(486.64, 234.72, 104.75), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=346.98},
    {pos = vector3(480.1, 216.42, 108.31), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=341.98},
    {pos = vector3(507.66, 239.28, 104.75), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=245.84},
    {pos = vector3(519.86, 234.86, 104.75), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=251.93},

    {pos = vector3(-677.76879882813,5764.015625,17.538265228271), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=240.89810180664},
}

tae = { -- POO STATION
    -- Premier rouleau (droite) --
    {pos = vector3(-807.21984863281,332.28469848633,220.4383392334), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=358.05}, -- this one is IPL from bob_74 ipl
    --PUBLIC
    {pos = vector3(-35.1, -1404.33, 29.49), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=93.05},
    {pos = vector3(-35.11, -1406.51, 29.49), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=89.62},
    {pos = vector3(-35.11, -1408.75, 29.49), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=90.58},
    {pos = vector3(-35.11, -1410.86, 29.49), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=88.72},
    {pos = vector3(-35.11, -1412.99, 29.49), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=86.49},
    --MECH
    {pos = vector3(951.92, -970.79, 39.37), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=266.98},
    --HP
    {pos = vector3(-439.27, -312.3, 34.91), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=116.81},
    {pos = vector3(-433.61, -309.95, 34.91), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=121.06},
    {pos = vector3(-451.9, -330.32, 69.52), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=164.74},
    {pos = vector3(-436.74, -332.35, 69.52), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=189.06},
    {pos = vector3(-438.96, -349.43, 69.52), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=102.37},
    {pos = vector3(-465.79, -340.89, 69.52), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=274.58},
    --PD
    {pos = vector3(-457.34, -335.6, 69.52), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=84.66},
    {pos = vector3(471.97, -980.49, 30.69), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=183.87},
    {pos = vector3(474.44, -980.49, 30.69), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=183.87},
    {pos = vector3(472.07, -980.49, 30.69), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=183.44},
    {pos = vector3(473.15, -980.49, 30.69), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=183.44},
    --PINKCAGE
    {pos = vector3(343.93, -227.81, 54.23), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=344.4},
    {pos = vector3(343.93, -227.81, 58.02), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=344.4},
    {pos = vector3(347.73, -217.94, 54.23), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=337.09},
    {pos = vector3(347.73, -217.94, 58.02), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=337.09},
    {pos = vector3(351.51, -208.05, 54.23), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=341.11},
    {pos = vector3(351.51, -208.05, 58.02), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=341.11},

    {pos = vector3(-678.10638427734,5763.5922851563,17.538265228271), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=54.231170654297},
    {pos = vector3(-676.21258544922,5767.6083984375,17.538242340088), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=57.763084411621},
    {pos = vector3(-679.91223144531,5759.6665039063,17.538263320923), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=64.825569152832},
    {pos = vector3(-681.71746826172,5755.798828125,17.538265228271), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=58.521827697754},
    {pos = vector3(-693.4931640625,5753.833984375,17.541757583618), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=323.59231567383},
    {pos = vector3(-697.4130859375,5755.6694335938,17.538265228271), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=325.68142700195},
    {pos = vector3(-701.345703125,5757.509765625,17.538265228271), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=324.49179077148},
    {pos = vector3(-705.24188232422,5759.3129882813,17.538265228271), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=325.05450439453},
    {pos = vector3(-709.18383789063,5761.1572265625,17.538265228271), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=339.24996948242},
    {pos = vector3(-713.06268310547,5762.9736328125,17.538265228271), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=328.07376098633},
}

ihi = {
    -- Premier rouleau (droite)
    --PUBLIC
    {pos = vector3(-35.1, -1404.33, 29.49), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=93.05},
    {pos = vector3(-35.11, -1406.51, 29.49), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=89.62},
    {pos = vector3(-35.11, -1408.75, 29.49), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=90.58},
    {pos = vector3(-35.11, -1410.86, 29.49), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=88.72},
    {pos = vector3(-35.11, -1412.99, 29.49), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=86.49},
    --MECH
}