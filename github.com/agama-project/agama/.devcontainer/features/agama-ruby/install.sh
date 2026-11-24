#!/bin/sh
set -e

zypper --non-interactive --gpg-auto-import-keys install --no-recommends --allow-downgrade \
  gettext-tools \
  yast2-devtools \
  "rubygem(yast-rake)" \
  augeas-devel \
  ruby-devel

if [ "$REPO_CLEANUP" = "true" ]; then
  zypper clean -a
fi

# Ruby language server + Ruby gettext
gem install --no-format-exec ruby-lsp gettext
