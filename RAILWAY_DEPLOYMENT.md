# Railway Deployment Guide for Inventory Management System

## Prerequisites
- GitHub account with your project repository
- Railway account (free to start)

## Deployment Steps

### 1. Upload to GitHub
1. Create a new repository on GitHub
2. Upload your clean project files
3. Make sure the repository is public

### 2. Deploy to Railway

#### Step 1: Create Railway Account
1. Go to [railway.app](https://railway.app)
2. Sign up with your GitHub account

#### Step 2: Deploy Your App
1. Click "New Project"
2. Select "Deploy from GitHub repo"
3. Choose your inventory management repository
4. Railway will automatically detect it's a Node.js app

#### Step 3: Add PostgreSQL Database
1. In your Railway project dashboard
2. Click "New Service"
3. Select "Database" → "PostgreSQL"
4. Railway will automatically provision a database

#### Step 4: Configure Environment Variables
1. Go to your web service settings
2. Add these environment variables:
   - `SESSION_SECRET`: Generate a secure random string (32+ characters)
   - `NODE_ENV`: production
3. Railway will automatically connect the database variables

#### Step 5: Deploy and Setup Database
1. Your app will automatically deploy
2. Once deployed, go to the web service
3. Click "Connect" to get your app URL
4. Visit `your-app-url.railway.app/api/health` to verify it's running

#### Step 6: Initialize Database Schema
1. In Railway dashboard, go to your web service
2. Click "Deployments" tab
3. Find the latest deployment and click "View Logs"
4. The database schema will be automatically created

## Important Notes

### Database Setup
- Railway automatically creates a PostgreSQL database
- The connection string is auto-generated
- Your app will automatically connect using the DATABASE_URL

### Environment Variables
Railway automatically provides:
- `DATABASE_URL`
- `PGHOST`, `PGPORT`, `PGUSER`, `PGPASSWORD`, `PGDATABASE`
- `PORT` (Railway assigns this automatically)

You only need to manually set:
- `SESSION_SECRET` (generate a secure random string)

### Free Tier Limitations
- $5 free credit (one-time)
- Apps may sleep after inactivity
- Limited build minutes

## Troubleshooting

### Build Issues
- Check the build logs in Railway dashboard
- Ensure all dependencies are in package.json
- Verify NODE_ENV is set to production

### Database Connection Issues
- Verify PostgreSQL service is running
- Check if DATABASE_URL is properly set
- Review connection logs

### App Not Loading
- Check deployment logs
- Verify the health endpoint: `/api/health`
- Ensure PORT environment variable is set

## Post-Deployment

### Accessing Your App
- Your app will be available at: `https://your-app-name.railway.app`
- Health check: `https://your-app-name.railway.app/api/health`

### Monitoring
- Monitor usage in Railway dashboard
- Check logs for any errors
- Set up alerts for service health

## Scaling
When you outgrow the free tier:
- Upgrade to paid plan for always-on service
- Consider adding Redis for session storage
- Enable auto-scaling for high traffic