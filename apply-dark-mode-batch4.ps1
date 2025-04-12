# Batch 4: Blog pages
$blogPages = @(
    "blog.html",
    "blog-post-1.html",
    "blog-post-2.html",
    "blog-post-3.html",
    "blog-post-4.html",
    "blog-post-5.html",
    "blog-post-6.html",
    "blog-post-7.html",
    "blog-post-8.html",
    "blog-post-9.html",
    "hi/blog.html",
    "hi/blog-post-1.html",
    "hi/blog-post-2.html",
    "hi/blog-post-3.html",
    "hi/blog-post-4.html",
    "hi/blog-post-5.html",
    "hi/blog-post-6.html",
    "hi/blog-post-7.html",
    "hi/blog-post-8.html",
    "hi/blog-post-9.html"
)

foreach ($page in $blogPages) {
    Write-Host "Processing $page..."
    powershell -ExecutionPolicy Bypass -File add-dark-mode-fixed.ps1 -FilePath $page
}

Write-Host "Batch 4 completed!"
