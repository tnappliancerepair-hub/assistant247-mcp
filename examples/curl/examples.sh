#!/bin/sh
# The AssistAnt 24/7 MCP server speaks plain JSON-RPC over HTTPS (MCP Streamable HTTP). No key, no signup.
MCP=https://assistant247.net/mcp
H='-H Content-Type:application/json -H Accept:application/json,text/event-stream'

# What tools are there?
curl -s $H $MCP -d '{"jsonrpc":"2.0","id":1,"method":"tools/list"}'

# HVAC companies near ZIP 37013 (Antioch, TN), verified first, then by distance
curl -s $H $MCP -d '{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"find_pros","arguments":{"zip":"37013","service":"hvac"}}}'

# Appliance repair near 70433 for a Samsung fridge that isn't making ice (matching free repair guides come back too)
curl -s $H $MCP -d '{"jsonrpc":"2.0","id":3,"method":"tools/call","params":{"name":"find_pros","arguments":{"zip":"70433","brand":"samsung","appliance":"refrigerator","problem":"not making ice"}}}'

# Plumbers within 25 miles of Covington, LA (no ZIP needed)
curl -s $H $MCP -d '{"jsonrpc":"2.0","id":4,"method":"tools/call","params":{"name":"get_town_summary","arguments":{"town":"Covington","state":"LA","service":"plumbing"}}}'

# What technicians actually found on Samsung refrigerators that weren't making ice
curl -s $H $MCP -d '{"jsonrpc":"2.0","id":5,"method":"tools/call","params":{"name":"what_breaks","arguments":{"appliance":"refrigerator","brand":"samsung","problem":"not making ice"}}}'

# Plain REST works too (same data): https://assistant247.net/openapi.json
curl -s 'https://assistant247.net/api/pros?zip=37013&service=hvac'
