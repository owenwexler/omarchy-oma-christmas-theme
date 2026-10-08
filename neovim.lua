-- Extend the upstream theme; keep its UI and syntax as the foundation.
local function extend_christmas()
  local h = vim.api.nvim_set_hl
  local groups = {
    Function = { fg = "#70d980", bold = true },
    Number = { fg = "#f0f4f8" }, Float = { fg = "#f0f4f8" },
    Special = { fg = "#ff777a" }, SpecialChar = { fg = "#ff777a" },
    CursorLineNr = { fg = "#70d980", bold = true },
    PmenuSel = { fg = "#0a1428", bg = "#70d980" },
    PmenuThumb = { bg = "#3fbd52" },
    TabLineSel = { fg = "#70d980", bg = "#0a1428", bold = true },
    WildMenu = { fg = "#0a1428", bg = "#70d980" },
    Question = { fg = "#70d980" },
    -- Explicit captures override upstream gold function and number colors.
    ["@function"] = { link = "Function" },
    ["@function.call"] = { link = "Function" },
    ["@function.builtin"] = { fg = "#ff5558", bold = true },
    ["@function.macro"] = { fg = "#ff5558", bold = true },
    ["@method"] = { link = "Function" },
    ["@method.call"] = { link = "Function" },
    ["@number"] = { link = "Number" },
    ["@number.float"] = { link = "Float" },
    ["@float"] = { link = "Float" },
    ["@lsp.type.function"] = { link = "Function" },
    ["@lsp.type.method"] = { link = "Function" },
    -- Vim's legacy shell syntax classifies `alias` as shStatement.
    shStatement = { fg = "#ff5558", bold = true },
    shAlias = { fg = "#ff5558", bold = true },
    Type = { fg = "#3fbd52" }, Structure = { fg = "#3fbd52" },
    Typedef = { fg = "#3fbd52" }, Title = { fg = "#3fbd52", bold = true },
    Keyword = { fg = "#ff5558", bold = true },
    Statement = { fg = "#ff5558" }, Conditional = { fg = "#ff5558" },
    Repeat = { fg = "#ff5558" }, StorageClass = { fg = "#ff5558" },
    Constant = { fg = "#f0f4f8" }, PreProc = { fg = "#ff5558", bold = true },
    Include = { fg = "#ff5558" }, Define = { fg = "#ff5558" },
    Macro = { fg = "#ff5558" }, SpecialComment = { fg = "#c9976b" },
    FloatBorder = { fg = "#3fbd52", bg = "#1a2a3a" },
    DiffAdd = { fg = "#70d980", bg = "#163529" },
    DiffDelete = { fg = "#ff777a", bg = "#392332" },
    DiffChange = { fg = "#ffd580", bg = "#34312b" },
    ["@keyword"] = { fg = "#ff5558", bold = true },
    ["@keyword.return"] = { fg = "#ff5558" },
    ["@keyword.import"] = { fg = "#ff5558" },
    ["@type"] = { fg = "#3fbd52" }, ["@type.builtin"] = { fg = "#3fbd52" },
    ["@constant"] = { fg = "#f0f4f8" },
    ["@constant.builtin"] = { fg = "#ff777a" },
    ["@attribute"] = { fg = "#c9976b" },
    ["@module"] = { fg = "#3fbd52" },
    ["@function.method"] = { link = "Function" },
    ["@function.method.call"] = { link = "Function" },
    ["@markup.heading"] = { fg = "#3fbd52", bold = true },
    ["@markup.link"] = { fg = "#7fbfff", underline = true },
    ["@markup.raw"] = { fg = "#c9976b" },
    GitSignsAdd = { fg = "#3fbd52" }, GitSignsChange = { fg = "#ffb84d" },
    GitSignsDelete = { fg = "#ff5558" },
  }
  for name, value in pairs(groups) do h(0, name, value) end
  local ansi = { "#0a1428", "#ff5558", "#3fbd52", "#70d980", "#3fbd52", "#ff5558", "#f0f4f8", "#e0e6ed",
    "#8b95a5", "#ff777a", "#70d980", "#f0f4f8", "#70d980", "#ff777a", "#ffffff", "#ffffff" }
  for i, color in ipairs(ansi) do vim.g["terminal_color_" .. (i - 1)] = color end
end

return {
  {
    "ChaseRensberger/christmas.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("OmaChristmas", { clear = true }),
        pattern = "christmas",
        callback = extend_christmas,
      })
      vim.cmd.colorscheme("christmas")
    end,
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "christmas" } },
}
