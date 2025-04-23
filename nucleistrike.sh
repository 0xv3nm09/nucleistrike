#!/bin/bash

# Color codes
green="\033[1;32m"
yellow="\033[1;33m"
red="\033[1;31m"
reset="\033[0m"

echo -e "${green}🧠 Welcome to Nucleistrike – Automated Nuclei Wrapper${reset}"
echo ""

read -p "🔗 Enter target (URL or file with -l): " TARGET
read -p "💬 Enter custom header (optional): " HEADER
read -p "🚀 Enter scan rate (1–10): " RATE
read -p "🏷️  Enter Nuclei tag filter (optional, e.g., cves, exposures): " TAGS

DATE=$(date +%Y-%m-%d_%H-%M-%S)
OUTDIR=~/Desktop/work/nucleistrike_$DATE
mkdir -p "$OUTDIR"

RATE_LIMIT=$((RATE * 50))

echo ""
echo -e "${yellow}⚙️ Running Nuclei with the following configuration:${reset}"
echo "  ➤ Target: $TARGET"
echo "  ➤ Header: $HEADER"
echo "  ➤ Rate Limit: $RATE_LIMIT req/sec"
echo "  ➤ Tags: $TAGS"
echo "  ➤ Output Dir: $OUTDIR"
echo ""

nuclei $([ -f "$TARGET" ] && echo "-l" || echo "-u") "$TARGET" \
  ${HEADER:+-H "$HEADER"} \
  -rl "$RATE_LIMIT" \
  ${TAGS:+-tags "$TAGS"} \
  -o "$OUTDIR/nuclei_results.txt" \
  -json

echo ""
echo -e "${green}✅ Scan complete! Results saved to $OUTDIR/nuclei_results.txt${reset}"
