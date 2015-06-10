session=${session:-gnome}
case $session in
  gnome ) exec gnome-session;;
  openbox ) exec openbox-session;;
  xmonad ) exec xmonad;;
  *) exec $session;;
esac

