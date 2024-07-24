Config = Config or {}

-- Locations of the stores that can be robbed
Config.locations = {
    vec3(24.9456, -1344.9544, 29.6116), -- Innocence Blvd
    vec3(-3041.3566, 584.2665, 8.0235), -- Inseno Road
    vec3(-3244.5734, 1000.6577, 12.9453), -- Barbareno Road
    vec3(1729.3294, 6417.1230, 35.1519), -- Great Ocean Highway
    vec3(1698.3787, 4923.2553, 42.2410), -- Grape Seed Main Street
    vec3(1959.3229, 3742.2895, 32.4584), -- Alhambra Drive
    vec3(548.9014, 2668.9414, 42.2711), -- Route 68
    vec3(2676.2124, 3280.9694, 55.3558), -- Senora Freeway
    vec3(2554.875, 381.3857, 108.7376), -- Palomino Freeway
    vec3(373.5953, 328.5891, 103.6810), -- Clinton Avenue
    vec3(-1820.5584, 793.9172, 138.2765), -- North Rockford Drive
    vec3(-47.2251, -1757.5423, 29.5983), -- Grove Street
    vec3(-706.7102, -913.5667, 19.3929), -- Ginger Street
    vec3(1164.1452, -322.7899, 69.3824) -- Mirror Park Blvd
}

-- Skill check difficulties for the robbery
Config.skillCheck1 = 'medium' -- First skill check difficulty
Config.skillCheck2 = 'medium' -- Second skill check difficulty
Config.skillCheck3 = 'medium' -- Third skill check difficulty

-- Minimum and maximum payout for a successful robbery
Config.payOutMin = 100 -- Minimum amount of money a player can receive
Config.payOutMax = 200 -- Maximum amount of money a player can receive
