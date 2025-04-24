# Solar Shrine Wiki

Wiki.js deployment for Solar Shrine, optimized for Render.com with PostgreSQL database.

## Deployment Options

This repository contains configuration files for deploying Wiki.js in multiple ways:

1. **Render.com** (Recommended): Easy setup with built-in PostgreSQL database
2. Local Docker testing environment

## Render.com Deployment (Recommended)

The simplest way to deploy this wiki is through Render.com's Blueprint feature:

1. Fork or clone this repository to your GitHub account
2. Connect Render.com to your GitHub repository
3. Create a new Blueprint service pointing to this repository
4. Render will automatically set up:
   - Wiki.js web service
   - PostgreSQL database
   - All necessary connections

Detailed instructions can be found in [RENDER_DEPLOYMENT.md](RENDER_DEPLOYMENT.md).

## Files for Render Deployment

The most important files for Render deployment are:

- `Dockerfile`: Configures the Wiki.js container
- `render.yaml`: Defines the services to be created on Render (web app and database)
- `IMPORT_HOMEPAGE.md`: Instructions for setting up the wiki homepage after deployment

## Post-Deployment Setup

After deploying to Render:

1. Access your wiki at the provided URL (typically https://solar-shrine-wiki.onrender.com)
2. Complete the initial Wiki.js setup
3. Follow the instructions in [IMPORT_HOMEPAGE.md](IMPORT_HOMEPAGE.md) to set up your homepage

## Local Testing

For local testing with Docker, see [README-LOCAL-TESTING.md](README-LOCAL-TESTING.md).

## Overview

This repository contains everything needed to deploy a Wiki.js instance for [solarshrine.org](https://solarshrine.org) using Docker Compose. The setup includes:

- Wiki.js (collaborative knowledge platform)
- Nginx (web server with SSL termination)
- Certbot (automatic SSL certificate management)
- Connection to Supabase PostgreSQL database

## Quick Start

1. Clone this repository
2. Update the Supabase password in `docker-compose.yml`
3. Run `docker-compose up -d`
4. Access the wiki at http://your-server-ip
5. Complete the Wiki.js setup wizard

## Prerequisites

- Docker and Docker Compose
- A server with a public IP address (DigitalOcean, AWS, etc.)
- Domain name with access to DNS settings
- Supabase account and project (already set up)

## Detailed Setup Instructions

### 1. Server Preparation

Set up a server with Docker and Docker Compose installed. A DigitalOcean droplet with at least 1GB RAM is recommended.

```bash
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Install Docker Compose
apt-get install -y docker-compose
```

### 2. Repository Setup

```bash
git clone https://github.com/yourusername/solarshrine-wiki.git
cd solarshrine-wiki

# Create directories for certbot
mkdir -p certbot/conf certbot/www
```

### 3. Update Configuration

Update the Supabase password in `docker-compose.yml`:

```yaml
DB_PASS: "your-actual-supabase-password" # Get this from Supabase dashboard
```

Update the email in `docker-compose.yml`:

```yaml
WIKI_ADMIN_EMAIL: "your-email@example.com"
```

### 4. Deploy the Stack

```bash
docker-compose up -d
```

### 5. Configure DNS

Add an A record to point `wiki.solarshrine.org` to your server's IP address.

### 6. Obtain SSL Certificate

Once DNS has propagated, obtain an SSL certificate:

```bash
docker-compose run --rm certbot certonly --webroot --webroot-path=/var/www/certbot -d wiki.solarshrine.org
```

### 7. Complete Wiki.js Setup

Access your wiki at https://wiki.solarshrine.org and follow the setup wizard.

### 8. Initial Content

Upload the sample content files to your wiki:
- SAMPLE_HOME_PAGE.md
- SAMPLE_AFROFUTURISM_PAGE.md

## Maintenance

### Updates

Update Wiki.js:

```bash
docker-compose pull
docker-compose up -d
```

### Backups

Back up your wiki data:

```bash
docker-compose exec wiki tar -czvf /data/backup.tar.gz /data
docker cp solarshrine-wiki_wiki_1:/data/backup.tar.gz ./backup.tar.gz
```

## Supabase Connection

- **URL:** https://ofnxuxemfvuwipeireuy.supabase.co
- **Anon Public Key:** eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9mbnh1eGVtZnZ1d2lwZWlyZXV5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDUzODMxMDAsImV4cCI6MjA2MDk1OTEwMH0.d_g861ps8lsmHA8URrjtwfhOec57LcyEZYGDc7OvOjM

## License

This project is for the Solar Shrine community. 