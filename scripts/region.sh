#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
AWS_TMUX_BINARY="${AWS_TMUX_BINARY:-aws}"
source "$CURRENT_DIR/helpers.sh"

get_region()
{
  AWS_REGION="$(${AWS_TMUX_BINARY} configure get region 2>/dev/null)"
  if [[ $AWS_REGION == "" ]]; then
    printf "not set"
  else 
    printf "$AWS_REGION"
  fi
}
get_region
