FROM requarks/wiki:2

# Add configuration to force IPv4
ENV NODE_OPTIONS="--dns-result-order=ipv4first"

# Copy a custom configuration file
COPY config.yml /wiki/config.yml

# Override the entrypoint to use our config
ENTRYPOINT ["node", "server"]

# Render.com will provide environment variables for the database connection
# No additional configuration needed as Wiki.js image is already set up 