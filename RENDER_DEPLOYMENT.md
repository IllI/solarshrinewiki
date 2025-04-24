# Deploying Solar Shrine Wiki to Render.com

This guide walks you through deploying the Solar Shrine Wiki to Render.com with Supabase as the database backend.

## Prerequisites

- A Supabase account with an active project
- A Render.com account
- Git repository with your Wiki.js files

## Deployment Steps

### 1. Push Your Files to GitHub

First, make sure your repository includes these essential files:
- `Dockerfile` - Simple configuration for Wiki.js
- `render.yaml` - Render deployment configuration
- `IMPORT_HOMEPAGE.md` - Instructions for importing the homepage after deployment

Push these files to your GitHub repository.

### 2. Deploy to Render

1. Log in to your Render.com account
2. Click the "New" button and select "Blueprint"
3. Connect your GitHub repository
4. Render will detect the `render.yaml` file and configure your service
5. You'll be prompted to provide values for environment variables marked with `sync: false`:
   - `DB_PASS`: Enter your Supabase PostgreSQL password: `solarshrine2025`
6. Click "Apply" to start the deployment

### 3. Wait for Deployment

- Render will build and deploy your Wiki.js instance
- This process typically takes 5-10 minutes

### 4. First-Time Setup

1. Once deployed, click the URL provided by Render to access your Wiki.js instance
2. You'll be prompted to complete the Wiki.js setup:
   - Create an admin account
   - Configure basic settings

### 5. Import the Homepage

Follow the instructions in `IMPORT_HOMEPAGE.md` to set up your wiki homepage.

## Troubleshooting

### Database Connection Issues

If you encounter database connection problems:
1. Check if the Supabase password is correct in the Render environment variables
2. Verify that your Supabase database allows connections from external services
3. Ensure the Supabase project is active and not in maintenance mode

### Custom Domain Setup

To use a custom domain (e.g., wiki.solarshrine.org):
1. In your Render dashboard, go to your service settings
2. Click on "Custom Domain"
3. Add your domain and follow the DNS configuration instructions

## Maintenance

- Render automatically deploys updates when you push changes to your repository
- Manage your Wiki.js administration through the admin panel at your-wiki-url/admin 