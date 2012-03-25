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

main = do
	xmonad $ ewmh defaultConfig
		{ layoutHook = smartBorders $ layoutHook defaultConfig
		, terminal		= "urxvt"
		, modMask		= mod4Mask
		, borderWidth		= 2
		, normalBorderColor	= "#0c0d0e"
		, focusedBorderColor	= "#333333"
		, handleEventHook	= fullscreenEventHook		
		}
		`additionalKeys`
                 [ ((mod4Mask, xK_a), spawn "date +'%c' | dzen2 -p 2 -fn '-*-terminus-bold-*-*-*-28-*-*-*-*-*-*-*' -bg '#0c0d0e' -fg '#7f8f9f'")
                 , ((mod4Mask, xK_o), spawn "/home/anton/repos/dmenu-tools/dmenu-edit")
                 , ((mod4Mask .|. controlMask, xK_Down), spawn "amixer set Master 1-")
                 , ((mod4Mask .|. controlMask, xK_Up  ), spawn "amixer set Master 1+")
                 , ((mod4Mask, xK_Right), windows W.focusDown)
                 , ((mod4Mask, xK_Left),  windows W.focusUp  )
                 , ((mod4Mask, xK_Down),  sendMessage Shrink)
                 , ((mod4Mask, xK_Up),    sendMessage Expand)
                 ]
                 `additionalKeysP`
                 [ ("M-S-a", kill)
                 , ("M-<Insert>", spawn "amixer -q set Front toggle")
                 , ("M-<Page_Up>", spawn "amixer -q set Front 5%+")
                 , ("M-<Page_Down>", spawn "amixer -q set Front 5%-")
                 
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
