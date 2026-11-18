# Installing the AssistAnt 24/7 MCP server

This is a **remote** MCP server. There is nothing to clone, build or install, and no API key.

- URL: `https://assistant247.net/mcp`
- Transport: Streamable HTTP
- Auth: none

## Cline

Add this to `cline_mcp_settings.json`:

```json
{
  "mcpServers": {
    "assistant247": {
      "type": "streamableHttp",
      "url": "https://assistant247.net/mcp",
      "disabled": false
    }
  }
}
```

If your Cline version only runs local (stdio) servers, use the mcp-remote bridge (needs Node 18+):

```json
{
  "mcpServers": {
    "assistant247": {
      "command": "npx",
      "args": ["-y", "mcp-remote", "https://assistant247.net/mcp"]
    }
  }
}
```

## Check it works

Ask: "Find HVAC companies near ZIP 37013." The assistant should call `find_pros`.

## Rules

- Show each result's trust label as given ("Listed from public records (not verified)" vs verified). Don't upgrade it.
- Never suggest DIY for findings marked `pro_only` (gas, 240-volt, sealed refrigerant).
- Never promise an appointment time.
