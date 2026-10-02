#!/usr/bin/env bash
# Git credential helper for this repository.
#
# Supplies the GitHub fine-grained PAT stored *outside* the repository tree.
# Look-up order (first existing, non-empty file wins):
#   1. $GITHUB_PAT_FILE
#   2. <repo>/../GITHUB_PAT.txt                (workspace root; the "primary" copy)
#   3. $HOME/GITHUB_PAT.txt
#   4. $HOME/backup/pat/GITHUB_PAT.backup.txt  (the "backup" copy)
#
# Install:
#   git config credential.helper "$(pwd)/scripts/git-credential-helper.sh"
# The token is never passed on a command line or embedded in a remote URL, so it
# does not appear in `ps`, in `.git/config`, or in error messages.
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TOKEN=""
for f in "${GITHUB_PAT_FILE:-}" "$HERE/../GITHUB_PAT.txt" "$HOME/GITHUB_PAT.txt" "$HOME/backup/pat/GITHUB_PAT.backup.txt"; do
  if [ -n "$f" ] && [ -s "$f" ]; then
    TOKEN="$(tr -d '[:space:]' < "$f")"
    break
  fi
done

if [ -z "$TOKEN" ]; then
  echo "git-credential-helper: no token file found (see header of this script)" >&2
  exit 1
fi

# Read git's request (key=value lines terminated by a blank line).  For the
# `get` action git does NOT send username=/password=; the helper must emit the
# credentials itself once it has seen the host.
PROTO=""
HOST=""
while IFS= read -r line; do
  case "$line" in
    protocol=*) PROTO="${line#protocol=}" ;;
    host=*)     HOST="${line#host=}" ;;
    "")         : ;;
  esac
done

case "$HOST" in
  ""|github.com) printf 'username=x-access-token\npassword=%s\n' "$TOKEN" ;;
  *)             exit 0 ;;   # never volunteer this token to another host
esac
