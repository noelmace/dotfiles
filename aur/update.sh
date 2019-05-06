if [ ! -z "$1" ]; then
  if [ ! -d "$1" ]; then
    echo -e "\"$1\" isn't a valid directory. Aborting."
    exit 1
  fi
  DIRECTORIES="$1"
else
  DIRECTORIES=$(ls -d */)
fi

for aur in $DIRECTORIES;
do
  cd $aur;

  echo -e "\n== $aur ==\n"

  BRANCH=$(git rev-parse --abbrev-ref HEAD)

  if [ "$BRANCH" != "master" ]; then
    echo -e "Not on master. Aborting."
    cd ..
    continue
  fi

  git fetch
  HEADHASH=$(git rev-parse HEAD)
  UPSTREAMHASH=$(git rev-parse master@{upstream})

  if [ "$HEADHASH" = "$UPSTREAMHASH" ]; then
    echo -e "Current branch is up to date with origin/master. No update needed."
    cd ..
    continue
  fi

  git add --all
  git stash save "Pre-update: $(date '+%Y-%m-%d %H:%M:%S')"

  git reset --hard && git clean -dfx

  git pull
  makepkg -scCi
  cd ..
done
