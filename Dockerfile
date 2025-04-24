FROM requarks/wiki:2

# Add configuration to force IPv4
ENV NODE_OPTIONS="--dns-result-order=ipv4first"

# No need for complex scripts, just rely on the built-in DB env vars support
CMD ["node", "server"]

# Render.com will provide environment variables for the database connection
# No additional configuration needed as Wiki.js image is already set up 