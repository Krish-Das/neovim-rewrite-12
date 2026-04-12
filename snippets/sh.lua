---@diagnostic disable: undefined-global
return {
  -- shebangs
  s({ trig = "!bash", snippetType = "autosnippet" }, fmta("#!/usr/bin/env bash\n\n<>", { i(0) })),
  s({ trig = "!sh", snippetType = "autosnippet" }, fmta("#!/usr/bin/env sh\n\n<>", { i(0) })),
}
