#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"
export TMUX_CFN="foobar"

aws_interpolations=(
	"\#{aws_region}"
	"\#{aws_version}"
	"\#{aws_cfn_status}"
)

aws_commands=(
  "#($CURRENT_DIR/scripts/region.sh)"
  "#($CURRENT_DIR/scripts/version.sh)"
  "#($CURRENT_DIR/scripts/cfn_status.sh)"
)

do_interpolation() {
	local interpolated="$1"

	for ((i=0; i<${#aws_commands[@]}; i++)); do
		interpolated=${interpolated/${aws_interpolations[$i]}/${aws_commands[$i]}}
	done

	echo "$interpolated"
}

set_tmux_options() {
	local option="$1"
	local value="$2"
	tmux set-option -gp "$option" "$value"
}

update_tmux_option() {
	local option=$1
	local option_value=$(get_tmux_option "$option")
	local new_option_value=$(do_interpolation "$option_value")
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}

key="$(get_tmux_option '@aws-cfn-list' 'u')"
tmux bind-key $key run -b "$CURRENT_DIR/scripts/cfn_list.sh";

main
