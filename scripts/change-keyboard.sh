layout=$(setxkbmap -query | awk 'FNR==3{print $2}')
case $layout in
  us)
      setxkbmap br
    ;;
  *)
      setxkbmap us
    ;;
esac
