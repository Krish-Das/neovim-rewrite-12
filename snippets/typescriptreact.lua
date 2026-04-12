---@diagnostic disable: undefined-global
return {
  -- console.log
  s({ trig = "clg", snippetType = "autosnippet" }, fmta("console.log(<>)", { i(0) })),

  -- React function component
  s(
    { trig = "rfc", snippetType = "autosnippet" },
    fmta("export default function <>() {\n\treturn <>\n}", {
      i(1),
      i(0),
    })
  ),

  -- import
  s(
    { trig = "imp" },
    fmta('import { <> } from "<>"', {
      i(0),
      i(1),
    })
  ),

  -- useState hook
  s(
    { trig = "ush" },
    fmta("const [<>, set<>] = useState(<>)", {
      i(1),
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
