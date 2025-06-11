local Rexxfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/RexxHayanasi/Rexxfield/refs/heads/main/rexxfield.lua'))()

local Window = Rexxfield:CreateWindow({
   Name = "Script Hub",
   LoadingTitle = "Loading Script Hub",
   LoadingSubtitle = "By RexxHayanasi",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Player Changer"
   },
   Discord = {
      Enabled = true,
      Invite = "5tBNqX3Ngp", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rexxfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rexxfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Main", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rexxfield:Notify({
   Title = "Menjalankan Script dengan Sukses",
   Content = "A Good Script Hub",
   Duration = 5,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Button = MainTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Westbound Inf Ammo",
   Callback = function()
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

for _, gun in pairs(require(game:GetService("ReplicatedStorage").GunScripts.GunStats)) do
    for prop, value in pairs(mods) do
        if gun[prop] then
            gun[prop] = value
        end
    end
end
   end,
})

local Button = MainTab:CreateButton({
   Name = "Greenville Overkill Tuning Garage",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/typical-overk1ll/scripts/main/Greenville", true))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Doors Vynixius Hub",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Shark Bite 2 Pearl Hub",
   Callback = function()
        loadstring(game:HttpGet('https://ppearl.vercel.app'))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Notoriety Requiem",
   Callback = function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/RUSH-HOUR-Notoriety-Requiem-Evolution-11364"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "DomainX",
   Callback = function()
        loadstring(game:HttpGet('https://sirius.menu/domainx'))() 
   end,
})

local Button = MainTab:CreateButton({
   Name = "Destruction Simulator Aqua Modz",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/AquaModz/DestructionSIMModded/main/DestructionSimAqua.lua'))()
   end,
})

local Tab = Window:CreateTab("Info", nil) -- Title, Image

local Paragraph = Tab:CreateParagraph({Title = "Info", Content = "By RexxHayanasi"})

local Paragraph = Tab:CreateParagraph({Title = "Info", Content = "Discord Server : "})
