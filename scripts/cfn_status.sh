#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
AWS_TMUX_BINARY="${AWS_TMUX_BINARY:-aws}"
source "$CURRENT_DIR/helpers.sh"

get_cfn_status()
{

  stack=$(get_tmux_option "@aws-cfn-stackname" "")
  result=$(aws cloudformation describe-stacks --stack-name $stack --query 'Stacks[*].StackStatus' | jq '.[]' | tr -d \")
  printf "$result"
}
get_cfn_status
