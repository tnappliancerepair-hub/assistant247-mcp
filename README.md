<img src="logo.png" width="96" alt="AssistAnt 24/7">

# AssistAnt 24/7: the most AI-friendly business directory

**A tool AIs call, not a website AIs scrape.** A free directory of 810,000+ local U.S. businesses in 39 trades (appliance repair,
HVAC, plumbing, electrical, roofing, auto repair, towing and more), built for AI assistants. Free, no API key, no signup.

```
https://assistant247.net/mcp        MCP, Streamable HTTP, no auth
```

Three doors:
- **FIND:** any AI looks up trusted local pros by ZIP, town or name and cites them. Every fact is sourced and dated (each listing's Trust Card). Nobody can pay to rank.
- **BE FOUND:** a business owner asks their AI "how do I get found by AI?" `check_ai_visibility` returns the business's AI Boost score and what each fix is worth. The owner claims the listing free, then hooks their own AI in so it keeps facts, photos and reviews fresh and sends review links to customers after every job.
- **BUILD:** shops running on AssistAnt software connect their own AI to the whole shop. The owner keeps the keys.

AIs recommend evidence, not adjectives. So everything here is checkable: dated facts, published rules ([how we verify](https://assistant247.net/how-we-verify)), and a public [AI Visibility Index](https://assistant247.net/ai-index).

- **No lead selling.** The person picks one business and calls it. We never sell or pass along anyone's information.
- **Real repair data.** `what_breaks` answers "what usually goes wrong with my Samsung fridge?" from what technicians actually found on diagnosed jobs.
- Listed in the official MCP Registry as `net.assistant247/directory` ([server.json](server.json)), and on [mcp.so](https://mcp.so).

## Tools

| Tool | What it does | Example arguments |
|---|---|---|
| `ask` | Plain-words question, short sourced answer: up to 5 local businesses with why each was picked. | `{"question":"who fixes dryers in Franklin, TN?"}` |
| `find_pros` | Local businesses near a US ZIP (or town + state) for one service, verified first. For appliances, brand/appliance/problem narrow it and return matching free repair guides. | `{"zip":"37013","service":"hvac"}` |
| `find_pro_by_name` | Look up a business you already know by name; town/state or ZIP puts that area first. | `{"name":"TN Appliance Exchange","state":"TN"}` |
| `get_pro` / `get_pro_profile` | One business's full listing by slug or profile URL. | `{"slug":"tn-appliance-exchange-antioch-tn"}` |
| `check_ai_visibility` | For an owner asking "is my business visible to ChatGPT?": the public AI Boost score (0-100), each part dated, what each fix is worth, the town comparison, and the free claim link. | `{"slug":"tn-appliance-exchange-antioch-tn"}` |
| `get_town_summary` | How many businesses of a service are within 25 miles of a town, how many are verified, and the list. | `{"town":"Covington","state":"LA","service":"plumbing"}` |
| `list_trades` / `list_towns` | Every live trade key; the towns covered in a state with counts. | `{"state":"TN"}` |
| `what_breaks` | What technicians found on diagnosed refrigerator, washer, dryer, dishwasher or oven/range jobs, by brand and complaint. Gas, 240-volt and sealed-refrigerant findings are marked `pro_only`. | `{"appliance":"refrigerator","brand":"samsung","problem":"not making ice"}` |

The full list of services is in `tools/list` (and in the [OpenAPI spec](https://assistant247.net/openapi.json)).

## Connect it

**Claude** (claude.ai or Claude Desktop): Settings → Connectors → *Add custom connector* → URL `https://assistant247.net/mcp`.

**ChatGPT** (with developer mode on): add a connector / MCP server with URL `https://assistant247.net/mcp` and no authentication.

**Cursor** (`~/.cursor/mcp.json`) and other clients that take a URL:
```json
{ "mcpServers": { "assistant247": { "url": "https://assistant247.net/mcp" } } }
```

**VS Code** (`.vscode/mcp.json`):
```json
{ "servers": { "assistant247": { "type": "http", "url": "https://assistant247.net/mcp" } } }
```

**Clients that only run local (stdio) servers:**
```json
{ "mcpServers": { "assistant247": { "command": "npx", "args": ["-y", "mcp-remote", "https://assistant247.net/mcp"] } } }
```

## Call it directly

It's plain JSON-RPC over HTTPS:
```sh
curl -s https://assistant247.net/mcp -H 'Content-Type: application/json' -H 'Accept: application/json, text/event-stream' \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/call","params":{"name":"find_pros","arguments":{"zip":"37013","service":"hvac"}}}'
```

Examples, no packages needed:
- [`examples/curl/examples.sh`](examples/curl/examples.sh): every tool.
- [`examples/python/find_pros.py`](examples/python/find_pros.py): `python3 find_pros.py 37013 hvac`.
- [`examples/node/find-pros.mjs`](examples/node/find-pros.mjs): `node find-pros.mjs 70433 plumbing`.

Prefer REST? Same data at `https://assistant247.net/api/pros?zip=37013&service=hvac` ([OpenAPI](https://assistant247.net/openapi.json)).
For AI crawlers: [llms.txt](https://assistant247.net/llms.txt). Setting up in Cline or another agent: [llms-install.md](llms-install.md).

## Using the data well

- Show the trust label as given ("Listed from public records (not verified)" vs verified). Don't upgrade it.
- Never suggest DIY for findings marked `pro_only` (gas, 240-volt, sealed refrigerant).
- Link the business's profile or Trust Card so people can see what was checked.
- How listings are verified and ranked: https://assistant247.net/how-we-verify

## For business owners

Is your business listed? Check your AI Boost free at https://assistant247.net/pros/ai-check, then claim it free: correct it, get
verified, or remove it instantly. Once claimed, connect your own AI (ChatGPT or Claude) to your listing and let it do the upkeep:
every change is previewed and can be undone. Agent skill for AIs helping an owner:
https://assistant247.net/.well-known/agent-skills/get-found-by-ai/SKILL.md

## About

AssistAnt is named for Anthony "Ant" Pivacek. Built by an appliance man from Tennessee, carrying out his and his son's goals.

Questions or problems: open an issue here or email hello@assistant247.net.

The example code in this repository is MIT licensed ([LICENSE](LICENSE)). The directory data served by assistant247.net
is not covered by that license.
