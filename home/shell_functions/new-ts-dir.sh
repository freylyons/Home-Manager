#!/usr/bin/env bash

# Generate timestamp
_ts_now() {
  date "+%Y-%m-%d-%H-%M-%S"
}

# Core creator function (shared)
# Args:
#   $1 → type ("dir" or "file")
#   $2 → name
# Outputs:
#   prints created path
_ts_create() {
  local type="$1"
  local name="$2"

  if [[ -z "$name" ]]; then
    echo "Please provide a name" >&2
    return 1
  fi

  local ts
  ts=$(_ts_now)

  local path="${ts}_$name"

  if [[ "$type" == "dir" ]]; then
    mkdir "$path" || return 1
  elif [[ "$type" == "file" ]]; then
    touch "$path" || return 1
  else
    echo "Invalid type: $type" >&2
    return 1
  fi

  echo "$path"
}

# Create timestamped directory
new-ts-dir() {
  local cd_flag=false

  if [[ "$1" == "--cd" ]]; then
    cd_flag=true
    shift
  fi

  local path
  path=$(_ts_create "dir" "$1") || return

  if $cd_flag; then
    cd "$path" || return
  fi
}

# Create timestamped file
new-ts-file() {
  local edit_flag=false

  if [[ "$1" == "--edit" ]]; then
    edit_flag=true
    shift
  fi

  local path
  path=$(_ts_create "file" "$1") || return

  if $edit_flag; then
    "${EDITOR:-vi}" "$path"
  fi
}

cd-last() {
  local local_lag="1"

  if [[ $# -gt 1 ]]; then
    printf "Too many arguments supplied" >&2
  fi

  if [[ $# -gt 0 ]]; then
    if [[ "$1" =~ ^[0-9]+$ ]]; then
      local_lag="$1"
    else
      printf "malformed input: expected integer, got $1" >&2
      return 1
    fi
  fi

  cd "$(ls | tail -n "$local_lag" | head -n 1)"
  return 0
}
