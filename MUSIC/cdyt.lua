
local screenW = math.floor(LCD_W)
local screenH = math.floor(LCD_H)

local now
local oldTime
local deltaTime

local state       = 0
local splashStart = getTime()
local musicPlayed = false  -- Biến để kiểm tra đã phát nhạc hay chưa

local Shots        = {}
local shotInterval = 65
local lastShot     = getTime()
local shotSpeed    = .9

local Comets       = {}
local cometSize    = 12
local cometDots    = 5
local cometSpeed   = .1

local Particles    = {}

local function init()
    -- lcd.lock()
    lcd.clear()
    oldTime = getTime()
    if not musicPlayed then
        playFile("/SCRIPTS/MUSIC/snd/cdyt.wav")
        musicPlayed = true
    end
end

local function run(event)
    if event == nil then end
    if event == EVT_EXIT_BREAK then return 2 end

    lcd.clear()
    splashStart = now
    state       = 0
    oldTime     = now
    return 0
end

return {init = init, run = run}
