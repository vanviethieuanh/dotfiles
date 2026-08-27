# Sourced by EVERY zsh invocation, including non-interactive shells
# (e.g. opencode's bash tool runs `zsh -c`). Keep this to shared PATH and
# function definitions only. Interactive-only stuff (aliases, themes,
# lazy-loaders) stays in .zshrc.

# --- Node (nvm) ---
# Expose npm/npx to non-interactive shells without loading all of nvm.
export NVM_DIR="$HOME/.nvm"
if [[ -f "$NVM_DIR/alias/default" && -d "$NVM_DIR/versions/node" ]]; then
  _nvm_default="$(cat "$NVM_DIR/alias/default")"
  _nvm_node_bin="$(ls -d "$NVM_DIR"/versions/node/v"${_nvm_default}"*/bin 2>/dev/null | head -n1)"
  if [[ -n "$_nvm_node_bin" ]]; then
    export PATH="$_nvm_node_bin:$PATH"
  fi
  unset _nvm_default _nvm_node_bin
fi

# --- Common tool PATH additions ---
export PATH="$HOME/.cargo/bin:$HOME/go/bin:$HOME/.local/share/pnpm:$HOME/.local/bin:$PATH"

# --- task (go-task) ---
# .zshrc aliases `task=go-task`, but aliases are not expanded in
# non-interactive shells. A function works everywhere.
task() { command go-task "$@"; }
