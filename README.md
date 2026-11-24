# Devcontainers

[![Build images](https://github.com/lslezak/devcontainers/actions/workflows/build.yml/badge.svg)](https://github.com/lslezak/devcontainers/actions/workflows/build.yml)
[![Validate](https://github.com/lslezak/devcontainers/actions/workflows/validate.yml/badge.svg)](https://github.com/lslezak/devcontainers/actions/workflows/validate.yml)

Development containers (openSUSE based) for various projects, for use in VS Code.

## Layout

- `.devcontainer/` – container for this repository itself
- `github.com/<org>/<repo>/.devcontainer/` – container for the `<org>/<repo>` project

## Requirements

- [VS Code](https://code.visualstudio.com/) with the
  [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension
- Podman (default) or Docker

The configs use Podman specific `runArgs`; remove them when using Docker.

## Notes

- The first start builds the image and can take a while.
- To use Podman set `dev.containers.dockerPath` to `podman` in the VS Code settings.

## Using in a repository

1. Clone the project, for example `git clone https://github.com/agama-project/agama`.
2. Copy the `.devcontainer/` directory from `github.com/<org>/<repo>/` into the
   project root.
3. Open the project in VS Code.
4. Run **Dev Containers: Reopen in Container** (`F1`).
5. You can exclude the dev container files from tracking with

    ```shell
    echo "/.devcontainer/" >> .git/info/exclude
    ```

## Using from outside

The `github.com/<org>/<repo>` layout matches what VS Code expects for shared
repository configurations. Clone this repository and point VS Code to it, then
projects don't need their own `.devcontainer/`:

1. Clone this repository, for example to `~/devcontainers`.
2. Add it to the VS Code user settings (the path should point to the directory
   which contains the `github.com` subdirectory):

    ```json
    "dev.containers.repositoryConfigurationPaths": ["~/devcontainers"]
    ```

    Or open *Settings* (`Ctrl + ,`) -> *Extensions*  -> *Dev Containers*  ->
    *Repository Configuration Paths* -> *Add Item*.
3. Open a project cloned from `github.com/<org>/<repo>`
4. VS Code offers the matching configuration from this repository; select it.

## Optional features

Claude Code and Gemini Code Assist support is installed by the
`suse-claude` and `suse-gemini` features. Remove them from `features` in
`devcontainer.json` if not needed.

## Links

See more details in this [devcontainer template
repository](https://github.com/lslezak/suse-devcontainer).
