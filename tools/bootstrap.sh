#!/usr/bin/env bash

# Local read-only clone of the Precedent upstream (alex137/BestPractice),
# kept current every session for cross-checking against the real house
# rules. NOT done with add_repo -- cross-owner attach is refused outright
# at any access level (confirmed directly). alex137/BestPractice is
# public though, so an anonymous clone/fetch needs no attach at all.
UPSTREAM_CLONE="$HOME/alex137/bestpractice"
if [ -d "$UPSTREAM_CLONE/.git" ]; then
  if ! git -C "$UPSTREAM_CLONE" rev-parse HEAD >/dev/null 2>&1; then
    echo "WARN: $UPSTREAM_CLONE exists but is not a valid git checkout -- left alone; remove by hand if it is a dead clone" >&2
  elif ! git -C "$UPSTREAM_CLONE" remote get-url origin 2>/dev/null | grep -qi 'alex137/bestpractice'; then
    echo "WARN: $UPSTREAM_CLONE exists but its origin is not alex137/BestPractice -- left alone, not touched" >&2
  else
    if timeout 60 git -C "$UPSTREAM_CLONE" fetch --quiet --depth 1000 origin precedent-beta-v01 2>/dev/null; then
      # fetch alone only moves origin/precedent-beta-v01, never the
      # checked-out branch -- reset to keep the working tree current too.
      if [ -z "$(git -C "$UPSTREAM_CLONE" status --porcelain 2>/dev/null || true)" ]; then
        git -C "$UPSTREAM_CLONE" reset --quiet --hard origin/precedent-beta-v01 2>/dev/null || \
          echo "WARN: fetched alex137/BestPractice but could not reset $UPSTREAM_CLONE to origin/precedent-beta-v01 -- it may be stale" >&2
      else
        echo "WARN: $UPSTREAM_CLONE has uncommitted changes -- fetched but NOT reset, so it may be stale until that tree is clean" >&2
      fi
    else
      echo "WARN: could not refresh the existing alex137/BestPractice clone at $UPSTREAM_CLONE -- it may be stale" >&2
    fi
  fi
elif [ -e "$UPSTREAM_CLONE" ]; then
  echo "WARN: $UPSTREAM_CLONE exists and is not a git checkout -- left alone, not cloning" >&2
else
  mkdir -p "$(dirname "$UPSTREAM_CLONE")"
  if GIT_LFS_SKIP_SMUDGE=1 timeout 600 git clone --quiet --depth 1 --branch precedent-beta-v01 \
       https://github.com/alex137/bestpractice "$UPSTREAM_CLONE" 2>/dev/null; then
    echo "NOTE: cloned alex137/BestPractice (upstream Precedent source, branch precedent-beta-v01) to $UPSTREAM_CLONE." >&2
  else
    echo "WARN: could not clone alex137/BestPractice to $UPSTREAM_CLONE" >&2
  fi
fi
