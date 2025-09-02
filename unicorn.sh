#!/bin/bash

# Ensure the API key is set
if [ -z "$OPENAI_API_KEY" ]; then
  echo "OPENAI_API_KEY is not set. Please set it in your environment."
  exit 1
fi

# Set your prompt
PROMPT="Tell me a three sentence bedtime story about a unicorn"

# Prepare the JSON payload
JSON_PAYLOAD=$(cat <<EOF
{
  "model": "gpt-3.5-turbo",
  "messages": [
    {"role": "user", "content": "$PROMPT"}
  ]
}
EOF
)

# Call the OpenAI API
curl https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d "$JSON_PAYLOAD"