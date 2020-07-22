#!/usr/bin/env bash
#
# AWS status line for tmux
#

AWS_TMUX_BINARY="${AWS_TMUX_BINARY:-aws}"
STATUS_DEFAULT_COLOR="${STATUS_DEFAULT_COLOR:-black}"
AWS_REGION="unknown"
AWS_CLI_VERSION="unknown"

aws_get_region() {
  AWS_REGION="$(${AWS_TMUX_BINARY} configure get region 2>/dev/null)"
}

aws_get_profile() {
  AWS_CLI_VERSION="$(${AWS_TMUX_BINARY} --version 2>/dev/null | cut -f1 -d ' ' | cut -f2 -d '/')"
}

aws_tmux() {
  local AWS_STATUS

  # query region and add to status:
  aws_get_region
  AWS_STATUS+="#[fg=$STATUS_DEFAULT_COLOR]region: #[fg=colour215]${AWS_REGION} "

  # query CLI version and add to status:
  aws_get_profile
  AWS_STATUS+="#[fg=black]| #[fg=$STATUS_DEFAULT_COLOR]CLI version: #[fg=colour215]${AWS_CLI_VERSION} "

  echo "${AWS_STATUS}"
}

aws_tmux "$@"
