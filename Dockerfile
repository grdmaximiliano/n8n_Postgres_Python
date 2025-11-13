# Start from the official n8n image
FROM n8nio/n8n

# The n8n image runs as the 'node' user.
# Switch to root to install system packages and Python libraries.
USER root

# --- Add your Python libraries here ---
# 1. Install Python 3, pip, and build-base (required for packages like pandas/numpy to compile C extensions)
RUN apk update && \
    apk add --no-cache python3 py3-pip build-base

# 2. Use pip3 to install your Python libraries.
# We must use --break-system-packages to bypass PEP 668 protection in Alpine,
# as we need to install the package system-wide for n8n to access it.
RUN pip3 install pandas --break-system-packages
# Add any other 'pip3 install' commands here

# 3. Clean up: Remove build dependencies to reduce the final image size.
RUN apk del build-base

# Switch back to the non-privileged 'node' user
# for security before starting the application.
USER node
