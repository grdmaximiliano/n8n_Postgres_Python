# Start from the official n8n image
FROM n8nio/n8n

# The n8n image runs as the 'node' user.
# Switch to root to install system packages and Python libraries.
USER root

# --- Add your Python libraries here ---
# 1. Update the package lists
# 2. Install pip for Python 3
# 3. Clean up the apt cache to keep the image smaller
RUN apt-get update && \
    apt-get install -y python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Now, use pip3 to install your Python libraries
RUN pip3 install pandas
# Add any other 'pip3 install' commands here


# Switch back to the non-privileged 'node' user
# for security before starting the application.
USER node
