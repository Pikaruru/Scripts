local MainRepository = "https://raw.githubusercontent.com/Pikaruru/Scripts/main/"

local PlaceIDs = {
    [6551809638] = "farmingadventures.lua",
    [9190926538] = "Toyfighters.lua",
    [5202297512] = "bobasim.lua",
    [9386846196] = "brawlinggrounds.lua",
    [9588998913] = "empireclash.lua",
    [10070062081] = "minion.lua",
    [2043040358] = "vyyrahk.lua",
    [10325366821] = "GuillotineTycoon.lua" ,
    [9894044804] = "bladesimulator.lua",
    [4895427362] = "romangaypire.lua",
    [10033287610] = "smasherman.lua",
    [8585657145] = "animeherosim.lua",
    [10108131074] = "mowthelawn.lua",
    [8549047195] = "aws.lua",
    [10011532704] = "AnimeBrawlSimulator.lua",
    [8612195438] = "clickerpartysimulator.lua",
    [7898006543] = "mushroomsimulator.lua",
    [9927535243] = "minersgalore.lua",
    [7225720036] = "miningsaga.lua",
    [9157870347] = "petadventures.lua",
    [10106105124] = "wheatfarmingsim.lua",
    [10157366004] = "pettappingsimulator.lua",
    [9970551995] = "touchthegrass.lua",
    [10204162989] = "pickaxesim.lua",
    [10347946161] = "ratwash.lua"
}

local Success, Result = pcall(function()
    loadstring(game:HttpGet(MainRepository..PlaceIDs[game.PlaceId]))()
end)

if not Success then
    warn("Error while loading script: "..Result)
end
