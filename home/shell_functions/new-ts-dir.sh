new-ts-dir() {
  local cd_flag=false

  if [[ "$1" == "--cd" ]]; then
    cd_flag=true
    shift
  fi

  if [[ "$#" -gt 0 ]]; then
    local DATE
    DATE=$(date "+%Y-%m-%d")
    local DIR="${DATE}_$1"

    mkdir "$DIR"

    if $cd_flag; then
      cd "$DIR" || return
    fi
  else
    echo "Please provide a name for this directory"
  fi
}
