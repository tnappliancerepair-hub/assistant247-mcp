"""Find local tradespeople near a ZIP code with the AssistAnt 24/7 MCP server.

Python 3.8+, standard library only:  python3 find_pros.py 37013 hvac
"""
import json
import sys
import urllib.request

MCP_URL = "https://assistant247.net/mcp"


def call(method, params, req_id=1):
    body = json.dumps({"jsonrpc": "2.0", "id": req_id, "method": method, "params": params}).encode()
    req = urllib.request.Request(MCP_URL, data=body, headers={
        "Content-Type": "application/json",
        "Accept": "application/json, text/event-stream",
        "User-Agent": "assistant247-mcp-example/1.0 (+https://github.com/tnappliancerepair-hub/assistant247-mcp)",
    })
    with urllib.request.urlopen(req, timeout=30) as r:
        return json.loads(r.read())


def main():
    zip_code = sys.argv[1] if len(sys.argv) > 1 else "37013"
    service = sys.argv[2] if len(sys.argv) > 2 else "appliance_repair"
    call("initialize", {"protocolVersion": "2025-06-18", "capabilities": {},
                        "clientInfo": {"name": "find-pros-example", "version": "1.0"}})
    res = call("tools/call", {"name": "find_pros", "arguments": {"zip": zip_code, "service": service}}, 2)
    data = json.loads(res["result"]["content"][0]["text"])
    for p in data.get("results", [])[:10]:
        print(f'{p["name"]:<45} {p.get("distance_miles", "?"):>5} mi  {p["trust"]["label"]}')
        print(f'    {p.get("phone") or ""}  {p.get("profile") or ""}')


if __name__ == "__main__":
    main()
