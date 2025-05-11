import os
import re
import glob

def fix_hindi_encoding(file_path):
    print(f"Processing {file_path}...")
    
    # Read the file content
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace [à¤¹à¤¿à¤‚à¤¦à¥€_à¤Ÿà¥‡à¤•à¥à¤¸à¥à¤Ÿ] with हिंदी
    content = content.replace('[à¤¹à¤¿à¤‚à¤¦à¥€_à¤Ÿà¥‡à¤•à¥à¤¸à¥à¤Ÿ]', 'हिंदी')
    
    # Replace PDF ?? with PDF से
    content = content.replace('PDF ??', 'PDF से')
    
    # Replace specific strings in the language selector
    content = content.replace('<span class="mr-1">[à¤¹à¤¿à¤‚à¤¦à¥€_à¤Ÿà¥‡à¤•à¥à¤¸à¥à¤Ÿ]</span>', '<span class="mr-1">हिंदी</span>')
    content = content.replace('<a href="pdf-text-extractor.html" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 font-bold">[à¤¹à¤¿à¤‚à¤¦à¥€_à¤Ÿà¥‡à¤•à¥à¤¸à¥à¤Ÿ]</a>', '<a href="pdf-text-extractor.html" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 font-bold">हिंदी</a>')
    
    # Save the file with UTF-8 encoding
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"Fixed encoding in {file_path}")

# Process all Hindi HTML files
hindi_files = glob.glob('hi/*.html')
print(f"Found {len(hindi_files)} Hindi HTML files to process.")

for file_path in hindi_files:
    fix_hindi_encoding(file_path)

print("Hindi encoding fixed in all files!")
