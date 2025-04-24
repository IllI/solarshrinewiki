FROM requarks/wiki:2

# Add configuration to force IPv4
ENV NODE_OPTIONS="--dns-result-order=ipv4first"

# Copy a custom configuration file
COPY config.yml /wiki/config.template.yml

# Install envsubst
RUN apt-get update && apt-get install -y gettext-base && apt-get clean

# Create an entry script
RUN echo '#!/bin/sh\n\
envsubst < /wiki/config.template.yml > /wiki/config.yml\n\
exec node server\n' > /wiki/entrypoint.sh && \
chmod +x /wiki/entrypoint.sh

# Set the entrypoint to our script
ENTRYPOINT ["/wiki/entrypoint.sh"]

# Render.com will provide environment variables for the database connection
# No additional configuration needed as Wiki.js image is already set up 