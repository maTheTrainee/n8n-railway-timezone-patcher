#!/bin/bash

# Get the n8n instance URL from environment variable
API_URL="${N8N_API_URL}"

# Get the n8n personal API key from environment variable
API_KEY="${N8N_API_KEY}"

# Get the desired timezone (default to Europe/Stockholm if not set)
TIMEZONE="${TIMEZONE:-Europe/Stockholm}"

# Inform the user we're fetching all workflows
echo "Fetching workflows..."

# Fetch all workflows from the n8n API
WORKFLOWS=$(curl -s -X GET "$API_URL/rest/workflows" \
  -H "Authorization: Bearer $API_KEY")

# Filter workflows that don't have the correct timezone
echo "$WORKFLOWS" | jq -c '.data[] | select(.settings.timezone != "'"$TIMEZONE"'")' | while read -r workflow; do
  # Extract workflow ID and name
  ID=$(echo "$workflow" | jq -r '.id')
  NAME=$(echo "$workflow" | jq -r '.name')

  # Log which workflow is being updated
  echo "Updating $NAME (ID: $ID)..."

  # Send PATCH request to update the timezone setting
  curl -s -X PATCH "$API_URL/rest/workflows/$ID" \
    -H "Authorization: Bearer $API_KEY" \
    -H "Content-Type: application/json" \
    -d '{"settings": {"timezone": "'"$TIMEZONE"'"}}'

  # Confirm the update
  echo "$NAME updated."
done

# Final message when done
echo "All done!"
