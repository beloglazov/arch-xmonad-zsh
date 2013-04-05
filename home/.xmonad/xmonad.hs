import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Layout.ThreeColumns
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig

myLayout = tiled ||| Full ||| ThreeCol 1 (3/100) (1/3)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

myModMask = mod4Mask

main = do
	xmonad $ ewmh defaultConfig
		{ layoutHook = smartBorders $ myLayout
		, terminal		= "urxvtc"
		, modMask		= myModMask
		, borderWidth		= 2
		, normalBorderColor	= "#0c0d0e"
		, focusedBorderColor	= "#333333"
		, handleEventHook	= fullscreenEventHook
		}
		`additionalKeys`
                 [ ((myModMask, xK_a), spawn "date +'%c' | dzen2 -p 2 -fn '-*-terminus-bold-*-*-*-28-*-*-*-*-*-*-*' -bg '#0c0d0e' -fg '#7f8f9f'")
		 , ((myModMask, xK_w), spawn "acpi -b | dzen2 -p 2 -fn '-*-terminus-bold-*-*-*-28-*-*-*-*-*-*-*' -bg '#0c0d0e' -fg '#7f8f9f'")
                 , ((myModMask, xK_e), spawn "e")
                 , ((myModMask, xK_o), spawn "dmenu-edit")
                 , ((myModMask, xK_u), spawn "dmenu-urxvt")
		 , ((myModMask, xK_p), spawn "dmenu-run")
                 , ((myModMask, xK_Right), windows W.focusDown)
                 , ((myModMask, xK_Left),  windows W.focusUp)
                 , ((myModMask, xK_Down),  sendMessage Shrink)
                 , ((myModMask, xK_Up),    sendMessage Expand)
                 , ((myModMask, xK_l), 	   windows W.focusDown)
                 , ((myModMask, xK_j),     windows W.focusUp)
                 , ((myModMask, xK_k),     sendMessage Shrink)
                 , ((myModMask, xK_i),     sendMessage Expand)
                 , ((myModMask .|. mod3Mask, xK_l), windows W.focusDown)
                 , ((myModMask .|. mod3Mask, xK_j), windows W.focusUp)
                 , ((myModMask .|. mod3Mask, xK_k), sendMessage Shrink)
                 , ((myModMask .|. mod3Mask, xK_i), sendMessage Expand)
                 , ((myModMask .|. shiftMask, xK_Right), windows W.swapDown)
                 , ((myModMask .|. shiftMask, xK_Left),  windows W.swapUp)
                 , ((myModMask .|. shiftMask, xK_Down),  sendMessage (IncMasterN (-1)))
                 , ((myModMask .|. shiftMask, xK_Up),    sendMessage (IncMasterN 1))
                 , ((myModMask .|. shiftMask, xK_l), 	 windows W.swapDown)
                 , ((myModMask .|. shiftMask, xK_j),  	 windows W.swapUp)
                 , ((myModMask .|. shiftMask, xK_k),  	 sendMessage (IncMasterN (-1)))
                 , ((myModMask .|. shiftMask, xK_i),     sendMessage (IncMasterN 1))
		 , ((myModMask .|. shiftMask, xK_F9), 	 spawn "suspend-to-mem")
		 , ((myModMask .|. shiftMask, xK_F10), 	 spawn "slock")
		 , ((myModMask .|. shiftMask, xK_F11), 	 spawn "reboot")
		 , ((myModMask .|. shiftMask, xK_F12), 	 spawn "shutdown")
                 , ((myModMask, xK_s), screenWorkspace 1 >>= flip whenJust (windows . W.view))
                 , ((myModMask, xK_d), screenWorkspace 0 >>= flip whenJust (windows . W.view))
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
