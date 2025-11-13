# Start from the official n8n image
FROM n8nio/n8n

# The n8n image runs as the 'node' user.
# Switch to root to install system packages and Python libraries.
USER root

# --- Add your Python libraries here ---
# The base image already includes Python 3.
# You can use pip to install any libraries you need for your scripts.
# For example, to install 'pandas' and 'requests':
#
# RUN pip install pandas requests
#
# Add any other 'pip install' commands you need below.
RUN pip3 install pandas


# Switch back to the non-privileged 'node' user
# for security before starting the application.
USER node
