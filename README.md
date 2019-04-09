# aws-tmux

> This is WIP, I'm using it in my prod setup but note that this is not an official AWS project or product in any form or shape.

`aws-tmux` is a simple AWS status indicator, currently showing the configured AWS region.

The prerequisites for this `tmux` status indicator to work is that you have the 
[AWS CLI](https://aws.amazon.com/cli/) tool installed.

To use this plugin, clone the repo into the `$HOME/.tmux` directory, 
then add something like the following to your `~/.tmux.conf` 
(here: we configure it to display the AWS status in the right part of the tmux status bar):

```bash
set -g status-right "#(/bin/bash $HOME/.tmux/aws-tmux/aws.tmux)"
```

Note: to make sure that the status is kept up-to-date automatically, add the following to your `~/.tmux.conf` (here: refresh every 5 seconds):

```bash
tmux set status-interval 5
```

Provided as is, use at your own risk! I might turn this into a proper [TPM plugin](https://github.com/tmux-plugins/tpm/blob/master/docs/how_to_create_plugin.md) one day.