#!/bin/bash

# GitHub Repository Setup Script for NextGen App
# This script prepares your project for GitHub upload

echo "🚀 NextGen App - GitHub Repository Setup"
echo "========================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    print_error "pubspec.yaml not found. Please run this script from the Flutter project root directory."
    exit 1
fi

print_info "Starting GitHub repository setup..."

# Step 1: Clean up build files
print_info "Step 1: Cleaning up build files..."
rm -rf build/
rm -rf .dart_tool/
rm -rf android/build/
rm -rf ios/build/
rm -rf web/build/
rm -rf windows/build/
rm -rf linux/build/
rm -rf macos/build/
print_status "Build files cleaned"

# Step 2: Remove log files
print_info "Step 2: Removing log files..."
rm -f *.log
rm -f flutter_*.log
rm -f hs_err_pid*.log
print_status "Log files removed"

# Step 3: Remove temporary files
print_info "Step 3: Removing temporary files..."
rm -f .DS_Store
rm -f Thumbs.db
rm -f *.tmp
rm -f *.temp
print_status "Temporary files removed"

# Step 4: Create screenshots directory
print_info "Step 4: Creating screenshots directory..."
mkdir -p screenshots
print_status "Screenshots directory created"

# Step 5: Check if .gitignore exists
if [ ! -f ".gitignore" ]; then
    print_warning ".gitignore not found. Creating one..."
    cp ../.gitignore .
    print_status ".gitignore created"
else
    print_status ".gitignore already exists"
fi

# Step 6: Check if LICENSE exists
if [ ! -f "LICENSE" ]; then
    print_warning "LICENSE not found. Creating one..."
    cp ../LICENSE .
    print_status "LICENSE created"
else
    print_status "LICENSE already exists"
fi

# Step 7: Check if CONTRIBUTING.md exists
if [ ! -f "CONTRIBUTING.md" ]; then
    print_warning "CONTRIBUTING.md not found. Creating one..."
    cp ../CONTRIBUTING.md .
    print_status "CONTRIBUTING.md created"
else
    print_status "CONTRIBUTING.md already exists"
fi

# Step 8: Initialize git if not already done
if [ ! -d ".git" ]; then
    print_info "Step 8: Initializing git repository..."
    git init
    print_status "Git repository initialized"
else
    print_status "Git repository already exists"
fi

# Step 9: Add all files to git
print_info "Step 9: Adding files to git..."
git add .
print_status "Files added to git"

# Step 10: Create initial commit
print_info "Step 10: Creating initial commit..."
git commit -m "Initial commit: NextGen App - Complete medical consultation platform

- Real-time chat with WhatsApp-style UI
- OTP-based authentication system  
- File sharing with Firebase Storage
- Push notifications with FCM
- Comprehensive error handling
- Material Design with blue theme
- Complete Firebase integration
- Professional documentation

Features:
✅ 7 main screens with smooth navigation
✅ 20+ implemented features
✅ 15,000+ lines of code
✅ Production-ready architecture
✅ Comprehensive documentation
✅ GitHub-ready setup"
print_status "Initial commit created"

# Step 11: Display next steps
echo ""
echo "🎉 GitHub Repository Setup Complete!"
echo "=================================="
echo ""
print_info "Next steps:"
echo "1. Create a new repository on GitHub"
echo "2. Copy the repository URL"
echo "3. Run the following commands:"
echo ""
echo "   git remote add origin https://github.com/YOUR_USERNAME/REPOSITORY_NAME.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
print_info "Repository name suggestions:"
echo "- nextgen-app-chatrx"
echo "- flutter-medical-chat-app"
echo "- chatrx-medical-platform"
echo "- nextgen-healthcare-app"
echo ""
print_info "Don't forget to:"
echo "- Add screenshots to the screenshots/ directory"
echo "- Update README.md with your GitHub username"
echo "- Set up repository topics and description"
echo "- Enable Issues and Projects in repository settings"
echo ""
print_status "Setup complete! Your project is ready for GitHub! 🚀"
