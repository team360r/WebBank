#!/bin/bash
set -e

echo "Starting wwwBank tutorial..."
echo ""

# Start Flutter web app on port 8080
echo "Starting Flutter web app on http://localhost:8080..."
cd "$(dirname "$0")"
flutter run -d chrome --web-port=8080 &
FLUTTER_PID=$!

# Start Docusaurus docs site on port 3000
echo "Starting docs site on http://localhost:3000..."
cd docs-site
npm start &
DOCS_PID=$!

# Wait a moment then open browser
sleep 4
open "http://localhost:3000" 2>/dev/null || xdg-open "http://localhost:3000" 2>/dev/null || true

echo ""
echo "wwwBank tutorial is running:"
echo "  Docs site:  http://localhost:3000"
echo "  Flutter app: http://localhost:8080"
echo ""
echo "Press Ctrl+C to stop both servers."

trap "kill $FLUTTER_PID $DOCS_PID 2>/dev/null" EXIT
wait
