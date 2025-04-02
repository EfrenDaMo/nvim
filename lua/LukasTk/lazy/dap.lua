return {
	{
		"mfussenegger/nvim-dap",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.set_log_level("DEBUG")
			vim.keymap.set("n", "<leader>dp", dap.pause, { desc = "Debug: Pause" })
			vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Debug: Restart" })
			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Continue" })
			vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<leader>ds", dap.terminate, { desc = "Debug: Terminate" })
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Conditional Breakpoint" })

			vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
			vim.keymap.set("n", "<leader>de", dapui.eval, { desc = "Debug: Toggle Eval" })

			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			dap.listeners.after.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.after.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = {
					"delve",
				},
				automatic_installation = true,
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
					--[[
					delve = function(config)
						table.insert(config.configurations, 1, {
							args = function()
								return vim.split(vim.fn.input("args> "), " ")
							end,
							type = "delve",
							name = "file",
							request = "launch",
							program = "${file}",
							outputMode = "remote",
						})
						table.insert(config.configurations, 1, {
							args = function()
								return vim.split(vim.fn.input("args> "), " ")
							end,
							type = "delve",
							name = "file args",
							request = "launch",
							program = "${file}",
							outputMode = "remote",
						})
						require("mason-nvim-dap").default_setup(config)
					end,
					]]
					--
					python = function(config)
						config.adapters = {
							type = "executable",
							command = "/usr/bin/python3",
							args = {
								"-m",
								"debugpy.adapter",
							},
						}
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})
		end,
	},
}
