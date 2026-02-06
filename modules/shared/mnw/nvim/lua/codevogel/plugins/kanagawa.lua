return {
  "rebelot/kanagawa.nvim",
  opts = {
    overrides = function(colors)
      return {
        DiagnosticWarn = {
          fg = colors.palette.roninYellow,
          bg = colors.palette.sumiInk0,
          bold = false,
        },
      }
    end,
  },
}
