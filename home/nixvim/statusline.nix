{ ... }:

{
  opts = {
    laststatus = 3;
    statusline = "%!v:lua.stl()";
  };

  highlightOverride = {
    StatusLine = { bg = "NONE"; };
    StatusLineNC = { bg = "NONE"; };
    StlMode   = { fg = "#b07878"; bg = "NONE"; bold = true; };
    StlFile   = { fg = "#988090"; bg = "NONE"; };
    StlBranch = { fg = "#8a9868"; bg = "NONE"; };
    StlFt     = { fg = "#7890a0"; bg = "NONE"; };
    StlPos    = { fg = "#c09058"; bg = "NONE"; };
    StlSep    = { fg = "#3e3c38"; bg = "NONE"; };
  };

  extraConfigLua = ''
    local modes = {
      n = "NORMAL", i = "INSERT", v = "VISUAL", V = "V-LINE",
      ["\22"] = "V-BLOCK", c = "COMMAND", R = "REPLACE", t = "TERMINAL",
    }
    
    local function hl(group, text)
      return "%#" .. group .. "#" .. text
    end

    function _G.stl()
      local m = vim.fn.mode()
      local sep = hl("StlSep", " | ")

      local left = { hl("StlMode", modes[m] or m:upper()), hl("StlFile", "%f%m") }
      local branch = vim.b.gitsigns_head or ""
      if branch ~= "" then table.insert(left, hl("StlBranch", branch)) end

      local right = {}
      local ft = vim.bo.filetype
      if ft ~= "" then table.insert(right, hl("StlFt", "[" .. ft .. "]")) end
      table.insert(right, hl("StlPos", "%l:%c %p%%"))

      return table.concat(left, sep) .. "%#StatusLine#%=" .. table.concat(right, sep)
    end
  '';
}
