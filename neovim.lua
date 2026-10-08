-- Extend the upstream theme; keep its UI and syntax as the foundation.
local function extend_christmas()
  local h = vim.api.nvim_set_hl
  local groups = {
    Type = { fg = "#3fbd52" }, Structure = { fg = "#3fbd52" },
    Typedef = { fg = "#3fbd52" }, Title = { fg = "#3fbd52", bold = true },
    Keyword = { fg = "#ff5558", bold = true },
    Statement = { fg = "#ff5558" }, Conditional = { fg = "#ff5558" },
    Repeat = { fg = "#ff5558" }, StorageClass = { fg = "#ff5558" },
    Constant = { fg = "#7fbfff" }, PreProc = { fg = "#c9976b" },
    Include = { fg = "#c9976b" }, Define = { fg = "#c9976b" },
    Macro = { fg = "#c9976b" }, SpecialComment = { fg = "#c9976b" },
    FloatBorder = { fg = "#3fbd52", bg = "#1a2a3a" },
    DiffAdd = { fg = "#70d980", bg = "#163529" },
    DiffDelete = { fg = "#ff777a", bg = "#392332" },
    DiffChange = { fg = "#ffd580", bg = "#34312b" },
    ["@keyword"] = { fg = "#ff5558", bold = true },
    ["@keyword.return"] = { fg = "#ff5558" },
    ["@keyword.import"] = { fg = "#c9976b" },
    ["@type"] = { fg = "#3fbd52" }, ["@type.builtin"] = { fg = "#3fbd52" },
    ["@constant"] = { fg = "#7fbfff" },
    ["@constant.builtin"] = { fg = "#7fbfff" },
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
  local ansi = { "#0a1428", "#ff5558", "#3fbd52", "#ffb84d", "#7fbfff", "#c9976b", "#a5d8ef", "#e0e6ed",
    "#8b95a5", "#ff777a", "#70d980", "#ffd580", "#a3d2ff", "#deb28e", "#c7eafa", "#ffffff" }
  for i, color in ipairs(ansi) do vim.g["terminal_color_" .. (i - 1)] = color end
end

return {
  {
    "ChaseRensberger/christmas.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("Omachristmas", { clear = true }),
        pattern = "christmas",
        callback = extend_christmas,
      })
      vim.cmd.colorscheme("christmas")
    end,
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "christmas" } },
}
