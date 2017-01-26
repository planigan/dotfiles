if [ ! -z ${TMUX_PANE+x} ]; then
  pane_path="TMUX_$(echo $TMUX_PANE | tr -d "%")_PATH"
  tmux set-environment -u $pane_path
fi

