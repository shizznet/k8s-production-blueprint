#!/usr/bin/env bash
set -euo pipefail
KEY_ARN="arn:aws:kms:ap-south-1:123456789012:key/REPLACE-ME-WITH-YOUR-ACTUAL-KMS-KEY-ID"

if [ "$#" -lt 1 ]; then
  echo "Usage: ./tools/encrypt-secret.sh <plain-secret-file> [output-file]"
  exit 1
fi

IN="$1"
OUT="${2:-${IN%.*}.enc.yaml}"

echo "Encrypting $IN -> $OUT using KMS: $KEY_ARN (placeholder)"
sops --encrypt --kms "$KEY_ARN" "$IN" > "$OUT"
echo "Encrypted secret written to $OUT"
