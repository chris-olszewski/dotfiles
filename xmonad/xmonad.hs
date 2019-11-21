import XMonad
import XMonad.Config.Desktop
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn

-- TODO: add binding to put a window into a "following" state
-- i.e. a window that switches workspaces when user switches workspace
borderDelta :: Integer
borderDelta = 3

screenBorder :: Border
screenBorder = Border 0 0 0 0

windowBorder :: Border
windowBorder = Border 15 15 15 15

initialSpacing = spacingRaw True Main.screenBorder False Main.windowBorder True

customKeys :: [(String, X ())]
customKeys = [ ("M-[", prevWS)
             , ("M-]", nextWS)
             , ("M-S-=", incScreenWindowSpacing borderDelta)
             , ("M--", incScreenWindowSpacing (-borderDelta))
             , ("M-p", spawn "dmenu_run -nf '#eceff4' -nb '#5e81ac' -sb '#8fbcbb' -sf '#2e3440'")
             ]

-- look at withFocused :: (Window -> X ()) -> X ()
-- to set a window in this state
-- setWMState to set the window state

myLayoutHook = initialSpacing $ layoutHook desktopConfig

main :: IO ()
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
