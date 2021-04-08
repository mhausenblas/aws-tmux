#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
AWS_TMUX_BINARY="${AWS_TMUX_BINARY:-aws}"
source "$CURRENT_DIR/helpers.sh"

get_cfn_list()
{
  stack=$(aws cloudformation list-stacks --query 'StackSummaries[?StackStatus!=`DELETE_COMPLETE`].StackName' | jq '.[]' | tr -d \" | fzf-tmux)
  set_tmux_option @aws-cfn-stackname $stack
}
get_cfn_list
