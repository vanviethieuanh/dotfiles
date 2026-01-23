local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  s('shebang', {
    t { '#!/usr/bin/env bash', 'set -euo pipefail', '', '' },
    i(0),
  }),

  s('strict', {
    t 'set -euo pipefail',
  }),

  s('func', {
    i(1, 'function_name'),
    t { '() {', '\t' },
    i(0),
    t { '', '}' },
  }),

  s('iferr', {
    t 'if ! ',
    i(1, 'command'),
    t { '; then', '\techo "Error: ' },
    i(2, 'message'),
    t { '" >&2', '\texit 1', 'fi' },
  }),

  s('tmp', {
    i(1, 'tmpfile'),
    t '=$(mktemp)',
    t { '', 'trap "rm -f $' },
    f(function(args) return args[1][1] end, {1}),
    t '" EXIT',
  }),

  s('check', {
    t 'if ! command -v ',
    i(1, 'cmd'),
    t { ' &> /dev/null; then', '\techo "' },
    f(function(args) return args[1][1] end, {1}),
    t { ' not found" >&2', '\texit 1', 'fi' },
  }),

  s('dircheck', {
    t 'if [[ ! -d "',
    i(1, 'dir'),
    t { '" ]]; then', '\tmkdir -p "' },
    f(function(args) return args[1][1] end, {1}),
    t { '"', 'fi' },
  }),
}