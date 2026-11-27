{ pkgs, inputs, ... }:

{
	programs.nixvim = {
		enable = true;
		defaultEditor = true;
		clipboard.register = "unnamedplus";

		globals = {
			mapleader = " ";
			maplocalleader = " ";
			loaded_netrw = 1;
			loaded_netrwPlugin = 1;
		};

    opts = {
      number = true;
      relativenumber = true;
      signcolumn = "yes";
      wrap = false;
      tabstop = 2;
      shiftwidth = 2;
      swapfile = false;
      winborder = "rounded";
			showmode = false;
      splitright = true;
      splitbelow = true;
      updatetime = 250;
      timeoutlen = 300;
      completeopt = [ "menu" "menuone" "noselect" "popup" ];
      pumheight = 10;
    };

		extraPlugins = [
			(pkgs.vimUtils.buildVimPlugin{
				name = "ember-nvim";
				src = inputs.ember-nvim;
			})
		];

		extraConfigLua = ''
			vim.cmd.colorscheme("ember")
		'';

    plugins = {
      oil.enable = true;
      gitsigns.enable = true;
      mini-icons = { enable = true; mockDevIcons = true; };
      mini-pairs.enable = true;
      indent-blankline.enable = true;
      telescope.enable = true;
		};

    imports = [
      ./keymaps.nix
      ./treesitter.nix
      ./lsp.nix
      ./statusline.nix
    ];
	};
}
