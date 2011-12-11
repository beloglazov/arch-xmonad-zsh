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
--                 , ((mod4Mask, xK_b), withFocused toggleBorder)
                 , ((mod4Mask .|. controlMask, xK_Down), spawn "amixer set Master 1-")
                 , ((mod4Mask .|. controlMask, xK_Up  ), spawn "amixer set Master 1+")
                 , ((mod4Mask, xK_Right), windows W.focusDown)
                 , ((mod4Mask, xK_Left),  windows W.focusUp  )
                 , ((mod4Mask, xK_Down),  sendMessage Shrink)
                 , ((mod4Mask, xK_Up),    sendMessage Expand)
                 , ((mod4Mask, xK_q), spawn "/home/anton/.cabal/bin/xmonad --recompile && /home/anton/.cabal/bin/xmonad --restart")
                 ]
                 `additionalKeysP`
                 [ ("<XF86AudioMute>", spawn "amixer -q set Front toggle")
                 , ("M-m", spawn "xmessage 'Hi'")
                 , ("M-<Page_Up>", spawn "amixer -q set Front 10%+")
                 , ("M-<Page_Down>", spawn "amixer -q set Front 10%-")
                 
                 , ("<XF86WWW>", windows $ W.greedyView "1")
                 , ("S-<XF86WWW>", windows $ W.shift "1")
                 , ("<XF86Mail>", windows $ W.greedyView "2")
                 , ("S-<XF86Mail>", windows $ W.shift "2")
                 , ("<XF86Messenger>", windows $ W.greedyView "3")
                 , ("S-<XF86Messenger>", windows $ W.shift "3")
                 , ("<XF86Launch1>", windows $ W.greedyView "4")
                 , ("S-<XF86Launch1>", windows $ W.shift "4")
                 ]
