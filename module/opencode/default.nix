{ ... }:
{
  # OpenCode configuration
  xdg.configFile."opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";

    plugin = [
      "oh-my-opencode"
      "@tarquinen/opencode-dcp"
      "@mohak34/opencode-notifier"
    ];

    mcp = {
      # NixOS/Home-Manager documentation - query options, packages, and settings
      nixos = {
        type = "local";
        command = [
          "uv"
          "tool"
          "run"
          "mcp-nixos"
        ];
        enabled = true;
      };

      # Context7 - live documentation for any library
      context7 = {
        type = "remote";
        url = "https://mcp.context7.com/mcp";
        enabled = true;
      };

      # GitHub - repository access
      github = {
        type = "local";
        command = [
          "bunx"
          "--bun"
          "@modelcontextprotocol/server-github"
        ];
        environment = {
          GITHUB_PERSONAL_ACCESS_TOKEN = "{env:GITHUB_TOKEN}";
        };
        enabled = true;
      };

      # Filesystem - scoped file access to ~/Source
      filesystem = {
        type = "local";
        command = [
          "bunx"
          "mcp-server-filesystem"
          "/Users/glacion/Source"
        ];
        enabled = true;
      };

      # Sequential Thinking - structured reasoning for complex tasks
      sequential-thinking = {
        type = "local";
        command = [
          "bunx"
          "--bun"
          "@modelcontextprotocol/server-sequential-thinking"
        ];
        enabled = true;
      };

      # Fetch - retrieve and parse web content (Python-based)
      fetch = {
        type = "local";
        command = [
          "uv"
          "tool"
          "run"
          "mcp-server-fetch"
        ];
        enabled = true;
      };

      # DuckDuckGo Search - web search (no API key required)
      duckduckgo = {
        type = "local";
        command = [
          "uv"
          "tool"
          "run"
          "duckduckgo-mcp-server"
        ];
        enabled = true;
      };
    };
  };
}
