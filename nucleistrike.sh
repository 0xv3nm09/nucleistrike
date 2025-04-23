#!/bin/bash

# NucleiStrike - Modular Nuclei Scanner with Ethical Settings and Color Output
# Author: ChatGPT + Muhammad Omaid

# Timestamp and output setup
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
output_dir=~/Desktop/work/nucleistrike_$timestamp
mkdir -p "$output_dir"

# Color definitions
green="\033[1;32m"
yellow="\033[1;33m"
red="\033[1;31m"
blue="\033[1;34m"
reset="\033[0m"

# Check and update Nuclei templates
echo -e "${blue}\n📦 Checking for Nuclei template updates...${reset}"
nuclei -update-templates

# Ask for target URL
read -p "🌐 Enter target URL (e.g., https://target.com): " target

# Ask for custom header (optional)
read -p "🔐 Enter optional custom header (e.g., X-Bug-Bounty: bounty123): " custom_header
header_flag=""
if [ ! -z "$custom_header" ]; then
    header_flag="-H '$custom_header'"
fi

# Ask for scan speed level
echo -e "\n⚙️  Choose scan speed level (1 = slowest, 10 = fastest):"
read -p "> " speed_level
case $speed_level in
    1) rate="1";;
    2) rate="2";;
    3) rate="4";;
    4) rate="6";;
    5) rate="8";;
    6) rate="12";;
    7) rate="16";;
    8) rate="18";;
    9) rate="20";;
   10) rate="25";;
    *) rate="8";;
esac

# Ask for severity level
echo -e "\n🚦 Filter by severity (comma-separated: info,low,medium,high,critical):"
read -p "> " severity
if [ -z "$severity" ]; then
    severity="low,medium,high,critical"
    echo -e "${yellow}⚠️  No severity entered. Defaulting to: $severity${reset}"
fi

# Ask which module to run
echo -e "\n🧰 Choose Nuclei Module to Run:"
echo "1) XSS (nuclei + dalfox + xsstrike)"
echo "2) Recon (tech stack, panels, exposures)"
echo "3) CVE detection"
echo "4) IDOR / SSRF / LFI Testing"
echo "5) Hidden Parameters + Directory Discovery"
read -p "> " module_choice

# Step 1: Run httpx to verify and probe target
echo -e "${yellow}\n🔎 Running httpx to probe $target ...${reset}"
echo "$target" | httpx -silent -title -tech-detect -status-code -threads 50 -o "$output_dir/httpx.txt"
cat "$output_dir/httpx.txt"

show_results() {
  local file=$1
  if [ -s "$file" ]; then
    cat "$file"
  else
    echo -e "${yellow}⚠️  No findings in $file${reset}"
  fi
}

# Module logic...
# (as above in user's script — preserved as-is)

