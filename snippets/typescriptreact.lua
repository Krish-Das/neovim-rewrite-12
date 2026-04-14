---@diagnostic disable: undefined-global
return {
  -- console.log
  s({ trig = ";clg", snippetType = "autosnippet", wordTrig = true }, fmta("console.log(<>)", { i(1, "value") })),

  -- React function component
  s(
    { trig = ";rfc", snippetType = "autosnippet", wordTrig = true },
    fmta("export function <>() {\n\treturn <>\n}", {
      i(1, "Component"),
      i(0),
    })
  ),
  s(
    { trig = ";rfdc", snippetType = "autosnippet", wordTrig = true },
    fmta("export default function <>() {\n\treturn <>\n}", {
      i(1, "Component"),
      i(0),
    })
  ),

  -- import
  s(
    { trig = "imp" },
    fmta('import { <> } from "<>"', {
      i(0),
      i(1, "react"),
    })
  ),

  -- useState hook
  s(
    { trig = "ush" },
    fmta("const [<>, set<>] = useState(<>)", {
      i(1, "state"),
      -- Capitalize the first letter
      f(function(args)
        local text = args[1][1]
        return text:sub(1, 1):upper() .. text:sub(2)
      end, { 1 }),
      i(0),
    })
  ),

  -- useEffect hook
  s(
    { trig = "ueh" },
    fmta("useEffect(() =>> {\n\t<>\n}, [])", {
      i(0),
    })
  ),
}
