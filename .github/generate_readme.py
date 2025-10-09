#!/usr/bin/env python3
"""
Script for automatic README generation based on the /docs structure
Analyzes markdown files and creates a README following the existing concept
"""

import os
import re
from pathlib import Path
from typing import Dict, List, Tuple

def is_file_complete(file_path: str) -> bool:
    """
    Checks if a markdown file is completely filled out or just a template
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Check for empty or template indicators
        if not content.strip():
            return False
            
        # Check for template indicators
        template_indicators = [
            '## \n**Description:**\n\n**Latest status:**\n\n```\n\n```',
            '**Description:**\n\n**Latest status:**\n\n```\n\n```',
            'Example             |',
            '| Name               | Type              | Description                                                 | Example             | Required |',
        ]
        
        # If it only contains template structure, it's not complete
        for indicator in template_indicators:
            if indicator in content and len(content.strip()) < 500:
                return False
        
        # Check for actual API endpoints
        if 'GET /' in content or 'POST /' in content or 'DELETE /' in content or 'PUT /' in content:
            return True
            
        # Check for filled query parameters or response examples
        if ('```json\n{' in content and content.count('```json') > 1) or \
           ('startAt | number' in content) or \
           ('"x":' in content and '"y":' in content):
            return True
        
        # Check for index/overview pages with meaningful content and links
        # These are complete if they have a title, description, and multiple internal links
        has_title = bool(re.search(r'^## \w+', content, re.MULTILINE))
        has_description = 'Description:' in content and not content.count('Description:') == content.count('**Description:**\n\n**Latest status:**')
        has_internal_links = content.count('](/docs/') >= 3  # At least 3 internal documentation links
        has_structure = content.count('###') >= 2  # At least 2 subsections
        
        if has_title and (has_description or has_internal_links) and has_structure:
            return True
            
        return False
        
    except Exception:
        return False

def extract_description_from_file(file_path: str) -> str:
    """
    Extracts the description from between **Description:** and **Latest status:** markers
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Look for content specifically between **Description:** and **Latest status:**
        desc_match = re.search(r'\*\*Description:\*\*\s*\n\n(.*?)\n\n\*\*Latest status:\*\*', content, re.DOTALL)
        if desc_match:
            description = desc_match.group(1).strip()
            # Only return if there's actual content (not empty or just whitespace)
            if description and description != '':
                # Clean up the description - take first sentence or limit length
                if '.' in description and len(description) > 50:
                    description = description.split('.')[0] + '.'
                if len(description) > 150:
                    description = description[:147] + '...'
                return description
        
        # If no description section found or it's empty, return empty string
        return ""
        
    except Exception:
        return ""

def extract_title_from_file(file_path: str) -> str:
    """
    Extracts the title from a markdown file
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Search for ## Title
        match = re.search(r'^## (.+)', content, re.MULTILINE)
        if match:
            title = match.group(1).strip()
            if title and title != '':
                return title
    except Exception:
        pass
    
    # Fallback: Use filename
    filename = Path(file_path).stem
    return filename.replace('-', ' ').title()

def scan_directory(base_path: str) -> Dict:
    """
    Scans a directory recursively and creates a structure of markdown files
    """
    structure = {}
    docs_path = Path(base_path) / 'docs'
    
    if not docs_path.exists():
        print(f"Error: {docs_path} does not exist!")
        return structure
    
    for root, dirs, files in os.walk(docs_path):
        # Skip template.md
        if 'template.md' in files:
            files.remove('template.md')
            
        for file in files:
            if file.endswith('.md'):
                file_path = os.path.join(root, file)
                relative_path = os.path.relpath(file_path, docs_path)
                
                # Create structure based on path
                parts = relative_path.split(os.sep)
                current = structure
                
                for part in parts[:-1]:  # All except the file
                    if part not in current:
                        current[part] = {}
                    current = current[part]
                
                # Add the file
                filename = parts[-1]
                title = extract_title_from_file(file_path)
                description = extract_description_from_file(file_path)
                is_complete = is_file_complete(file_path)
                
                if '_files' not in current:
                    current['_files'] = []
                
                current['_files'].append({
                    'filename': filename,
                    'title': title,
                    'description': description,
                    'path': relative_path,
                    'complete': is_complete
                })
    
    return structure

def generate_table_entries(files: List[Dict]) -> List[str]:
    """
    Generates table entries for a list of files with links to the documents and descriptions
    """
    entries = []
    for file_info in sorted(files, key=lambda x: x['filename']):
        state = "✅" if file_info['complete'] else "❌"
        title = file_info['title']
        description = file_info.get('description', '')
        # Create relative link to the markdown file
        link = f"/docs/{file_info['path']}"
        linked_title = f"[{title}]({link})"
        
        # If no description, leave empty (no placeholder)
        if not description:
            description = ""
        
        entries.append(f"| {state} | {linked_title} | {description} |")
    
    return entries

def generate_table_of_contents(structure: Dict) -> str:
    """
    Dynamically generates table of contents based on actual structure
    """
    toc = ["## Table of Contents", ""]
    
    # Websites section
    if 'websites' in structure:
        toc.append("- [Websites](#websites)")
        websites = structure['websites']
        
        for section_key in sorted(websites.keys()):
            if section_key != '_files':
                section_name = section_key.title()
                toc.append(f"  - [{section_name}](#{ section_key.lower()})")
                
                # Add subsections if they exist
                section = websites[section_key]
                if isinstance(section, dict):
                    for subsection_key in sorted(section.keys()):
                        if subsection_key != '_files':
                            subsection_name = subsection_key.title()
                            toc.append(f"    - [{subsection_name}](#{subsection_key.lower()})")
    
    # Root level sections
    for section_key in sorted(structure.keys()):
        if section_key not in ['websites'] and section_key != '_files':
            section_name = section_key.title()
            toc.append(f"- [{section_name}](#{section_key.lower()})")
            
            # Add subsections if they exist
            section = structure[section_key]
            if isinstance(section, dict):
                for subsection_key in sorted(section.keys()):
                    if subsection_key != '_files':
                        subsection_name = subsection_key.title()
                        toc.append(f"  - [{subsection_name}](#{subsection_key.lower()})")
    
    return '\n'.join(toc) + '\n\n'

def generate_section_content(section_name: str, section_data: Dict, level: int = 3) -> str:
    """
    Recursively generates content for any section
    """
    content = ""
    heading = "#" * level
    
    content += f"{heading} {section_name.title()}\n"
    
    # Add files in this section
    if '_files' in section_data and section_data['_files']:
        content += "|  State  | Name            | Description      |\n"
        content += "| :---: | :--- | :--- |\n"
        entries = generate_table_entries(section_data['_files'])
        content += '\n'.join(entries) + '\n'
    else:
        # Check if there are subsections
        has_subsections = any(key != '_files' and isinstance(section_data[key], dict) 
                            for key in section_data.keys())
        
        if not has_subsections:
            # No files and no subsections, add empty placeholder
            content += "|  State  | Name            | Description      |\n"
            content += "| :---: | :--- | :--- |\n"
            content += "|       |      |             |\n"
    
    content += "\n"
    
    # Process subsections
    for subsection_key in sorted(section_data.keys()):
        if subsection_key != '_files' and isinstance(section_data[subsection_key], dict):
            content += generate_section_content(subsection_key, section_data[subsection_key], level + 1)
    
    return content

def generate_readme_content(structure: Dict) -> str:
    """
    Generates README content based on the structure - now completely dynamic
    """
    content = "# umami API docs\n\n"
    
    # Add status legend
    content += "### 📊 Documentation Status Legend\n"
    content += "| Symbol | Meaning |\n"
    content += "| :---: | :--- |\n"
    content += "| ✅ | Documentation complete – file contains full API specification |\n"
    content += "| ❌ | Documentation incomplete – file is template or missing content |\n\n"
    
    # Generate dynamic table of contents
    content += generate_table_of_contents(structure)
    
    content += "---\n---\n\n"
    # Generate Websites section
    if 'websites' in structure:
        content += "## Websites\n\n"
        websites_content = generate_section_content("websites", structure['websites'], level=2)
        # Remove the first line (## Websites) since we already added it
        content += '\n'.join(websites_content.split('\n')[1:])
    
    content += "--- \n\n"
    
    # Generate all other root-level sections dynamically
    for section_key in sorted(structure.keys()):
        if section_key not in ['websites'] and section_key != '_files':
            content += generate_section_content(section_key, structure[section_key], level=2)
            content += "---\n\n"
    
    return content.rstrip() + "\n"

def main():
    """
    Main function of the script
    """
    # Get the parent directory of .github (the repository root)
    base_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    
    print("🔍 Scanning /docs directory...")
    structure = scan_directory(base_path)
    
    print("📝 Generating README content...")
    readme_content = generate_readme_content(structure)
    
    # Write new README
    readme_path = os.path.join(base_path, 'README.md')
    
    print(f"💾 Writing README to {readme_path}...")
    with open(readme_path, 'w', encoding='utf-8') as f:
        f.write(readme_content)
    
    print("✅ README successfully generated!")
    
    # Output statistics
    total_files = 0
    complete_files = 0
    
    def count_files(struct):
        nonlocal total_files, complete_files
        if isinstance(struct, dict):
            if '_files' in struct:
                for file_info in struct['_files']:
                    total_files += 1
                    if file_info['complete']:
                        complete_files += 1
            for key, value in struct.items():
                if key != '_files':
                    count_files(value)
    
    count_files(structure)
    
    print(f"\n📊 Statistics:")
    print(f"   Total files found: {total_files}")
    print(f"   Completely filled: {complete_files}")
    print(f"   Still to be processed: {total_files - complete_files}")
    print(f"   Progress: {(complete_files/total_files*100):.1f}%" if total_files > 0 else "   Progress: 0%")

if __name__ == "__main__":
    main()