require("codecompanion").setup({
    -- 1. Setup LiteLLM as the "Source of Truth"
    adapters = {

        http = {
            litellm = function()
                return require("codecompanion.adapters").extend("openai_compatible", {
                    env = {
                        url = "http://localhost:4000", -- Your LiteLLM URL
                    },
                    schema = {
                        model = {
                            default = "code-fast", -- Default to your RX 6600 model
                            choices = {
                                "code-fast",   -- Qwen 2.5 Coder (Fast)
                                "reasoning-heavy", -- DeepSeek-R1 (Heavy)
                                "research-bulk", -- Gemini 2.5 Pro (The Brains)
                            },
                        }
                    }
                })
            end
        }
    },
    strategies = {
        chat = { adapter = "litellm" },
        inline = { adapter = "litellm" },
        agent = { adapter = "litellm" },
    },
    display = {
        diff = {
            enabled = true,
            provider = "mini_diff", -- or "default"
        },
    },
})
