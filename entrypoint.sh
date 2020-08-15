#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f ./tmp/pids/server.pid

echo "Runinng on http://localhost:3000"

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"