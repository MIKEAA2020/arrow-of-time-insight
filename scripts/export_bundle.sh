#!/usr/bin/env bash
# Export the repository in forms that can be pushed/applied without network auth.
#
#   scripts/export_bundle.sh [output_dir]
#
# Produces (default output_dir = ../backup/push):
#   arrow-of-time-insight.bundle   git bundle with the full history of this branch
#   arrow-of-time-insight.patch    patch of all commits on top of the upstream tip
#   MANIFEST.txt                   file list + sha256 of the bundle
#
# To push later with a working token:
#   git clone arrow-of-time-insight.bundle repo && cd repo
#   git remote set-url origin https://github.com/MIKEAA2020/arrow-of-time-insight.git
#   git push origin main
# or, from an existing clone:
#   git am ../arrow-of-time-insight.patch
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$HERE/.."
OUT="${1:-$HERE/../../backup/push}"
mkdir -p "$OUT"

git bundle create "$OUT/arrow-of-time-insight.bundle" --all
BASE="$(git rev-list --max-parents=0 HEAD | tail -1)"
git format-patch --stdout "$BASE..HEAD" > "$OUT/arrow-of-time-insight.patch"
{
  echo "created: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo "branch:  $(git rev-parse --abbrev-ref HEAD) @ $(git rev-parse --short HEAD)"
  echo "upstream tip at clone time: 9a01a020458959909e6138ebc5d612db483b4ef5"
  echo
  git log --oneline "$BASE..HEAD"
  echo
  sha256sum "$OUT/arrow-of-time-insight.bundle" "$OUT/arrow-of-time-insight.patch"
} > "$OUT/MANIFEST.txt"

cat "$OUT/MANIFEST.txt"
