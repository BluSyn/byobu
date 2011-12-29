###############################################################################
#    byobu's tmux f-key keybindings
#
#    Copyright (C) 2011 Dustin Kirkland <dustin.kirkland@gmail.com>
#
#    Authors: Dustin Kirkland <dustin.kirkland@gmail.com>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, version 3 of the License.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
###############################################################################

# Add F12 to the prefix list
set -g prefix ^A,F12

# Byobu's Keybindings
# Documented in: $BYOBU_PREFIX/share/doc/byobu/help.tmux.txt
bind-key -n F1 new-window -k -n config byobu-config
bind-key -n S-F1 new-window -k -n help '$BYOBU_PAGER $BYOBU_PREFIX/share/doc/byobu/help.tmux.txt'
bind-key -n F2 new-window
bind-key -n C-F2 display-panes \; split-window -h
bind-key -n S-F2 display-panes \; split-window -v
bind-key -n C-S-F2 new-session
bind-key -n F3 previous-window
bind-key -n F4 next-window
bind-key -n M-Left previous-window
bind-key -n M-Right next-window
bind-key -n M-Up choose-session \; send-keys Up \; send-keys Enter
bind-key -n M-Down choose-session \; send-keys Down \; send-keys Enter
bind-key -n S-F3 display-panes \; select-pane -t :.-
bind-key -n S-F4 display-panes \; select-pane -t :.+
bind-key -n S-Up display-panes \; select-pane -U
bind-key -n S-Down display-panes \; select-pane -D
bind-key -n S-Left display-panes \; select-pane -L
bind-key -n S-Right display-panes \; select-pane -R
bind-key -n C-F3 display-panes \; swap-pane -s :. -t :.- \; select-pane -t :.-
bind-key -n C-F4 display-panes \; swap-pane -s :. -t :.+ \; select-pane -t :.+
bind-key -n C-S-F3 swap-window -t :-1
bind-key -n C-S-F4 swap-window -t :+1
bind-key -n C-Up resize-pane -U
bind-key -n C-Down resize-pane -D
bind-key -n C-Left resize-pane -L
bind-key -n C-Right resize-pane -R
bind-key -n F5 source $BYOBU_PREFIX/share/byobu/profiles/tmuxrc
bind-key -n S-F5 new-window -k "$BYOBU_PREFIX/lib/byobu/include/cycle-status" \; source $BYOBU_PREFIX/share/byobu/profiles/tmuxrc
bind-key -n C-F5 send-keys ". $BYOBU_PREFIX/bin/byobu-reconnect-sockets" \; send-keys Enter
bind-key -n C-S-F5 new-window -d "byobu-select-profile -r"
bind-key -n F6 detach
bind-key -n S-F6 run-shell 'exec touch $BYOBU_RUN_DIR/no-logout' \; detach
bind-key -n C-F6 kill-pane
bind-key -n F7 copy-mode
bind-key -n M-NPage copy-mode \; send-keys NPage
bind-key -n M-PPage copy-mode \; send-keys PPage
bind-key -n F8 command-prompt -p "(rename-window)" "rename-window %%"
bind-key -n S-F8 next-layout
bind-key -n C-F8 new-window -k "$BYOBU_PREFIX/lib/byobu/include/layout restore; clear; $SHELL"
bind-key -n C-S-F8 command-prompt -p "Save byobu layout as:" "run-shell '$BYOBU_PREFIX/lib/byobu/include/layout save %%'"
bind-key -n F9 new-window -k -n config byobu-config
bind-key -n M-F11 break-pane
bind-key -n C-F11 join-pane -h -s :. -t :-1
bind-key -n S-F11 join-pane -v -s :. -t :-1
bind-key -n S-F12 source $BYOBU_PREFIX/share/byobu/keybindings/f-keys.tmux.disable
bind-key -n C-S-F12 new-window $BYOBU_PREFIX/lib/byobu/include/mondrian
bind-key -n M-IC paste-buffer
