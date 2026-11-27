{ ... }:

{
  plugins.treesitter = {
    enable = true;
    settings = {
      auto_install = false;
      ensure_installed = [
        "c"
        "cpp"
        "python"
        "typst"
      ];
      highlight.enable = true;
    };
  };

  opts = {
    foldmethod = "expr";
    foldexpr = "v:lua.vim.treesitter.foldexpr()";
    foldlevelstart = 99;
  };
}
