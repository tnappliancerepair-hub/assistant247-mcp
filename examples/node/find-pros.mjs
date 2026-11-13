// Find local tradespeople near a ZIP code with the AssistAnt 24/7 MCP server.
// Node 18+ (built-in fetch), no packages:  node find-pros.mjs 37013 plumbing
const MCP_URL = 'https://assistant247.net/mcp';

async function call(method, params, id = 1) {
  const r = await fetch(MCP_URL, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json', Accept: 'application/json, text/event-stream' },
    body: JSON.stringify({ jsonrpc: '2.0', id, method, params }),
  });
  if (!r.ok) throw new Error(`HTTP ${r.status}`);
  return r.json();
}

const [zip = '37013', service = 'appliance_repair'] = process.argv.slice(2);
await call('initialize', { protocolVersion: '2025-06-18', capabilities: {}, clientInfo: { name: 'find-pros-example', version: '1.0' } });
const res = await call('tools/call', { name: 'find_pros', arguments: { zip, service } }, 2);
const data = JSON.parse(res.result.content[0].text);
for (const p of (data.results || []).slice(0, 10)) {
  console.log(`${p.name.padEnd(45)} ${String(p.distance_miles ?? '?').padStart(5)} mi  ${p.trust.label}`);
  console.log(`    ${p.phone || ''}  ${p.profile || ''}`);
}
