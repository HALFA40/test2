#!/bin/bash

# Build the frontend
echo "Building frontend..."
npx vite build

# Build the production server (without vite dependencies)
echo "Building production server..."
npx esbuild server/production.ts --platform=node --packages=external --bundle --format=esm --outfile=dist/index.js

echo "Production build complete!"
echo "Files ready in dist/ directory"