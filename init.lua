-- Requires, this could easily add pretty advanced packages
inspect = require 'inspect'

-- Current application hotkeys set
-- 'G', openchrome
-- 'R', openrdp
-- 'I', openireport
-- 'Q', openqtcreator
-- 'V', openvim
-- 'D', openterminal
-- 'E', find something new for openatom
-- 'E', opengimp
-- 'H', opentortoise
-- 'M', opensonos
-- 'J', openhipchat
-- 'P', openpgadmin
-- 'O', openmail
-- 'N', openfinder
-- 'L', openlibre
-- 'K', openkitematic

local grid = require "hs.grid"
local hotkey = require "hs.hotkey"
--------------------------------------------------------------------------------
-- CONSTANTS
--------------------------------------------------------------------------------
local cmd_alt = {"cmd", "alt"}
local cmd_shift = {"cmd", "shift"}
local hyper = {"cmd", "alt", "ctrl"}
local easykey = {"cmd", "ctrl"}
local yay = "ᕙ(⇀‸↼‶)ᕗ reloaded"


hotkey.bind(cmd_alt, 'N', grid.pushWindowNextScreen)
hotkey.bind(cmd_alt, 'P', grid.pushWindowPrevScreen)

--------------------------------------------------------------------------------
-- RELOAD
--------------------------------------------------------------------------------
hotkey.bind(hyper, "C", function()
    hs.reload()
    --hs.alert("Reloaded ^_^")
    -- hs.alert(yay) -- I do not know why these won't print to the screen
    -- but I've added a hs.alert(yay) to the bottom and it will do the job
end)

--------------------------------------------------------------------------------
-- WINDOW HINTS
--------------------------------------------------------------------------------
hotkey.bind({"ctrl"},";",hs.hints.windowHints)

--------------------------------------------------------------------------------
-- OPEN CONSOLE
--------------------------------------------------------------------------------
hotkey.bind(hyper, "X", function()
    hs.openConsole()
    hs.focus()
end)

--------------------------------------------------------------------------------
-- CHANGE FOCUS
--------------------------------------------------------------------------------
-- hotkey.bind({"ctrl"}, "L", function()
--     local win = hs.window.focusedWindow()
--     win:focusWindowEast()
--     local f = win:frame()
--     -- make it so that I can move the mouse to the center of this window
-- --    local screen = win:screen()
-- --    local max = screen:frame()
-- --    local a = {}
-- --    a.x = max.x / 2 -- this isn't good but it does move the mouse
-- --    a.y = max.y / 2
-- --    hs.mouse.setAbsolutePosition(a)
-- end)
--
-- hotkey.bind({"ctrl"}, "H", function()
--     local win = hs.window.focusedWindow()
--     win:focusWindowWest()
-- end)
--
-- hotkey.bind({"ctrl"}, "K", function()
--     local win = hs.window.focusedWindow()
--     win:focusWindowNorth()
-- end)
--
-- hotkey.bind({"ctrl"}, "J", function()
--     local win = hs.window.focusedWindow()
--     win:focusWindowSouth()
-- end)

--------------------------------------------------------------------------------
-- WINDOW MOVEMENT
--------------------------------------------------------------------------------
hotkey.bind(hyper, "M", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

hotkey.bind(hyper, "N", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    -- local max = screen:frame()

    f.x = 223
    f.y = 196
    f.w = 1467
    f.h = 696
    win:setFrame(f)
end)

hotkey.bind(hyper, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

hotkey.bind(hyper, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2 + 9
  win:setFrame(f)
end)

hotkey.bind(hyper, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hotkey.bind(hyper, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

local laptopScreen = "Color LCD"
local windowLayout = {
    {"Google Chrome",  nil,          laptopScreen, hs.layout.left50,    nil, nil},
    {"MacVim",    nil,          laptopScreen, hs.layout.right50,   nil, nil},
    {"iTunes",  "iTunes",     laptopScreen, hs.layout.maximized, nil, nil},
    {"iTunes",  "MiniPlayer", laptopScreen, nil, nil, hs.geometry.rect(0, -48, 400, 48)},
}
-- > for _, i in pairs(hs.screen.allScreens()) do print(i:id()) end :: this was the command and it returned those two ids which will probbaly come in handy
-- something like hs.screen(47821613) will find the left monitor
-- 478216137
-- 478215722
-- hs.layout.apply(windowLayout)

-- EXTRA :) -- These are really good CHROME/DEVTOOLS
hotkey.bind(cmd_alt, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w * 7 / 12
  f.h = max.h
  win:setFrame(f)
end)

hotkey.bind(cmd_alt, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * 7 / 12)
  f.y = max.y
  f.w = max.w * 5 / 12
  f.h = max.h
  win:setFrame(f)
end)

hotkey.bind(cmd_alt, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h * 3 / 4
  win:setFrame(f)
end)

--------------------------------------------------------------------------------
-- Creating a simple menubar item
--------------------------------------------------------------------------------
local caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("AWAKE")
    else
        caffeine:setTitle("SLEEPY")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

--------------------------------------------------------------------------------
-- APPLICATION FOCUS MOVEMENT
--------------------------------------------------------------------------------
local function opengimp()
    hs.application.launchOrFocus("Gimp")
end

local function openrdp()
    hs.application.launchOrFocus("Microsoft Remote Desktop")
end

local function openchrome()
    hs.application.launchOrFocus("Google Chrome")
end

local function openterminal()
    hs.application.launchOrFocus("iTerm")
end

local function openatom()
    hs.application.launchOrFocus("/Applications/Atom.app")
end

local function opentortoise()
    hs.application.launchOrFocus("TortoiseHg")
end

local function opensonos()
    hs.application.launchOrFocus("Sonos")
end

local function openhipchat()
    hs.application.launchOrFocus("HipChat")
end

local function openvim()
    hs.application.launchOrFocus("MacVim")
end

local function openqtcreator()
    hs.application.launchOrFocus("Qt Creator")
end

local function openireport()
    hs.application.launchOrFocus("iReport")
end

local function openpgadmin()
    hs.application.launchOrFocus("pgAdmin 4")
end

local function openmail()
    hs.application.launchOrFocus("Mail")
end

local function openfinder()
    hs.application.launchOrFocus("Finder")
end

local function openlibre()
    hs.application.launchOrFocus("LibreOffice")
end

local function openkitematic()
    -- hs.application.launchOrFocus("Kitematic (Beta)")
    hs.application.launchOrFocus("DockStation")
end

hotkey.bind(easykey, 'G', openchrome)
hotkey.bind(easykey, 'R', openrdp)
hotkey.bind(easykey, 'I', openireport)
hotkey.bind(easykey, 'Q', openqtcreator)
hotkey.bind(easykey, 'V', openvim) --macvim
hotkey.bind(easykey, 'D', openterminal)
hotkey.bind(easykey, 'E', openatom)
hotkey.bind(easykey, 'U', opengimp)
hotkey.bind(easykey, 'H', opentortoise)
hotkey.bind(easykey, 'M', opensonos)
hotkey.bind(easykey, 'J', openhipchat)
hotkey.bind(easykey, 'P', openpgadmin)
hotkey.bind(easykey, 'O', openmail)
hotkey.bind(easykey, 'N', openfinder)
hotkey.bind(easykey, 'L', openlibre)
hotkey.bind(easykey, 'K', openkitematic)

--------------------------------------------------------------------------------
-- USEFUL TIDBITS IVE LEARNED ABOUT LUA / HS
--------------------------------------------------------------------------------
-- for _, i in ipairs(hs.application.runningApplications()) do print(i) end


-- This is an experiment to see how using hammerspoon://ramentime in alfred word, it works!
-- make sure MAKE SURE to type hammerspoon:// LOWER CASE
-- I really like that I am also able to use open hammerspoon://ramentime to access this function
-- RAMEN TIMER THROUGH ALFRED --
function startRamenTimer()
    hs.timer.doAfter(3, function()
        hs.notify.new({
            title="Ramen time!",
            informatieText="Your ramen is ready!"
        }):send()
    end)
    hs.alert("Ramen timer started!")
end

function randomReviewer()
    local reviewers = { 'John', 'Kevin', 'Chris', 'Ryan', 'Kendall', 'Jonathan' }
    hs.alert(reviewers[math.random(#reviewers)])
end

hs.urlevent.bind("ramentime",startRamenTimer)
hs.urlevent.bind("who", randomReviewer)


----------------------- Addition window movements

hotkey.bind(hyper, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

hotkey.bind(hyper, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2 + 9
  win:setFrame(f)
end)

hotkey.bind(hyper, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hotkey.bind(hyper, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.alert(yay)
