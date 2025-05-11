Write-Host "Adding files to Git..."
git add hi/index.html
Write-Host "Committing changes..."
git commit -m "Fix Hindi encoding issues in navigation and menus"
Write-Host "Pushing to remote repository..."
git push origin main
Write-Host "Done!"
