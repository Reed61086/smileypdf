import os
import re
import glob
import shutil

def remove_hindi_selector_from_english_pages():
    print("Removing Hindi language selector from English pages...")
    
    # Get all English HTML files (those not in the hi/ directory)
    english_files = glob.glob('*.html')
    print(f"Found {len(english_files)} English HTML files to process.")
    
    for file_path in english_files:
        print(f"Processing {file_path}...")
        
        # Read the file content
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Check if the file has a language selector
        if 'href="hi/' in content:
            # Remove the language selector
            # This is a simple approach - we'll need to manually check some files
            content = re.sub(r'<div[^>]*class="[^"]*language-selector[^"]*"[^>]*>.*?</div>', '', content, flags=re.DOTALL)
            content = re.sub(r'<div[^>]*class="[^"]*relative[^"]*"[^>]*>.*?<span[^>]*>Hindi</span>.*?</div>', '', content, flags=re.DOTALL)
            content = re.sub(r'<div[^>]*>.*?<a href="hi/.*?</div>', '', content, flags=re.DOTALL)
            
            # Save the file with UTF-8 encoding
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(content)
            
            print(f"Removed Hindi language selector from {file_path}")
    
    print("Finished removing Hindi language selectors from English pages.")

def remove_hindi_directory():
    print("Removing Hindi directory...")
    
    # Check if the Hindi directory exists
    if os.path.exists('hi'):
        # Remove the Hindi directory and all its contents
        shutil.rmtree('hi')
        print("Hindi directory removed.")
    else:
        print("Hindi directory not found.")

# Main execution
if __name__ == "__main__":
    remove_hindi_selector_from_english_pages()
    remove_hindi_directory()
    print("All Hindi content has been removed from the website.")
