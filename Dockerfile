# Mostly from here - https://github.com/cdr/deploy-code-server/blob/main/Dockerfile
# Start from the code-server Debian base image
FROM codercom/code-server:3.10.2

# Use our custom entrypoint script first
COPY entrypoint.sh /usr/bin/entrypoint.sh


USER coder

# Apply VS Code settings
COPY configs/settings.json .local/share/code-server/User/settings.json

# Use bash shell
ENV SHELL=/bin/bash

# Fix permissions for code-server
RUN sudo chown -R coder:coder /home/coder/.local

# You can add custom software and dependencies for your environment below
# -----------

# Install a VS Code extension:
# Note: we use a different marketplace than VS Code. See https://github.com/cdr/code-server/blob/main/docs/FAQ.md#differences-compared-to-vs-code
RUN code-server --install-extension ms-python.python && code-server --install-extension ms-toolsai.jupyter

# -----------

# Port
ENV PORT=8080

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
# Start from the code-server Debian base image
FROM codercom/code-server:3.10.2

# Use our custom entrypoint script first
COPY entrypoint.sh /usr/bin/entrypoint.sh


USER coder

# Apply VS Code settings
COPY configs/settings.json .local/share/code-server/User/settings.json

# Use bash shell
ENV SHELL=/bin/bash

# Fix permissions for code-server
RUN sudo chown -R coder:coder /home/coder/.local

# You can add custom software and dependencies for your environment below
# -----------

# Install a VS Code extension:
# Note: we use a different marketplace than VS Code. See https://github.com/cdr/code-server/blob/main/docs/FAQ.md#differences-compared-to-vs-code
RUN code-server --install-extension ms-python.python && code-server --install-extension ms-toolsai.jupyter

# -----------

# Port
ENV PORT=8080

ENTRYPOINT ["/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080"]
