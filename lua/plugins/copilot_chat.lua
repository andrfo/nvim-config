return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken", -- Kun for Linux og Mac
		opts = {
			model = "gpt-5",

			prompts = {
				Rename = {
					prompt = "Du får en markert kodeblokk som input. Oppgaven din er KUN å rename variabler, funksjoner og felt til norske, beskrivende navn.",
					selection = function(source)
						local select = require("CopilotChat.select")
						return select.visual(source)
					end,
				},
			},
		},
		keys = {
			{ "<leader>ct", ":CopilotChatToggle<CR>", desc = "Toggle CopilotChat" },

			{ "<leader>cr", ":CopilotChatRename<CR>", mode = "v", desc = "CopilotChat - Rename" },
			{ "<leader>cR", ":CopilotChatReview<CR>", mode = "v", desc = "CopilotChat - Review code" },
			{ "<leader>ct", ":CopilotChatTestsCR>", mode = "v", desc = "CopilotChat - Write tests" },
			{ "<leader>cd", ":CopilotChatToggle<CR>", mode = "v", desc = "CopilotChat - Write documentation" },

			{ "<leader>cp", ":CopilotChatPrompts<CR>", desc = "View/Select CopilotChat Prompts" },
			{ "<leader>cm", ":CopilotChatModels<CR>", desc = "View/Select CopilotChat Models" },
		},
	},
}
