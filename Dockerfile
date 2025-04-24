FROM requarks/wiki:2

# Add configuration to force IPv4
ENV NODE_OPTIONS="--dns-result-order=ipv4first"

# Copy a custom configuration file
COPY config.yml /wiki/config.template.yml

# Create an entry script that handles environment variable replacement
RUN echo '#!/bin/sh\n\
# Process environment variables in config file\n\
sed -e "s/\\\$\\\$DB_HOST/$DB_HOST/g" \\\n\
    -e "s/\\\$\\\$DB_PORT/$DB_PORT/g" \\\n\
    -e "s/\\\$\\\$DB_USER/$DB_USER/g" \\\n\
    -e "s/\\\$\\\$DB_PASS/$DB_PASS/g" \\\n\
    -e "s/\\\$\\\$DB_NAME/$DB_NAME/g" \\\n\
    -e "s/\\\$\\\$DB_SSL/$DB_SSL/g" \\\n\
    /wiki/config.template.yml > /wiki/config.yml\n\
\n\
# Start Wiki.js\n\
exec node server\n' > /wiki/entrypoint.sh && \
chmod +x /wiki/entrypoint.sh

# Set the entrypoint to our script
ENTRYPOINT ["/wiki/entrypoint.sh"]

# Render.com will provide environment variables for the database connection
# No additional configuration needed as Wiki.js image is already set up 