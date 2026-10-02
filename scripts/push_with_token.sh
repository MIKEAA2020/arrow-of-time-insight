#!/usr/bin/env bash
# Push this repository using the PAT stored outside the repo tree.
#
#   scripts/push_with_token.sh [owner/repo] [branch]
#
# Defaults: MIKEAA2020/arrow-of-time-insight  main
#
# Notes
#  * The token is read from ../GITHUB_PAT.txt (workspace root) or the backup copy;
#    it is passed to git through scripts/git-credential-helper.sh, never via the
#    command line or the remote URL, so it cannot leak into `ps`, logs, or
#    .git/config.
#  * Exit codes: 0 push ok; 2 no token file; 3 authentication rejected by GitHub.
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$HERE/.."

REPO="${1:-MIKEAA2020/arrow-of-time-insight}"
BRANCH="${2:-main}"

if [ ! -s "$HERE/../GITHUB_PAT.txt" ] && [ ! -s "$HOME/backup/pat/GITHUB_PAT.backup.txt" ]; then
  echo "error: no token file (expected ../GITHUB_PAT.txt or ~/backup/pat/GITHUB_PAT.backup.txt)" >&2
  exit 2
fi

echo "pushing HEAD -> https://github.com/$REPO.git ($BRANCH)"
set +e
OUT="$(GIT_TERMINAL_PROMPT=0 git \
        -c credential.helper= \
        -c "credential.helper=$HERE/git-credential-helper.sh" \
        push "https://github.com/$REPO.git" "HEAD:refs/heads/$BRANCH" 2>&1)"
RC=$?
set -e
printf '%s\n' "$OUT" | sed -E 's/(github_pat_|ghp_|gho_)[A-Za-z0-9_]+/[TOKEN-REDACTED]/g'

if [ $RC -ne 0 ]; then
  case "$OUT" in
    *"Invalid username or token"*|*"Authentication failed"*|*"403"*|*"401"*)
      echo >&2
      echo "AUTH REJECTED: the stored token is not accepted by GitHub for this push." >&2
      echo "Status of the token currently on file: see ../PUSH_STATUS.md" >&2
      exit 3 ;;
  esac
  exit $RC
fi
echo "push ok"
