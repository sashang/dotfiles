import XMonad

main = xmonad defaultConfig
  { terminal = "gnome-terminal"
  , modMask = mod4Mask
  , borderWidth = 3
  }

