session=${1:-xmonad}
case $session in
  gnome ) exec gnome-session;;
  openbox ) exec openbox-session;;
  xmonad ) exec xmonad;;
  *) exec $session;;
esac

