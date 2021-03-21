#!/bin/bash
# This script generates a new blog post for my jekyll/minima blog under the _posts directory.
# It is meant to run from the root directory of the blog.
# Usage: ./generate_post.sh "TITLE" "CATEGORIES"

# Needed for the filename, jekyll sorts posts this way and displays date.
DATE=$(date +%Y-%m-%d)
# Needed for sorting the posts exactly.
EXACT_DATE=$(date "+%Y-%m-%d %H:%M:%S")
# Title of post. Used for filename and base config for new posts.
TITLE="$1"
LOWER_TITLE=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]')
FILENAME_TITLE=$(echo $LOWER_TITLE | sed 's/ /-/g')
# Tags for the post. Probably SEO stuff - I didn't really look behind how tags are processed in jekyll atm.
TAGS="$2"

# base config for every post.
BASECONF="---\nlayout: post\ntitle:  \"$TITLE\"\ndate:   $EXACT_DATE +0100\ncategories: $TAGS\n---"

FILENAME="_posts/$DATE-$FILENAME_TITLE.markdown"

touch $FILENAME
echo -e $BASECONF > $FILENAME