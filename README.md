# OpenVSCode + Codex + Playwright auf VPS

Dieses Repo baut ein eigenes Docker-Image auf Basis von `gitpod/openvscode-server:latest` und installiert:

- OpenVSCode Server
- Codex CLI
- Playwright MCP
- Chromium für headless Browser-Tests
- Git, Python, pip, Node.js
- bubblewrap für Linux-Sandboxing

## Repo-Struktur

- `Dockerfile`: das Custom Image
- `docker-compose.yml`: Laufzeit auf dem VPS
- `.codex/config.toml`: Codex + Playwright MCP
