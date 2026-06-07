FROM gitpod/openvscode-server:latest

USER root

ARG NODE_MAJOR=22

RUN apt-get update && apt-get install -y     git curl wget ca-certificates gnupg unzip jq     python3 python3-pip python3-venv python3-dev     build-essential bubblewrap     && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_MAJOR}.x | bash -     && apt-get update && apt-get install -y nodejs     && rm -rf /var/lib/apt/lists/*

RUN npm install -g @openai/codex @playwright/mcp

RUN mkdir -p /workspace /artifacts /home/openvscode-server/.codex /home/openvscode-server/.cache/ms-playwright     && chown -R openvscode-server:openvscode-server /workspace /artifacts /home/openvscode-server

USER openvscode-server
WORKDIR /workspace
ENV HOME=/home/openvscode-server
ENV PLAYWRIGHT_BROWSERS_PATH=/home/openvscode-server/.cache/ms-playwright
ENV CODEX_HOME=/home/openvscode-server/.codex

RUN npx playwright install --with-deps chromium

EXPOSE 3000

CMD ["/bin/sh","-lc","exec /home/.openvscode-server/bin/openvscode-server --host 0.0.0.0 --port 3000 --connection-token ${OPENVSCODE_TOKEN:-changeme} --start-server /workspace"]
