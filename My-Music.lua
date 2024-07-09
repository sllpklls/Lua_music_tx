local toolName = "TNS|My Music|TNE"

local function init() 
end

local function run(event)    
    chdir("/SCRIPTS/MUSIC")
    return "/SCRIPTS/MUSIC/music.lua"
end

return {init = init, run = run}
