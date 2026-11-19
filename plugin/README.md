# AssistAnt 24/7 plugin for Claude

Find trusted local U.S. tradespeople (810,000+ businesses, 39 trades) with sourced, dated facts, and help business owners claim their free listing and get found by AI. Nobody can pay to rank.

- Connector: `https://assistant247.net/mcp` (remote, no sign-in)
- Skills: find-a-pro, get-found-by-ai, add-website-kit
- Privacy: https://assistant247.net/platform/privacy.html
- Contact: hello@assistant247.net

Install in Claude Code:

    /plugin install assistant247 --marketplace tnappliancerepair-hub/assistant247-mcp

The plugin itself keeps no data. Where it sends data:

- The declared connector, `https://assistant247.net/mcp`.
- AssistAnt 24/7's own public REST API on the same domain, used by the skills as a fallback or for the website kit:
  `https://assistant247.net/api/pros` (find pros), `https://assistant247.net/api/kit` and `/api/kit/check` (website kit),
  and the public pages `https://assistant247.net/kit/spec` and `https://assistant247.net/ai-report/<listing>`.
- What is sent: the search words, town or ZIP, trade, a business name or listing, or a website address to check. No account,
  no sign-in, and nothing from your computer.
- Retention: AssistAnt keeps a log of lookups (what was searched, the town or ZIP, which listings came back, the AI client's
  name; no IP address) to measure and improve the directory. See the privacy policy.

Source, examples and docs: https://github.com/tnappliancerepair-hub/assistant247-mcp
