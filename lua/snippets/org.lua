local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node

-- Date/time snippets for org-mode
ls.add_snippets("org", {
  -- /today → <YYYY-MM-DD>
  s("/today", {
    f(function()
      return "<" .. os.date("%Y-%m-%d") .. ">"
    end),
  }),

  -- /now → <YYYY-MM-DD HH:MM>
  s("/now", {
    f(function()
      return "<" .. os.date("%Y-%m-%d %H:%M") .. ">"
    end),
  }),

  -- /HHMM → <YYYY-MM-DD HH:MM> (e.g., /1430 → <2025-12-02 14:30>)
  s({ trig = "/(%d%d)(%d%d)", regTrig = true, wordTrig = false }, {
    f(function(_, snip)
      local hour = snip.captures[1]
      local min = snip.captures[2]
      return "<" .. os.date("%Y-%m-%d") .. " " .. hour .. ":" .. min .. ">"
    end),
  }),
})
