{ ... }:

{
	keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
      options.desc = "find files";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<CR>";
      options.desc = "live grep";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<CR>";
      options.desc = "search help";
    }
    {
      mode = "n";
      key = "<leader>o";
      action = ":Oil --float<CR>";
      options = {
        desc = "Oil file explorer";
        silent = true;
      };
    }
		{
    	mode = "n";
    	key = "<leader>sh";
    	action = "<C-w>h";
    	options = {
      	desc = "go to left split";
      	silent = true;
    	};
    }
		{
    	mode = "n";
    	key = "<leader>sj";
    	action = "<C-w>j";
    	options = {
      	desc = "go to bottom split";
      	silent = true;
    	};
    }
		{
    	mode = "n";
    	key = "<leader>sk";
    	action = "<C-w>k";
    	options = {
      	desc = "go to top split";
      	silent = true;
    	};
    }
		{
    	mode = "n";
    	key = "<leader>sl";
    	action = "<C-w>l";
    	options = {
      	desc = "go to right split";
      	silent = true;
    	};
    }
		{
    	mode = "n";
    	key = "<leader>gh";
    	action = "<cmd>tabprevious<CR>";
    	options = {
      	desc = "previous tab";
      	silent = true;
    	};
    }
		{
    	mode = "n";
    	key = "<leader>gl";
    	action = "<cmd>tabnext<CR>";
    	options = {
      	desc = "next tab";
      	silent = true;
    	};
    }
    {
      mode = "i";
      key = "<C-Space>";
      action = "<Cmd>lua vim.lsp.completion.get()<CR>";
      options.desc = "Trigger completion manually";
    }
    {
      mode = "i";
      key = "<Tab>";
      action.__raw = ''
        function()
          if vim.fn.pumvisible() == 1 then
            return "<C-n>"
          else
            return "<Tab>"
          end
        end
      '';
      options = {
        expr = true;
        desc = "Next completion item";
      };
    }
    {
      mode = "i";
      key = "<S-Tab>";
      action.__raw = ''
        function()
          if vim.fn.pumvisible() == 1 then
            return "<C-p>"
          else
            return "<S-Tab>"
          end
        end
      '';
      options = {
        expr = true;
        desc = "Previous completion item";
      };
    }
    {
      mode = "i";
      key = "<CR>";
      action.__raw = ''
        function()
          if vim.fn.pumvisible() == 1 then
            return "<C-y>"
          else
            return "<CR>"
          end
        end
      '';
      options = {
        expr = true;
        desc = "Confirm completion / normal Enter";
      };
    }
    {
      mode = "i";
      key = "<C-e>";
      action.__raw = ''
        function()
          if vim.fn.pumvisible() == 1 then
            return "<C-e>"
          else
            return "<C-e>"
          end
        end
      '';
      options = {
        expr = true;
        desc = "Abort completion";
      };
    }
	];
}
