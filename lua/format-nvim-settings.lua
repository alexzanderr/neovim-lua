

-- format-nvim
--


-- https://www.kevinpeters.net/auto-formatters-for-python
-- https://github.com/mhartington/formatter.nvim/blob/master/CONFIG.md
--
--
--
--
require "format".setup {
    -- ["*"] = {
    --     {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
    -- },
	python = {
		{
			cmd = {"black"},
		}
	},
	sh = {
		{
			cmd = {"shfmt"},
		}
	},
	cpp = {{
			-- cmd = {"clang-format --style='{BasedOnStyle: chromium, IndentWidth: 4}'"}
			cmd = {"clang-format"}
	}},
	c = {{
			cmd = {"clang-format --style='{BasedOnStyle: chromium, IndentWidth: 4}'"}
	}},
    vim = {
        {
            cmd = {"luafmt -w replace"},
            start_pattern = "^lua << EOF$",
            end_pattern = "^EOF$"
        }
    },
    vimwiki = {
        {
            cmd = {"prettier -w --parser babel"},
            start_pattern = "^{{{javascript$",
            end_pattern = "^}}}$"
        }
    },
    lua = {
        {
            cmd = {
                function(file)
                    return string.format("luafmt -l %s -w replace %s", vim.bo.textwidth, file)
                end
            }
        }
    },
    go = {
        {
            cmd = {"gofmt -w", "goimports -w"},
            tempfile_postfix = ".tmp"
        }
    },
    javascript = {
        {cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}
    },
    markdown = {
        {cmd = {"prettier -w"}},
        {
            cmd = {"black"},
            start_pattern = "^```python$",
            end_pattern = "^```$",
            target = "current"
        }
    }
}
