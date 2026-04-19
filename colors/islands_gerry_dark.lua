-- islands_gerry_dark.lua
-- Converted from [Islands] Gerry Dark (JetBrains)
-- XML editor scheme: gerryDark.theme.xml  |  UI: islandsGerryDark_theme.json
--
-- Install: ~/.config/nvim/colors/islands_gerry_dark.lua
-- Activate: vim.cmd.colorscheme("islands_gerry_dark")  or  :colorscheme islands_gerry_dark

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "islands_gerry_dark"
vim.o.background = "dark"
vim.o.termguicolors = true

local hi = vim.api.nvim_set_hl

-- ── Palette ───────────────────────────────────────────────────────────────
-- Directly sourced from the XML <colors> block and JSON "colors" object.
-- Names map to JetBrains attribute names where possible.
local c = {
  -- Editor / UI base  (JSON palette)
  bg = "#1e1f22", -- bg / DOCUMENTATION_COLOR / TEXT bg / GUTTER_BACKGROUND
  bg2 = "#28292c", -- bg2
  second = "#37393c", -- second (inactive tab bg)
  fg = "#afb9c3", -- TEXT foreground (editor text)
  fg_ui = "#d0d0d9", -- JSON fg (UI text, slightly brighter)
  fg2 = "#96969d", -- secondFg / INLINE_PARAMETER_HINT fg
  sel_bg = "#464b50", -- selBg
  sel_fg = "#e0e0e9", -- selFg
  border = "#3f3f3f", -- border
  dis = "#555555", -- dis / LINE_NUMBERS_COLOR
  accent = "#5378c8", -- accent (caret, active tab underline)
  -- Editor specifics (XML <colors>)
  caret = "#55a5ff", -- CARET_COLOR
  cur_line = "#2b2d30", -- CARET_ROW_COLOR
  line_nr = "#555555", -- LINE_NUMBERS_COLOR
  line_nr_cur = "#999999", -- LINE_NUMBER_ON_CARET_ROW_COLOR
  sel_editor = "#173d59", -- SELECTION_BACKGROUND (editor)
  indent_guide = "#393b40", -- INDENT_GUIDE
  ind_guide_sel = "#636669", -- SELECTED_INDENT_GUIDE
  right_margin = "#636669", -- RIGHT_MARGIN_COLOR
  fold_bg = "#283246", -- FOLDED_TEXT_ATTRIBUTES bg
  match_bg = "#326146", -- MATCHED_BRACE_ATTRIBUTES bg
  search_bg = "#3c5082", -- SEARCH_RESULT / TEXT_SEARCH_RESULT bg
  search_sp = "#55a5ff", -- SEARCH_RESULT effect color
  -- Syntax token colors (XML <attributes>)
  keyword = "#c88cdc", -- DEFAULT_KEYWORD
  string = "#96be78", -- DEFAULT_STRING / JAVA_STRING / PY.STRING
  number = "#36beff", -- DEFAULT_NUMBER
  fn = "#ffc86e", -- DEFAULT_FUNCTION_CALL / DEFAULT_FUNCTION_DECLARATION
  type = "#ffc86e", -- DEFAULT_CLASS_REFERENCE / DEFAULT_INTERFACE_NAME
  constant = "#96be78", -- DEFAULT_CONSTANT / ENUM_CONST
  parameter = "#61afe1", -- DEFAULT_PARAMETER
  field = "#ff9696", -- DEFAULT_INSTANCE_FIELD / DEFAULT_STATIC_FIELD
  comment = "#808080", -- DEFAULT_LINE_COMMENT / DEFAULT_BLOCK_COMMENT / DEFAULT_DOC_COMMENT
  doc_tag = "#c88cdc", -- DEFAULT_DOC_COMMENT_TAG
  doc_tag_val = "#61afe1", -- DEFAULT_DOC_COMMENT_TAG_VALUE
  metadata = "#bbb529", -- DEFAULT_METADATA (annotations)
  entity = "#ff9696", -- DEFAULT_ENTITY
  escape = "#17bbdd", -- DEFAULT_VALID_STRING_ESCAPE
  escape_bad = "#dd3962", -- DEFAULT_INVALID_STRING_ESCAPE effect
  operation = "#afb9c3", -- DEFAULT_OPERATION_SIGN (inherits fg)
  label = "#c88cdc", -- LABEL / DEFAULT_LABEL (bold)
  global_var = "#7878ff", -- JS.GLOBAL_VARIABLE (italic+bold)
  variable = "#afb9c3", -- DEFAULT_LOCAL_VARIABLE (fg, no override)
  class_ref = "#ffc86e", -- CLASS_REFERENCE / CONSTRUCTOR_CALL
  html_tag = "#ff9696", -- HTML_TAG_NAME / XML_TAG_NAME
  json_key = "#ff9696", -- JSON.PROPERTY_KEY
  yaml_key = "#ff9696", -- YAML_SCALAR_KEY
  yaml_val = "#96be78", -- YAML_SCALAR_VALUE / YAML_TEXT
  css_color = "#17bbdd", -- CSS.COLOR / CSS.PSEUDO
  css_fn = "#61afe1", -- CSS.FUNCTION / CSS.HASH
  regex = "#17bbdd", -- JS.REGEXP / RUBY_REGEXP / PUPPET_REGEX
  todo = "#e88c00", -- TODO_DEFAULT_ATTRIBUTES
  warn_effect = "#e88c00", -- WARNING_ATTRIBUTES effect
  error_effect = "#dd3962", -- ERRORS_ATTRIBUTES effect
  error_bg = "#dd5c7c", -- JSON "error"
  md_heading = "#50b4be", -- MARKDOWN_HEADER_LEVEL_*
  link = "#61afe1", -- HYPERLINK_ATTRIBUTES
  -- Diff / VCS (XML)
  diff_add_fg = "#96be78", -- ADDED_LINES_COLOR / FILESTATUS_ADDED
  diff_del_fg = "#ff9696", -- DELETED_LINES_COLOR
  diff_mod_fg = "#ffc86e", -- MODIFIED_LINES_COLOR
  diff_add_bg = "#295836", -- DIFF_INSERTED bg
  diff_del_bg = "#46505f", -- DIFF_DELETED bg
  diff_mod_bg = "#205572", -- DIFF_MODIFIED bg
  diff_conf_bg = "#913f3f", -- DIFF_CONFLICT bg
  -- Hint / inlay
  inlay_fg = "#56575c",
  inlay_bg = "#1e1f22", -- "#393b40",
  inlay_cur_bg = "#486691",
}

-- ── Helpers ───────────────────────────────────────────────────────────────
local function link(from, to)
  hi(0, from, { link = to })
end

-- ── Editor UI ─────────────────────────────────────────────────────────────
hi(0, "Normal", { fg = c.fg, bg = c.bg })
hi(0, "NormalFloat", { fg = c.fg_ui, bg = c.bg2 })
hi(0, "NormalNC", { fg = c.fg, bg = c.bg })
hi(0, "Cursor", { fg = c.bg, bg = c.caret })
hi(0, "CursorIM", { fg = c.bg, bg = c.caret })
hi(0, "CursorLine", { bg = c.cur_line })
hi(0, "CursorColumn", { bg = c.cur_line })
hi(0, "CursorLineNr", { fg = c.line_nr_cur, bg = c.cur_line })
hi(0, "LineNr", { fg = c.line_nr })
hi(0, "SignColumn", { fg = c.line_nr, bg = c.bg })
hi(0, "ColorColumn", { bg = c.cur_line })
hi(0, "Visual", { bg = c.sel_editor })
hi(0, "VisualNOS", { bg = c.sel_editor })
hi(0, "Search", { bg = c.search_bg, sp = c.search_sp })
hi(0, "IncSearch", { fg = c.fg_ui, bg = c.search_bg, bold = true })
hi(0, "CurSearch", { link = "IncSearch" })
hi(0, "Substitute", { fg = c.fg_ui, bg = c.search_bg })
hi(0, "MatchParen", { bg = c.match_bg, bold = true })
hi(0, "NonText", { fg = c.indent_guide })
hi(0, "SpecialKey", { fg = c.indent_guide })
hi(0, "Whitespace", { fg = "#4b575f" }) -- WHITESPACES
hi(0, "EndOfBuffer", { fg = c.bg })
hi(0, "Folded", { fg = c.comment, bg = c.fold_bg })
hi(0, "FoldColumn", { fg = c.dis, bg = c.bg })
hi(0, "VertSplit", { fg = c.border, bg = c.bg })
hi(0, "WinSeparator", { fg = c.border, bg = c.bg })
hi(0, "StatusLine", { fg = c.fg_ui, bg = c.bg2 })
hi(0, "StatusLineNC", { fg = c.fg2, bg = c.bg2 })
hi(0, "TabLine", { fg = c.fg2, bg = c.second })
hi(0, "TabLineSel", { fg = c.sel_fg, bg = c.bg, underline = true, sp = c.accent })
hi(0, "TabLineFill", { bg = c.second })
hi(0, "WildMenu", { fg = c.sel_fg, bg = c.sel_bg })
hi(0, "Pmenu", { fg = c.fg_ui, bg = c.bg2 })
hi(0, "PmenuSel", { fg = c.sel_fg, bg = c.sel_bg })
hi(0, "PmenuSbar", { bg = c.second })
hi(0, "PmenuThumb", { bg = c.dis })
hi(0, "FloatBorder", { fg = c.border, bg = c.bg2 })
hi(0, "Title", { fg = c.accent, bold = true })
hi(0, "Directory", { fg = c.accent })
hi(0, "Question", { fg = c.link })
hi(0, "MoreMsg", { fg = c.link })
hi(0, "ModeMsg", { fg = c.fg_ui })
hi(0, "MsgArea", { fg = c.fg_ui })
hi(0, "ErrorMsg", { fg = c.error_bg })
hi(0, "WarningMsg", { fg = c.warn_effect })
hi(0, "QuickFixLine", { bg = c.cur_line })
hi(0, "SpellBad", { undercurl = true, sp = c.error_effect })
hi(0, "SpellCap", { undercurl = true, sp = c.warn_effect })
hi(0, "SpellRare", { undercurl = true, sp = c.link })
hi(0, "SpellLocal", { undercurl = true, sp = c.type })
hi(0, "Conceal", { fg = c.dis })

-- ── Core Syntax ───────────────────────────────────────────────────────────
hi(0, "Comment", { fg = c.comment, italic = true })
hi(0, "String", { fg = c.string })
hi(0, "Character", { fg = c.escape }) -- DEFAULT_VALID_STRING_ESCAPE color
hi(0, "Number", { fg = c.number })
hi(0, "Float", { fg = c.number })
hi(0, "Boolean", { fg = c.keyword })
hi(0, "Constant", { fg = c.constant })
hi(0, "Identifier", { fg = c.fg }) -- DEFAULT_LOCAL_VARIABLE = no override
hi(0, "Function", { fg = c.fn })
hi(0, "Statement", { fg = c.keyword })
hi(0, "Conditional", { fg = c.keyword })
hi(0, "Repeat", { fg = c.keyword })
hi(0, "Label", { fg = c.label, bold = true })
hi(0, "Operator", { fg = c.operation })
hi(0, "Keyword", { fg = c.keyword })
hi(0, "Exception", { fg = c.keyword })
hi(0, "PreProc", { fg = c.keyword })
hi(0, "Include", { fg = c.keyword })
hi(0, "Define", { fg = c.keyword })
hi(0, "Macro", { fg = c.keyword })
hi(0, "PreCondit", { fg = c.keyword })
hi(0, "Type", { fg = c.type })
hi(0, "StorageClass", { fg = c.keyword })
hi(0, "Structure", { fg = c.type })
hi(0, "Typedef", { fg = c.keyword }) -- TYPEDEF = #c88cdc
hi(0, "Special", { fg = c.escape })
hi(0, "SpecialChar", { fg = c.escape })
hi(0, "Tag", { fg = c.html_tag })
hi(0, "Delimiter", { fg = c.fg })
hi(0, "SpecialComment", { fg = c.doc_tag, bold = true })
hi(0, "Debug", { fg = c.error_bg })
hi(0, "Underlined", { underline = true })
hi(0, "Ignore", { fg = c.dis })
hi(0, "Error", { fg = c.error_bg, bg = "#a03c3c" }) -- BAD_CHARACTER bg
hi(0, "Todo", { fg = c.todo, bold = true })

-- ── Treesitter @-captures (nvim-treesitter ≥ 0.9) ────────────────────────
-- Variables / identifiers
hi(0, "@variable", { fg = c.fg }) -- DEFAULT_LOCAL_VARIABLE = no override
hi(0, "@variable.parameter", { fg = c.parameter }) -- DEFAULT_PARAMETER = #61afe1
hi(0, "@variable.member", { fg = c.field }) -- DEFAULT_INSTANCE_FIELD = #ff9696
hi(0, "@variable.builtin", { fg = c.keyword }) -- self/this → keyword
hi(0, "@variable.global", { fg = c.global_var, bold = true, italic = true }) -- JS.GLOBAL_VARIABLE
-- Constants
hi(0, "@constant", { fg = c.constant }) -- DEFAULT_CONSTANT = #96be78
hi(0, "@constant.builtin", { fg = c.keyword }) -- GO_BUILTIN_CONSTANT = #c88cdc
hi(0, "@constant.macro", { fg = c.keyword })
-- Strings
hi(0, "@string", { fg = c.string })
hi(0, "@string.escape", { fg = c.escape }) -- DEFAULT_VALID_STRING_ESCAPE = #17bbdd
hi(0, "@string.special", { fg = c.escape })
hi(0, "@string.regexp", { fg = c.regex }) -- JS.REGEXP = #17bbdd
hi(0, "@character", { fg = c.escape })
hi(0, "@character.special", { fg = c.escape })
hi(0, "@number", { fg = c.number }) -- DEFAULT_NUMBER = #36beff
hi(0, "@number.float", { fg = c.number })
hi(0, "@boolean", { fg = c.keyword })
-- Functions
hi(0, "@function", { fg = c.fn }) -- DEFAULT_FUNCTION_DECLARATION = #ffc86e
hi(0, "@function.call", { fg = c.fn }) -- DEFAULT_FUNCTION_CALL = #ffc86e
hi(0, "@function.builtin", { fg = c.fn }) -- PY.BUILTIN_NAME / GO_BUILTIN_VARIABLE = #ffc86e
hi(0, "@function.macro", { fg = c.keyword })
hi(0, "@function.method", { fg = c.fn })
hi(0, "@function.method.call", { fg = c.fn })
hi(0, "@constructor", { fg = c.class_ref }) -- CONSTRUCTOR_CALL_ATTRIBUTES = #ffc86e
-- Keywords
hi(0, "@keyword", { fg = c.keyword })
hi(0, "@keyword.import", { fg = c.keyword })
hi(0, "@keyword.return", { fg = c.keyword })
hi(0, "@keyword.operator", { fg = c.keyword })
hi(0, "@keyword.exception", { fg = c.keyword })
hi(0, "@keyword.conditional", { fg = c.keyword })
hi(0, "@keyword.repeat", { fg = c.keyword })
hi(0, "@keyword.directive", { fg = c.keyword })
hi(0, "@keyword.coroutine", { fg = c.keyword })
-- Types
hi(0, "@type", { fg = c.type }) -- DEFAULT_CLASS_REFERENCE = #ffc86e
hi(0, "@type.builtin", { fg = c.keyword }) -- GO_BUILTIN_TYPE = #c88cdc
hi(0, "@type.definition", { fg = c.type })
hi(0, "@type.qualifier", { fg = c.keyword })
-- Modules / namespaces
hi(0, "@module", { fg = c.type }) -- TS.MODULE_NAME / JS.MODULE_NAME = #ffc86e
hi(0, "@namespace", { fg = c.type })
-- Properties
hi(0, "@property", { fg = c.field }) -- DEFAULT_INSTANCE_FIELD = #ff9696
-- Punctuation
hi(0, "@punctuation.delimiter", { fg = c.fg })
hi(0, "@punctuation.bracket", { fg = c.fg })
hi(0, "@punctuation.special", { fg = c.escape })
-- Comments
hi(0, "@comment", { fg = c.comment, italic = true })
hi(0, "@comment.documentation", { fg = c.comment, italic = true })
hi(0, "@comment.todo", { fg = c.todo, bold = true })
-- Tags (HTML / JSX / XML)
hi(0, "@tag", { fg = c.html_tag }) -- HTML_TAG_NAME = #ff9696
hi(0, "@tag.builtin", { fg = c.html_tag })
hi(0, "@tag.attribute", { fg = c.fn }) -- DEFAULT_ATTRIBUTE = #ffc86e
hi(0, "@tag.delimiter", { fg = c.fg })
-- Annotations / decorators
hi(0, "@attribute", { fg = c.metadata }) -- DEFAULT_METADATA = #bbb529
-- Labels
hi(0, "@label", { fg = c.label, bold = true })
-- Operators
hi(0, "@operator", { fg = c.operation })
-- Markup (Markdown)
hi(0, "@markup.heading", { fg = c.md_heading, bold = true }) -- MARKDOWN_HEADER_LEVEL_* = #50b4be
hi(0, "@markup.heading.1", { fg = c.md_heading, bold = true })
hi(0, "@markup.heading.2", { fg = c.md_heading, bold = true })
hi(0, "@markup.heading.3", { fg = c.md_heading, bold = true })
hi(0, "@markup.link", { fg = c.link, underline = true })
hi(0, "@markup.link.url", { fg = c.link, underline = true })
hi(0, "@markup.raw", { fg = c.string }) -- MARKDOWN_CODE_SPAN = #96be78
hi(0, "@markup.raw.block", { fg = c.string })
hi(0, "@markup.strong", { bold = true })
hi(0, "@markup.italic", { italic = true })
hi(0, "@markup.strikethrough", { strikethrough = true })
hi(0, "@markup.list", { fg = c.keyword })
-- Diffs
hi(0, "@diff.plus", { fg = c.diff_add_fg })
hi(0, "@diff.minus", { fg = c.diff_del_fg })
hi(0, "@diff.delta", { fg = c.diff_mod_fg })

-- ── LSP semantic tokens ───────────────────────────────────────────────────
hi(0, "@lsp.type.class", { fg = c.type })
hi(0, "@lsp.type.enum", { fg = c.type })
hi(0, "@lsp.type.enumMember", { fg = c.constant }) -- ENUM_CONST = #96be78
hi(0, "@lsp.type.function", { fg = c.fn })
hi(0, "@lsp.type.interface", { fg = c.type }) -- DEFAULT_INTERFACE_NAME = #ffc86e
hi(0, "@lsp.type.keyword", { fg = c.keyword })
hi(0, "@lsp.type.macro", { fg = c.keyword })
hi(0, "@lsp.type.method", { fg = c.fn })
hi(0, "@lsp.type.modifier", { fg = c.keyword })
hi(0, "@lsp.type.namespace", { fg = c.type })
hi(0, "@lsp.type.number", { fg = c.number })
hi(0, "@lsp.type.operator", { fg = c.operation })
hi(0, "@lsp.type.parameter", { fg = c.parameter })
hi(0, "@lsp.type.property", { fg = c.field })
hi(0, "@lsp.type.string", { fg = c.string })
hi(0, "@lsp.type.struct", { fg = c.type })
hi(0, "@lsp.type.type", { fg = c.type })
hi(0, "@lsp.type.typeParameter", { fg = c.type }) -- TYPE_PARAMETER_NAME_ATTRIBUTES = #ffc86e
hi(0, "@lsp.type.variable", { fg = c.fg })
hi(0, "@lsp.type.decorator", { fg = c.metadata })
hi(0, "@lsp.mod.static", { fg = c.field }) -- DEFAULT_STATIC_FIELD = #ff9696
hi(0, "@lsp.mod.abstract", { italic = true })
hi(0, "@lsp.mod.deprecated", { strikethrough = true, fg = c.comment })
hi(0, "@lsp.mod.readonly", { fg = c.constant })

-- ── Diagnostics ───────────────────────────────────────────────────────────
hi(0, "DiagnosticError", { fg = c.error_effect })
hi(0, "DiagnosticWarn", { fg = c.warn_effect })
hi(0, "DiagnosticInfo", { fg = c.link })
hi(0, "DiagnosticHint", { fg = c.inlay_fg })
hi(0, "DiagnosticOk", { fg = c.diff_add_fg })
hi(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.error_effect })
hi(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = c.warn_effect })
hi(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = c.link })
hi(0, "DiagnosticUnderlineHint", { undercurl = true, sp = c.inlay_fg })
hi(0, "DiagnosticVirtualTextError", { fg = c.error_effect, italic = true })
hi(0, "DiagnosticVirtualTextWarn", { fg = c.warn_effect, italic = true })
hi(0, "DiagnosticVirtualTextInfo", { fg = c.link, italic = true })
hi(0, "DiagnosticVirtualTextHint", { fg = c.inlay_fg, italic = true })
hi(0, "DiagnosticSignError", { fg = c.error_effect })
hi(0, "DiagnosticSignWarn", { fg = c.warn_effect })
hi(0, "DiagnosticSignInfo", { fg = c.link })
hi(0, "DiagnosticSignHint", { fg = c.inlay_fg })

-- ── Diff / Git ────────────────────────────────────────────────────────────
-- DIFF_INSERTED / DIFF_DELETED / DIFF_MODIFIED / DIFF_CONFLICT
hi(0, "DiffAdd", { bg = c.diff_add_bg })
hi(0, "DiffDelete", { bg = c.diff_del_bg })
hi(0, "DiffChange", { bg = c.diff_mod_bg })
hi(0, "DiffText", { bg = "#1a4060", bold = true })
-- Git signs (lewis6991/gitsigns.nvim)
hi(0, "GitSignsAdd", { fg = c.diff_add_fg }) -- ADDED_LINES_COLOR
hi(0, "GitSignsChange", { fg = c.diff_mod_fg }) -- MODIFIED_LINES_COLOR
hi(0, "GitSignsDelete", { fg = c.diff_del_fg }) -- DELETED_LINES_COLOR
hi(0, "GitSignsAddNr", { fg = c.diff_add_fg })
hi(0, "GitSignsChangeNr", { fg = c.diff_mod_fg })
hi(0, "GitSignsDeleteNr", { fg = c.diff_del_fg })

-- ── Inlay hints (nvim 0.10+) ──────────────────────────────────────────────
-- INLINE_PARAMETER_HINT / INLINE_PARAMETER_HINT_HIGHLIGHTED
hi(0, "LspInlayHint", { fg = c.inlay_fg, bg = c.inlay_bg })

-- ── Telescope ─────────────────────────────────────────────────────────────
hi(0, "TelescopeBorder", { fg = c.border })
hi(0, "TelescopeNormal", { fg = c.fg, bg = c.bg2 })
hi(0, "TelescopePromptNormal", { fg = c.fg_ui, bg = c.bg2 })
hi(0, "TelescopeSelection", { fg = c.sel_fg, bg = c.sel_bg })
hi(0, "TelescopeSelectionCaret", { fg = c.caret, bg = c.sel_bg })
hi(0, "TelescopeMatching", { fg = c.fn, bold = true })
hi(0, "TelescopePromptPrefix", { fg = c.accent })

-- ── nvim-tree / neo-tree ──────────────────────────────────────────────────
hi(0, "NvimTreeNormal", { fg = c.fg_ui, bg = c.bg2 })
hi(0, "NvimTreeFolderIcon", { fg = c.accent })
hi(0, "NvimTreeFolderName", { fg = c.fg_ui })
hi(0, "NvimTreeOpenedFolderName", { fg = c.accent, bold = true })
hi(0, "NvimTreeRootFolder", { fg = c.fn, bold = true })
hi(0, "NvimTreeGitDirty", { fg = c.diff_mod_fg })
hi(0, "NvimTreeGitNew", { fg = c.diff_add_fg })
hi(0, "NvimTreeGitDeleted", { fg = c.diff_del_fg })
hi(0, "NvimTreeIndentMarker", { fg = c.indent_guide })

-- ── nvim-cmp ──────────────────────────────────────────────────────────────
hi(0, "CmpItemAbbr", { fg = c.fg })
hi(0, "CmpItemAbbrDeprecated", { fg = c.dis, strikethrough = true })
hi(0, "CmpItemAbbrMatch", { fg = c.fn, bold = true })
hi(0, "CmpItemAbbrMatchFuzzy", { fg = c.fn })
hi(0, "CmpItemMenu", { fg = c.fg2 })
hi(0, "CmpItemKindFunction", { fg = c.fn })
hi(0, "CmpItemKindMethod", { fg = c.fn })
hi(0, "CmpItemKindConstructor", { fg = c.class_ref })
hi(0, "CmpItemKindClass", { fg = c.type })
hi(0, "CmpItemKindInterface", { fg = c.type })
hi(0, "CmpItemKindStruct", { fg = c.type })
hi(0, "CmpItemKindEnum", { fg = c.type })
hi(0, "CmpItemKindEnumMember", { fg = c.constant })
hi(0, "CmpItemKindField", { fg = c.field })
hi(0, "CmpItemKindProperty", { fg = c.field })
hi(0, "CmpItemKindVariable", { fg = c.fg })
hi(0, "CmpItemKindConstant", { fg = c.constant })
hi(0, "CmpItemKindKeyword", { fg = c.keyword })
hi(0, "CmpItemKindModule", { fg = c.type })
hi(0, "CmpItemKindSnippet", { fg = c.escape })
hi(0, "CmpItemKindText", { fg = c.fg2 })
hi(0, "CmpItemKindValue", { fg = c.number })
hi(0, "CmpItemKindUnit", { fg = c.number })
hi(0, "CmpItemKindColor", { fg = c.css_color })
hi(0, "CmpItemKindReference", { fg = c.link })
hi(0, "CmpItemKindOperator", { fg = c.operation })
hi(0, "CmpItemKindTypeParameter", { fg = c.type })

-- ── which-key ─────────────────────────────────────────────────────────────
hi(0, "WhichKeyFloat", { bg = c.bg2 })
hi(0, "WhichKey", { fg = c.accent })
hi(0, "WhichKeyGroup", { fg = c.type })
hi(0, "WhichKeyDesc", { fg = c.fg_ui })
hi(0, "WhichKeySeparator", { fg = c.dis })

-- ── indent-blankline ──────────────────────────────────────────────────────
-- INDENT_GUIDE = #393b40 / SELECTED_INDENT_GUIDE = #636669
hi(0, "IblIndent", { fg = c.indent_guide })
hi(0, "IblScope", { fg = c.ind_guide_sel })
link("IndentBlanklineChar", "IblIndent")
link("IndentBlanklineContextChar", "IblScope")
