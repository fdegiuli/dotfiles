#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;36m'  # Changed to cyan which is lighter and more readable
RED='\033[0;31m'
NC='\033[0m' # No Color

# Create a temporary file to store the Brewfile
BREWFILE="Brewfile.new"

echo -e "${BLUE}Generating initial Brewfile...${NC}"
brew bundle dump --file="$BREWFILE"

if [ ! -s "$BREWFILE" ]; then
    echo -e "${RED}Error: Failed to generate Brewfile${NC}"
    exit 1
fi

echo -e "\n${GREEN}Reviewing packages...${NC}"
echo -e "${BLUE}For each package, enter:${NC}"
echo -e "  Y - keep this package"
echo -e "  n - remove this package"
echo -e "  q - quit and save what we've done so far"
echo -e "  s - skip remaining packages and keep them all"
echo -e "\nPress Enter to start reviewing..."

read -r < /dev/tty

# Create a new file for the filtered packages
FILTERED_BREWFILE="Brewfile.filtered"
> "$FILTERED_BREWFILE"

while IFS= read -r line || [ -n "$line" ]; do
    # Skip empty lines and comments
    if [[ -z "$line" || "$line" =~ ^# ]]; then
        echo "$line" >> "$FILTERED_BREWFILE"
        continue
    fi

    echo -e "\n${BLUE}Package:${NC} $line"
    echo -n "Keep this package? (Y/n/q/s) "
    read -r response < /dev/tty
    
    case "$response" in
        [Yy]* | "" )
            echo "$line" >> "$FILTERED_BREWFILE"
            ;;
        [Qq]* )
            echo -e "\n${GREEN}Saving and exiting...${NC}"
            mv "$FILTERED_BREWFILE" "Brewfile"
            rm "$BREWFILE"
            exit 0
            ;;
        [Ss]* )
            echo "$line" >> "$FILTERED_BREWFILE"
            # Add all remaining packages
            while IFS= read -r remaining_line || [ -n "$remaining_line" ]; do
                echo "$remaining_line" >> "$FILTERED_BREWFILE"
            done
            mv "$FILTERED_BREWFILE" "Brewfile"
            rm "$BREWFILE"
            echo -e "\n${GREEN}Brewfile has been created successfully!${NC}"
            exit 0
            ;;
        * )
            echo -e "${RED}Invalid input. Skipping package.${NC}"
            ;;
    esac
done < "$BREWFILE"

# Move the filtered Brewfile to replace the old one
mv "$FILTERED_BREWFILE" "Brewfile"
rm "$BREWFILE"

echo -e "\n${GREEN}Brewfile has been created successfully!${NC}" 