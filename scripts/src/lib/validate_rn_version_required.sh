validate_rn_version_required() {
  if ! [[ "$1" =~ ^0(\.[0-9]+)*$ ]] ; then
    echo "SDK should be a number like 0.72 or 0.72.0"
  elif ! (( $(echo "${1#*.} >= 72" | bc -l) )); then
    echo "Min. supported RN version is 0.72"
  fi
}
