---- #########################################################################
---- #                                                                       #
---- # Copyright (C) sllpklls                                                #
-----#                                                                       #
---- # myfacebook: https://www.facebook.com/sllpklls/     	             #
---- #                                                                       #
---- #                                                                       #                       
---- #                                                                       #
---- #########################################################################

-- Model types
local modelType = 0
local MUSIC_1 = 0
local MUSIC_2 = 1
local MUSIC_3 = 2

-- Common functions
local function fieldIncDec(event, value, max)
  if event == EVT_VIRTUAL_DEC or event == EVT_VIRTUAL_DEC_REPT then
    value = (value + max)
  elseif event == EVT_VIRTUAL_INC or event == EVT_VIRTUAL_INC_REPT then
    value = (value + max + 2)
  end
  value = (value % (max+1))
  return value
end

-- Model Type Menu
local function modelTypeSurround(index)
  if index <= 1 then
    lcd.drawFilledRectangle(59*(index%2)+12, 13, 43, 23)
  else
    lcd.drawFilledRectangle(59*(index%2)+12, 34, 40, 20)
  end
end

local function drawModelChoiceMenu()
  lcd.clear()
  lcd.drawScreenTitle("Select model type", 0, 0)
    lcd.drawText( 20, 20, "TY")
    lcd.drawText( 78, 20, "CDYT")
    lcd.drawText( 20, 40, "CN")
  modelTypeSurround(modelType)
  fieldsMax = 0
end

local function modelTypeMenu(event)
  drawModelChoiceMenu()
  if event == EVT_VIRTUAL_ENTER then
    if modelType == MUSIC_1 then
      return "trotyeu.lua"
    elseif modelType == MUSIC_2 then
      return "cdyt.lua"
    elseif modelType == MUSIC_3 then
      return "cn.lua"
    end
  else
    modelType = fieldIncDec(event, modelType, 2)
  end
  return 0
end

-- Main
local function run(event)
  if event == nil then
    error("Cannot be run as a model script!")
  end

  if event == EVT_VIRTUAL_EXIT then
    return 2
  end


  return modelTypeMenu(event)
end

return { run=run }
