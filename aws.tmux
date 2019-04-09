#!/usr/bin/env bash
#
# AWS status line for tmux
#

AWS_TMUX_BINARY="${AWS_TMUX_BINARY:-aws}"
STATUS_DEFAULT_COLOR="${STATUS_DEFAULT_COLOR:-black}"
AWS_REGION="unknown"

aws_get_region() {
  AWS_REGION="$(${AWS_TMUX_BINARY} configure get region 2>/dev/null)"
}

aws_tmux() {
  local AWS_STATUS

  # query region and add to status:
  aws_get_region
  AWS_STATUS+="#[fg=$STATUS_DEFAULT_COLOR]AWS region: #[fg=colour166]${AWS_REGION} "

  echo "${AWS_STATUS}"
}

aws_tmux "$@"
