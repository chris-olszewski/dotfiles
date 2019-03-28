import XMonad
import XMonad.Config.Desktop
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS

customKeys = [
  ("M-[", prevWS),
  ("M-]", nextWS)
  ]

main = xmonad $ desktopConfig
       { terminal = "alacritty"
       , modMask = mod4Mask
       }
       `additionalKeysP`
       customKeys
