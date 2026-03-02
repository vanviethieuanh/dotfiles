local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('shebang', {
    t { '#!/usr/bin/env python3', '' },
    i(0),
  }),

  s('main', {
    t { 'if __name__ == "__main__":', '\t' },
    i(0),
  }),
}