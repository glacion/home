{ pkgs, ... }:
{
  home.packages = with pkgs; [
    buck2
    dockerfile-language-server
    gopls
    nodePackages.typescript
    nodePackages.typescript-language-server
    opencode
    tombi
    ty
    yaml-language-server
  ];

  # OpenCode configuration
  xdg.configFile."opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    model = "openai/gpt-5.3-codex";

    lsp = {
      buck2 = {
        command = [
          "buck2"
          "lsp"
        ];
        extensions = [
          "buck"
          "bzl"
        ];
      };
      basedpyright = {
        disabled = true;
      };
      ty = {
        command = [
          "ty"
          "server"
        ];
        extensions = [
          "py"
        ];
      };
      tombi = {
        command = [
          "tombi"
          "lsp"
        ];
        extensions = [
          "toml"
        ];
      };
    };

    plugin = [
      "oh-my-opencode"
      "@tarquinen/opencode-dcp"
      "@mohak34/opencode-notifier"
    ];

    mcp = {
      # NixOS/Home-Manager documentation - query options, packages, and settings
      nixos = {
        enabled = true;
        type = "local";
        command = [
          "uv"
          "tool"
          "run"
          "mcp-nixos"
        ];
      };

      # Context7 - live documentation for any library
      context7 = {
        enabled = true;
        type = "remote";
        url = "https://mcp.context7.com/mcp";
      };

      # GitHub - repository access
      github = {
        enabled = true;
        type = "local";
        command = [
          "bunx"
          "--bun"
          "@modelcontextprotocol/server-github"
        ];
        environment = {
          GITHUB_PERSONAL_ACCESS_TOKEN = "{env:GITHUB_TOKEN}";
        };
      };

      # Filesystem - scoped file access to ~/Source
      filesystem = {
        enabled = true;
        type = "local";
        command = [
          "bunx"
          "mcp-server-filesystem"
          "/Users/glacion/Source"
        ];
      };

      # Sequential Thinking - structured reasoning for complex tasks
      sequential-thinking = {
        enabled = true;
        type = "local";
        command = [
          "bunx"
          "--bun"
          "@modelcontextprotocol/server-sequential-thinking"
        ];
      };

      # Fetch - retrieve and parse web content (Python-based)
      fetch = {
        enabled = true;
        type = "local";
        command = [
          "uv"
          "tool"
          "run"
          "mcp-server-fetch"
        ];
      };

      # DuckDuckGo Search - web search (no API key required)
      duckduckgo = {
        enabled = true;
        type = "local";
        command = [
          "uv"
          "tool"
          "run"
          "duckduckgo-mcp-server"
        ];
      };
    };
  };
}
