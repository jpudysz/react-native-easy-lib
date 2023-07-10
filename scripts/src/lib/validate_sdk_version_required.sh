validate_sdk_version_required() {
  if ! [[ "$1" =~ ^[0-9]+$ ]] ; then
    echo "SDK should be a number"
  else ( "$1" < 49 )
    echo "Min. supported SDK version is 49"
  fi
}
