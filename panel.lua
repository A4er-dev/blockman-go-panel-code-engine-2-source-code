local hue = 0
local wave = 0
local duration = 16
local elapsedTime = 0
local alpha = 255

local function interpolateAstral(hue, alpha)
    local r = math.floor(127 + 127 * math.sin(math.rad(hue)))
    local g = math.floor(127 + 127 * math.sin(math.rad(hue + 120)))
    local b = math.floor(127 + 127 * math.sin(math.rad(hue + 240)))
    return (alpha << 24) | (r << 16) | (g << 8) | b
end

local text = "Astral\nClient"
local textLength = string.len(text)
local astralText = {}

local timer = LuaTimer:scheduleTimer(function()
    if elapsedTime >= duration * 1000 then
        MsgSender.sendCenterTips(1000000, "", "")
        LuaTimer:cancelTimer(timer)
        return
    end

    local assembledText = ""
    wave = wave + 15

    if elapsedTime >= (duration * 1000) - 2000 then
        alpha = math.max(0, alpha - 16) 
    end

    for i = 1, textLength do
        local brightness = 0.5 + 0.5 * math.sin(math.rad(wave + i * 20))
        astralText[i] = interpolateAstral(hue + i * 25, alpha)
        local color = string.format("%08X", astralText[i])
        assembledText = assembledText .. "▢" .. color .. string.sub(text, i, i)
    end

    MsgSender.sendCenterTips(1000000, assembledText, "Astral Wave Animation")
    hue = (hue + 8) % 360
    elapsedTime = elapsedTime + 40
end, 40, -1)
            -----------------
  local txt = [[
^FFFF00Texture credits^FFFFFF: skull && Raylan
^B22222Yt Channel ^FFFFFF= @aeteambg
^0000CDDc^FFFFFF: Ray cest
Give credits when promoted
]]

local btn = "^00FF00Ok"
local title = "Owner INFO"

CustomDialog.builder()
    .setContentText(txt)
    .setRightText(btn)
    .setTitleText(title)
    .setHideLeftButton()
    .setPanelSize(600, 450)
    .show()
    
    local predefinedTime = 50000

local curWorld = EngineWorld:getWorld()
curWorld:setWorldTime(predefinedTime)

UIHelper.showToast("^00FF00 time set to: " .. predefinedTime)
local hue = 0
local wave = 0

local function interpolateWave(hue, brightness)
    local r = math.floor(255 * brightness)
    local g, b = 0, 0 
    local a = 255
    return (a << 24) | (r << 16) | (g << 8) | b
end

local text = "AEteam/Skull"
local textLength = string.len(text)
local waveText = {}

LuaTimer:scheduleTimer(function()
    local assembledText = ""
    wave = wave + 10

    for i = 1, textLength do
        local brightness = 0.5 + 0.5 * math.sin(math.rad(wave + i * 20))
        waveText[i] = interpolateWave(hue, brightness)
        local color = string.format("%08X", waveText[i])
        assembledText = assembledText .. "▢" .. color .. string.sub(text, i, i)
    end

    MsgSender.sendBottomTips(1000000, assembledText, "Wave Animation")
end, 50, -1)
local cannonWindow = GUIManager:getWindowByName("Main-Cannon")
if cannonWindow then
    cannonWindow:SetVisible(true)
    cannonWindow:SetHeight({0, 60})
    cannonWindow:SetWidth({0, 60})
    cannonWindow:SetXPosition({0, -22})
    cannonWindow:SetYPosition({0, -313})

    cannonWindow:registerEvent(GUIEvent.ButtonClick, function()
        local player = PlayerManager:getClientPlayer()
        if player and player.Player then
            local pitch = player.Player:getPitch()
            local yaw = player.Player:getYaw()

            local pitchRad = pitch * math.pi / 180
            local yawRad = yaw * math.pi / -180

            local x = math.cos(pitchRad) * math.sin(yawRad)
            local y = -math.sin(pitchRad)
            local z = math.cos(pitchRad) * math.cos(yawRad)

            local newPos = VectorUtil.newVector3(x, y, z)
            player.Player:setVelocity(newPos)
            SoundUtil.playSound(313)
        end
    end)
end
local parachuteWindow = GUIManager:getWindowByName("Main-Parachute")
    parachuteWindow:SetVisible(true)
    parachuteWindow:SetHeight({0, 60})
    parachuteWindow:SetWidth({0, 60})
    parachuteWindow:SetXPosition({0, 1483})
    parachuteWindow:SetYPosition({0, 230})
   parachuteWindow:registerEvent(GUIEvent.ButtonClick, function()
    PlayerManager:getClientPlayer().Player:startParachute()
  end) 
--==================================--
local fishing = GUIManager:getWindowByName("Main-Fishing")
if fishing then
    fishing:SetVisible(true)
    fishing:SetHeight({0, 60})
    fishing:SetWidth({0, 60})
    fishing:SetXPosition({0, 38})
    fishing:SetYPosition({0, -313})
end
    fishing:registerEvent(GUIEvent.ButtonClick, function()
        if not Is_Open then
        Is_Open = true
        layout_main:SetVisible(true)
        local scale = 0.5
        layout_main:SetScale(VectorUtil.newVector3(scale, scale, scale))
        LuaTimer:scheduleTicker(function()
            if scale < 0.98 then   
                scale = scale + 0.05 
                layout_main:SetScale(VectorUtil.newVector3(scale, scale, scale))
            end
        end, 1, 10)
        SoundUtil.playSound(4)
    else
        local scale = 0.94  
        LuaTimer:scheduleTicker(function()
            if scale > 0.5 then
                scale = scale - 0.09  
                layout_main:SetScale(VectorUtil.newVector3(scale, scale, scale))
            else
                layout_main:SetVisible(false)
                Is_Open = false
            end
        end, 1, 10)
        SoundUtil.playSound(5)
    end
end)
        -------

    --------  
local dateDisplay = GUIManager:createGUIWindow(GUIType.StaticText, "GUIRoot-showDate")
dateDisplay:SetHorizontalAlignment(HorizontalAlignment.Center)
dateDisplay:SetVerticalAlignment(VerticalAlignment.Center)
dateDisplay:SetHeight({ 0, 70 }) 
dateDisplay:SetWidth({ 0, 200 }) 
dateDisplay:SetLevel(1)
dateDisplay:SetTouchable(false)
GUISystem.Instance():GetRootWindow():AddChildWindow(dateDisplay)
dateDisplay:SetBackgroundColor({ 0, 0, 0, 0 })
dateDisplay:SetVisible(true)
dateDisplay:SetYPosition({ 0, -310 })
dateDisplay:SetXPosition({ 0, 255 })

function UpdateDate()
    local time = os.date("*t")
    local formattedDate = string.format("^FF0000Date:^FFFFFF %02d/%02d/%04d", time.day, time.month, time.year)
    dateDisplay:SetText(formattedDate)
end

LuaTimer:scheduleTimer(UpdateDate, 1000, -1)
--==================================--
local layout_main = GUIManager:createGUIWindow(GUIType.Layout, "GUIRoot-xuy228")
layout_main:SetHorizontalAlignment(HorizontalAlignment.Center)
layout_main:SetVerticalAlignment(VerticalAlignment.Center)
layout_main:SetHeight({ 0, 250 })
layout_main:SetWidth({ 0, 250 })
layout_main:SetLevel(1)
layout_main:SetTouchable(false)
GUISystem.Instance():GetRootWindow():AddChildWindow(layout_main)
layout_main:SetBackgroundColor({0, 0, 0, 0.0})
layout_main:SetVisible(true)
layout_main:SetYPosition({ 0, -200 })
layout_main:SetXPosition({ 0, -460 })

local open_lay = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-xuy2")
open_lay:SetHorizontalAlignment(HorizontalAlignment.Center)
open_lay:SetVerticalAlignment(VerticalAlignment.Center)
open_lay:SetHeight({ 0, 60 })
open_lay:SetWidth({ 0, 60 })
open_lay:SetTouchable(true)
open_lay:registerEvent(GUIEvent.ButtonClick, function()
    if not Is_Open then
        Is_Open = true
        layout_main:SetVisible(true)
        local scale = 0.5
        layout_main:SetScale(VectorUtil.newVector3(scale, scale, scale))
        LuaTimer:scheduleTicker(function()
            if scale < 0.98 then   
                scale = scale + 0.05 
                layout_main:SetScale(VectorUtil.newVector3(scale, scale, scale))
            end
        end, 1, 10)
        SoundUtil.playSound(4)
    else
        local scale = 0.94  
        LuaTimer:scheduleTicker(function()
            if scale > 0.5 then
                scale = scale - 0.09  
                layout_main:SetScale(VectorUtil.newVector3(scale, scale, scale))
            else
                layout_main:SetVisible(false)
                Is_Open = false
            end
        end, 1, 10)
        SoundUtil.playSound(5)
    end
end)
GUISystem.Instance():GetRootWindow():AddChildWindow(open_lay)
open_lay:SetVisible(true)
open_lay:SetYPosition({ 0, -100 })
open_lay:SetXPosition({ 0, 0 })
open_lay:SetNormalImage("set:gui_shop.json image:show_add_property_nor")
open_lay:SetPushedImage("set:gui_shop.json image:show_add_property_nor")


local timeDisplay = GUIManager:createGUIWindow(GUIType.StaticText, "GUIRoot-timeDisplay")
timeDisplay:SetHorizontalAlignment(HorizontalAlignment.Center)
timeDisplay:SetVerticalAlignment(VerticalAlignment.Center)
timeDisplay:SetHeight({ 0, 25 })
timeDisplay:SetWidth({ 0, 40 })
timeDisplay:SetLevel(1)
timeDisplay:SetTouchable(false)
timeDisplay:SetVisible(true)
timeDisplay:SetBackgroundColor({ 0, 0, 0, 0.6})
GUISystem.Instance():GetRootWindow():AddChildWindow(timeDisplay)

local function updateTime()
    local currentTime = os.date("%I:%M")
    timeDisplay:SetText(currentTime)
end

LuaTimer:scheduleTimer(function()
    updateTime()
end, 1000, -1)

open_lay:registerEvent(GUIEvent.TouchMove, function()
    timer.cipka = LuaTimer:scheduleTimer(function()
        if not Blockman.Instance().m_gameSettings:isMouseMoving() then
            local mousePos = Blockman.Instance().m_gameSettings:getMousePos()
            open_lay:SetXPosition({0, mousePos.x / 1.0 - 740})
            open_lay:SetYPosition({0, mousePos.y / 1.0 - 305})
            timeDisplay:SetXPosition({0, mousePos.x / 1.0 - 740})
            timeDisplay:SetYPosition({0, mousePos.y / 1.0 - 255})
        end
    end, 5, 250)
end)
    ------------
uti = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-util12")
 uti:SetHorizontalAlignment(HorizontalAlignment.Center)
 uti:SetVerticalAlignment(VerticalAlignment.Center)
        --uti:SetTextHorzAlign(HorizontalAlignment.Center)
        --uti:SetTextVertAlign(VerticalAlignment.Center)
        uti:SetHeight({ 0, 50 })
        uti:SetWidth({ 0, 140 })
        uti:SetLevel(1)
        uti:SetTouchable(true)
        layout_main:AddChildWindow(uti)
        uti:SetText("Util")
        uti:SetBackgroundColor({0.745, 0.137, 0.137, 0.9})
        uti:SetVisible(true)
        uti:SetYPosition({ 0, -80 })
        uti:SetXPosition({ 0, 680 })
        uti:registerEvent(GUIEvent.ButtonClick, function()
        Util()
    end)
   ------------
layout_demon = GUIManager:createGUIWindow(GUIType.Layout, "GUIRoot-pezdalua")
 layout_demon:SetHorizontalAlignment(HorizontalAlignment.Center)
 layout_demon:SetVerticalAlignment(VerticalAlignment.Center)
        --CenterToastg:SetTextHorzAlign(HorizontalAlignment.Center)
        --CenterToastg:SetTextVertAlign(VerticalAlignment.Center)
        layout_demon:SetHeight({ 0, 250})
        layout_demon:SetWidth({ 0, 250 })
        layout_demon:SetLevel(1)
        layout_demon:SetTouchable(false)
        GUISystem.Instance():GetRootWindow():AddChildWindow(layout_demon)
        layout_demon:SetBackgroundColor({0, 0, 0, 0.0})
        layout_demon:SetVisible(true)
        layout_demon:SetYPosition({ 0, -200 })
        layout_demon:SetXPosition({ 0, -460})
        --------------
mov = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-movement1")
 mov:SetHorizontalAlignment(HorizontalAlignment.Center)
 mov:SetVerticalAlignment(VerticalAlignment.Center)
        --mov:SetTextHorzAlign(HorizontalAlignment.Center)
        --mov:SetTextVertAlign(VerticalAlignment.Center)
        mov:SetHeight({ 0, 50 })
        mov:SetWidth({ 0, 140 })
        mov:SetLevel(1)
        mov:SetTouchable(true)
        layout_main:AddChildWindow(mov)
        mov:SetText("Movement")
        mov:SetBackgroundColor({0.745, 0.137, 0.137, 0.9})
        mov:SetVisible(true)
        mov:SetYPosition({ 0, -80 })
        mov:SetXPosition({ 0, 80 })
        mov:registerEvent(GUIEvent.ButtonClick, function()
        Movement()
    end)
   ------------
music = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-musicolol")
 music:SetHorizontalAlignment(HorizontalAlignment.Center)
 music:SetVerticalAlignment(VerticalAlignment.Center)
        --music:SetTextHorzAlign(HorizontalAlignment.Center)
        --music:SetTextVertAlign(VerticalAlignment.Center)
        music:SetHeight({ 0, 50 })
        music:SetWidth({ 0, 140 })
        music:SetLevel(1)
        music:SetTouchable(true)
        layout_main:AddChildWindow(music)
        music:SetText("music")
        music:SetBackgroundColor({0.745, 0.137, 0.137, 0.9})
        music:SetVisible(true)
        music:SetYPosition({ 0, -80 })
        music:SetXPosition({ 0, 830 })
        music:registerEvent(GUIEvent.ButtonClick, function()
        music()
    end)
    ------------
inf = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-infolol")
 inf:SetHorizontalAlignment(HorizontalAlignment.Center)
 inf:SetVerticalAlignment(VerticalAlignment.Center)
        --inf:SetTextHorzAlign(HorizontalAlignment.Center)
        --inf:SetTextVertAlign(VerticalAlignment.Center)
        inf:SetHeight({ 0, 50 })
        inf:SetWidth({ 0, 140 })
        inf:SetLevel(1)
        inf:SetTouchable(true)
        layout_main:AddChildWindow(inf)
        inf:SetText("Info")
        inf:SetBackgroundColor({0.745, 0.137, 0.137, 0.9})
        inf:SetVisible(true)
        inf:SetYPosition({ 0, -80 })
        inf:SetXPosition({ 0, 530 })
        inf:registerEvent(GUIEvent.ButtonClick, function()
        Info()
    end)
   ------------
pla = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-player100")
 pla:SetHorizontalAlignment(HorizontalAlignment.Center)
 pla:SetVerticalAlignment(VerticalAlignment.Center)
        --pla:SetTextHorzAlign(HorizontalAlignment.Center)
        --pla:SetTextVertAlign(VerticalAlignment.Center)
        pla:SetHeight({ 0, 50 })
        pla:SetWidth({ 0, 140 })
        pla:SetLevel(1)
        pla:SetTouchable(true)
        layout_main:AddChildWindow(pla)
        pla:SetText("Player")
        pla:SetBackgroundColor({0.745, 0.137, 0.137, 0.9})
        pla:SetVisible(true)
        pla:SetYPosition({ 0, -80 })
        pla:SetXPosition({ 0, 380 })
        pla:registerEvent(GUIEvent.ButtonClick, function()
        Player()
    end)
   ------------
fnt = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-funcbat645")
 fnt:SetHorizontalAlignment(HorizontalAlignment.Center)
 fnt:SetVerticalAlignment(VerticalAlignment.Center)
        --fnt:SetTextHorzAlign(HorizontalAlignment.Center)
        --fnt:SetTextVertAlign(VerticalAlignment.Center)
        fnt:SetHeight({ 0, 50 })
        fnt:SetWidth({ 0, 140 })
        fnt:SetLevel(1)
        fnt:SetTouchable(true)
        layout_main:AddChildWindow(fnt)
        fnt:SetText("SkyBox")
        fnt:SetBackgroundColor({0.745, 0.137, 0.137, 0.9})
        fnt:SetVisible(true)
        fnt:SetYPosition({ 0, -80 })
        fnt:SetXPosition({ 0, 230 })
        fnt:registerEvent(GUIEvent.ButtonClick, function()
        Visual()
    end)
   ------------
com = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-combat34")
 com:SetHorizontalAlignment(HorizontalAlignment.Center)
 com:SetVerticalAlignment(VerticalAlignment.Center)
        --com:SetTextHorzAlign(HorizontalAlignment.Center)
        --com:SetTextVertAlign(VerticalAlignment.Center)
        com:SetHeight({ 0, 50 })
        com:SetWidth({ 0, 140 })
        com:SetLevel(1)
        com:SetTouchable(true)
        layout_main:AddChildWindow(com)
        com:SetText("Combat")
        com:SetBackgroundColor({0.745, 0.137, 0.137, 0.9})
        com:SetVisible(true)
        com:SetYPosition({ 0, -80 })
        com:SetXPosition({ 0, -70 })
        com:registerEvent(GUIEvent.ButtonClick, function()
        Combat()
    end)
   ------------
ggl = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-behertui2")
 ggl:SetHorizontalAlignment(HorizontalAlignment.Center)
 ggl:SetVerticalAlignment(VerticalAlignment.Center)
        --ggl:SetTextHorzAlign(HorizontalAlignment.Center)
        --ggl:SetTextVertAlign(VerticalAlignment.Center)
        ggl:SetHeight({ 0, 50 })
        ggl:SetWidth({ 0, 140 })
        ggl:SetLevel(1)
        ggl:SetTouchable(true)
        layout_main:AddChildWindow(ggl)
        ggl:SetText("Info")
        ggl:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        ggl:SetVisible(true)
        ggl:SetYPosition({ 0, -25 })
        ggl:SetXPosition({ 0, 380 })
        ggl:registerEvent(GUIEvent.ButtonClick, function()
        Info1()
    end)
   ------------     --LuaTimer:scheduleTimer(function()showCord()end, 20, 99999999999)
     ------------
CenterToastg = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-xuy1")
 CenterToastg:SetHorizontalAlignment(HorizontalAlignment.Center)
 CenterToastg:SetVerticalAlignment(VerticalAlignment.Center)
        --CenterToastg:SetTextHorzAlign(HorizontalAlignment.Center)
        --CenterToastg:SetTextVertAlign(VerticalAlignment.Center)
        CenterToastg:SetHeight({ 0, 50 })
        CenterToastg:SetWidth({ 0, 140 })
        CenterToastg:SetLevel(1)
        CenterToastg:SetTouchable(true)
        layout_main:AddChildWindow(CenterToastg)
        CenterToastg:SetText("InfScaffold")
        CenterToastg:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        CenterToastg:SetVisible(true)
        CenterToastg:SetYPosition({ 0, -25})
        CenterToastg:SetXPosition({ 0, 80})
        CenterToastg:registerEvent(GUIEvent.ButtonClick, function()
        scuf()
    end)
   ------------
ab = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-aimbotbtn")
 ab:SetHorizontalAlignment(HorizontalAlignment.Center)
 ab:SetVerticalAlignment(VerticalAlignment.Center)
        --ab:SetTextHorzAlign(HorizontalAlignment.Center)
        --ab:SetTextVertAlign(VerticalAlignment.Center)
        ab:SetHeight({ 0, 50 })
        ab:SetWidth({ 0, 140 })
        ab:SetLevel(1)
        ab:SetTouchable(true)
        layout_main:AddChildWindow(ab)
        ab:SetText("tt btn")
        ab:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        ab:SetVisible(true)
        ab:SetYPosition({ 0, -25 })
        ab:SetXPosition({ 0, -70 })
        ab:registerEvent(GUIEvent.ButtonClick, function()
        ttbtn()
    end)
   ------------
we9 = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-forgot838")
 we9:SetHorizontalAlignment(HorizontalAlignment.Center)
 we9:SetVerticalAlignment(VerticalAlignment.Center)
        --we9:SetTextHorzAlign(HorizontalAlignment.Center)
        --we9:SetTextVertAlign(VerticalAlignment.Center)
        we9:SetHeight({ 0, 50 })
        we9:SetWidth({ 0, 140 })
        we9:SetLevel(1)
        we9:SetTouchable(true)
        layout_main:AddChildWindow(we9)
        we9:SetText("rain")
        we9:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        we9:SetVisible(true)
        we9:SetYPosition({ 0, -25 })
        we9:SetXPosition({ 0, 230 })
        we9:registerEvent(GUIEvent.ButtonClick, function()
        rain()
    end)
   ------------
gf9 = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-type828")
 gf9:SetHorizontalAlignment(HorizontalAlignment.Center)
 gf9:SetVerticalAlignment(VerticalAlignment.Center)
        --gf9:SetTextHorzAlign(HorizontalAlignment.Center)
        --gf9:SetTextVertAlign(VerticalAlignment.Center)
        gf9:SetHeight({ 0, 50 })
        gf9:SetWidth({ 0, 140 })
        gf9:SetLevel(1)
        gf9:SetTouchable(true)
        layout_main:AddChildWindow(gf9)
        gf9:SetText("Evening")
        gf9:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        gf9:SetVisible(true)
        gf9:SetYPosition({ 0, 30 })
        gf9:SetXPosition({ 0, 230 })
        gf9:registerEvent(GUIEvent.ButtonClick, function()
        Evening()
    end)
   ------------
ds5 = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-requem1")
 ds5:SetHorizontalAlignment(HorizontalAlignment.Center)
 ds5:SetVerticalAlignment(VerticalAlignment.Center)
        --ds5:SetTextHorzAlign(HorizontalAlignment.Center)
        --ds5:SetTextVertAlign(VerticalAlignment.Center)
        ds5:SetHeight({ 0, 50 })
        ds5:SetWidth({ 0, 140 })
        ds5:SetLevel(1)
        ds5:SetTouchable(true)
        layout_main:AddChildWindow(ds5)
        ds5:SetText("Night")
        ds5:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        ds5:SetVisible(true)
        ds5:SetYPosition({ 0, 85 })
        ds5:SetXPosition({ 0, 230 })
        ds5:registerEvent(GUIEvent.ButtonClick, function()
        Night()
    end)
   ------------
local B = false

local clicktp = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-clecetp")
clicktp:SetHorizontalAlignment(HorizontalAlignment.Center)
clicktp:SetVerticalAlignment(VerticalAlignment.Center)
clicktp:SetHeight({ 0, 50 })
clicktp:SetWidth({ 0, 140 })
clicktp:SetLevel(1)
clicktp:SetTouchable(true)
layout_main:AddChildWindow(clicktp)
clicktp:SetText("Speed")
clicktp:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
clicktp:SetVisible(true)
clicktp:SetYPosition({ 0, 30 })
clicktp:SetXPosition({ 0, 80 })

clicktp:registerEvent(GUIEvent.ButtonClick, function()
    B = not B
    if B then
        ClientHelper.putIntPrefs("SpeedAddMax", 20000000)
        UIHelper.showToast("^FF0000[DANGER] Speed ON")
    else    
        ClientHelper.putIntPrefs("SpeedAddMax", 1)
        UIHelper.showToast("^FF0000Speed OFF")
    end
end)
   ------------
riachb = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-crich11")
 riachb:SetHorizontalAlignment(HorizontalAlignment.Center)
 riachb:SetVerticalAlignment(VerticalAlignment.Center)
        --riachb:SetTextHorzAlign(HorizontalAlignment.Center)
        --riachb:SetTextVertAlign(VerticalAlignment.Center)
        riachb:SetHeight({ 0, 50 })
        riachb:SetWidth({ 0, 140 })
        riachb:SetLevel(1)
        riachb:SetTouchable(true)
        layout_main:AddChildWindow(riachb)
        riachb:SetText("TpToGirls")
        riachb:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        riachb:SetVisible(true)
        riachb:SetYPosition({ 0, 30 })
        riachb:SetXPosition({ 0, -70 })
        riachb:registerEvent(GUIEvent.ButtonClick, function()
        Tptogirls()
    end)
   ------------
strifff = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-strefeee")
 strifff:SetHorizontalAlignment(HorizontalAlignment.Center)
 strifff:SetVerticalAlignment(VerticalAlignment.Center)
        --strifff:SetTextHorzAlign(HorizontalAlignment.Center)
        --strifff:SetTextVertAlign(VerticalAlignment.Center)
        strifff:SetHeight({ 0, 50 })
        strifff:SetWidth({ 0, 140 })
        strifff:SetLevel(1)
        strifff:SetTouchable(true)
        layout_main:AddChildWindow(strifff)
        strifff:SetText("Strafe")
        strifff:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        strifff:SetVisible(true)
        strifff:SetYPosition({ 0, 85 })
        strifff:SetXPosition({ 0, 80 })
        strifff:registerEvent(GUIEvent.ButtonClick, function()
        Strofe()
    end)
   ------------
rispe = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-rispeeee")
 rispe:SetHorizontalAlignment(HorizontalAlignment.Center)
 rispe:SetVerticalAlignment(VerticalAlignment.Center)
        --rispe:SetTextHorzAlign(HorizontalAlignment.Center)
        --rispe:SetTextVertAlign(VerticalAlignment.Center)
        rispe:SetHeight({ 0, 50 })
        rispe:SetWidth({ 0, 140 })
        rispe:SetLevel(1)
        rispe:SetTouchable(true)
        layout_main:AddChildWindow(rispe)
        rispe:SetText("Respawn")
        rispe:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        rispe:SetVisible(true)
        rispe:SetYPosition({ 0, 140 })
        rispe:SetXPosition({ 0, 80 })
        rispe:registerEvent(GUIEvent.ButtonClick, function()
        Respawn1()
    end)
   ------------
porachu = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-parachhh")
 porachu:SetHorizontalAlignment(HorizontalAlignment.Center)
 porachu:SetVerticalAlignment(VerticalAlignment.Center)
        --porachu:SetTextHorzAlign(HorizontalAlignment.Center)
        --porachu:SetTextVertAlign(VerticalAlignment.Center)
        porachu:SetHeight({ 0, 50 })
        porachu:SetWidth({ 0, 140 })
        porachu:SetLevel(1)
        porachu:SetTouchable(true)
        layout_main:AddChildWindow(porachu)
        porachu:SetText("Parachutev2")
        porachu:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        porachu:SetVisible(true)
        porachu:SetYPosition({ 0, 195 })
        porachu:SetXPosition({ 0, 80 })
        porachu:registerEvent(GUIEvent.ButtonClick, function()
        Parachutev2()
    end)
   ------------
nedelay = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-nidelaaaaayayayayay")
 nedelay:SetHorizontalAlignment(HorizontalAlignment.Center)
 nedelay:SetVerticalAlignment(VerticalAlignment.Center)
        --nedelay:SetTextHorzAlign(HorizontalAlignment.Center)
        --nedelay:SetTextVertAlign(VerticalAlignment.Center)
        nedelay:SetHeight({ 0, 50 })
        nedelay:SetWidth({ 0, 140 })
        nedelay:SetLevel(1)
        nedelay:SetTouchable(true)
        layout_main:AddChildWindow(nedelay)
        nedelay:SetText("tpv2")
        nedelay:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        nedelay:SetVisible(true)
        nedelay:SetYPosition({ 0, 85 })
        nedelay:SetXPosition({ 0, -70 })
        nedelay:registerEvent(GUIEvent.ButtonClick, function()
        tp()
    end)
   ------------
tricerl = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-tracererera")
 tricerl:SetHorizontalAlignment(HorizontalAlignment.Center)
 tricerl:SetVerticalAlignment(VerticalAlignment.Center)
        --tricerl:SetTextHorzAlign(HorizontalAlignment.Center)
        --tricerl:SetTextVertAlign(VerticalAlignment.Center)
        tricerl:SetHeight({ 0, 50 })
        tricerl:SetWidth({ 0, 140 })
        tricerl:SetLevel(1)
        tricerl:SetTouchable(true)
        layout_main:AddChildWindow(tricerl)
        tricerl:SetText("spin")
        tricerl:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        tricerl:SetVisible(true)
        tricerl:SetYPosition({ 0, -25 })
        tricerl:SetXPosition({ 0, 680 })
        tricerl:registerEvent(GUIEvent.ButtonClick, function()
        spin()
    end)
   ------------
snow12 = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-fcl1131")
 snow12:SetHorizontalAlignment(HorizontalAlignment.Center)
 snow12:SetVerticalAlignment(VerticalAlignment.Center)
        --snow12:SetTextHorzAlign(HorizontalAlignment.Center)
        --snow12:SetTextVertAlign(VerticalAlignment.Center)
        snow12:SetHeight({ 0, 50 })
        snow12:SetWidth({ 0, 140 })
        snow12:SetLevel(1)
        snow12:SetTouchable(true)
        layout_main:AddChildWindow(snow12)
        snow12:SetText("Snow")
        snow12:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        snow12:SetVisible(true)
        snow12:SetYPosition({ 0, 140 })
        snow12:SetXPosition({ 0, 230 })
        snow12:registerEvent(GUIEvent.ButtonClick, function()
        Snow()
    end)
    ----------
sunny = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-seeeunny")
 sunny:SetHorizontalAlignment(HorizontalAlignment.Center)
 sunny:SetVerticalAlignment(VerticalAlignment.Center)
        --sunny:SetTextHorzAlign(HorizontalAlignment.Center)
        --sunny:SetTextVertAlign(VerticalAlignment.Center)
        sunny:SetHeight({ 0, 50 })
        sunny:SetWidth({ 0, 140 })
        sunny:SetLevel(1)
        sunny:SetTouchable(true)
        layout_main:AddChildWindow(sunny)
        sunny:SetText("Sunny")
        sunny:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        sunny:SetVisible(true)
        sunny:SetYPosition({ 0, 195 })
        sunny:SetXPosition({ 0, 230 })
        sunny:registerEvent(GUIEvent.ButtonClick, function()
        Sunny()
    end)
    ------------
Christmas = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-Chreeistmas")
 Christmas:SetHorizontalAlignment(HorizontalAlignment.Center)
 Christmas:SetVerticalAlignment(VerticalAlignment.Center)
        --Christmas:SetTextHorzAlign(HorizontalAlignment.Center)
        --Christmas:SetTextVertAlign(VerticalAlignment.Center)
        Christmas:SetHeight({ 0, 50 })
        Christmas:SetWidth({ 0, 140 })
        Christmas:SetLevel(1)
        Christmas:SetTouchable(true)
        layout_main:AddChildWindow(Christmas)
        Christmas:SetText("Christmas")
        Christmas:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        Christmas:SetVisible(true)
        Christmas:SetYPosition({ 0, 250 })
        Christmas:SetXPosition({ 0, 230 })
        Christmas:registerEvent(GUIEvent.ButtonClick, function()
        Christmas()
    end)
   ------------
eriach1 = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-eeeehhhhh")
 eriach1:SetHorizontalAlignment(HorizontalAlignment.Center)
 eriach1:SetVerticalAlignment(VerticalAlignment.Center)
        --eriach1:SetTextHorzAlign(HorizontalAlignment.Center)
        --eriach1:SetTextVertAlign(VerticalAlignment.Center)
        eriach1:SetHeight({ 0, 50 })
        eriach1:SetWidth({ 0, 140 })
        eriach1:SetLevel(1)
        eriach1:SetTouchable(true)
        layout_main:AddChildWindow(eriach1)
        eriach1:SetText("y+p")
        eriach1:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        eriach1:SetVisible(true)
        eriach1:SetYPosition({ 0, 140 })
        eriach1:SetXPosition({ 0, -70 })
        eriach1:registerEvent(GUIEvent.ButtonClick, function()
        ytppara()
    end)
   ------------
tpal = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-tpolllll")
 tpal:SetHorizontalAlignment(HorizontalAlignment.Center)
 tpal:SetVerticalAlignment(VerticalAlignment.Center)
        --tpal:SetTextHorzAlign(HorizontalAlignment.Center)
        --tpal:SetTextVertAlign(VerticalAlignment.Center)
        tpal:SetHeight({ 0, 50 })
        tpal:SetWidth({ 0, 140 })
        tpal:SetLevel(1)
        tpal:SetTouchable(true)
        layout_main:AddChildWindow(tpal)
        tpal:SetText("GUIBTN")
        tpal:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        tpal:SetVisible(true)
        tpal:SetYPosition({ 0, 30 })
        tpal:SetXPosition({ 0, 380 })
        tpal:registerEvent(GUIEvent.ButtonClick, function()
        guibtn()
    end)
    --------------
render1 = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-fcl11")
 render1:SetHorizontalAlignment(HorizontalAlignment.Center)
 render1:SetVerticalAlignment(VerticalAlignment.Center)
        --render1:SetTextHorzAlign(HorizontalAlignment.Center)
        --render1:SetTextVertAlign(VerticalAlignment.Center)
        render1:SetHeight({ 0, 50 })
        render1:SetWidth({ 0, 140 })
        render1:SetLevel(1)
        render1:SetTouchable(true)
        layout_main:AddChildWindow(render1)
        render1:SetText("render")
        render1:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        render1:SetVisible(true)
        render1:SetYPosition({ 0, 140 })
        render1:SetXPosition({ 0, 680 })
        render1:registerEvent(GUIEvent.ButtonClick, function()
        Render()
    end)
    -------------------
spawn = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-spawnn")
 spawn:SetHorizontalAlignment(HorizontalAlignment.Center)
 spawn:SetVerticalAlignment(VerticalAlignment.Center)
        --spawn:SetTextHorzAlign(HorizontalAlignment.Center)
        --spawn:SetTextVertAlign(VerticalAlignment.Center)
        spawn:SetHeight({ 0, 50 })
        spawn:SetWidth({ 0, 140 })
        spawn:SetLevel(1)
        spawn:SetTouchable(true)
        layout_main:AddChildWindow(spawn)
        spawn:SetText("spawnblock")
        spawn:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        spawn:SetVisible(true)
        spawn:SetYPosition({ 0, 87 })
        spawn:SetXPosition({ 0, 680 })
        spawn:registerEvent(GUIEvent.ButtonClick, function()
        spawnb()
    end)
    ----------------------
    cloud = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-sky")
 cloud:SetHorizontalAlignment(HorizontalAlignment.Center)
 cloud:SetVerticalAlignment(VerticalAlignment.Center)
        --cloud:SetTextHorzAlign(HorizontalAlignment.Center)
        --cloud:SetTextVertAlign(VerticalAlignment.Center)
        cloud:SetHeight({ 0, 50 })
        cloud:SetWidth({ 0, 140 })
        cloud:SetLevel(1)
        cloud:SetTouchable(true)
        layout_main:AddChildWindow(cloud)
        cloud:SetText("Clouds")
        cloud:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        cloud:SetVisible(true)
        cloud:SetYPosition({ 0, 32 }) 
        cloud:SetXPosition({ 0, 680 })
        cloud:registerEvent(GUIEvent.ButtonClick, function()
        clouds()
    end)
    -------------
hidec = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-hidecn")
 hidec:SetHorizontalAlignment(HorizontalAlignment.Center)
 hidec:SetVerticalAlignment(VerticalAlignment.Center)
        --hidec:SetTextHorzAlign(HorizontalAlignment.Center)
        --hidec:SetTextVertAlign(VerticalAlignment.Center)
        hidec:SetHeight({ 0, 50 })
        hidec:SetWidth({ 0, 140 })
        hidec:SetLevel(1)
        hidec:SetTouchable(true)
        layout_main:AddChildWindow(hidec)
        hidec:SetText("hidechat")
        hidec:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        hidec:SetVisible(true)
        hidec:SetYPosition({ 0, 250 })
        hidec:SetXPosition({ 0, 80 })
        hidec:registerEvent(GUIEvent.ButtonClick, function()
        hidechat()
    end)
    --Y diff is 55 dumazz
credit = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-creditolol")
 credit:SetHorizontalAlignment(HorizontalAlignment.Center)
 credit:SetVerticalAlignment(VerticalAlignment.Center)
        --credit:SetTextHorzAlign(HorizontalAlignment.Center)
        --credit:SetTextVertAlign(VerticalAlignment.Center)
        credit:SetHeight({ 0, 50 })
        credit:SetWidth({ 0, 140 })
        credit:SetLevel(1)
        credit:SetTouchable(true)
        layout_main:AddChildWindow(credit)
        credit:SetText("credits")
        credit:SetBackgroundColor({0, 0, 0, 1.0})
        credit:SetVisible(true)
        credit:SetYPosition({ 0, -25 })
        credit:SetXPosition({ 0, 530 })
        credit:registerEvent(GUIEvent.ButtonClick, function()
        credits()
    end)
vibe1 = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-vibe1olol")
 vibe1:SetHorizontalAlignment(HorizontalAlignment.Center)
 vibe1:SetVerticalAlignment(VerticalAlignment.Center)
        --vibe1:SetTextHorzAlign(HorizontalAlignment.Center)
        --vibe1:SetTextVertAlign(VerticalAlignment.Center)
        vibe1:SetHeight({ 0, 50 })
        vibe1:SetWidth({ 0, 140 })
        vibe1:SetLevel(1)
        vibe1:SetTouchable(true)
        layout_main:AddChildWindow(vibe1)
        vibe1:SetText("vibe")
        vibe1:SetBackgroundColor({0, 0, 0, 1.0})
        vibe1:SetVisible(true)
        vibe1:SetYPosition({ 0, -25 })
        vibe1:SetXPosition({ 0, 830 })
        vibe1:registerEvent(GUIEvent.ButtonClick, function()
        vibe()
    end)
phonk = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-phonkolol")
 phonk:SetHorizontalAlignment(HorizontalAlignment.Center)
 phonk:SetVerticalAlignment(VerticalAlignment.Center)
        --phonk:SetTextHorzAlign(HorizontalAlignment.Center)
        --phonk:SetTextVertAlign(VerticalAlignment.Center)
        phonk:SetHeight({ 0, 50 })
        phonk:SetWidth({ 0, 140 })
        phonk:SetLevel(1)
        phonk:SetTouchable(true)
        layout_main:AddChildWindow(phonk)
        phonk:SetText("phonks")
        phonk:SetBackgroundColor({0, 0, 0, 1.0})
        phonk:SetVisible(true)
        phonk:SetYPosition({ 0, 30 })
        phonk:SetXPosition({ 0, 830 })
        phonk:registerEvent(GUIEvent.ButtonClick, function()
        phonk()
    end)
    
msic = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-msicolol")
 msic:SetHorizontalAlignment(HorizontalAlignment.Center)
 msic:SetVerticalAlignment(VerticalAlignment.Center)
        --msic:SetTextHorzAlign(HorizontalAlignment.Center)
        --msic:SetTextVertAlign(VerticalAlignment.Center)
        msic:SetHeight({ 0, 50 })
        msic:SetWidth({ 0, 140 })
        msic:SetLevel(1)
        msic:SetTouchable(true)
        layout_main:AddChildWindow(msic)
        msic:SetText("stop music")
        msic:SetBackgroundColor({0, 0, 0, 1.0})
        msic:SetVisible(true)
        msic:SetYPosition({ 0, 85 })
        msic:SetXPosition({ 0, 830 })
        msic:registerEvent(GUIEvent.ButtonClick, function()
        msic()
    end)
tpred = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-tpredddddd")
 tpred:SetHorizontalAlignment(HorizontalAlignment.Center)
 tpred:SetVerticalAlignment(VerticalAlignment.Center)
        --tpred:SetTextHorzAlign(HorizontalAlignment.Center)
        --tpred:SetTextVertAlign(VerticalAlignment.Center)
        tpred:SetHeight({ 0, 50 })
        tpred:SetWidth({ 0, 140 })
        tpred:SetLevel(1)
        tpred:SetTouchable(true)
        layout_main:AddChildWindow(tpred)
        tpred:SetText("tptored")
        tpred:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        tpred:SetVisible(true)
        tpred:SetYPosition({ 0, 85 })
        tpred:SetXPosition({ 0, 380 })
        tpred:registerEvent(GUIEvent.ButtonClick, function()
        tptoredsr()
    end)
tpblue = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-tpblueeeeee")
 tpblue:SetHorizontalAlignment(HorizontalAlignment.Center)
 tpblue:SetVerticalAlignment(VerticalAlignment.Center)
        --tpblue:SetTextHorzAlign(HorizontalAlignment.Center)
        --tpblue:SetTextVertAlign(VerticalAlignment.Center)
        tpblue:SetHeight({ 0, 50 })
        tpblue:SetWidth({ 0, 140 })
        tpblue:SetLevel(1)
        tpblue:SetTouchable(true)
        layout_main:AddChildWindow(tpblue)
        tpblue:SetText("tptoblue")
        tpblue:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        tpblue:SetVisible(true)
        tpblue:SetYPosition({ 0, 140 })
        tpblue:SetXPosition({ 0, 380 })
        tpblue:registerEvent(GUIEvent.ButtonClick, function()
        tptobluesr()
    end)
tpyellow = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-tpyellowww")
 tpyellow:SetHorizontalAlignment(HorizontalAlignment.Center)
 tpyellow:SetVerticalAlignment(VerticalAlignment.Center)
        --tpyellow:SetTextHorzAlign(HorizontalAlignment.Center)
        --tpyellow:SetTextVertAlign(VerticalAlignment.Center)
        tpyellow:SetHeight({ 0, 50 })
        tpyellow:SetWidth({ 0, 140 })
        tpyellow:SetLevel(1)
        tpyellow:SetTouchable(true)
        layout_main:AddChildWindow(tpyellow)
        tpyellow:SetText("tptoyellow")
        tpyellow:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        tpyellow:SetVisible(true)
        tpyellow:SetYPosition({ 0, 195 })
        tpyellow:SetXPosition({ 0, 380 })
        tpyellow:registerEvent(GUIEvent.ButtonClick, function()
        tpyellowsr()
    end)
tpgreen = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-tpgreennnn")
 tpgreen:SetHorizontalAlignment(HorizontalAlignment.Center)
 tpgreen:SetVerticalAlignment(VerticalAlignment.Center)
        --tpgreen:SetTextHorzAlign(HorizontalAlignment.Center)
        --tpgreen:SetTextVertAlign(VerticalAlignment.Center)
        tpgreen:SetHeight({ 0, 50 })
        tpgreen:SetWidth({ 0, 140 })
        tpgreen:SetLevel(1)
        tpgreen:SetTouchable(true)
        layout_main:AddChildWindow(tpgreen)
        tpgreen:SetText("tptogreen")
        tpgreen:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        tpgreen:SetVisible(true)
        tpgreen:SetYPosition({ 0, 250 })
        tpgreen:SetXPosition({ 0, 380 })
        tpgreen:registerEvent(GUIEvent.ButtonClick, function()
        tpgreensr()
    end)
tpcustom1 = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-tpcordsss")
 tpcustom1:SetHorizontalAlignment(HorizontalAlignment.Center)
 tpcustom1:SetVerticalAlignment(VerticalAlignment.Center)
        --tpcustom1:SetTextHorzAlign(HorizontalAlignment.Center)
        --tpcustom1:SetTextVertAlign(VerticalAlignment.Center)
        tpcustom1:SetHeight({ 0, 50 })
        tpcustom1:SetWidth({ 0, 140 })
        tpcustom1:SetLevel(1)
        tpcustom1:SetTouchable(true)
        layout_main:AddChildWindow(tpcustom1)
        tpcustom1:SetText("tp hns")
        tpcustom1:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        tpcustom1:SetVisible(true)
        tpcustom1:SetYPosition({ 0, 305 })
        tpcustom1:SetXPosition({ 0, 380 })
        tpcustom1:registerEvent(GUIEvent.ButtonClick, function()
        customtp()
    end)
closep = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-panelpokicoded")
 closep:SetHorizontalAlignment(HorizontalAlignment.Center)
 closep:SetVerticalAlignment(VerticalAlignment.Center)
        --closep:SetTextHorzAlign(HorizontalAlignment.Center)
        --closep:SetTextVertAlign(VerticalAlignment.Center)
        closep:SetHeight({ 0, 50 })
        closep:SetWidth({ 0, 140 })
        closep:SetLevel(1)
        closep:SetTouchable(true)
        layout_main:AddChildWindow(closep)
        closep:SetText("close panel")
        closep:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        closep:SetVisible(true)
        closep:SetYPosition({ 0, 195 })
        closep:SetXPosition({ 0, 680 })
        closep:registerEvent(GUIEvent.ButtonClick, function()
        closepanel()
    end)
panelopen = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-panelopenolol")
 panelopen:SetHorizontalAlignment(HorizontalAlignment.Center)
 panelopen:SetVerticalAlignment(VerticalAlignment.Center)
        --panelopen:SetTextHorzAlign(HorizontalAlignment.Center)
        --panelopen:SetTextVertAlign(VerticalAlignment.Center)
        panelopen:SetHeight({ 0, 50 })
        panelopen:SetWidth({ 0, 140 })
        panelopen:SetLevel(1)
        panelopen:SetTouchable(true)
        GUISystem.Instance():GetRootWindow():AddChildWindow(panelopen)
        panelopen:SetText(".")
        panelopen:SetBackgroundColor({0, 0, 0, 0})
        panelopen:SetVisible(true)
        panelopen:SetYPosition({ 0, -330 })
        panelopen:SetXPosition({ 0, -321 })
        panelopen:registerEvent(GUIEvent.ButtonClick, function()
        panel()
    end)    
paneltheme1 = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-panelthemesuka")
 paneltheme1:SetHorizontalAlignment(HorizontalAlignment.Center)
 paneltheme1:SetVerticalAlignment(VerticalAlignment.Center)
        --paneltheme1:SetTextHorzAlign(HorizontalAlignment.Center)
        --paneltheme1:SetTextVertAlign(VerticalAlignment.Center)
        paneltheme1:SetHeight({ 0, 50 })
        paneltheme1:SetWidth({ 0, 140 })
        paneltheme1:SetLevel(1)
        paneltheme1:SetTouchable(true)
        layout_main:AddChildWindow(paneltheme1)
        paneltheme1:SetText("repawn v2")
        paneltheme1:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        paneltheme1:SetVisible(true)
        paneltheme1:SetYPosition({ 0, 250 })
        paneltheme1:SetXPosition({ 0, 680 })
        paneltheme1:registerEvent(GUIEvent.ButtonClick, function()
        theme()
    end)
paneltheme2 = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-panelthemesheme")
 paneltheme2:SetHorizontalAlignment(HorizontalAlignment.Center)
 paneltheme2:SetVerticalAlignment(VerticalAlignment.Center)
        --paneltheme2:SetTextHorzAlign(HorizontalAlignment.Center)
        --paneltheme2:SetTextVertAlign(VerticalAlignment.Center)
        paneltheme2:SetHeight({ 0, 50 })
        paneltheme2:SetWidth({ 0, 140 })
        paneltheme2:SetLevel(1)
        paneltheme2:SetTouchable(true)
        layout_main:AddChildWindow(paneltheme2)
        paneltheme2:SetText("panel hide")
        paneltheme2:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        paneltheme2:SetVisible(true)
        paneltheme2:SetYPosition({ 0, 305 })
        paneltheme2:SetXPosition({ 0, 680 })
        paneltheme2:registerEvent(GUIEvent.ButtonClick, function()
        theme2()
    end) 
name = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-namenigha")
 name:SetHorizontalAlignment(HorizontalAlignment.Center)
 name:SetVerticalAlignment(VerticalAlignment.Center)
        --name:SetTextHorzAlign(HorizontalAlignment.Center)
        --name:SetTextVertAlign(VerticalAlignment.Center)
        name:SetHeight({ 0, 50 })
        name:SetWidth({ 0, 140 })
        name:SetLevel(1)
        name:SetTouchable(true)
        layout_main:AddChildWindow(name)
        name:SetText("name")
        name:SetBackgroundColor({0.0, 0.0, 0.0, 1.0})
        name:SetVisible(true)
        name:SetYPosition({ 0, 360 })
        name:SetXPosition({ 0, 380 })
        name:registerEvent(GUIEvent.ButtonClick, function()
        name()
    end)
        
--====================functions============================-
function rain()
UIHelper.showToast("^00FF00Sky On")
HostApi.setSky("yu")
end
function Evening()
   UIHelper.showToast("^00FF00Sky ON") 
   HostApi.setSky("Wanxia")
end
function Night()
   UIHelper.showToast("^00FF00Sky ON")
   HostApi.setSky("fanxing")
end

function Snow() 
   UIHelper.showToast("^00FF00Sky ON")
   HostApi.setSky("xue")
end
function Sunny()
UIHelper.showToast("^00FF00Sky ON")
HostApi.setSky("liuxing")
end
function Christmas()
UIHelper.showToast("^00FF00Sky ON")
HostApi.setSky("qing")
end
function ttbtn()
GUIManager:showWindowByName("Main-throwpot-Controls")
    GUIManager:getWindowByName("Main-throwpot-Controls"):SetVisible(true)
    UIHelper.ShowToast("^FF00EETnt tag gui on")
end
function Info1() 
     
    GMHelper:openInput({ "Enter player name" }, function(input)
        local ps = PlayerManager:getPlayers()
        local res = ""

        for _, p in ipairs(ps) do
            if string.find(p.name, input, 1, true) then
                res = res .. string.format("Name: %s\nSex: %s\nID: %s\n\n", p.name, p:getSex(), p.userId)
            end
        end

        if res ~= "" then
            ClientHelper.onSetClipboard(res)
        end
    end)
end  
function guibtn() 
local buttonCount = 0
UIHelper.showToast("^00FF00Button coordinater on")
local function createButton(x, y, name)
    local newButton = GUIManager:createGUIWindow(GUIType.Button, name)
    newButton:SetText("Button (" .. buttonCount .. ")")
    newButton:SetHeight({ 0, 50 })
    newButton:SetWidth({ 0, 140 })
    newButton:SetTouchable(true)
    newButton:SetXPosition({ 0, x })
    newButton:SetYPosition({ 0, y })
    newButton:SetBackgroundColor({ 0.1, 0.7, 0.3, 0.8 })

    GUISystem.Instance():GetRootWindow():AddChildWindow(newButton)

    newButton:registerEvent(GUIEvent.ButtonClick, function()
        UIHelper.showToast("^00FF00 Button " .. buttonCount .. " Pressed!")
    end)
end

local mainButton = GUIManager:createGUIWindow(GUIType.Button, "GUIRoot-MainButton")
mainButton:SetText("Create Button")
mainButton:SetHeight({ 0, 50 })
mainButton:SetWidth({ 0, 140 })
mainButton:SetTouchable(true)
mainButton:SetXPosition({ 0, 200 })
mainButton:SetYPosition({ 0, 100 })
mainButton:SetBackgroundColor({ 0.8, 0.2, 0.2, 0.8 })

GUISystem.Instance():GetRootWindow():AddChildWindow(mainButton)

mainButton:registerEvent(GUIEvent.ButtonClick, function()
    GMHelper:openInput({ "Enter X coordinate" }, function(xInput)
        local x = tonumber(xInput) or 0
        LuaTimer:schedule(function()
            GMHelper:openInput({ "Enter Y coordinate" }, function(yInput)
                local y = tonumber(yInput) or 0
                buttonCount = buttonCount + 1
                local buttonName = "GUIRoot-DynamicButton" .. buttonCount
                createButton(x, y, buttonName)
            end)
        end, 100)
    end)
end)
end
function spin()
    GMHelper:openInput({""}, function(n1)
        PlayerManager:getClientPlayer().Player.m_rotateSpeed = n1
        UIHelper.showToast("^FF00EEStart")
    end)
end

function Render()
    GMHelper:openInput({""}, function(Number)
        ClientHelper.putIntPrefs("BlockRenderDistance", Number)
        UIHelper.showToast("^00FF00Changed")
    end)
end 
function spawnb()
    GMHelper:openInput({""}, function(martin)
        local blockPos = PlayerManager:getClientPlayer():getPosition()
        EngineWorld:setBlock(blockPos, martin)
    end)
    UIHelper.showToast("^00FF00block spawn successful")
end
function clouds()
    ClientHelper.putBoolPrefs("DisableRenderClouds", true)
	UIHelper.showToast("^FF0000Clouds Stop")
end
function hidechat()
 local A = false  
 
function hidechat()
    A = not A  

    if A then
        GUIManager:getWindowByName("Main-Chat-Message"):SetVisible(false) 
        UIHelper.showToast("^00FF00hide chat on")
    else
        GUIManager:getWindowByName("Main-Chat-Message"):SetVisible(true) 
        UIHelper.showToast("^00FF00hide chat off")
    end
end
end  
--Shizzy i miss u.... 
function Parachutev2() 

parachuteEnabled = not parachuteEnabled
LuaTimer:cancel(parachuteTimer)
UIHelper.showToast("^FF0000Parachute OFF")

if parachuteEnabled then
     UIHelper.showToast("^00FF00Parachute ON")
    parachuteTimer = LuaTimer:scheduleTimer(function()
        local player = PlayerManager:getClientPlayer()
        if player and player.Player then
            player.Player:startParachute()
        end
        
    end, 0.1, -1) 
end  
end  
function Tptogirls()
local players = PlayerManager:getPlayers()
local found = false
for _, player in pairs(players) do
    if player.Player:getSex() ~= 1 then
        local position = player.Player:getPosition()
        position.y = position.y + 2
        PlayerManager:getClientPlayer().Player:setPosition(position)
        found = true
    end
end
if not found then
    UIHelper.showToast("No girls dickhead")
end
end 
function ytppara()
local player = PlayerManager:getClientPlayer()
if player and player.Player then
    local pos = player.Player:getPosition()
    player.Player:setPosition(VectorUtil.newVector3(pos.x, pos.y + 7, pos.z))
    player.Player:startParachute()
    UIHelper.showToast("^00FF00Parachute ON")
end
end
function music() 
local descrip = [[
^FF0000Music Tab^000000
^FFFFFFControl the in-game music with ease. ^FF0000Play, ^FFFFFFpause, ^FF0000stop, or ^FFFFFFcustomize your soundtracks seamlessly. ^FFFFFFEnhance your gaming experience with personalized audio settings.

^FF0000Vibe Playlist^000000
^FFFFFFSet the mood with smooth, relaxing beats. Perfect for chilling and unwinding during your gameplay.

^FF0000Phonk Playlist^000000
^FFFFFFAmp up the intensity with dark, gritty, and energetic phonk tracks. Ideal for when you need that high-energy boost!
]]
local btn = "^00FF00Ok"
    local title = "music"

    CustomDialog.builder()
        .setContentText(descrip)
        .setRightText(btn)
        .setTitleText(title)
        .setHideLeftButton()
        .setPanelSize(600, 450)
        .show()
end  
function credits()
    local txt = [[
^FFFF00Texture credits^FFFFFF: skull
^B22222Yt Channel ^FFFFFF= @aeteambg
^0000CDDc^FFFFFF: Ray cest
Give credits when promoted



Copy info credits ^00FF00shader
]]

    local btn = "^00FF00Ok"
    local title = "Owner INFO"

    CustomDialog.builder()
        .setContentText(txt)
        .setRightText(btn)
        .setTitleText(title)
        .setHideLeftButton()
        .setPanelSize(600, 450)
        .show()

    local msg = [[
^00FF00
        Aeteam        
       Aeteam         
      Aeteam          
     Aeteam           
    Aeteam            
   Aeteam             
  Aeteam              
 Aeteam               
Aeteam                
 Aeteam               
  Aeteam              
   Aeteam             
    Aeteam            
     Aeteam           
      Aeteam          
       Aeteam         
        Aeteam      
]]

    MsgSender.sendMsg(msg)
end
function vibe()
SoundUtil.playSound(312)
UIHelper.showToast("^00FF00Now playing vibe Playlist.")
end
function phonk()
UIHelper.showToast("^00FF00Now playing Phonk Playlist")
SoundUtil.playSound(320)
end  
function msic()
local player = PlayerManager:getClientPlayer()
 if player and player.Player then
 player.Player:startParachute()
 end
UIHelper.showToast("^00FF00music stop")
end
function Util()
local text = [[
^FF0000Utilities Hacks^000000

Utilities hacks typically refer to tools or features that enhance functionality, often by bypassing certain limitations or adding new capabilities. These tools empower developers and administrators to optimize performance and streamline processes
]]
local btn = "^00FF00Ok"
local heading = "utilities"
    CustomDialog.builder()
        .setContentText(text)
        .setRightText(btn)
        .setTitleText(heading) 
        .setHideLeftButton()
        .setPanelSize(600, 450)
        .show()
end

                                    ----------
local function setPosTest(targetPos)
    if targetPos.y < 10 then return end

    local clientPlayer = PlayerManager:getClientPlayer().Player
    local myPos = clientPlayer:getPosition()
    local disTp = { x = targetPos.x - myPos.x, z = targetPos.z - myPos.z }

    if myPos.y < 165 then
        myPos.y = 165
    end

    if math.abs(disTp.x) > 18 then
        if disTp.x > 0 then
            myPos.x = myPos.x + 18
        else
            myPos.x = myPos.x - 18
        end
        clientPlayer:setPosition(myPos)
        LuaTimer:scheduleTimer(function()
            setPosTest(targetPos)
        end, 100, 1)
        return
    end

    if math.abs(disTp.z) > 18 then
        if disTp.z > 0 then
            myPos.z = myPos.z + 18
        else
            myPos.z = myPos.z - 18
        end
        clientPlayer:setPosition(myPos)
        LuaTimer:scheduleTimer(function()
            setPosTest(targetPos)
        end, 100, 1)
        return
    end

    local function checkBlock(pos)
        while EngineWorld:getBlockId(pos) ~= BlockID.AIR do
            pos.y = pos.y + 1
            if pos.y > 256 then break end
        end
        return pos
    end

    targetPos = checkBlock(targetPos)
    clientPlayer:setPosition(targetPos)

    local player = PlayerManager:getClientPlayer().Player
    player:setAllowFlying(false)
    player:setFlying(false)
end

function tptoredsr()
    local targetPos = VectorUtil.newVector3(64, 24, 445)
    setPosTest(targetPos)
end

function tptobluesr()
    local targetPos = VectorUtil.newVector3(127, 29, 383)
    setPosTest(targetPos)
end

function tpgreensr()
    local targetPos = VectorUtil.newVector3(128, 24, 506)
    setPosTest(targetPos)
end

function tpyellowsr()
    local targetPos = VectorUtil.newVector3(190, 24, 446)
    setPosTest(targetPos)
end
function customtp()
   local targetPos = VectorUtil.newVector3(185, 98, 411)
   setPosTest(targetPos)
end  
function Respawn1()
PacketSender:getSender():sendRebirth()
     UIHelper.showToast("^00FF00Respawn")
end
function tp()
local positionUpdateEnabled = false
local positionUpdateTimer = nil

function findPlayerByName(name)
    local players = PlayerManager:getPlayers()
    for _, player in ipairs(players) do
        if string.find(player.name, name, 1, true) then
            return player
        end
    end
    return nil
end

GMHelper:openInput({ "Enter player name" }, function(inputName)
    local targetPlayer = findPlayerByName(inputName)
    if not targetPlayer then
        UIHelper:showToast("Player not found!")
        return
    end

    positionUpdateEnabled = not positionUpdateEnabled
    
    if positionUpdateEnabled then
        positionUpdateTimer = LuaTimer:scheduleTimer(function()
            local position = targetPlayer.Player:getPosition()
            position.y = position.y + 2
            PlayerManager:getClientPlayer().Player:setPosition(position)
            UIHelper:showToast("Position update ON")
        end, 2, -1)
    else
        UIHelper:showToast("Position update OFF")
    end
end)
end 
function Visual()
local txt = [[
^FF0000     Sky box     ^FFFFFF
sky box are the ^000000visual^FFFFFF hacks that changes sky for user (you) there are 6 variants of it
^000000-Sunny
^000000-Christmas
^000000-evenning
^000000-night
^000000-snow
^000000-rain
            ]]
local btn = "^00FF00Ok"
local heading = "Sky Box"
    CustomDialog.builder()
     .setHideLeftButton()
     .setPanelSize(600, 450)
     .setRightText(btn)
     .setContentText(txt)
     .setTitleText(heading)
     .show()
end
function Movement()
local txt = [[
^FF0000Movement Hacks^000000

The Movement Hacks tab offers advanced mobility tools designed to enhance player movement, bypass restrictions, and unlock new traversal possibilities. Whether you're exploring vast environments or seeking an edge in dynamic scenarios, these features provide seamless and efficient control.
]]
local btn = "^00FF00Ok"
local heading = "^FF0000Movement^FFFFFF"
    CustomDialog.builder()
    .setPanelSize(600, 450)
    .setHideLeftButton()
    .setContentText(txt)
    .setRightText(btn)
    .setTitleText(heading)
    .show()
end
function Player()
local txt = [[
^FF0000Player Hacks^000000

The Player Hacks tab provides powerful tools to enhance character capabilities, customize gameplay, and gain a competitive edge. These features focus on player-centric improvements for a superior experience.
]]
local btn = "^00FF00Ok"
local heading = "^FF0000Player^FFFFFF"
 CustomDialog.builder()
 .setPanelSize(600, 450)
 .setHideLeftButton()
 .setRightText(btn)
 .setContentText(txt)
 .setTitleText(heading)
 .show()
end
function Info()
local txt = [[
^FF0000Info (Credit) Tab^000000

The Info (Credit) tab is designed to provide essential information and recognize the creators, contributors, and developers behind the panel. This tab ensures transparency and gives proper acknowledgment for the work involved.
]]
local btn = "^00FF00Ok"
local heading = "^000000Info^FFFFFF"
  CustomDialog.builder()
  .setPanelSize(600, 450)
  .setHideLeftButton()
  .setRightText(btn)
  .setContentText(txt)
  .setTitleText(heading)
  .show()
end
function Combat()
local txt = [[
^FF0000Combat Hacks^000000

The Combat Hacks tab delivers powerful tools to dominate battles, enhance your offensive and defensive capabilities, and ensure you always have the upper hand. Perfect for those looking to maximize their combat efficiency and gameplay impact.
]]
local btn = "^00FF00Ok"
local heading = "^000000Combat^FFFFFF"
  CustomDialog.builder()
  .setPanelSize(600, 450)
  .setHideLeftButton()
  .setRightText(btn)
  .setContentText(txt)
  .setTitleText(heading)
  .show()
end
function closepanel()
 layout_main:SetVisible(false)
  UIHelper.showToast("Panel close")
 SoundUtil.playSound(5) 
end

--j <3 fking missing u
function panel()
if not Is_Open then
        Is_Open = true
        layout_main:SetVisible(true)
        local scale = 0.5
        layout_main:SetScale(VectorUtil.newVector3(scale, scale, scale))
        LuaTimer:scheduleTicker(function()
            if scale < 0.98 then   
                scale = scale + 0.05 
                layout_main:SetScale(VectorUtil.newVector3(scale, scale, scale))
            end
        end, 1, 10)
        SoundUtil.playSound(4)
    else
        local scale = 0.94  
        LuaTimer:scheduleTicker(function()
            if scale > 0.5 then
                scale = scale - 0.09  
                layout_main:SetScale(VectorUtil.newVector3(scale, scale, scale))
            else
                layout_main:SetVisible(false)
                Is_Open = false  
            end
        end, 1, 10)
        SoundUtil.playSound(5)
    end
end   
function theme() 
local player = PlayerManager:getClientPlayer()
    local packets = 0

    for i = 1, 1500 do
        player:sendPacket({
            pid = "onClickVipRespawn"
        })
        packets = packets + 1
    end

    UIHelper.showToast("packet send")
end
function theme2() 
layout_main:SetVisible(false)
open_lay:SetVisible(false)
cannonWindow:SetVisible(false)
parachuteWindow:SetVisible(false)
timeDisplay:SetVisible(false)
dateDisplay:SetVisible(false)
end
function name()
UIHelper.showToast("^FF0000NAME ^FFFFFFon")
local player = PlayerManager:getClientPlayer().Player
local label = "▥Skull"
local devTag = "[[[Astral]"
local tick = 0

local function rainbowColor(hue)
    local r = math.floor(127 + 127 * math.sin(math.rad(hue)))
    local g = math.floor(127 + 127 * math.sin(math.rad(hue + 120)))
    local b = math.floor(127 + 127 * math.sin(math.rad(hue + 240)))
    return string.format("%06X", (r << 16) | (g << 8) | b)
end

local nameTimer
nameTimer = LuaTimer:scheduleTimer(function()
    local color = rainbowColor(tick)
    local coloredTag = "▢" .. color .. devTag
    player:setShowName(coloredTag .. label)
    tick = (tick + 10) % 360
end, 100, -1)
end