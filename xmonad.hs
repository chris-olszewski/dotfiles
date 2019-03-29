import XMonad
import XMonad.Config.Desktop
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn

borderDelta :: Int
borderDelta = 3

customKeys = [ ("M-[", prevWS)
             , ("M-]", nextWS)
             , ("M-S-=", incSpacing borderDelta)
             , ("M--", incSpacing (-borderDelta))
             , ("M-p", spawn "dmenu_run -nf '#eceff4' -nb '#5e81ac' -sb '#8fbcbb' -sf '#2e3440'")
             ]

-- Nord colors
-- frost dark: 5e81ac
-- snow light: eceff4
myLayoutHook = spacing 15 $ layoutHook desktopConfig

-- want M-+ to inc spacing
-- want M-- to dec spacing

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
