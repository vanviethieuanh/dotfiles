local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('iferr', {
    t 'if err != nil {',
    t { '', '\t' },
    i(0),
    t { '', '}' },
  }),

  s('http', {
    t { 'http.HandleFunc("/', '' },
    i(1, 'path'),
    t { '", func(w http.ResponseWriter, r *http.Request) {', '\t' },
    i(0),
    t { '', '})' },
  }),

  s('errn', {
    t 'if err != nil {',
    t { '', '\treturn nil, err', '}' },
  }),

  s('errf', {
    t 'if err != nil {',
    t { '', '\treturn fmt.Errorf("' },
    i(1, 'message'),
    t ': %w", err)',
    t { '', '}' },
  }),
}
