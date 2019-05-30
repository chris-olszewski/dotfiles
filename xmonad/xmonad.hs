import XMonad
import XMonad.Config.Desktop
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn

-- TODO: add binding to put a window into a "following" state
--   	 i.e. a window that switches workspaces when user switches workspace
borderDelta :: Int
borderDelta = 3

customKeys = [ ("M-[", prevWS)
             , ("M-]", nextWS)
             , ("M-S-=", incSpacing borderDelta)
             , ("M--", incSpacing (-borderDelta))
             , ("M-p", spawn "dmenu_run -nf '#eceff4' -nb '#5e81ac' -sb '#8fbcbb' -sf '#2e3440'")
             ]


myLayoutHook = spacing 15 $ layoutHook desktopConfig

main = xmonad $ desktopConfig
       { terminal = "alacritty"
       , modMask = mod4Mask
       , normalBorderColor = "#5e81ac"
       , focusedBorderColor = "#ebcb8b"
       , borderWidth = 2
       , layoutHook = myLayoutHook
       }
       `additionalKeysP`
       customKeys
