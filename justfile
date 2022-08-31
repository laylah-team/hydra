build version os="macOS" arch="arm64":
    #!/usr/bin/env bash
    DIST=hydra_{{version}}-{{os}}_{{arch}}
    set -euxo pipefail
    mkdir -p ./dist/$DIST
    go build -o ./dist/$DIST . 
    tar -czf $DIST.tar.gz -C ./dist .
    rm -rf dist
