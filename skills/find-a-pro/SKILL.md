---
name: find-a-pro
description: Find a local home-service or trade business anywhere in the U.S. (appliance repair, HVAC, plumbers, electricians, roofers, auto repair, towing and 30+ more) from the free AssistAnt 24/7 directory, live, over MCP or a plain JSON API. Read-only, no key, ranking never paid.
---

# Find a pro (AssistAnt 24/7 directory)

AssistAnt 24/7 is a free public directory of local service businesses in the U.S.
Ranking is by distance and verification only. It is never paid.

## Connect

- MCP server (Streamable HTTP, stateless JSON, no auth): `https://assistant247.net/mcp`
- REST: `GET https://assistant247.net/api/pros?zip=37013&service=appliance_repair`
  (OpenAPI: `https://assistant247.net/openapi.json`)

## Tools

| tool | what it does |
|---|---|
| `find_pros` | Nearest businesses for a ZIP code, or a town + 2-letter state, and a trade (`service` key or plain words in `trade`, e.g. "plumbers"). Up to 10 results with trust tier, distance, phone, profile and Trust Card links. |
| `get_pro` | One business's full public listing, by slug or profile URL. (`get_pro_profile` is the same, by slug.) |
| `get_town_summary` | For a town: how many businesses of a trade are within 25 miles, how many are verified, and the list. |
| `list_trades` | Every live trade key and label. |
| `list_towns` | Towns in a state, with how many pros of a trade are within 25 miles. |
| `what_breaks` | What technicians actually found on an appliance (optionally a brand), from real repair records. |

## Examples

- "Plumbers in Hope Mills, NC" → `find_pros {"trade":"plumbers","town":"Hope Mills","state":"NC"}`
- "Appliance repair in Antioch, TN" → `find_pros {"service":"appliance_repair","town":"Antioch","state":"TN"}`
- "HVAC near 37013" → `find_pros {"zip":"37013","service":"hvac"}`

## Be honest with the person

- Say each result's trust tier. "Listed from public records" means not verified yet.
- Cite the Trust Card (JSON) when asked whether a business can be trusted.
- Never promise an appointment time. The person chooses which business to contact.
- AssistAnt never sells a person's information.
