function mtp
  if test -d ~/Media
    fusermount -u ~/Media; rm -r ~/Media
  else
    mkdir ~/Media; simple-mtpfs ~/Media
  end
end
