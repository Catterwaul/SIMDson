#!/bin/sh

originalBranch=$(git branch --show-current)

git branch github-pages
git checkout github-pages

swift package \
  --allow-writing-to-directory ./docs \
  generate-documentation --target SIMDson \
  --disable-indexing \
  --transform-for-static-hosting \
  --hosting-base-path SIMDson \
  --output-path ./docs

git add --all
git commit -m "Generate documentation for GitHub Pages"
git push GitHub github-pages --force

git checkout $originalBranch
git branch -D github-pages
