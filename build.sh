#!/bin/bash
# Build script to create Dify plugin package with correct structure
# The ZIP must have manifest.yaml at the root level, not inside a subdirectory

VERSION=${1:-"latest"}
OUTPUT_FILE="vertex-ai-plugin-${VERSION}.zip"

echo "Building Dify plugin package..."
echo "Output: ${OUTPUT_FILE}"

# Remove old build if exists
rm -f "${OUTPUT_FILE}"

# Create ZIP with files at root level (not inside a subdirectory)
zip -r "${OUTPUT_FILE}" . \
  -x ".git/*" \
  -x "**/__pycache__/*" \
  -x "**/*.pyc" \
  -x ".env" \
  -x "build.sh" \
  -x "*.zip"

echo ""
echo "✅ Build complete: ${OUTPUT_FILE}"
echo ""
echo "Verifying structure (manifest.yaml should be at root):"
unzip -l "${OUTPUT_FILE}" | head -15

echo ""
echo "To import into Dify:"
echo "1. Upload ${OUTPUT_FILE} via 'Import from local file'"
echo "2. Or attach this file to a GitHub Release for URL import"
