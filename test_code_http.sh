#!/bin/sh

# Vérifie si le nombre d'arguments est correct
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <URL> <Expected HTTP Status Code>"
  exit 1
fi

# Stocke les arguments dans des variables pour plus de clarté
URL="$1"
EXPECTED_CODE="$2"

# Effectue la requête et stocke le code de réponse HTTP
response=$(curl -k -s -o /dev/null -w "%{http_code}" "$URL")
echo "HTTP Response Code: $response"

# Compare le code de réponse au code attendu
if [ "$response" -ne "$EXPECTED_CODE" ]; then
  echo "Failure: The response code is not $EXPECTED_CODE."
  exit 1
else
  echo "Success: The server responded with a $EXPECTED_CODE code."
fi

