#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
AWS_TMUX_BINARY="${AWS_TMUX_BINARY:-aws}"
source "$CURRENT_DIR/helpers.sh"

get_version()
{
  AWS_CLI_VERSION="$(${AWS_TMUX_BINARY} --version 2>/dev/null | cut -f1 -d ' ' | cut -f2 -d '/')"
  printf "$AWS_CLI_VERSION"
}
get_version
