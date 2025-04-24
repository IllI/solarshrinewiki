# Importing the Homepage to Wiki.js

After you've successfully deployed your Wiki.js instance following the steps in `DEPLOYMENT_STEPS.md`, you'll want to set up your homepage. Here's how to import the sample homepage we've created:

## Method 1: Copy-Paste (Easiest)

1. Access your Wiki.js admin panel at `https://your-wiki-url/login`
2. Create a new page (click on the "+" button in the navigation)
3. Set the path to `/` (root)
4. Select "Markdown" as the editor
5. Open the `HOMEPAGE.md` file in this repository
6. Copy all of its contents
7. Paste into the Wiki.js editor
8. Click "Save" and publish the page

## Method 2: Git Sync (Advanced)

If you want to maintain your wiki content in Git:

1. In the Wiki.js admin panel, go to "Administration" > "Storage"
2. Enable and configure Git synchronization with your repository
3. Structure your repository with the `HOMEPAGE.md` file at the appropriate location
4. Run a sync operation

## Customizing Your Homepage

Once imported, you can customize your homepage:

1. Update the links to point to real pages in your wiki
2. Replace placeholder text with actual information about your community
3. Add images by uploading them to your Supabase storage bucket and linking to them
4. Consider adding custom CSS in the Wiki.js administration panel for unique styling

## Next Steps After Homepage Setup

1. Create the main sections referenced in the navigation links
2. Set up user permissions and access controls
3. Invite community members to contribute
4. Configure automated backups of your wiki content 