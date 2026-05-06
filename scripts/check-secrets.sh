#!/usr/bin/env bash
set -euo pipefail

root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$root"

failures=0

report() {
  local file="$1"
  local line="$2"
  local rule="$3"

  if [[ "$line" == "0" ]]; then
    printf 'SECRET-CHECK FAIL %s rule=%s\n' "$file" "$rule" >&2
  else
    printf 'SECRET-CHECK FAIL %s:%s rule=%s\n' "$file" "$line" "$rule" >&2
  fi

  failures=$((failures + 1))
}

scan_path() {
  local file="$1"
  local lower
  lower="$(printf '%s' "$file" | tr '[:upper:]' '[:lower:]')"

  case "$lower" in
    .env|.env.*|*/.env|*/.env.*|*.pem|*.key|*.p12|*.pfx|*.jks|*.keystore|*.crt|*.cer|*/id_rsa|*/id_dsa|*/id_ecdsa|*/id_ed25519|.npmrc|*/.npmrc|.pypirc|*/.pypirc|.netrc|*/.netrc)
      report "$file" 0 "sensitive-file"
      ;;
    *token*.txt|*tokens*.json|*credential*.json|*credentials*.json|*service-account*.json|*service_account*.json|*secret*.json|*secrets*.json)
      report "$file" 0 "sensitive-filename"
      ;;
    .secrets/*|*/.secrets/*|secrets/*|*/secrets/*|private/*|*/private/*|credentials/*|*/credentials/*|service-accounts/*|*/service-accounts/*|service_accounts/*|*/service_accounts/*)
      report "$file" 0 "sensitive-directory"
      ;;
  esac
}

scan_content() {
  local file="$1"

  [[ -f "$file" ]] || return 0

  if ! LC_ALL=C grep -Iq . "$file"; then
    return 0
  fi

  local line number
  number=0

  while IFS= read -r line || [[ -n "$line" ]]; do
    number=$((number + 1))

    if [[ "$line" =~ -----BEGIN[[:space:]][A-Z[:space:]]*PRIVATE[[:space:]]KEY----- ]]; then
      report "$file" "$number" "private-key-marker"
    fi

    if [[ "$line" =~ (api[_-]?key|secret|token|password|passwd|private[_-]?key|client[_-]?secret|access[_-]?token|refresh[_-]?token|auth[_-]?token)[[:space:]]*[:=][[:space:]]*[\"\']?[^\"\'\`[:space:]]{8,} ]]; then
      report "$file" "$number" "secret-assignment"
    fi

    if [[ "$line" =~ AKIA[0-9A-Z]{16} ]]; then
      report "$file" "$number" "aws-access-key"
    fi

    if [[ "$line" =~ (ghp|gho|ghu|ghs|ghr)_[A-Za-z0-9_]{30,} || "$line" =~ github_pat_[A-Za-z0-9_]{20,} ]]; then
      report "$file" "$number" "github-token"
    fi

    if [[ "$line" =~ sk-(proj-)?[A-Za-z0-9_-]{20,} ]]; then
      report "$file" "$number" "openai-token"
    fi

    if [[ "$line" =~ xox[baprs]-[A-Za-z0-9-]{20,} ]]; then
      report "$file" "$number" "slack-token"
    fi

    if [[ "$line" =~ AIza[0-9A-Za-z_-]{35} ]]; then
      report "$file" "$number" "google-api-key"
    fi

    if [[ "$line" =~ eyJ[A-Za-z0-9_-]{20,}\.[A-Za-z0-9_-]{20,}\.[A-Za-z0-9_-]{20,} ]]; then
      report "$file" "$number" "jwt"
    fi
  done < "$file"
}

collect_files() {
  if [[ "$#" -gt 0 ]]; then
    printf '%s\0' "$@"
    return 0
  fi

  git ls-files -z
  git ls-files --others --exclude-standard -z
}

while IFS= read -r -d '' file; do
  [[ -n "$file" ]] || continue
  [[ "$file" == .git/* ]] && continue
  scan_path "$file"
  scan_content "$file"
done < <(collect_files "$@")

if [[ "$failures" -gt 0 ]]; then
  printf 'Secret check failed with %s finding(s). Remove the secret and rotate the credential if it was real.\n' "$failures" >&2
  exit 1
fi

printf 'Secret check passed.\n'
