// Simple JavaScript obfuscator for SmileyPDF
const fs = require('fs');
const path = require('path');
const JavaScriptObfuscator = require('javascript-obfuscator');

// Function to obfuscate JavaScript code
function obfuscateJS(code) {
    return JavaScriptObfuscator.obfuscate(code, {
        compact: true,
        controlFlowFlattening: true,
        controlFlowFlatteningThreshold: 0.7,
        deadCodeInjection: true,
        deadCodeInjectionThreshold: 0.4,
        debugProtection: true,
        debugProtectionInterval: true,
        disableConsoleOutput: true,
        identifierNamesGenerator: 'hexadecimal',
        renameGlobals: false,
        rotateStringArray: true,
        selfDefending: true,
        stringArray: true,
        stringArrayEncoding: ['base64'],
        stringArrayThreshold: 0.8,
        transformObjectKeys: true,
        unicodeEscapeSequence: false
    }).getObfuscatedCode();
}

// Function to extract JavaScript from HTML files and obfuscate it
function processHTMLFile(filePath) {
    try {
        const content = fs.readFileSync(filePath, 'utf8');
        
        // Extract JavaScript code between <script> tags (excluding external scripts)
        const scriptRegex = /<script(?! src=)[^>]*>([\s\S]*?)<\/script>/g;
        let match;
        let newContent = content;
        
        while ((match = scriptRegex.exec(content)) !== null) {
            const originalScript = match[0];
            const scriptContent = match[1];
            
            // Skip empty scripts or those that are already obfuscated
            if (!scriptContent.trim() || scriptContent.includes('_0x')) {
                continue;
            }
            
            // Obfuscate the script content
            const obfuscatedScript = obfuscateJS(scriptContent);
            
            // Replace the original script with the obfuscated one
            const newScript = `<script>${obfuscatedScript}</script>`;
            newContent = newContent.replace(originalScript, newScript);
        }
        
        // Write the modified content back to the file
        fs.writeFileSync(filePath, newContent, 'utf8');
        console.log(`Processed: ${filePath}`);
    } catch (error) {
        console.error(`Error processing ${filePath}:`, error);
    }
}

// Function to process all HTML files in a directory
function processDirectory(directory) {
    const files = fs.readdirSync(directory);
    
    for (const file of files) {
        const filePath = path.join(directory, file);
        const stat = fs.statSync(filePath);
        
        if (stat.isDirectory()) {
            // Recursively process subdirectories
            processDirectory(filePath);
        } else if (file.endsWith('.html')) {
            // Process HTML files
            processHTMLFile(filePath);
        }
    }
}

// Main function
function main() {
    const rootDirectory = process.argv[2] || '.';
    console.log(`Starting obfuscation in directory: ${rootDirectory}`);
    processDirectory(rootDirectory);
    console.log('Obfuscation complete!');
}

main();
