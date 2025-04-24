# Deploying Solar Shrine Wiki to Render.com

This guide walks you through deploying the Solar Shrine Wiki to Render.com using Render's managed PostgreSQL database.

## Prerequisites

- A Render.com account
- Git repository with your Wiki.js files

## Deployment Steps

### 1. Push Your Files to GitHub

First, make sure your repository includes these essential files:
- `Dockerfile` - Simple configuration for Wiki.js
- `render.yaml` - Render deployment configuration with PostgreSQL database
- `IMPORT_HOMEPAGE.md` - Instructions for importing the homepage after deployment

Push these files to your GitHub repository.

### 2. Deploy to Render

1. Log in to your Render.com account
2. Click the "New" button and select "Blueprint"
3. Connect your GitHub repository
4. Render will detect the `render.yaml` file and configure your services:
   - A Wiki.js web service
   - A PostgreSQL database with automatic connections
5. Click "Apply" to start the deployment

### 3. Wait for Deployment

- Render will build and deploy both your Wiki.js instance and PostgreSQL database
- This process typically takes 5-10 minutes
- The database will be automatically provisioned and connected to Wiki.js

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
1. Check the Render logs for both the Web Service and the PostgreSQL database
2. Verify that both services are running correctly
3. Make sure the web service can access the database (check network settings)

### Custom Domain Setup

To use a custom domain (e.g., wiki.solarshrine.org):
1. In your Render dashboard, go to your service settings
2. Click on "Custom Domain"
3. Add your domain and follow the DNS configuration instructions

## Maintenance

- Render automatically deploys updates when you push changes to your repository
- Manage your Wiki.js administration through the admin panel at your-wiki-url/admin
- Database backups are handled automatically by Render 