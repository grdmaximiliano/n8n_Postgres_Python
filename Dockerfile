# Start from the official n8n image
FROM n8nio/n8n

# The n8n image runs as the 'node' user.
# Switch to root to install system packages and Python libraries.
USER root

# --- Add your Python libraries here ---
# The base image is Alpine, so we use 'apk' (not 'apt-get')
# 1. Update the package lists
# 2. Install pip for Python 3 using --no-cache to avoid a separate cache cleanup step
RUN apk update && \
    apk add --no-cache python3-pip

# Now, use pip3 to install your Python libraries
RUN pip3 install pandas
# Add any other 'pip3 install' commands here


# Switch back to the non-privileged 'node' user
# for security before starting the application.
USER node
