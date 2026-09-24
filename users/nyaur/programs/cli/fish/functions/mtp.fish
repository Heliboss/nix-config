function mtp
  if test -d ~/Media
    fusermount -u ~/Media; rm -r ~/Media
  else
    mkdir ~/Media; aft-mtp-mount ~/Media
  end
end
