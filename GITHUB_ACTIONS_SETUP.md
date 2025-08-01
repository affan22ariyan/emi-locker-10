# 🚀 GitHub Actions Setup for EMI Locker APK

## 📋 Prerequisites

Before setting up GitHub Actions, ensure you have:
- [ ] **GitHub account** (free)
- [ ] **Git installed** on your computer
- [ ] **Your EMI Locker project** ready

## 🔧 Step-by-Step Setup

### Step 1: Create GitHub Repository

1. **Go to GitHub.com** and sign in
2. **Click the "+" icon** in the top right corner
3. **Select "New repository"**
4. **Fill in repository details**:
   - Repository name: `emi-locker-app`
   - Description: `EMI Locker Android App - Device Security Application`
   - Make it **Public** (for free GitHub Actions)
   - **Don't** initialize with README (we'll push our existing code)
5. **Click "Create repository"**

### Step 2: Initialize Git and Push to GitHub

Open your terminal/command prompt in your project folder and run:

```bash
# Initialize Git repository
git init

# Add all files to Git
git add .

# Create initial commit
git commit -m "Initial commit: EMI Locker Android App"

# Add GitHub as remote origin (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/emi-locker-app.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Step 3: Verify GitHub Actions Workflow

The GitHub Actions workflow is already configured in your project at `.github/workflows/build.yml`. It will:

1. **Automatically trigger** on every push to main branch
2. **Set up Java 11** and Android SDK
3. **Build the APK** using Gradle
4. **Upload APK artifacts** for download

### Step 4: Monitor the Build

1. **Go to your GitHub repository**
2. **Click the "Actions" tab**
3. **You should see a workflow running** (or completed)
4. **Click on the workflow run** to see details

### Step 5: Download the APK

Once the build completes successfully:

1. **Click on the workflow run** in the Actions tab
2. **Scroll down to "Artifacts"**
3. **Click "emi-locker-apk"** to download the release APK
4. **Click "emi-locker-debug-apk"** to download the debug APK

## 📱 APK Installation

After downloading the APK:

1. **Enable Unknown Sources** on your Android device
2. **Transfer APK** to your device
3. **Install the APK**
4. **Grant all permissions** when prompted
5. **Enable Device Admin** in the app

## 🔧 Manual Trigger (Optional)

If you want to trigger a build manually:

1. **Go to Actions tab** in your repository
2. **Click "Build EMI Locker APK"** workflow
3. **Click "Run workflow"** button
4. **Select branch** (usually main)
5. **Click "Run workflow"**

## 📊 Build Status

The workflow will show different statuses:

- 🟡 **Yellow**: Build in progress
- 🟢 **Green**: Build successful
- 🔴 **Red**: Build failed

## 🔍 Troubleshooting

### Common Issues:

1. **Build fails with "Gradle sync failed"**
   - Check the workflow logs for specific errors
   - Usually related to dependency issues
   - The workflow should handle most cases automatically

2. **APK not generated**
   - Check if the build completed successfully
   - Look for "Upload APK" step in the logs
   - Verify artifacts are available for download

3. **Workflow not triggering**
   - Ensure you pushed to the `main` branch
   - Check if the workflow file is in `.github/workflows/build.yml`
   - Verify the repository is public (for free accounts)

### Build Logs

To check build logs:

1. **Go to Actions tab**
2. **Click on the workflow run**
3. **Click on the "build" job**
4. **Expand steps** to see detailed logs

## 🎯 Benefits of GitHub Actions

✅ **Automatic builds** on every code change
✅ **No local setup** required (Java, Android SDK, etc.)
✅ **Consistent builds** across different environments
✅ **Easy sharing** - anyone can download the APK
✅ **Version control** - track changes and releases
✅ **Free** for public repositories

## 📈 Advanced Features

### Release Management

To create releases with APKs:

1. **Go to Releases** in your repository
2. **Click "Create a new release"**
3. **Tag version** (e.g., v1.0.0)
4. **Upload APK** from Actions artifacts
5. **Publish release**

### Branch Protection

To protect your main branch:

1. **Go to Settings** → **Branches**
2. **Add rule** for main branch
3. **Require status checks** to pass
4. **Require pull request reviews**

## 🚀 Quick Commands

```bash
# Check if Git is initialized
git status

# Add all files
git add .

# Commit changes
git commit -m "Update EMI Locker app"

# Push to GitHub
git push origin main

# Check remote repository
git remote -v
```

## 📞 Support

If you encounter issues:

1. **Check GitHub Actions logs** for specific errors
2. **Verify repository settings** (public/private)
3. **Ensure workflow file** is in the correct location
4. **Check branch name** (should be `main`)

---

**Status**: Ready for GitHub Actions setup! 🚀
**Next Step**: Follow the steps above to create your repository and push the code 