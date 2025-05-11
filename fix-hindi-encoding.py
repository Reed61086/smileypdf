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
