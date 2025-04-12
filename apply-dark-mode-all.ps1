# Master script to run all batches
Write-Host "Starting dark mode implementation for all pages..."

# Run each batch script
Write-Host "Running Batch 1: Main pages..."
powershell -ExecutionPolicy Bypass -File apply-dark-mode-batch1.ps1

Write-Host "Running Batch 2: Basic tool pages..."
powershell -ExecutionPolicy Bypass -File apply-dark-mode-batch2.ps1

Write-Host "Running Batch 3: Coming soon pages..."
powershell -ExecutionPolicy Bypass -File apply-dark-mode-batch3.ps1

Write-Host "Running Batch 4: Blog pages..."
powershell -ExecutionPolicy Bypass -File apply-dark-mode-batch4.ps1

Write-Host "Running Batch 5: PDF splitter and viewer variants..."
powershell -ExecutionPolicy Bypass -File apply-dark-mode-batch5.ps1

Write-Host "All batches completed! Dark mode has been implemented on all pages."
