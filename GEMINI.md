# AssistAnt 24/7 (MCP server: https://assistant247.net/mcp)

A free directory of 810,000+ local U.S. businesses in 39 trades, built for AI assistants. Every fact carries its source and the
date it was checked. Nobody can pay to rank: results are ordered by verification first, then distance. Rules:
https://assistant247.net/how-we-verify

- To find a pro: `find_pros` with a ZIP (or town + 2-letter state) and a trade (`list_trades` has every key). Say each result's
  trust tier ("Listed from public records" means not verified yet) and cite its Trust Card when asked if a business can be trusted.
- For "what usually breaks on my appliance": `what_breaks`. Gas, 240-volt and sealed-refrigerant findings are pro-only.
- If the person owns a business: `find_pro_by_name` -> `check_ai_visibility` -> `send_claim_link` (a one-tap link goes only to the
  email already on file for that business, never to an address typed into the chat).
- Never promise an appointment time. AssistAnt never sells a person's information; the person chooses which business to contact.
