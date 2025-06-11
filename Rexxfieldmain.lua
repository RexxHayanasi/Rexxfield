-- Rexxfield Script Hub (Fixed Version)
-- Fixed issues: Error handling, memory management, and compatibility

local Rexxfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/RexxHayanasi/Rexxfield/main/rexxfield.lua'))()

-- Safe initialization with error handling
local success, window = pcall(function()
    return Rexxfield:CreateWindow({
        Name = "Script Hub",
        LoadingTitle = "Loading Script Hub",
        LoadingSubtitle = "By RexxHayanasi",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "RexxfieldConfigs",
            FileName = "PlayerChanger"
        },
        Discord = {
            Enabled = true,
            Invite = "5tBNqX3Ngp",
            RememberJoins = true
        },
        KeySystem = false
    })
end)

if not success then
    warn("[Rexxfield] Failed to create window:", window)
    return
end

-- Main Tab
local MainTab = window:CreateTab("Main", nil)
local MainSection = MainTab:CreateSection("Main Functions")

-- Notification with better error handling
local function SafeNotify(title, content)
    pcall(function()
        Rexxfield:Notify({
            Title = title,
            Content = content,
            Duration = 5,
            Actions = {
                Ignore = {
                    Name = "Okay",
                    Callback = function()
                        print("User acknowledged notification")
                    end
                }
            }
        })
    end)
end

SafeNotify("Script Hub Loaded", "Welcome to the enhanced Rexxfield Hub!")

-- Improved button creation with error handling
local function CreateSafeButton(tab, name, callback)
    local success, btn = pcall(function()
        return tab:CreateButton({
            Name = name,
            Callback = function()
                -- Add memory cleanup before execution
                collectgarbage()
                
                -- Run with protected call
                local execSuccess, err = pcall(callback)
                if not execSuccess then
                    warn("[Script Error]", name, ":", err)
                    SafeNotify("Script Error", "Failed to execute "..name)
                end
            end
        })
    end)
    
    if not success then
        warn("[Button Error] Failed to create", name, ":", btn)
    end
end

-- Script buttons with better implementation
CreateSafeButton(MainTab, "Infinite Yield (Safe)", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source', true))()
end)

CreateSafeButton(MainTab, "Westbound Inf Ammo", function()
    local mods = {
        Damage = 999, 
        FanFire = true, 
        camShakeResist = 0, 
        Spread = 0, 
        prepTime = 0, 
        equipTime = 0, 
        MaxShots = math.huge, 
        ReloadAnimationSpeed = 0, 
        ReloadSpeed = 0, 
        HipFireAccuracy = 0, 
        ZoomAccuracy = 0, 
        InstantFireAnimation = true
    }

    local gunStats = require(game:GetService("ReplicatedStorage").GunScripts.GunStats
    for _, gun in pairs(gunStats) do
        for prop, value in pairs(mods) do
            if gun[prop] ~= nil then
                gun[prop] = value
            end
        end
    end
end)

CreateSafeButton(MainTab, "Greenville Overkill", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/typical-overk1ll/scripts/main/Greenville", true))()
end)

CreateSafeButton(MainTab, "Doors Vynixius Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua", true))()
end)

-- Memory management section
local UtilityTab = window:CreateTab("Utilities", nil)
local UtilitySection = UtilityTab:CreateSection("System Tools")

CreateSafeButton(UtilityTab, "Clean Memory", function()
    collectgarbage()
    SafeNotify("Memory Cleaned", "RAM usage has been optimized")
end)

CreateSafeButton(UtilityTab, "Check Memory", function()
    local mem = math.floor((collectgarbage("count")/1024))
    SafeNotify("Memory Usage", "Current: "..mem.." MB")
end)

-- Info tab
local InfoTab = window:CreateTab("Information", nil)
InfoTab:CreateParagraph({
    Title = "Rexxfield Script Hub",
    Content = "Enhanced version with error handling and memory management"
})

InfoTab:CreateParagraph({
    Title = "Credits",
    Content = "Original by RexxHayanasi | Enhanced with safety features"
})

-- Automatic memory cleaner
task.spawn(function()
    while task.wait(30) do
        collectgarbage()
        print("Automatic memory cleanup performed")
    end
end)

-- Initial memory check
task.delay(5, function()
    local mem = math.floor((collectgarbage("count")/1024))
    print(string.format("[Rexxfield] Initial memory: %dMB", mem))
end)
