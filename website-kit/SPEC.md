# business.json: a business's own facts, in one small public file (v0.1)

Status: proposed, v0.1, 2026-11-19. Canonical copy: https://assistant247.net/kit/spec
License: this specification is [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). The example files in this folder are MIT.

A local business publishes its own facts as JSON at `https://<its site>/.well-known/business.json`, and the same facts as a
`## Business facts` block in `/llms.txt`. Anyone may read, write, validate or build tools for it. It needs no account, no registry
and no AssistAnt. It complements schema.org JSON-LD, which stays the standard for search engines; its job is one clean, dated copy
of the facts that any program can fetch without parsing a web page.

No AI assistant or search engine has said it reads this file. It is published so the people building websites and AI tools can.
It will stay small and backward compatible.

## Rules

1. **Location:** `/.well-known/business.json` on the business's own website (RFC 8615), served as `application/json`, UTF-8,
   public. One business per file.
2. **Only the owner's own facts.** No reviews, ratings or claims about other businesses. Leave a field out rather than guess.
3. **`updated` is required** (YYYY-MM-DD) and changes whenever the owner re-confirms the facts. Treat a file not updated in over a
   year as possibly stale.
4. **Mirror:** the same facts as short `- Label: value` lines under `## Business facts` in `/llms.txt`. If they disagree, the JSON
   file wins.
5. **Consistency:** name, phone and address should match the page's schema.org JSON-LD and the business's public profiles.
6. **Extending:** unknown fields are allowed and ignored by readers that don't know them. Prefix private extensions `x_<tool>_`.

## Fields

| field | | meaning |
|---|---|---|
| `name` | required | The business name customers know. |
| `updated` | required | YYYY-MM-DD: the day the owner last confirmed these facts. |
| `phone` / `website` / `email` / `booking` | one required | At least one way to reach the business. Phone in E.164 (`+16155550134`) preferred. |
| `description` | | One or two plain sentences in the owner's words. |
| `category` | | A schema.org type: `LocalBusiness`, `Plumber`, `HVACBusiness`, `Electrician`, `AutoRepair` ... |
| `services` | | List of plain service names. |
| `address` | | `{street, city, region, postal_code, country}`. Service-area businesses may leave out the street. |
| `service_area` | | List of towns, counties or ZIPs served. |
| `hours` | | List of schema.org `openingHours` strings (`"Mo-Fr 08:00-17:00"`). |
| `hours_note` | | Free text, e.g. "Phone answered 24/7". |
| `booking` | | `{phone, url, how}`. |
| `profiles` | | Public profile URLs (same meaning as schema.org `sameAs`). |
| `verified_by` | | Independent checks of these facts: `[{name, url, note}]`. Any directory or association may be named; none is required. |
| `spec`, `spec_version` | | `https://assistant247.net/kit/spec` and `"0.1"`. |

Machine-readable: [business.schema.json](business.schema.json) (JSON Schema 2020-12). Examples: [example.business.json](example.business.json),
[example.llms.txt](example.llms.txt), and the matching schema.org JSON-LD in [example.jsonld.html](example.jsonld.html).

## Tools (free)

- Generate all three files: `GET https://assistant247.net/api/kit?name=&phone=&website=&city=&state=&services=&hours=`
  (or `?slug=` for a business listed on AssistAnt 24/7).
- Check a site: https://assistant247.net/kit/check or `GET https://assistant247.net/api/kit/check?url=<site>`.
