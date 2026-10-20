# The openSUSE base image
# hadolint ignore=DL3007
FROM registry.opensuse.org/documentation/containers/15.6/opensuse-daps-toolchain:latest

# Packages to install
ARG BASE_PACKAGES="bash-completion \
  command-not-found \
  curl \
  diffutils \
  findutils \
  gawk \
  gh \
  git \
  glibc-locale-base \
  gpg2 \
  grep \
  gzip \
  inotify-tools \
  jq \
  make \
  openssh-clients \
  patch \
  procps \
  ripgrep \
  shadow \
  sudo \
  tar \
  wget \
  which \
  xz \
  yq"

# Install the packages
RUN zypper --non-interactive --gpg-auto-import-keys install --no-recommends $BASE_PACKAGES \
    && zypper clean -a

# Set up a non-root user (recommended for dev containers)
# hadolint ignore=DL3064
ARG USERNAME=vscode
RUN useradd -s /bin/bash --uid 1000 --gid users -m $USERNAME \
    && mkdir -p /etc/sudoers.d/ \
    && echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Set the default user
USER $USERNAME
