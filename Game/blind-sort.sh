#!/bin/bash

# This script is available on GitHub Gist at https://gist.github.com/FJrodafo/14e5bd86761670ddc4f73109e1f1a888
# Explore more gists by Francisco José Rodríguez Afonso at https://gist.github.com/FJrodafo

# A simple terminal-based number sorting game where the user places random numbers into chosen positions without knowing future values.
# After all positions are filled (or attempts run out), the game checks if the numbers are in ascending order to determine a win or loss.

# Script version
VERSION="1.0.4"

# Function that displays help information
show_help() {
    cat << EOF
Welcome to the Blind Sorting game!

A simple terminal-based number sorting game!

How to play:
    - Choose the number of positions (e.g., 6).
    - Random numbers will be given to you.
    - Place each number into an empty position.
    - When all positions are filled, the game checks if the numbers are sorted in ascending order.
    - If sorted, you win; if not, you lose.
EOF
}

# Handle command-line flags
case "$1" in
    --help|-h)
        show_help
        exit 0
        ;;
    --version|-v)
        echo "blindsort $VERSION"
        exit 0
        ;;
esac

# ANSI color codes for terminal output
RESET="\e[0m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
BRIGHTRED="\e[91m"
BRIGHTGREEN="\e[92m"

# Ask the user for the number of positions and validate input
while true; do
    read -p "Enter number of positions (e.g., 6): " max_positions
    if [[ "$max_positions" =~ ^[1-9][0-9]*$ ]]; then
        break
    else
        echo -e "${RED}Please enter a valid positive number.${RESET}"
    fi
done

# Initialize the positions array with zeros (0 = empty slot)
positions=()
for ((i=0; i<max_positions; i++)); do
    positions+=("0")
done

# Maximum number of attempts allowed
max_attempts=20

# Display game start information
echo -e "${CYAN}Blind Sorting Game Started with $max_positions positions, max attempts: $max_attempts${RESET}"

# Print position indices
echo -n -e "${CYAN}Positions: ${RESET}"
for ((i=1; i<=max_positions; i++)); do
    echo -n "$i "
done
echo

# Function to print current state of positions
print_positions() {
    echo -n -e "${CYAN}Positions: ${RESET}"
    for val in "${positions[@]}"; do
        if [ "$val" -eq 0 ]; then
            # Empty positions are shown as underscores
            echo -n -e "${YELLOW}_ ${RESET}"
        else
            # Filled positions show the stored number
            echo -n -e "${YELLOW}$val ${RESET}"
        fi
    done
    echo
}

# Function that checks if all positions are filled
all_filled() {
    for val in "${positions[@]}"; do
        if [ "$val" -eq 0 ]; then
            return 1  # Not all positions are filled
        fi
    done
    return 0  # All positions are filled
}

# Show initial empty board
print_positions

# Main game loop
for ((attempt=1; attempt<=max_attempts; attempt++)); do
    # Generate a random number between 1 and 50
    number=$(( RANDOM % 50 + 1 ))
    echo
    echo -e "${CYAN}Number: ${YELLOW}$number${RESET}"

    # Ask the user where to place the number
    while true; do
        read -p "Which position do you want to place it in? (1-$max_positions): " position

        # Validate numeric input
        if [[ "$position" =~ ^[0-9]+$ ]]; then
            if (( position >= 1 && position <= max_positions )); then
                index=$((position - 1))

                # Check if the chosen position is already occupied
                if [ "${positions[$index]}" -ne 0 ]; then
                    echo -e "${RED}That position is already taken! Choose another.${RESET}"
                else
                    # Place the number in the chosen position
                    positions[$index]=$number
                    break
                fi
            else
                echo -e "${RED}Please enter a position between 1 and $max_positions.${RESET}"
            fi
        else
            echo -e "${RED}Please enter a valid number.${RESET}"
        fi
    done

    # Print updated board
    print_positions

    # Stop early if all positions are filled
    if all_filled; then
        echo
        echo -e "${CYAN}All positions are filled, checking order...${RESET}"
        break
    fi
done

# Check if the numbers are sorted in ascending order
is_sorted=1
for ((i=0; i<max_positions-1; i++)); do
    if (( positions[i] > positions[i+1] )); then
        is_sorted=0
        break
    fi
done

# Display final result
echo
if (( is_sorted == 1 )); then
    echo -e "${BRIGHTGREEN}Congratulations! ${GREEN}Positions are in ascending order.${RESET}"
else
    echo -e "${RED}Positions are not in ascending order. ${BRIGHTRED}Game over.${RESET}"
fi
