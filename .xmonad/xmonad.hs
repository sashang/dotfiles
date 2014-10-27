import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import System.IO


main = do
  xmproc <- spawnPipe "/home/sashan/bin/xmobar /home/sashan/.xmobar"
  xmonad $ defaultConfig
      { manageHook = manageDocks <+> manageHook defaultConfig
      , layoutHook = avoidStruts $ layoutHook defaultConfig
      , terminal = "gnome-terminal"
      , modMask = mod4Mask
      , borderWidth = 3
      }

