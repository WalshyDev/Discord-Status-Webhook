#!/bin/bash

echo "[Webhook]: Sending webhook to Discord...";

case $1 in
  "building" )
    EMBED_COLOR=0
    STATUS_MESSAGE="Building..."
    ;;

  "success" )
    EMBED_COLOR=3066993
    STATUS_MESSAGE="Passed"
    ;;

  "failure" )
    EMBED_COLOR=15158332
    STATUS_MESSAGE="Failed"
    ;;

  "custom" )
    EMBED_COLOR=$2
    STATUS_MESSAGE=$3
    ;;
  * )
    EMBED_COLOR=0
    STATUS_MESSAGE="Status Unknown"
    ;;
esac

AUTHOR_NAME="$(git log -1 "$GITHUB_SHA" --pretty="%aN")"
COMMIT_SUBJECT="$(git log -1 "$GITHUB_SHA" --pretty="%s")"
COMMIT_MESSAGE="$(git log -1 "$GITHUB_SHA" --pretty="%b")"

CREDITS="$AUTHOR_NAME authored & committed"

# GitHub does not have a variable for the PR number
# if [[ $GITHUB_PULL_REQUEST != false ]]; then
#   URL="https://github.com/$GITHUB_REPOSITORY/pull/$GITHUB_PULL_REQUEST"
# else
#   URL=""
# fi

TIMESTAMP=$(date --utc +%FT%TZ)
WEBHOOK_DATA='{
  "username": "",
  "avatar_url": "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png",
  "embeds": [ {
    "color": '$EMBED_COLOR',
    "author": {
      "name": "'"$STATUS_MESSAGE"' - '"$GITHUB_REPOSITORY"'"
    },
    "title": "'"$COMMIT_SUBJECT"'",
    "url": "'"$URL"'",
    "description": "'"${COMMIT_MESSAGE//$'\n'/ }"\\n\\n"$CREDITS"'",
    "fields": [
      {
        "name": "Commit",
        "value": "'"[\`${GITHUB_SHA:0:7}\`](https://github.com/$GITHUB_REPOSITORY/commit/$GITHUB_SHA)"'",
        "inline": true
      },
      {
        "name": "Branch",
        "value": "'"[\`$GITHUB_REF\`](https://github.com/$GITHUB_REPOSITORY/tree/$GITHUB_REF)"'",
        "inline": true
      }
    ]
  } ]
}'

curl --fail --progress-bar -H Content-Type:application/json -d "$WEBHOOK_DATA" "$WEBHOOK_URL"
EXIT_CODE=$?
if [ ${EXIT_CODE} != 0 ]; then
  echo "[Webhook]: Unable to send webhook."
else
  echo "[Webhook]: Successfully sent the webhook."
fi
exit $EXIT_CODE