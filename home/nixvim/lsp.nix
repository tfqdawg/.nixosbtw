{ ... }:

{
  plugins.lsp = {
    enable = true;
    servers = {
      clangd.enable = true;
      basedpyright.enable = true;
      tinymist.enable = true;
    };

    onAttach = ''
      if client:supports_method("textDocument/completion") then
        vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
      end
    '';
  };
}
