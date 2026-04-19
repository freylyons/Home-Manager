#!/usr/bin/env bash
source-home-manager() {
  unset __HM_SESS_VARS_SOURCED
  source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
  echo "Home Manager environment variables reloaded."
}
