for aur in */;
do
  cd $aur;
  git reset --hard && git clean -dfx
  git pull
  makepkg -scCi
  cd ..
done
