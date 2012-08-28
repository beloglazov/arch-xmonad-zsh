import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig

myLayout = tiled ||| Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100


main = do
	xmonad $ ewmh defaultConfig
		{ layoutHook = smartBorders $ myLayout
		, terminal		= "urxvtc"
		, modMask		= mod3Mask
		, borderWidth		= 2
		, normalBorderColor	= "#0c0d0e"
		, focusedBorderColor	= "#333333"
		, handleEventHook	= fullscreenEventHook
		}
		`additionalKeys`
                 [ ((modMask, xK_a), spawn "date +'%c' | dzen2 -p 2 -fn '-*-terminus-bold-*-*-*-28-*-*-*-*-*-*-*' -bg '#0c0d0e' -fg '#7f8f9f'")
                 , ((modMask, xK_e), spawn "e")
                 , ((modMask, xK_o), spawn "dmenu-edit")
                 , ((modMask, xK_u), spawn "dmenu-urxvt")
		 , ((modMask, xK_p), spawn "dmenu-run")
                 , ((modMask, xK_Right), windows W.focusDown)
                 , ((modMask, xK_Left),  windows W.focusUp)
                 , ((modMask, xK_Down),  sendMessage Shrink)
                 , ((modMask, xK_Up),    sendMessage Expand)
                 , ((modMask .|. shiftMask, xK_Right), windows W.swapDown)
                 , ((modMask .|. shiftMask, xK_Left),  windows W.swapUp)
                 , ((modMask .|. shiftMask, xK_Down), sendMessage (IncMasterN (-1)))
                 , ((modMask .|. shiftMask, xK_Up),   sendMessage (IncMasterN 1))
		 , ((modMask .|. shiftMask, xK_F10), spawn "slock")
		 , ((modMask .|. shiftMask, xK_F11), spawn "reboot")
		 , ((modMask .|. shiftMask, xK_F12), spawn "shutdown")
                 ]
                 `additionalKeysP`
                 [ ("M-S-a", kill)
                 , ("M-<Insert>", spawn "amixer -q set Master toggle")
                 , ("M-<Page_Up>", spawn "amixer set Master 1+")
                 , ("M-<Page_Down>", spawn "amixer set Master 1-")

                 , ("M-z", windows $ W.greedyView "1")
                 , ("S-M-z", windows $ W.shift "1")
                 , ("M-x", windows $ W.greedyView "2")
                 , ("S-M-x", windows $ W.shift "2")
                 , ("M-c", windows $ W.greedyView "3")
                 , ("S-M-c", windows $ W.shift "3")
                 , ("M-v", windows $ W.greedyView "4")
                 , ("S-M-v", windows $ W.shift "4")
                 , ("M-b", windows $ W.greedyView "5")
                 , ("S-M-b", windows $ W.shift "5")
                 ]
