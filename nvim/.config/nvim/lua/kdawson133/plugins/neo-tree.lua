return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local tree = require("neo-tree")
        tree.setup({
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_by_name = {
                        '.git',
                        '.gitignore',
                    },
                    never_show = {
                        '.DS_Store',
                        'thumbs.db',
                    },
                },
            },
        })
        vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>")
        vim.keymap.set("n", "<leader>m", ":Neotree filesystem reveal top<CR>")
        vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>")
    end
}
